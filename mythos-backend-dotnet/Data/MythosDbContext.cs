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

            base.OnModelCreating(modelBuilder);
        }
    }
}
