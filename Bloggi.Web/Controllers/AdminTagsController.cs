using Bloggi.Web.Hubs;
using Bloggi.Web.Models.Domain;
using Bloggi.Web.Models.ViewModels;
using Bloggi.Web.Reponsitories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;

namespace Bloggi.Web.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminTagsController : Controller
    {
        private readonly ITagRepository _tagRepository;
        private readonly IHubContext<TagHub> _tagHubContext;
        public AdminTagsController(ITagRepository tagRepository, IHubContext<TagHub> tagHubContext)
        {
            _tagRepository=tagRepository;
            _tagHubContext=tagHubContext;
        }

        
        [HttpGet]
        public IActionResult Add()
        {
            return View();

        }

        [HttpPost]
        [ActionName("Add")]
        public async Task<IActionResult> Add(AddTagRequest addTagRequest)
        {


            if (ModelState.IsValid)
            {
                var tag = new Tag
                {
                    Name = addTagRequest.Name,
                    DisplayName = addTagRequest.DisplayName,
                };
                await _tagRepository.AddAsync(tag);

                await _tagHubContext.Clients.All.SendAsync("ReceiveTag", tag);
                return RedirectToAction("List");
            }

            return View();
        }

        [HttpGet]
        [ActionName("List")]
        public async Task<IActionResult> List(string? searchQuery, int? pageSize = 3, int pageNumber =1)
        {

            var totalRecords = await _tagRepository.CountAsync(searchQuery);


            var totalPages = Math.Ceiling((decimal)((decimal)totalRecords / pageSize));


            ViewBag.SearchQuery = searchQuery;
            ViewBag.PageSize = pageSize;
            ViewBag.TotalPages = totalPages;
            ViewBag.CurrentPage = pageNumber;

            var tags = await _tagRepository.GetAllAsync(searchQuery, pageSize, pageNumber);

            return View(tags);
        }

        [HttpGet]
        public async Task<IActionResult> Edit(Guid id)
        {
            // 1st method 
            //var tag =bloggieDbContext.Tags.Find(id);
            // 2nd Method
            var tag = await _tagRepository.GetAsync(id);
            if (tag != null)
            {
                var editTagRequet = new EditTagRequet
                {
                    Id = tag.Id,
                    Name = tag.Name,
                    DisplayName= tag.DisplayName,
                };
                return View(editTagRequet);
            }
            return View(null);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(EditTagRequet editTagRequet)
        {
            var tag = new Tag
            {
                Id=editTagRequet.Id,
                Name = editTagRequet.Name,
                DisplayName = editTagRequet.DisplayName,
            };

            var updateTag = await _tagRepository.UpdateAsync(tag);

            if (updateTag == null)
            {
                
                throw new InvalidOperationException($"Tag with ID {editTagRequet.Id} was not found.");
            }

                return RedirectToAction("List");
            
        }

        [HttpPost]
        public async Task<IActionResult> Delete(EditTagRequet editTagRequet)
        {

            var deletedTag = await _tagRepository.DeleteAsync(editTagRequet.Id);

            if (deletedTag != null)
            {
               
                return RedirectToAction("List");
            }
            return RedirectToAction("Edit", new { id = editTagRequet.Id });

        }


    }
}
