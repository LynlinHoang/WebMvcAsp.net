using Bloggi.Web.Models.Domain;

namespace Bloggi.Web.Models.ViewModels
{
    public class BlogViewDetailModel
    {
        public Guid Id { get; set; }
        public string Heading { get; set; }

        public string PageTile { get; set; }

        public string Content { get; set; }

        public string ShortDescription { get; set; }

        public string FeaturedImageUrl { get; set; }

        public string UrlHandle { get; set; }

        public DateTime PublishedDate { get; set; }

        public string Author { get; set; }

        public bool Visible { get; set; }

        public ICollection<Tag> Tags { get; set; }

        public int TotalLike { get; set; }

        public bool Liked { get; set; }

        public string CommentDescription { get; set; }

        public IEnumerable<BlogComment> Comments { get; set; }



    }
}
