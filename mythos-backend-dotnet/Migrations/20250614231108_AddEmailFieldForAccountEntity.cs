using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace mythos_backend_dotnet.Migrations
{
    /// <inheritdoc />
    public partial class AddEmailFieldForAccountEntity : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Email",
                table: "Accounts",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Email",
                table: "Accounts");
        }
    }
}
