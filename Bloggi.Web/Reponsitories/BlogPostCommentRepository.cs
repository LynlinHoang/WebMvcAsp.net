using Bloggi.Web.Data;
using Bloggi.Web.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace Bloggi.Web.Reponsitories
{
    public class BlogPostCommentRepository : IBlogPostCommentRepository
    {
        private readonly BloggieDbContext _bloggieDbContext;

        public BlogPostCommentRepository(BloggieDbContext bloggieDbContext)
        {
            _bloggieDbContext=bloggieDbContext;
        }
        public async Task<BlogPostComment> AddAsync(BlogPostComment blogPostComment)
        {
            await _bloggieDbContext.BlogPostComment.AddAsync(blogPostComment);

            await _bloggieDbContext.SaveChangesAsync();

            return blogPostComment;
        }

        public async Task<BlogPostComment> AddReplayAsync(Guid id, ReplyComment reply)
        {
            var blogPostComment = await _bloggieDbContext.BlogPostComment.SingleOrDefaultAsync(x => x.Id == id);

            if (blogPostComment == null)
            {
                throw new InvalidOperationException("BlogPostComment not found.");
            }

            await _bloggieDbContext.ReplyComment.AddAsync(reply);


            await _bloggieDbContext.SaveChangesAsync();


            return blogPostComment;
        }

        public async Task<IEnumerable<BlogPostComment>> GetCommentByBlogIdAsync(Guid blogPostId)
        {
            return await _bloggieDbContext.BlogPostComment.
                Where(x => x.BlogPostId == blogPostId)
                .ToListAsync();
        }

        public async Task<IEnumerable<ReplyComment>> GetReplyCommentByBlogIdAsync( Guid CommentId)
        {
            return await _bloggieDbContext.ReplyComment.
                Where(x => x.CommentId == CommentId)
                .ToListAsync();
        }
    }
}
