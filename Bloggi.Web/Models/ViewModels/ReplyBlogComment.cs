namespace Bloggi.Web.Models.ViewModels
{
    public class ReplyBlogComment
    {
        public Guid Id { get; set; }
        public string Description { get; set; }
        public DateTime DateAdded { get; set; }
        public string Username { get; set; }
        public string UserId { get; set; }
    }
}
