using Bloggi.Web.Hubs;
using Bloggi.Web.Models.Domain;
using Bloggi.Web.Models.ViewModels;
using Bloggi.Web.Reponsitories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using System.ComponentModel.Design;

namespace Bloggi.Web.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CommentController : ControllerBase
    {

        private readonly IBlogPostCommentRepository _blogPostCommentRepository;
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IHubContext<CommentHub> _commentHubContext;
        public CommentController(
            IBlogPostCommentRepository blogPostCommentRepository,
            SignInManager<IdentityUser> signInManager,
            UserManager<IdentityUser> userManager,
            IHubContext<CommentHub> commentHubContext
            )
        {

            _signInManager=signInManager;
            _userManager=userManager;
            _blogPostCommentRepository=blogPostCommentRepository;
            _commentHubContext = commentHubContext;
        }

        [HttpPost("Add")]
        public async Task<IActionResult> Add([FromBody] AddCommentRequet blogComment)
        {


            var domainModel = new BlogPostComment
            {
                BlogPostId = Guid.Parse(blogComment.BlogPostId),
                Description = blogComment.Description,
                UserId = _userManager.GetUserId(User),
                DateAdded = DateTime.Now,
            };


            await _blogPostCommentRepository.AddAsync(domainModel);

            var getComment = new BlogComment
            {
                
                Description = blogComment.Description,
                DateAdded=domainModel.DateAdded,
                UserId=domainModel.UserId,
                Username=(await _userManager.FindByIdAsync(domainModel.UserId.ToString())).UserName,

            };

            await _commentHubContext.Clients.All.SendAsync("ReceiveNewComment", getComment);
            return Ok();
        }


        [HttpPost("reply")]
        public async Task<IActionResult> AddReply([FromBody] ReplyCommentRequet reply)
        {


            var domainModel = new ReplyComment
            {
                Description= reply.Description,
                BlogPostId= reply.BlogPostId,
                DateAdded = DateTime.Now,
                UserId = _userManager.GetUserId(User),
                CommentId = reply.CommentId,


            };


            await _blogPostCommentRepository.AddReplayAsync(reply.CommentId, domainModel);

            var getComment = new ReplyCommentSignaR
            {
                Id = domainModel.Id,
                Description = domainModel.Description,
                DateAdded=domainModel.DateAdded,
                UserId=domainModel.UserId,
                Username=(await _userManager.FindByIdAsync(domainModel.UserId.ToString())).UserName,
                CommentId=reply.CommentId,

            };

            await _commentHubContext.Clients.All.SendAsync("ReceiveNewReplyComment", getComment);
            return Ok();

        }
    }   
}
