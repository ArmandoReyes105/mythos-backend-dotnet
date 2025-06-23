using Microsoft.Data.Sqlite;
using Microsoft.EntityFrameworkCore;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Services;
using mythos_backend_dotnet.Tests.TestUtils;

namespace mythos_backend_dotnet.Tests.Services
{
    public class MythosWalletServiceTests : IDisposable
    {
        private readonly SqliteConnection connection;
        private readonly MythosDbContext context;
        private readonly MythosWalletService service;

        private readonly Guid userIdWithWallet = Guid.NewGuid();
        private readonly Guid userIdWithoutWallet = Guid.NewGuid();

        public MythosWalletServiceTests()
        {
            (context, connection) = InMemoryDbFactory.CreateSqliteInMemory();
            service = new MythosWalletService(context);

            context.Accounts.Add(new Account { Id = userIdWithWallet, Username = "userWithWallet"} );
            context.MythosWallets.Add(new MythosWallet
            {
                UserId = userIdWithWallet,
                MythrasBalance = 100,
                IsLocked = false,
                LastUpdated = DateTime.UtcNow.AddDays(-1)
            });

            context.SaveChanges();
        }

        #region GetWalletByUserIdAsync

        [Fact]
        public async Task GetWalletByUserIdAsync_ReturnsWallet_WhenExists()
        {
            //Arrange
            var id = userIdWithWallet; 

            // Act
            var result = await service.GetWalletByUserIdAsync(id);

            // Assert
            Assert.NotNull(result);
            Assert.Equal(userIdWithWallet, result!.UserId);
            Assert.Equal(100, result.MythrasBalance);
            Assert.False(result.IsLocked);
        }

        [Fact]
        public async Task GetWalletByUserIdAsync_ReturnsNull_WhenNotExists()
        {
            //Arrange
            var id = userIdWithoutWallet; 

            // Act
            var result = await service.GetWalletByUserIdAsync(id);

            // Assert
            Assert.Null(result);
        }

        #endregion

        #region BlockWalletAsync

        [Fact]
        public async Task BlockWalletAsync_Succeeds_WhenWalletExistsAndNotLocked()
        {
            //Arrange
            var id = userIdWithWallet;

            // Act
            var result = await service.BlockWalletAsync(id);

            // Assert
            var wallet = await context.MythosWallets.FirstAsync(w => w.UserId == id);

            Assert.True(result);
            Assert.NotNull(wallet);
            Assert.True(wallet!.IsLocked);
        }

        [Fact]
        public async Task BlockWalletAsync_Fails_WhenWalletDoesNotExist()
        {
            //Arrange
            var id = userIdWithoutWallet; 

            // Act
            var result = await service.BlockWalletAsync(id);

            // Assert
            Assert.False(result);
        }

        [Fact]
        public async Task BlockWalletAsync_Fails_WhenWalletAlreadyLocked()
        {
            // Arrange
            var wallet = await context.MythosWallets.FirstAsync(w => w.UserId == userIdWithWallet);
            wallet!.IsLocked = true;
            await context.SaveChangesAsync();

            // Act
            var result = await service.BlockWalletAsync(userIdWithWallet);

            // Assert
            Assert.False(result);
        }

        #endregion

        #region UnblockWalletAsync

        [Fact]
        public async Task UnblockWalletAsync_Succeeds_WhenWalletExistsAndIsLocked()
        {
            // Arrange
            var wallet = await context.MythosWallets.FirstAsync(w => w.UserId == userIdWithWallet);
            wallet!.IsLocked = true;
            await context.SaveChangesAsync();

            // Act
            var result = await service.UnblockWalletAsync(userIdWithWallet);

            // Assert
            var updatedWallet = await context.MythosWallets.FirstAsync(w => w.UserId == userIdWithWallet);

            Assert.True(result);
            Assert.NotNull(updatedWallet);
            Assert.False(updatedWallet!.IsLocked);
        }

        [Fact]
        public async Task UnblockWalletAsync_Fails_WhenWalletDoesNotExist()
        {
            //Arrange
            var id = userIdWithoutWallet;

            // Act
            var result = await service.UnblockWalletAsync(id);

            // Assert
            Assert.False(result);
        }

        [Fact]
        public async Task UnblockWalletAsync_Fails_WhenWalletIsNotLocked()
        {
            //Arrange
            var id = userIdWithWallet; 

            // Act
            var result = await service.UnblockWalletAsync(id);

            // Assert
            Assert.False(result);
        }

        #endregion

        public void Dispose()
        {
            context.Dispose();
            connection.Dispose();
        }
    }
}
