namespace Bloggi.Web.Reponsitories
{
    public interface IImageRespository
    {
        Task<string> UploadAsync(IFormFile file);
    }
}
