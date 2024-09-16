using Bloggi.Web.Models.Domain;
using Bloggi.Web.Models.ViewModels;
using Bloggi.Web.Reponsitories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace Bloggi.Web.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminBlogPostController : Controller
    {
        private readonly ITagRepository tagRepository;
        private readonly IBlogPostRepository blogPostRepository;

        public AdminBlogPostController(ITagRepository tagRepository, IBlogPostRepository blogPostRepository)
        {
            this.tagRepository = tagRepository;
            this.blogPostRepository=blogPostRepository;
        }
        [HttpGet]
        public async Task<IActionResult> Add()
        {
            var tags = await tagRepository.GetAllAsync();

            var model = new AddBlogPostRequet
            {
                Tags = tags.Select(x => new SelectListItem { Text = x.Name, Value = x.Id.ToString() })
            };
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> Add(AddBlogPostRequet addBlogPostRequet)
        {
            var blogPost = new BlogPost
            {
                Heading =addBlogPostRequet.Heading,
                PageTile =addBlogPostRequet.PageTile,
                Content = addBlogPostRequet.Content,
                ShortDescription = addBlogPostRequet.ShortDescription,
                FeaturedImageUrl = addBlogPostRequet.FeaturedImageUrl,
                UrlHandle = addBlogPostRequet.UrlHandle,
                PublishedDate = addBlogPostRequet.PublishedDate,
                Author=addBlogPostRequet.Author,
                Visible=addBlogPostRequet.Visible,


            };

            var selectedTags = new List<Tag>();
            foreach (var selectedTagId in addBlogPostRequet.SelectedTag)
            {
                var selectedTagIdAsGuid = Guid.Parse(selectedTagId);
                var existingTag = await tagRepository.GetAsync(selectedTagIdAsGuid);

                if (existingTag!=null)
                {
                    selectedTags.Add(existingTag);
                }
            }
            blogPost.Tags = selectedTags;

            await blogPostRepository.AddAsync(blogPost);
            return RedirectToAction("Add");
        }


        [HttpGet]

        public async Task<IActionResult> List()
        {
            var blogPost = await blogPostRepository.GetAllAsync();

            return View(blogPost);
        }

        [HttpGet]
        public async Task<IActionResult> Edit(Guid id)
        {
            // Retrieve the result from the repository
            var blogPost = await blogPostRepository.GetAsync(id);
            var tagsDomainModel = await tagRepository.GetAllAsync();
            // map the domain model into the view model
            if (blogPost !=null)
            {
                var model = new EditBlogPostRequest
                {
                    Id = blogPost.Id,
                    Heading = blogPost.Heading,
                    PageTile = blogPost.PageTile,
                    Content= blogPost.Content,
                    Author = blogPost.Author,
                    FeaturedImageUrl = blogPost.FeaturedImageUrl,
                    UrlHandle = blogPost.UrlHandle,
                    ShortDescription = blogPost.ShortDescription,
                    PublishedDate= blogPost.PublishedDate,
                    Visible= blogPost.Visible,
                    Tags = tagsDomainModel.Select(x => new SelectListItem
                    {
                        Text = x.Name,
                        Value= x.Id.ToString(),
                    }),
                    SelectedTag = blogPost.Tags.Select(x => x.Id.ToString()).ToArray(),
                };
                return View(model);
            }
            // pass data to view

            return View(null);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(EditBlogPostRequest editBlogPostRequest)
        {
            var blogPostDomainModel = new BlogPost
            {
                Id = editBlogPostRequest.Id,
                Heading =editBlogPostRequest.Heading,
                PageTile =editBlogPostRequest.PageTile,
                Content = editBlogPostRequest.Content,
                ShortDescription = editBlogPostRequest.ShortDescription,
                FeaturedImageUrl = editBlogPostRequest.FeaturedImageUrl,
                UrlHandle = editBlogPostRequest.UrlHandle,
                PublishedDate = editBlogPostRequest.PublishedDate,
                Author=editBlogPostRequest.Author,
                Visible=editBlogPostRequest.Visible,
            };
            // Map Tags from selected Tags
            var selectedTags = new List<Tag>();
            foreach (var selectedTag in editBlogPostRequest.SelectedTag)
            {
                if (Guid.TryParse(selectedTag, out var tag))
                {
                    var foundTag = await tagRepository.GetAsync(tag);

                    if (foundTag != null)
                    {
                        selectedTags.Add(foundTag);
                    }
                }
            }
            blogPostDomainModel.Tags = selectedTags;

            var updateBlog = await blogPostRepository.UpdateAsync(blogPostDomainModel);
            // Mapping tags back to domain madel

            if (updateBlog != null)
            {
                // s
                return RedirectToAction("List");

            }

            return RedirectToAction("Edit", new { id = editBlogPostRequest.Id });
        }

        [HttpPost]
        public async Task<IActionResult> Delete(EditBlogPostRequest delete)
        {
            var deleteBlogPost = await blogPostRepository.DeleteAsync(delete.Id);
            if (deleteBlogPost != null)
            {
                return RedirectToAction("List");
            }

            return RedirectToAction("Edit", new { id = delete.Id });
        }

    }
}
