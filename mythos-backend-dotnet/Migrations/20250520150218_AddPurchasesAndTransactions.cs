using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace mythos_backend_dotnet.Migrations
{
    /// <inheritdoc />
    public partial class AddPurchasesAndTransactions : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "MythosTransactions",
                columns: table => new
                {
                    MythosTransactionId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Type = table.Column<int>(type: "int", nullable: false),
                    Amount = table.Column<int>(type: "int", nullable: false),
                    BalanceAfter = table.Column<int>(type: "int", nullable: false),
                    CreatedAt = table.Column<DateTime>(type: "datetime2", nullable: false),
                    AccountId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    CounterpartyAccountId = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_MythosTransactions", x => x.MythosTransactionId);
                    table.ForeignKey(
                        name: "FK_MythosTransactions_Accounts_AccountId",
                        column: x => x.AccountId,
                        principalTable: "Accounts",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_MythosTransactions_Accounts_CounterpartyAccountId",
                        column: x => x.CounterpartyAccountId,
                        principalTable: "Accounts",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "Purchases",
                columns: table => new
                {
                    PurchaseId = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    ContentId = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    MythrasPrice = table.Column<int>(type: "int", nullable: false),
                    PurchaseDate = table.Column<DateTime>(type: "datetime2", nullable: false),
                    AccountId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    MythosTransactionId = table.Column<int>(type: "int", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Purchases", x => x.PurchaseId);
                    table.ForeignKey(
                        name: "FK_Purchases_Accounts_AccountId",
                        column: x => x.AccountId,
                        principalTable: "Accounts",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_Purchases_MythosTransactions_MythosTransactionId",
                        column: x => x.MythosTransactionId,
                        principalTable: "MythosTransactions",
                        principalColumn: "MythosTransactionId",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_MythosTransactions_AccountId",
                table: "MythosTransactions",
                column: "AccountId");

            migrationBuilder.CreateIndex(
                name: "IX_MythosTransactions_CounterpartyAccountId",
                table: "MythosTransactions",
                column: "CounterpartyAccountId");

            migrationBuilder.CreateIndex(
                name: "IX_Purchases_AccountId",
                table: "Purchases",
                column: "AccountId");

            migrationBuilder.CreateIndex(
                name: "IX_Purchases_MythosTransactionId",
                table: "Purchases",
                column: "MythosTransactionId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Purchases");

            migrationBuilder.DropTable(
                name: "MythosTransactions");
        }
    }
}
