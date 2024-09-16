using Bloggi.Web.Data;
using Bloggi.Web.Hubs;
using Bloggi.Web.Models.Domain;
using Microsoft.AspNetCore.SignalR;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace Bloggi.Web.Reponsitories
{
    public class TagRepository : ITagRepository
    {
        private readonly BloggieDbContext bloggieDbContext;
        private readonly IHubContext<TagHub> tagHubContext;

        public TagRepository(BloggieDbContext bloggieDbContext, IHubContext<TagHub> tagHubContext)
        {
            this.bloggieDbContext=bloggieDbContext;
            this.tagHubContext = tagHubContext;
        }
        public async Task<Tag> AddAsync(Tag tag)
        {
            await bloggieDbContext.Tags.AddAsync(tag);
            await bloggieDbContext.SaveChangesAsync();

            await tagHubContext.Clients.All.SendAsync("ReceiveTag", tag);
            return tag;

        }

        public async Task<int> CountAsync(string? searchQuery)
        {
            var query = bloggieDbContext.Tags.AsQueryable();

            if (!string.IsNullOrEmpty(searchQuery))
            {
                query = query.Where(tag => tag.Name.Contains(searchQuery));
            }

            return await query.CountAsync();
        }

        public async Task<Tag> DeleteAsync(Guid id)
        {
            
            var existingTag = await bloggieDbContext.Tags.FindAsync(id);

            if (existingTag != null)
            {
                bloggieDbContext.Tags.Remove(existingTag);
                bloggieDbContext.SaveChangesAsync();
                return existingTag;
            }
            return null;

        }

        public async Task<IEnumerable<Tag>> GetAllAsync(string? searchQuery, int? pageSize = 10,
            int pageNumber = 1)
        {
            IQueryable<Tag> query = bloggieDbContext.Tags; 

            if (!string.IsNullOrWhiteSpace(searchQuery))
            {
                query = query.Where(x => x.Name.Contains(searchQuery) || x.DisplayName.Contains(searchQuery));
            }

            var skipAmount = (pageNumber - 1) * pageSize;

            return await query.Skip((int)skipAmount).Take((int)pageSize).ToListAsync();

        }

        public async Task<Tag?> GetAsync(Guid id)
        {
            var tag = await bloggieDbContext.Tags.FirstOrDefaultAsync(t => t.Id == id);
            return tag;
        }


        public async Task<Tag> UpdateAsync(Tag tag)
        {
            var existingTag = await bloggieDbContext.Tags.FindAsync(tag.Id);

           
            if (existingTag != null)
            {
                existingTag.Name = tag.Name;
                existingTag.DisplayName = tag.DisplayName;

                await bloggieDbContext.SaveChangesAsync();

                return existingTag;
            }
            return null;
        }
    }
}
