using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace mythos_backend_dotnet.Migrations
{
    /// <inheritdoc />
    public partial class SuscriptionPlanNullableEnTransaction : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Transactions_MythrasPackages_MythrasPackageId",
                table: "Transactions");

            migrationBuilder.DropForeignKey(
                name: "FK_Transactions_SuscriptionPlans_SuscriptionPlanId",
                table: "Transactions");

            migrationBuilder.AlterColumn<int>(
                name: "SuscriptionPlanId",
                table: "Transactions",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AlterColumn<int>(
                name: "MythrasPackageId",
                table: "Transactions",
                type: "int",
                nullable: true,
                oldClrType: typeof(int),
                oldType: "int");

            migrationBuilder.AddForeignKey(
                name: "FK_Transactions_MythrasPackages_MythrasPackageId",
                table: "Transactions",
                column: "MythrasPackageId",
                principalTable: "MythrasPackages",
                principalColumn: "MythrasPackageId");

            migrationBuilder.AddForeignKey(
                name: "FK_Transactions_SuscriptionPlans_SuscriptionPlanId",
                table: "Transactions",
                column: "SuscriptionPlanId",
                principalTable: "SuscriptionPlans",
                principalColumn: "SuscriptionPlanId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Transactions_MythrasPackages_MythrasPackageId",
                table: "Transactions");

            migrationBuilder.DropForeignKey(
                name: "FK_Transactions_SuscriptionPlans_SuscriptionPlanId",
                table: "Transactions");

            migrationBuilder.AlterColumn<int>(
                name: "SuscriptionPlanId",
                table: "Transactions",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "MythrasPackageId",
                table: "Transactions",
                type: "int",
                nullable: false,
                defaultValue: 0,
                oldClrType: typeof(int),
                oldType: "int",
                oldNullable: true);

            migrationBuilder.AddForeignKey(
                name: "FK_Transactions_MythrasPackages_MythrasPackageId",
                table: "Transactions",
                column: "MythrasPackageId",
                principalTable: "MythrasPackages",
                principalColumn: "MythrasPackageId",
                onDelete: ReferentialAction.Cascade);

            migrationBuilder.AddForeignKey(
                name: "FK_Transactions_SuscriptionPlans_SuscriptionPlanId",
                table: "Transactions",
                column: "SuscriptionPlanId",
                principalTable: "SuscriptionPlans",
                principalColumn: "SuscriptionPlanId",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
