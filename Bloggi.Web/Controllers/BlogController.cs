using Bloggi.Web.Hubs;
using Bloggi.Web.Models.Domain;
using Bloggi.Web.Models.ViewModels;
using Bloggi.Web.Reponsitories;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;

namespace Bloggi.Web.Controllers
{
    public class BlogController : Controller
    {
        private readonly IBlogPostRepository _blogPostRepository;
        private readonly IBlogPostLikeRepository _blogPostLikeRepository;
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IBlogPostCommentRepository _blogPostCommentRepository;
        private readonly IHubContext<CommentHub> _commentHubContext;

        public BlogController(
            IBlogPostRepository blogPostRepository,
            IBlogPostLikeRepository blogPostLikeRepository,
            SignInManager<IdentityUser> signInManager,
            UserManager<IdentityUser> userManager,
            IBlogPostCommentRepository blogPostCommentRepository,
            IHubContext<CommentHub> commentHubContext
            )
        {
            _blogPostRepository=blogPostRepository;
            _blogPostLikeRepository=blogPostLikeRepository;
            _signInManager=signInManager;
            _userManager=userManager;
            _blogPostCommentRepository=blogPostCommentRepository;
            _commentHubContext = commentHubContext;
        }

        [HttpGet]
        public async Task<IActionResult> Index(string urlHandle)
        {
            var liked = false;
            var blogPost = await _blogPostRepository.GetByUrlHandleAsync(urlHandle);
            var blogPostLikeViewModel = new BlogViewDetailModel();


            if (blogPost != null)
            {
                var totallike = await _blogPostLikeRepository.GetTotalLikes(blogPost.Id);

                if (_signInManager.IsSignedIn(User))
                {
                    var likeForBlog = await _blogPostLikeRepository.GetLikesForBlog(blogPost.Id);

                    var userId = _userManager.GetUserId(User);

                    if (likeForBlog != null)
                    {
                        var likeFromUser = likeForBlog.FirstOrDefault(x => x.UserId == userId);

                        liked = likeFromUser != null;
                    }
                }

                var blogComment = await _blogPostCommentRepository.GetCommentByBlogIdAsync(blogPost.Id);



                var blogCommentsForView = new List<BlogComment>();

                foreach (var item in blogComment)
                {
                    // Lấy các Reply Comments và chờ đợi tất cả các tác vụ hoàn thành
                    var replyComments = await _blogPostCommentRepository.GetReplyCommentByBlogIdAsync(item.Id);
                    var replyBlogCommentsForView = new List<ReplyBlogComment>();
                    foreach (var reply in replyComments)
                    {
                        // Tạo từng ReplyBlogComment và thêm vào danh sách
                        replyBlogCommentsForView.Add(new ReplyBlogComment
                        {
                            Id = reply.Id,
                            Description = reply.Description,
                            DateAdded = reply.DateAdded,
                            Username = (await _userManager.FindByIdAsync(reply.UserId.ToString())).UserName,
                            UserId = reply.UserId.ToString()
                        });
                    }

                    blogCommentsForView.Add(new BlogComment
                    {
                        Id = item.Id,
                        Description = item.Description,
                        DateAdded = item.DateAdded,
                        Username = (await _userManager.FindByIdAsync(item.UserId.ToString())).UserName,
                        UserId = item.UserId.ToString(),
                        ReplyBlogs = replyBlogCommentsForView
                    });
                }


                blogPostLikeViewModel = new BlogViewDetailModel
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
                    Tags= blogPost.Tags,
                    TotalLike= totallike,
                    Liked = liked,
                    Comments= blogCommentsForView,
                };
            }

            return View(blogPostLikeViewModel);
        }









    }
}
