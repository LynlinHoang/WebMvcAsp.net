using Bloggi.Web.Models;
using Bloggi.Web.Models.ViewModels;
using Bloggi.Web.Reponsitories;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace Bloggi.Web.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IBlogPostRepository _blogPostRepository;
        private readonly ITagRepository _tagRepository;

        public HomeController(ILogger<HomeController> logger,
                            IBlogPostRepository blogPostRepository,
                             ITagRepository tagRepository)
        {
            _logger = logger;
            _blogPostRepository=blogPostRepository;
            _tagRepository=tagRepository;
        }
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            var blogPost = await _blogPostRepository.GetAllAsync();

            var tags = await _tagRepository.GetAllAsync();

            var model = new HomeViewModel
            {
                BlogPosts = blogPost,
                Tags = tags
            };
            return View(model);
        }

        public IActionResult Privacy()
        {
            return View();
        }

        public IActionResult Chat()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
