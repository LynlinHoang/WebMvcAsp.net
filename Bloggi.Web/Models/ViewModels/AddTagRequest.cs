using System.ComponentModel.DataAnnotations;

namespace Bloggi.Web.Models.ViewModels
{
    public class AddTagRequest
    {
        [Required]
        [StringLength(60, MinimumLength = 3)]
        public string Name {  get; set; }
        [Required]
        [RegularExpression(@"^[A-Z]+[a-zA-Z0-9""'\s-]*$")]
        public string DisplayName { get; set; }
    }
}
