using Microsoft.EntityFrameworkCore;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Models;
using mythos_backend_dotnet.Services;
using mythos_backend_dotnet.Tests.Builders;
using mythos_backend_dotnet.Tests.TestUtils;

namespace mythos_backend_dotnet.Tests.Services
{
    public class AuthServiceTests
    {
        private readonly MythosDbContext context;
        private readonly AuthService service; 
        public AuthServiceTests()
        {
            context = InMemoryDbFactory.Create();
            service = new AuthService(context, TestConfiguration.Create());

            var account = new AccountBuilder()
                .WithUsername("HaxRay")
                .WithPassword("j53Rmd7S")
                .Build();

            var refreshTokenAccount = new AccountBuilder()
                .WithUsername("TokenUser")
                .WithRefreshToken(Guid.NewGuid().ToString(), DateTime.UtcNow.AddDays(1))
                .Build();

            var expiredTokenAccount = new AccountBuilder()
                .WithUsername("ExpiredTokenUser")
                .WithRefreshToken(Guid.NewGuid().ToString(), DateTime.UtcNow.AddDays(-1))
                .Build();

            context.Accounts.AddRange(account, refreshTokenAccount, expiredTokenAccount);
            context.SaveChanges();
        }

        #region LoginAsync 
        [Fact]
        public async Task LoginAsync_ReturnsToken_WhenCredentialsAreValid()
        {
            //Arrange
            var request = new AccountDto { Username = "HaxRay", Password = "j53Rmd7S" }; 

            //Act
            var result = await service.LoginAsync(request);

            //Assert
            Assert.NotNull(result);
            Assert.False(string.IsNullOrEmpty(result.AccessToken));
            Assert.False(string.IsNullOrEmpty(result.RefreshToken));
        }

        [Fact]
        public async Task LoginAsync_ReturnsNull_WhenUserDoesNotExist()
        {
            //Arrange
            var request = new AccountDto { Username = "HaxRayNull", Password = "j53Rmd7S" };

            //Act
            var result = await service.LoginAsync(request);

            //Assert
            Assert.Null(result); 
        }

        [Fact]
        public async Task LoginAsync_ReturnsNull_WhenPasswordIsInvalid()
        {
            //Arrange
            var request = new AccountDto { Username = "HaxRay", Password = "ajy458ahv" };

            //Act
            var result = await service.LoginAsync(request);

            //Assert
            Assert.Null(result);
        }

        #endregion

        #region RegisterAsync

        [Fact]
        public async Task RegisterAsync_CreatesAccountAndWallet_WhenDataIsValid()
        {
            //Arrange
            var request = new CreateAccountRequestDto { Username = "JeyRod", Password = "yjgsn548a", Email = "mythos@example.com" };

            //Act
            var result = await service.RegisterAsync(request);

            //Assert
            Assert.NotNull(result);
            Assert.Equal(request.Username, result.Username);
        }

        [Fact]
        public async Task RegisterAsync_ReturnsNull_WhenUsernameAlreadyExists()
        {
            //Arrange
            var request = new CreateAccountRequestDto { Username = "HaxRay", Password = "yjgsn234ls", Email = "mythos@example.com" };

            //Act
            var result = await service.RegisterAsync(request);

            //Assert
            Assert.Null(result);
        }

        #endregion

        #region RefreshTokenAsync

        [Fact]
        public async Task RefreshTokenAsync_ReturnsNewToken_WhenRefreshTokenIsValid()
        {
            //Arrange
            var account = await context.Accounts.Where(a => a.Username == "TokenUser").FirstAsync();
            Assert.NotNull(account.RefreshToken);

            //Act
            var result = await service.RefreshTokensAsync(account.Id, account.RefreshToken);

            //Assert
            Assert.NotNull(result);
            Assert.False(string.IsNullOrEmpty(result.AccessToken));
            Assert.False(string.IsNullOrEmpty(result.RefreshToken));
        }

        [Fact]
        public async Task RefreshTokenAsync_ReturnsNull_WhenRefreshTokenIsInvalid()
        {
            //Arrange
            var account = await context.Accounts.Where(a => a.Username == "TokenUser").FirstAsync();

            //Act
            var result = await service.RefreshTokensAsync(account.Id, "aygGj87H57GkoG57");

            //Assert
            Assert.Null(result);
        }

        [Fact]
        public async Task RefreshTokenAsync_ReturnsNull_WhenRefreshTokenIsExpired()
        {
            //Arrange
            var account = await context.Accounts.Where(a => a.Username == "ExpiredTokenUser").FirstAsync();
            Assert.NotNull(account.RefreshToken);

            //Act
            var result = await service.RefreshTokensAsync(account.Id, account.RefreshToken);

            //Assert
            Assert.Null(result);
        }

        #endregion

    }
}
