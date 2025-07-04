using Microsoft.Data.Sqlite;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Services.Implementations;
using mythos_backend_dotnet.Tests.TestUtils;

namespace mythos_backend_dotnet.Tests.Services
{
    public class PurchaseServiceTests : IDisposable
    {
        private readonly SqliteConnection _connection;
        private readonly MythosDbContext _context;
        private readonly PurchaseService _service;
        private readonly Guid _userId = Guid.NewGuid();
        private const string ContentId = "novela-1";

        public PurchaseServiceTests()
        {
            (_context, _connection) = InMemoryDbFactory.CreateSqliteInMemory();
            var uow = TestUnitOfWorkFactory.Create(_context);
            _service = new PurchaseService(uow);

            _context.Accounts.Add(new Account { Id = _userId, Username = "testuser" });
            _context.SaveChanges();
        }

        [Fact]
        public async Task PurchaseContentAsync_Succeeds_WhenValidPurchase()
        {
            _context.MythosWallets.Add(new MythosWallet
            {
                UserId = _userId,
                MythrasBalance = 100,
                IsLocked = false,
                LastUpdated = DateTime.UtcNow
            });
            _context.SaveChanges();

            var (success, message, newBalance) = await _service.PurchaseContentAsync(_userId, ContentId, 50);

            Assert.True(success);
            Assert.Equal("Compra exitosa", message);
            Assert.Equal(50, newBalance);
        }

        [Fact]
        public async Task PurchaseContentAsync_ReturnsError_WhenWalletNotFound()
        {
            var (success, message, newBalance) = await _service.PurchaseContentAsync(_userId, ContentId, 50);

            Assert.False(success);
            Assert.Equal("Wallet no encontrada", message);
            Assert.Null(newBalance);
        }

        [Fact]
        public async Task PurchaseContentAsync_ReturnsError_WhenWalletLocked()
        {
            _context.MythosWallets.Add(new MythosWallet
            {
                UserId = _userId,
                MythrasBalance = 100,
                IsLocked = true,
                LastUpdated = DateTime.UtcNow
            });
            _context.SaveChanges();

            var (success, message, newBalance) = await _service.PurchaseContentAsync(_userId, ContentId, 50);

            Assert.False(success);
            Assert.Equal("La wallet está bloqueada", message);
            Assert.Null(newBalance);
        }

        [Fact]
        public async Task PurchaseContentAsync_ReturnsError_WhenInsufficientFunds()
        {
            _context.MythosWallets.Add(new MythosWallet
            {
                UserId = _userId,
                MythrasBalance = 10,
                IsLocked = false,
                LastUpdated = DateTime.UtcNow
            });
            _context.SaveChanges();

            var (success, message, newBalance) = await _service.PurchaseContentAsync(_userId, ContentId, 50);

            Assert.False(success);
            Assert.Equal("Fondos insuficientes", message);
            Assert.Equal(10, newBalance);
        }

        [Fact]
        public async Task PurchaseContentAsync_ReturnsSuccess_WhenAlreadyPurchased()
        {
            var userId = _userId; 
            if (!_context.Accounts.Any(a => a.Id == userId))
            {
                _context.Accounts.Add(new Account { Id = userId, Username = "tester" });
            }
            _context.MythosWallets.Add(new MythosWallet
            {
                UserId = userId,
                MythrasBalance = 100,
                IsLocked = false,
                LastUpdated = DateTime.UtcNow
            });

            var transaction = new MythosTransaction
            {
                AccountId = userId,
                CounterpartyAccountId = userId,
                Amount = 50,
                CreatedAt = DateTime.UtcNow,
                Type = Enums.MythosTransactionType.PurchaseMade
            };
            _context.MythosTransactions.Add(transaction);
            await _context.SaveChangesAsync(); 

            _context.Purchases.Add(new Purchase
            {
                AccountId = userId,
                ContentId = ContentId,
                MythrasPrice = 50,
                PurchaseDate = DateTime.UtcNow,
                MythosTransactionId = transaction.MythosTransactionId,
                MythosTransaction = transaction
            });

            await _context.SaveChangesAsync();

            var (success, message, newBalance) = await _service.PurchaseContentAsync(userId, ContentId, 50);

            Assert.True(success);
            Assert.Equal("Contenido ya comprado", message);
            Assert.Equal(100, newBalance);
        }

        public void Dispose()
        {
            _context.Dispose();
            _connection.Dispose();
        }
    }

}
