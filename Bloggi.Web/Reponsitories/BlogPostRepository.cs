﻿using Bloggi.Web.Data;
using Bloggi.Web.Models.Domain;
using Microsoft.EntityFrameworkCore;

namespace Bloggi.Web.Reponsitories
{
    public class BlogPostRepository : IBlogPostRepository
    {
        private BloggieDbContext _bloggieDbContext;

        public BlogPostRepository(BloggieDbContext bloggieDbContext)
        {
            _bloggieDbContext=bloggieDbContext;
        }
        public async Task<BlogPost> AddAsync(BlogPost blogPost)
        {
            await _bloggieDbContext.BlogPosts.AddAsync(blogPost);
            await _bloggieDbContext.SaveChangesAsync();
            return blogPost;
        }

        public async Task<BlogPost?> DeleteAsync(Guid id)
        {
            var existingBlog = await _bloggieDbContext.BlogPosts.FindAsync(id);

            if (existingBlog != null)
            {
                _bloggieDbContext.BlogPosts.Remove(existingBlog);

                await _bloggieDbContext.SaveChangesAsync();
                return existingBlog;

            }
            return null;

        }

        public async Task<IEnumerable<BlogPost>> GetAllAsync()
        {
           return await _bloggieDbContext.BlogPosts.Include(x=> x.Tags).ToListAsync(); 
        }

        public async Task<BlogPost?> GetAsync(Guid id)
        {
           return await _bloggieDbContext.BlogPosts.Include(x=>x.Tags).FirstOrDefaultAsync(x=> x.Id == id);


        }

        public async Task<BlogPost?> GetByUrlHandleAsync(string urlHandle)
        {
           return   await _bloggieDbContext.BlogPosts.Include(x=>x.Tags).FirstOrDefaultAsync(x=> x.UrlHandle == urlHandle);
        }

        public async Task<BlogPost?> UpdateAsync(BlogPost blogPost)
        {
          var existingBlog =   await _bloggieDbContext.BlogPosts.Include(x=>x.Tags).FirstOrDefaultAsync(x => x.Id == blogPost.Id);

            if (existingBlog != null)
            {
                existingBlog.Id = blogPost.Id;
                existingBlog.Heading = blogPost.Heading;
                existingBlog.PageTile = blogPost.PageTile;
                existingBlog.Content = blogPost.Content;
                existingBlog.ShortDescription = blogPost.ShortDescription;
                existingBlog.Author = blogPost.Author;
                existingBlog.FeaturedImageUrl = blogPost.FeaturedImageUrl;
                existingBlog.UrlHandle = blogPost.UrlHandle;
                existingBlog.Visible = blogPost.Visible;
                existingBlog.PublishedDate = blogPost.PublishedDate;
                existingBlog.Tags = blogPost.Tags;

                await _bloggieDbContext.SaveChangesAsync();
                return existingBlog;

            }
            return null;


        }
    }
}
