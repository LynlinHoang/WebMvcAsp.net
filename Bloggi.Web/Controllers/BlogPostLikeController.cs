using Bloggi.Web.Models.Domain;
using Bloggi.Web.Models.ViewModels;
using Bloggi.Web.Reponsitories;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Bloggi.Web.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BlogPostLikeController : ControllerBase
    {
        private readonly IBlogPostLikeRepository _blogPostLikeRepository;

        public BlogPostLikeController(IBlogPostLikeRepository blogPostLikeRepository)
        {
            _blogPostLikeRepository=blogPostLikeRepository;
        }


        [HttpPost]
        [Route("Add")]
        public async Task<IActionResult> AddLike([FromBody] AddLikeRequest addLikeRequest)
        {
            var model = new BlogPostLike
            {
                BlogPostId=addLikeRequest.BlogPostId,
                UserId=addLikeRequest.UserId,
            };
            await _blogPostLikeRepository.AddLikeForBlog(model);


            return Ok();
        }

        [HttpGet]
        [Route("{blogPostId:guid}/totalLikes")]
        public async Task<IActionResult> GetTotalLikesForBlog([FromRoute] Guid blogPostId)
        {
            var totalLike = await _blogPostLikeRepository.GetTotalLikes(blogPostId);
            return Ok(totalLike);
        }

        [HttpDelete]
        [Route("{blogPostId:guid}/like/{userId}")]
        public async Task<IActionResult> RemoveLike([FromRoute] Guid blogPostId, [FromRoute] string userId)
        {
            var likeToDelete = await _blogPostLikeRepository.GetLike(blogPostId, userId);

            if (likeToDelete == null)
            {
                return NotFound("Like not found");
            }

            await _blogPostLikeRepository.RemoveLikeForBlog(likeToDelete);

            return Ok("Like removed successfully");
        }

    }
}
