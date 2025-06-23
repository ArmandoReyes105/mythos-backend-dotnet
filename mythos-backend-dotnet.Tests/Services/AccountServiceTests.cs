using Microsoft.EntityFrameworkCore;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Exceptions;
using mythos_backend_dotnet.Models;
using mythos_backend_dotnet.Services;
using mythos_backend_dotnet.Tests.Builders;
using mythos_backend_dotnet.Tests.TestUtils;

namespace mythos_backend_dotnet.Tests.Services
{
    public class AccountServiceTests
    {
        private readonly MythosDbContext context;
        private readonly AccountService service;

        public AccountServiceTests()
        {
            context = InMemoryDbFactory.Create();
            var unitOfWork = TestUnitOfWorkFactory.CreateLight(context);
            service = new AccountService(context, unitOfWork);

            var readerAccount = new AccountBuilder()
                .WithUsername("ReaderUser")
                .WithEmail("mythos@gmail.com")
                .WithPassword("aygnb2496")
                .WithRole("reader")
                .Build();

            var writerAccount = new AccountBuilder()
                .WithUsername("WriterUser")
                .WithEmail("writer@gmail.com")
                .WithPassword("agi6a8")
                .WithRole("writer")
                .Build();

            context.Accounts.AddRange(readerAccount, writerAccount);
            context.SaveChanges();
        }

        #region GetAccountByIdAsync

        [Fact]
        public async Task GetAccountByIdAsync_ReturnsAccount_WhenExists()
        {
            //Arrange
            var account = await context.Accounts.FirstAsync();

            //Act
            var result = await service.GetAccountByIdAsync(account.Id);

            //Assert
            Assert.NotNull(result);
            Assert.Equal(account.Username, result.Username);
        }

        [Fact]
        public async Task GetAccountByIdAsync_ReturnsNull_WhenNotExists()
        {
            //Arrange 
            var wrongId = Guid.NewGuid();

            //Act
            var result = await service.GetAccountByIdAsync(wrongId);

            //Assert
            Assert.Null(result);
        }

        #endregion

        #region GetAccountByAcessTokenCookieAsync

        [Fact]
        public async Task GetAccountByAccessTokenCookieAsync_ReturnsAccountResponse_WhenExists()
        {
            //Arrange
            var account = await context.Accounts.FirstAsync();

            //Act
            var result = await service.GetAccountByAccessTokenCookieAsync(account.Id);

            //Assert
            Assert.NotNull(result);
            Assert.Equal(account.Email, result.Email);
        }

        [Fact]
        public async Task GetAccountByAccessTokenCookieAsync_ReturnsNull_WhenNotExists()
        {
            //Arrange
            var wrongId = Guid.NewGuid(); 

            //Act
            var result = await service.GetAccountByAccessTokenCookieAsync(wrongId);

            //Assert
            Assert.Null(result);
        }

        #endregion

        #region UpdateAccountAsync

        [Fact]
        public async Task UpdateAccountAsync_UpdatesFields_WhenValid()
        {
            //Arrange
            var account = await context.Accounts.FirstAsync();
            var dto = new EditProfileRequestDto { Username = "NewUsername", Email = "new@email.com" };

            //Act
            var result = await service.UpdateAccountAsync(account.Id, dto);

            //Assert
            Assert.NotNull(result);
            Assert.Equal(dto.Username, result.Username);
            Assert.Equal(dto.Email, result.Email);
        }

        [Fact]
        public async Task UpdateAccountAsync_ReturnsNull_WhenAccountNotFound()
        {
            //Arrange
            var wrongId = Guid.NewGuid();

            //Act
            var result = await service.UpdateAccountAsync(wrongId, new EditProfileRequestDto());

            //Assert
            Assert.Null(result);
        }

        #endregion

        #region ChangePasswordAsync

        [Fact]
        public async Task ChangePasswordAsync_UpdatesPassword_WhenValid()
        {
            //Arrange
            var account = await context.Accounts.FirstAsync();
            var request = new ChangePasswordRequest { NewPassword = "ayN7hnLYH76h5" };

            //Act
            var result = await service.ChangePasswordAsync(account.Id, request);

            //Assert
            Assert.True(result);
        }

        [Fact]
        public async Task ChangePasswordAsync_ReturnsFalse_WhenAccountNotFound()
        {
            //Arrange
            var id = Guid.NewGuid();
            var request = new ChangePasswordRequest { NewPassword = "ayN7hnLYH76h5" };

            //Act
            var result = await service.ChangePasswordAsync(id, request);

            //Assert
            Assert.False(result);
        }

        #endregion

        #region BecomeWriterAsync

        [Fact]
        public async Task BecomeWriterAsync_Succeeds_WhenReader()
        {
            //Arrange
            var reader = await context.Accounts.FirstAsync(a => a.Role == "reader");
            var dto = new PersonDto
            {
                Name = "Juan",
                LastName = "Pérez",
                Country = "MX",
                BirthDate = new DateTime(1990, 1, 1),
                Biography = "Bio"
            };

            //Act
            var result = await service.BecomeWriterAsync(reader.Id, dto);

            //Assert
            var updated = await context.Accounts.FirstAsync(a => a.Id == reader.Id);
            var person = context.People.FirstOrDefault(p => p.AccountId == reader.Id);

            Assert.NotNull(result);
            Assert.Equal("writer", updated.Role);
            Assert.NotNull(person);
            Assert.Equal(dto.Name, person.Name);
        }

        [Fact]
        public async Task BecomeWriterAsync_Throws_WhenAlreadyWriter()
        {
            //Arrange
            var writer = await context.Accounts.FirstAsync(a => a.Role == "writer");
            var dto = new PersonDto();

            //Act
            var ex = await Assert.ThrowsAsync<BusinessException>(() =>
                service.BecomeWriterAsync(writer.Id, dto));

            //Assert
            Assert.Equal("Ya eres escritor.", ex.Message);
        }

        [Fact]
        public async Task BecomeWriterAsync_Throws_WhenRoleNotReader()
        {
            //Arrange
            var account = new AccountBuilder().WithRole("admin").Build();
            context.Accounts.Add(account);
            await context.SaveChangesAsync();

            var dto = new PersonDto();

            //Act
            var ex = await Assert.ThrowsAsync<BusinessException>(() =>
                service.BecomeWriterAsync(account.Id, dto));

            //Assert
            Assert.Equal("No tienes permiso para convertirte en escritor.", ex.Message);
        }

        [Fact]
        public async Task BecomeWriterAsync_Throws_WhenAccountNotFound()
        {
            //Arrange
            var dto = new PersonDto();

            //Act
            var ex = await Assert.ThrowsAsync<BusinessException>(() =>
                service.BecomeWriterAsync(Guid.NewGuid(), dto));

            //Assert
            Assert.Equal("Cuenta no encontrada.", ex.Message);
        }

        #endregion
    }
}
