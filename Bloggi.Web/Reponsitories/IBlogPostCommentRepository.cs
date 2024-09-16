using Bloggi.Web.Models.Domain;

namespace Bloggi.Web.Reponsitories
{
    public interface IBlogPostCommentRepository
    {
        Task<BlogPostComment> AddAsync(BlogPostComment blogPostComment);

        Task<IEnumerable<BlogPostComment>> GetCommentByBlogIdAsync(Guid blogPostId);

        Task<BlogPostComment> AddReplayAsync(Guid id, ReplyComment reply);

        Task<IEnumerable<ReplyComment>> GetReplyCommentByBlogIdAsync(Guid CommentId);

    }
}
