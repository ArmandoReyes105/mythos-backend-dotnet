using Microsoft.Data.Sqlite;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Tests.TestUtils;

namespace mythos_backend_dotnet.Tests.Services
{
    public class MythosTransactionServiceTests : IDisposable
    {
        private readonly SqliteConnection connection; 
        private readonly MythosDbContext context;
        private readonly MythosTransactionService service;

        private readonly Guid senderId = Guid.NewGuid();
        private readonly Guid receiverId = Guid.NewGuid();

        public MythosTransactionServiceTests()
        {
            (context, connection) = InMemoryDbFactory.CreateSqliteInMemory();
            service = new MythosTransactionService(context);

            var senderWallet = new MythosWallet
            {
                UserId = senderId,
                MythrasBalance = 100,
                IsLocked = false
            };

            var receiverWallet = new MythosWallet
            {
                UserId = receiverId,
                MythrasBalance = 50,
                IsLocked = false
            };

            context.Accounts.AddRange(
                new Account { Id = senderId, Username = "SenderUser" },
                new Account { Id = receiverId, Username = "ReceiverUser" }
            );

            context.MythosWallets.AddRange(senderWallet, receiverWallet);
            context.SaveChanges();
        }

        #region DonateAsync

        [Fact]
        public async Task DonateAsync_Succeeds_WhenValid()
        {
            // Arrange
            var dto = new CreateDonationDto
            {
                ReceiverAccountId = receiverId,
                Amount = 30
            };

            // Act
            var (success, message, response) = await service.DonateAsync(senderId, dto);

            // Assert
            Assert.True(success, $"Fallo la donación. Mensaje: {message}");
            Assert.Equal("Donación exitosa", message);
            Assert.NotNull(response);
            Assert.Equal(70, response!.SenderBalance);   // 100 - 30
            Assert.Equal(80, response.ReceiverBalance);  // 50 + 30
        }

        [Fact]
        public async Task DonateAsync_Fails_WhenAmountIsZero()
        {
            // Arrange
            var dto = new CreateDonationDto { ReceiverAccountId = receiverId, Amount = 0 };

            // Act
            var (success, message, response) = await service.DonateAsync(senderId, dto);

            // Assert
            Assert.False(success);
            Assert.Equal("La cantidad a donar debe ser mayor a cero.", message);
            Assert.Null(response);
        }

        [Fact]
        public async Task DonateAsync_Fails_WhenDonatingToSelf()
        {
            // Arrange
            var dto = new CreateDonationDto { ReceiverAccountId = senderId, Amount = 10 };

            // Act
            var (success, message, response) = await service.DonateAsync(senderId, dto);

            // Assert
            Assert.False(success);
            Assert.Equal("No puedes donar a ti mismo.", message);
            Assert.Null(response);
        }

        [Fact]
        public async Task DonateAsync_Fails_WhenSenderWalletIsMissing()
        {
            // Arrange
            var fakeSenderId = Guid.NewGuid(); // no tiene wallet
            var dto = new CreateDonationDto { ReceiverAccountId = receiverId, Amount = 10 };

            // Act
            var (success, message, response) = await service.DonateAsync(fakeSenderId, dto);

            // Assert
            Assert.False(success);
            Assert.Contains("no tiene wallet", message);
            Assert.Null(response);
        }

        [Fact]
        public async Task DonateAsync_Fails_WhenReceiverWalletIsMissing()
        {
            // Arrange
            var fakeReceiverId = Guid.NewGuid(); // no tiene wallet
            var dto = new CreateDonationDto { ReceiverAccountId = fakeReceiverId, Amount = 10 };

            // Act
            var (success, message, response) = await service.DonateAsync(senderId, dto);

            // Assert
            Assert.False(success);
            Assert.Equal("El escritor receptor no tiene wallet.", message);
            Assert.Null(response);
        }

        [Fact]
        public async Task DonateAsync_Fails_WhenSenderWalletLocked()
        {
            // Arrange
            var wallet = context.MythosWallets.First(w => w.UserId == senderId);
            wallet.IsLocked = true;
            context.SaveChanges();

            var dto = new CreateDonationDto { ReceiverAccountId = receiverId, Amount = 10 };

            // Act
            var (success, message, response) = await service.DonateAsync(senderId, dto);

            // Assert
            Assert.False(success);
            Assert.Equal("Tu wallet está bloqueada. No puedes donar.", message);
            Assert.Null(response);
        }

        [Fact]
        public async Task DonateAsync_Fails_WhenReceiverWalletLocked()
        {
            // Arrange
            var wallet = context.MythosWallets.First(w => w.UserId == receiverId);
            wallet.IsLocked = true;
            context.SaveChanges();

            var dto = new CreateDonationDto { ReceiverAccountId = receiverId, Amount = 10 };

            // Act
            var (success, message, response) = await service.DonateAsync(senderId, dto);

            // Assert
            Assert.False(success);
            Assert.Equal("La wallet del receptor está bloqueada. No puede recibir donaciones.", message);
            Assert.Null(response);
        }

        [Fact]
        public async Task DonateAsync_Fails_WhenInsufficientBalance()
        {
            // Arrange
            var dto = new CreateDonationDto { ReceiverAccountId = receiverId, Amount = 1000 };

            // Act
            var (success, message, response) = await service.DonateAsync(senderId, dto);

            // Assert
            Assert.False(success);
            Assert.Equal("Saldo insuficiente para donar.", message);
            Assert.Null(response);
        }

        #endregion

        public void Dispose()
        {
            context.Dispose();
            connection.Dispose();
        }
    }
}
