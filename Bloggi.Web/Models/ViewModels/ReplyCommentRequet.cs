namespace Bloggi.Web.Models.ViewModels
{
    public class ReplyCommentRequet
    {
        public string Description { get; set; }
        public Guid BlogPostId { get; set; }
        public Guid CommentId { get; set; }
    }
}
