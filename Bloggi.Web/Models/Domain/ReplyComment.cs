namespace Bloggi.Web.Models.Domain
{
    public class ReplyComment
    {
 
        public Guid Id { get; set; }
        public string Description { get; set; }
        public Guid BlogPostId { get; set; }
        public string UserId { get; set; }
        public Guid CommentId { get; set; }
        public DateTime DateAdded { get; set; }

        public BlogPostComment BlogPostComment { get; set; }
    }
}
