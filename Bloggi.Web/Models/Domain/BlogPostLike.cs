using Microsoft.AspNetCore.Identity;

namespace Bloggi.Web.Models.Domain
{
    public class BlogPostLike
    {
        public Guid Id { get; set; }

        public Guid BlogPostId { get; set; }

        public string UserId { get; set; }

        public IdentityUser User { get; set; }
    }
}
