using Bloggi.Web.Models.Domain;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using System.Reflection.Emit;

namespace Bloggi.Web.Data
{
    public class BloggieDbContext: IdentityDbContext
    {
        public BloggieDbContext(DbContextOptions<BloggieDbContext> options) : base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder builbder)
        {
            base.OnModelCreating(builbder);


            var adminRoleId = "02f463da-68b9-4325-9e59-7dd33dbeaaaa";
            var superAdminRoleId = "95046b92-547f-4721-8466-c6b78020c101";
            var userRoleId = "a7f945cf-7bfa-4e77-b6b2-c6eaa0d5fbbb";

            var roles = new List<IdentityRole>
            {
                new IdentityRole
                {
                   Name = "Admin",
                   NormalizedName="Admin",
                   Id = adminRoleId,
                   ConcurrencyStamp=adminRoleId,
                },

                 new IdentityRole
                  {
                   Name = "SuperAdmin",
                   NormalizedName="SuperAdmin",
                   Id = superAdminRoleId,
                   ConcurrencyStamp=superAdminRoleId,
                  },
                  new IdentityRole
                   {
                   Name = "User",
                   NormalizedName="User",
                   Id = userRoleId,
                   ConcurrencyStamp=userRoleId,
                   },
            };

            builbder.Entity<IdentityRole>().HasData(roles);

            var superAdminId = "1990ecf6-afa4-4efe-8a21-061c30de6197";

            var superAdminUser = new IdentityUser
            {
                UserName ="superadmin@blog.com",
                Email="superadmin@blog.com",
                NormalizedEmail="superadmin@blog.com".ToUpper(),
                NormalizedUserName="superadmin@blog.com".ToUpper(),
                Id = superAdminId,
            };


            var passwordHasher = new PasswordHasher<IdentityUser>();

            superAdminUser.PasswordHash = passwordHasher.HashPassword(superAdminUser, "Superadmin@123");

            builbder.Entity<IdentityUser>().HasData(superAdminUser);


            var superAdminRoles = new List<IdentityUserRole<string>>
            {
                new IdentityUserRole<string>
                {
                    RoleId = adminRoleId,
                    UserId = superAdminId
                },


                new IdentityUserRole<string>
                {
                    RoleId = superAdminRoleId,
                    UserId = superAdminId
                },

                new IdentityUserRole<string>
                {
                    RoleId = userRoleId,
                    UserId = superAdminId
                },

            };
            
            builbder.Entity<IdentityUserRole<string>>().HasData(superAdminRoles);

            builbder.Entity<BlogPostComment>()
                .HasOne(comment => comment.User)
                .WithMany() 
                .HasForeignKey(comment => comment.UserId)
                .OnDelete(DeleteBehavior.Cascade);

            builbder.Entity<BlogPostLike>()
                .HasOne(like => like.User)
                .WithMany() 
                .HasForeignKey(like => like.UserId)
                .OnDelete(DeleteBehavior.Cascade);

            builbder.Entity<BlogPostComment>()
                .HasMany(b => b.ReplyComments)
                .WithOne(r => r.BlogPostComment)
                .HasForeignKey(r => r.CommentId)
                .OnDelete(DeleteBehavior.Cascade);
        }
        public DbSet<BlogPost> BlogPosts { get; set; }
        public DbSet<Tag> Tags { get; set; }
        public DbSet<BlogPostLike> BlogPostLike { get; set; }     
        public DbSet<BlogPostComment> BlogPostComment { get; set; }
        public DbSet<ReplyComment> ReplyComment { get; set; }
    }
}
//"BlogAuthDBConnectionString": "server=MSI\\SQLEXPRESS; database=authdatamvc; TrustServerCertificate=true ; Trusted_Connection=True"