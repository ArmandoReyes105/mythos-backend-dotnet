using Microsoft.EntityFrameworkCore;
using mythos_backend_dotnet.Entities;

namespace mythos_backend_dotnet.Data
{
    public class MythosDbContext(DbContextOptions<MythosDbContext> options) : DbContext(options)
    {
        public DbSet<Account> Accounts { get; set; }
        public DbSet<Person> People { get; set; }
        public DbSet<MythosTransaction> MythosTransactions { get; set; }
        public DbSet<Purchase> Purchases { get; set; }
        public DbSet<SuscriptionPlan> SuscriptionPlans { get; set; }
        public DbSet<MythrasPackage> MythrasPackages { get; set; }
        public DbSet<Transaction> Transactions { get; set; }
        public DbSet<AccountSuscriptionPlan> AccountSuscriptionPlans { get; set; }
        public DbSet<MythosWallet> MythosWallets { get; set; }
        public DbSet<Withdrawal> Withdrawals { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<MythosTransaction>()
                .HasOne(mt => mt.Account)
                .WithMany()
                .HasForeignKey(mt => mt.AccountId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<MythosTransaction>()
                .HasOne(mt => mt.CounterpartyAccount)
                .WithMany()
                .HasForeignKey(mt => mt.CounterpartyAccountId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<AccountSuscriptionPlan>()
                .HasKey(usp => new { usp.AccountId, usp.SuscriptionPlanId });

            modelBuilder.Entity<AccountSuscriptionPlan>()
                .HasOne(usp => usp.Account)
                .WithMany()
                .HasForeignKey(usp => usp.AccountId)
                .OnDelete(DeleteBehavior.Restrict);

            modelBuilder.Entity<AccountSuscriptionPlan>()
                .HasOne(usp => usp.SuscriptionPlan)
                .WithMany()
                .HasForeignKey(usp => usp.SuscriptionPlanId)
                .OnDelete(DeleteBehavior.Restrict);


            // Seeding de planes de suscripción
            modelBuilder.Entity<SuscriptionPlan>().HasData(
                new SuscriptionPlan
                {
                    SuscriptionPlanId = 1,
                    Name = "Plan Básico",
                    Price = 49.00m,
                    DurationDays = 30,
                    MythrasMonthlyBonus = 100,
                    ExtraBenefits = "Lecturas limitadas",
                    IsActive = true,
                    CreatedAt = new DateTime(2025, 6, 24, 0, 0, 0, DateTimeKind.Utc)
                },
                new SuscriptionPlan
                {
                    SuscriptionPlanId = 2,
                    Name = "Plan Estándar",
                    Price = 99.00m,
                    DurationDays = 30,
                    MythrasMonthlyBonus = 250,
                    ExtraBenefits = "Lecturas y soporte",
                    IsActive = true,
                    CreatedAt = new DateTime(2025, 6, 24, 0, 0, 0, DateTimeKind.Utc)
                },
                new SuscriptionPlan
                {
                    SuscriptionPlanId = 3,
                    Name = "Plan Premium",
                    Price = 149.00m,
                    DurationDays = 30,
                    MythrasMonthlyBonus = 500,
                    ExtraBenefits = "Todo ilimitado",
                    IsActive = true,
                    CreatedAt = new DateTime(2025, 6, 24, 0, 0, 0, DateTimeKind.Utc)
                }
            );

            // Seeding de paquetes de Mythras
            modelBuilder.Entity<MythrasPackage>().HasData(
                new MythrasPackage
                {
                    MythrasPackageId = 1,
                    Name = "Paquete Chico",
                    MythrasAmount = 100,
                    Price = 99.00m,
                    BonusMythras = 0,
                    IsActive = true,
                    CreatedAt = new DateTime(2025, 6, 24, 0, 0, 0, DateTimeKind.Utc)
                },
                new MythrasPackage
                {
                    MythrasPackageId = 2,
                    Name = "Paquete Mediano",
                    MythrasAmount = 200,
                    Price = 199.00m,
                    BonusMythras = 50,
                    IsActive = true,
                    CreatedAt = new DateTime(2025, 6, 24, 0, 0, 0, DateTimeKind.Utc)
                },
                new MythrasPackage
                {
                    MythrasPackageId = 3,
                    Name = "Paquete Grande",
                    MythrasAmount = 400,
                    Price = 399.00m,
                    BonusMythras = 100,
                    IsActive = true,
                    CreatedAt = new DateTime(2025, 6, 24, 0, 0, 0, DateTimeKind.Utc)
                }
            );

            base.OnModelCreating(modelBuilder);
        }
    }
}
