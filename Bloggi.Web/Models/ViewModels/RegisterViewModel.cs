using System.ComponentModel.DataAnnotations;
using System.Net.Mail;

namespace Bloggi.Web.Models.ViewModels
{
    public class RegisterViewModel
    {
        [Required]
        public string Username {  get; set; }

        [Required]
        [MinLength(6, ErrorMessage = "Password has to be at least 6 characters") ]
        public string Password { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

    }
}
