
using CloudinaryDotNet;
using CloudinaryDotNet.Actions;
using Microsoft.Extensions.Configuration;

namespace Bloggi.Web.Reponsitories
{
    public class CloudinaryImageRepository : IImageRespository
    {
        private readonly IConfiguration configuration;
        private readonly Account account;
        public CloudinaryImageRepository(IConfiguration configuration)
        {
            this.configuration = configuration;

            account = new Account(configuration.GetSection("Cloudinary")["CloudName"],
                                  configuration.GetSection("Cloudinary")["ApiKey"],
                                  configuration.GetSection("Cloudinary")["ApiSecret"]);


        }
        public async Task<string> UploadAsync(IFormFile file)
        {
            var client = new Cloudinary(account);

            var uploadParams = new ImageUploadParams()
            {
                File = new FileDescription(file.FileName, file.OpenReadStream()),
                DisplayName = file.FileName,
            };
            var oploadResult = await client.UploadAsync(uploadParams);

            if (oploadResult != null && oploadResult.StatusCode == System.Net.HttpStatusCode.OK)
            {
                return oploadResult.SecureUri.ToString();
            }

            return null;

        }
    }
}
