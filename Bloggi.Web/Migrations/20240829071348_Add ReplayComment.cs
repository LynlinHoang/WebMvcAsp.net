using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Bloggi.Web.Migrations
{
    /// <inheritdoc />
    public partial class AddReplayComment : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "ReplyComment",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    BlogPostId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UserId = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CommentId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    DateAdded = table.Column<DateTime>(type: "datetime2", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ReplyComment", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ReplyComment_BlogPostComment_CommentId",
                        column: x => x.CommentId,
                        principalTable: "BlogPostComment",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "1990ecf6-afa4-4efe-8a21-061c30de6197",
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "cf428079-59db-4b39-b4d0-2bf96220ba96", "AQAAAAIAAYagAAAAEFZ5EFiIcWLXLEqqdzj8T3f+8QUZril7Cdz+WoBH3/82fuEUCXYVbr/WHqm/qkbHxA==", "07ae9abe-636d-497e-9b71-b08a0cdf82d6" });

            migrationBuilder.CreateIndex(
                name: "IX_ReplyComment_CommentId",
                table: "ReplyComment",
                column: "CommentId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ReplyComment");

            migrationBuilder.UpdateData(
                table: "AspNetUsers",
                keyColumn: "Id",
                keyValue: "1990ecf6-afa4-4efe-8a21-061c30de6197",
                columns: new[] { "ConcurrencyStamp", "PasswordHash", "SecurityStamp" },
                values: new object[] { "eb1be610-2f9e-46ef-8d24-776dda9faf0d", "AQAAAAIAAYagAAAAEAS/oBds91eqE283XDqad7kjPz8s4WAFLhKfpX5Z25f0Bs5ge72tvHcE909i8SZczA==", "8f6773cc-b512-43f4-809c-1ab97ebf17bb" });
        }
    }
}
