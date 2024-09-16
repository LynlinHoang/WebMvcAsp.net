using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Bloggi.Web.Migrations
{
    /// <inheritdoc />
    public partial class EditBlogPost : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Conten",
                table: "BlogPosts",
                newName: "Content");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Content",
                table: "BlogPosts",
                newName: "Conten");
        }
    }
}
