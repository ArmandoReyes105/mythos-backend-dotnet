using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace mythos_backend_dotnet.Migrations
{
    /// <inheritdoc />
    public partial class UpdateSeedData : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "MythrasPackages",
                keyColumn: "MythrasPackageId",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2025, 6, 24, 0, 0, 0, 0, DateTimeKind.Utc));

            migrationBuilder.UpdateData(
                table: "MythrasPackages",
                keyColumn: "MythrasPackageId",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2025, 6, 24, 0, 0, 0, 0, DateTimeKind.Utc));

            migrationBuilder.UpdateData(
                table: "MythrasPackages",
                keyColumn: "MythrasPackageId",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2025, 6, 24, 0, 0, 0, 0, DateTimeKind.Utc));

            migrationBuilder.UpdateData(
                table: "SuscriptionPlans",
                keyColumn: "SuscriptionPlanId",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2025, 6, 24, 0, 0, 0, 0, DateTimeKind.Utc));

            migrationBuilder.UpdateData(
                table: "SuscriptionPlans",
                keyColumn: "SuscriptionPlanId",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2025, 6, 24, 0, 0, 0, 0, DateTimeKind.Utc));

            migrationBuilder.UpdateData(
                table: "SuscriptionPlans",
                keyColumn: "SuscriptionPlanId",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2025, 6, 24, 0, 0, 0, 0, DateTimeKind.Utc));
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.UpdateData(
                table: "MythrasPackages",
                keyColumn: "MythrasPackageId",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2025, 6, 26, 1, 25, 19, 645, DateTimeKind.Utc).AddTicks(8732));

            migrationBuilder.UpdateData(
                table: "MythrasPackages",
                keyColumn: "MythrasPackageId",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2025, 6, 26, 1, 25, 19, 645, DateTimeKind.Utc).AddTicks(8880));

            migrationBuilder.UpdateData(
                table: "MythrasPackages",
                keyColumn: "MythrasPackageId",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2025, 6, 26, 1, 25, 19, 645, DateTimeKind.Utc).AddTicks(8882));

            migrationBuilder.UpdateData(
                table: "SuscriptionPlans",
                keyColumn: "SuscriptionPlanId",
                keyValue: 1,
                column: "CreatedAt",
                value: new DateTime(2025, 6, 26, 1, 25, 19, 645, DateTimeKind.Utc).AddTicks(1522));

            migrationBuilder.UpdateData(
                table: "SuscriptionPlans",
                keyColumn: "SuscriptionPlanId",
                keyValue: 2,
                column: "CreatedAt",
                value: new DateTime(2025, 6, 26, 1, 25, 19, 645, DateTimeKind.Utc).AddTicks(1679));

            migrationBuilder.UpdateData(
                table: "SuscriptionPlans",
                keyColumn: "SuscriptionPlanId",
                keyValue: 3,
                column: "CreatedAt",
                value: new DateTime(2025, 6, 26, 1, 25, 19, 645, DateTimeKind.Utc).AddTicks(1681));
        }
    }
}
