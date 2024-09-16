namespace Bloggi.Web.Models.ViewModels
{
    public class BlogComment
    {
        public Guid Id { get; set; }
        public string Description { get; set; }

        public DateTime DateAdded { get; set; }

        public string Username { get; set; }

        public string UserId { get; set; }

        public IEnumerable<ReplyBlogComment> ReplyBlogs { get; set; }

    }
}
