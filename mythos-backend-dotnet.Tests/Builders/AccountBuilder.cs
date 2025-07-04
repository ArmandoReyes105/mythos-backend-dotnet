using Microsoft.AspNetCore.Identity;
using mythos_backend_dotnet.Entities;

namespace mythos_backend_dotnet.Tests.Builders
{
    class AccountBuilder
    {
        private Guid _id = Guid.NewGuid();
        private string _username = "mythosUsername";
        private string _email = "mythos@example.com";
        private string _password = "mythosPassword";
        private string _role = "reader";
        private string? _refreshToken = null;
        private DateTime? _refreshTokenExpiry = null;

        public AccountBuilder WithUsername(string username) { _username = username; return this; }
        public AccountBuilder WithEmail(string email) { _email = email; return this; }
        public AccountBuilder WithPassword(string password) { _password = password; return this; }
        public AccountBuilder WithRole(string role) { _role = role; return this; }
        public AccountBuilder WithRefreshToken(string token, DateTime expiry)
        {
            _refreshToken = token;
            _refreshTokenExpiry = expiry;
            return this;
        }

        public Account Build()
        {
            var account = new Account
            {
                Id = _id,
                Username = _username,
                Email = _email,
                Role = _role,
                RefreshToken = _refreshToken,
                RefreshTokenExpiryTime = _refreshTokenExpiry
            };

            account.PasswordHash = new PasswordHasher<Account>().HashPassword(account, _password);

            return account;
        }
    }
}
