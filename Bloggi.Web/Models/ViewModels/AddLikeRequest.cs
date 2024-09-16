namespace Bloggi.Web.Models.ViewModels
{
    public class AddLikeRequest
    {
       public Guid BlogPostId { get; set; }

       public string UserId { get; set; }

    }
}
