using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace mythos_backend_dotnet.Migrations
{
    /// <inheritdoc />
    public partial class SeedInitialPlansAndPackages : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.InsertData(
                table: "MythrasPackages",
                columns: new[] { "MythrasPackageId", "BonusMythras", "CreatedAt", "IsActive", "MythrasAmount", "Name", "Price" },
                values: new object[,]
                {
                    { 1, 0, new DateTime(2025, 6, 26, 1, 25, 19, 645, DateTimeKind.Utc).AddTicks(8732), true, 100, "Paquete Chico", 99.00m },
                    { 2, 50, new DateTime(2025, 6, 26, 1, 25, 19, 645, DateTimeKind.Utc).AddTicks(8880), true, 200, "Paquete Mediano", 199.00m },
                    { 3, 100, new DateTime(2025, 6, 26, 1, 25, 19, 645, DateTimeKind.Utc).AddTicks(8882), true, 400, "Paquete Grande", 399.00m }
                });

            migrationBuilder.InsertData(
                table: "SuscriptionPlans",
                columns: new[] { "SuscriptionPlanId", "CreatedAt", "DurationDays", "ExtraBenefits", "IsActive", "MythrasMonthlyBonus", "Name", "Price" },
                values: new object[,]
                {
                    { 1, new DateTime(2025, 6, 26, 1, 25, 19, 645, DateTimeKind.Utc).AddTicks(1522), 30, "Lecturas limitadas", true, 100, "Plan Básico", 49.00m },
                    { 2, new DateTime(2025, 6, 26, 1, 25, 19, 645, DateTimeKind.Utc).AddTicks(1679), 30, "Lecturas y soporte", true, 250, "Plan Estándar", 99.00m },
                    { 3, new DateTime(2025, 6, 26, 1, 25, 19, 645, DateTimeKind.Utc).AddTicks(1681), 30, "Todo ilimitado", true, 500, "Plan Premium", 149.00m }
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DeleteData(
                table: "MythrasPackages",
                keyColumn: "MythrasPackageId",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "MythrasPackages",
                keyColumn: "MythrasPackageId",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "MythrasPackages",
                keyColumn: "MythrasPackageId",
                keyValue: 3);

            migrationBuilder.DeleteData(
                table: "SuscriptionPlans",
                keyColumn: "SuscriptionPlanId",
                keyValue: 1);

            migrationBuilder.DeleteData(
                table: "SuscriptionPlans",
                keyColumn: "SuscriptionPlanId",
                keyValue: 2);

            migrationBuilder.DeleteData(
                table: "SuscriptionPlans",
                keyColumn: "SuscriptionPlanId",
                keyValue: 3);
        }
    }
}
