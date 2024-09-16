using Bloggi.Web.Models.Domain;

namespace Bloggi.Web.Reponsitories
{
    public interface IBlogPostLikeRepository
    {
        Task<int> GetTotalLikes(Guid blogPostId);

        Task<BlogPostLike> AddLikeForBlog(BlogPostLike blogPostLike);

        Task<IEnumerable<BlogPostLike>> GetLikesForBlog(Guid blogPostId);

        Task<BlogPostLike> RemoveLikeForBlog(BlogPostLike blogPostLike);

        Task<BlogPostLike> GetLike(Guid BlogPostId, string UserId);

    }
}
