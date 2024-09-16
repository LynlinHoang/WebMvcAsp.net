using Microsoft.AspNetCore.Identity;

namespace Bloggi.Web.Models.Domain
{
    public class BlogPostComment
    {
        public Guid Id { get; set; }
        public string Description { get; set; }
        public Guid BlogPostId { get; set; }
        public string UserId { get; set; }
        public DateTime DateAdded { get; set; }
        public IdentityUser User { get; set; }
        public ICollection<ReplyComment> ReplyComments { get; set; }
    }
}
