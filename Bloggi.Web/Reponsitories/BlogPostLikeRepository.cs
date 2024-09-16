
using Bloggi.Web.Data;
using Bloggi.Web.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace Bloggi.Web.Reponsitories
{
    public class BlogPostLikeRepository : IBlogPostLikeRepository
    {
        private readonly BloggieDbContext _bloggieDbContext;

        public BlogPostLikeRepository(BloggieDbContext bloggieDbContext)
        {
            _bloggieDbContext = bloggieDbContext;
        }

        public async Task<BlogPostLike> AddLikeForBlog(BlogPostLike blogPostLike)
        {
            await _bloggieDbContext.BlogPostLike.AddAsync(blogPostLike);

            await _bloggieDbContext.SaveChangesAsync();

            return blogPostLike;
        }

        public async Task<BlogPostLike> GetLike(Guid BlogPostId, string UserId)
        {
            var getlike = await _bloggieDbContext.BlogPostLike
             .FirstOrDefaultAsync(l => l.BlogPostId == BlogPostId && l.UserId == UserId);

            return getlike;
        }

        public async Task<IEnumerable<BlogPostLike>> GetLikesForBlog(Guid blogPostId)
        {
           return await _bloggieDbContext.BlogPostLike.Where(x=>x.BlogPostId == blogPostId).ToListAsync();


        }

        public async Task<int> GetTotalLikes(Guid blogPostId)
        {
            return await _bloggieDbContext.BlogPostLike.CountAsync(x => x.BlogPostId == blogPostId);
        }

        public async Task<BlogPostLike> RemoveLikeForBlog(BlogPostLike blogPostLike)
        {

            var likeToRemove = await _bloggieDbContext.BlogPostLike
            .FirstOrDefaultAsync(l => l.BlogPostId == blogPostLike.BlogPostId && l.UserId == blogPostLike.UserId);

            if (likeToRemove == null)
            {
                // Like không tồn tại
                throw new InvalidOperationException("Like not found");
            }

            // Xóa Like
            _bloggieDbContext.BlogPostLike.Remove(likeToRemove);
            await _bloggieDbContext.SaveChangesAsync();

            return null;
        }
    }
}
