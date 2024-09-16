using Bloggi.Web.Models.Domain;

namespace Bloggi.Web.Reponsitories
{
    public interface ITagRepository
    {
        Task<IEnumerable<Tag>> GetAllAsync(
            string? seachQuery="",
            int? pageSize =10,
            int payNumber = 1
            );
        Task<Tag?> GetAsync(Guid id);
        Task<Tag> AddAsync(Tag tag);
        Task<Tag> UpdateAsync(Tag tag);
        Task<Tag> DeleteAsync(Guid id);
        Task<int> CountAsync(string? searchQuery);

    }
}
