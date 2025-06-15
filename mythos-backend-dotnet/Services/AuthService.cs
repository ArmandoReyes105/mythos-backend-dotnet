using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Models;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;

namespace mythos_backend_dotnet.Services
{
    public class AuthService(MythosDbContext context, IConfiguration configuration) : IAuthService
    {
        public async Task<TokenResponseDto?> LoginAsync(AccountDto request)
        {
            var user = await context.Accounts.FirstOrDefaultAsync(u => u.Username == request.Username);

            if (user is null)
            {
                return null;
            }

            if (new PasswordHasher<Account>().VerifyHashedPassword(user, user.PasswordHash, request.Password) == PasswordVerificationResult.Failed)
            {
                return null;
            }

            return await CreateTokenResponse(user);
        }

        public async Task<Account?> RegisterAsync(CreateAccountRequestDto request)
        {

            if(await context.Accounts.AnyAsync(a => a.Username == request.Username))
            {
                return null; 
            }

            var account = new Account();

            var hashedPassword = new PasswordHasher<Account>()
                .HashPassword(account, request.Password);

            account.Username = request.Username;
            account.Email = request.Email;
            account.Role = "reader"; // Default role, can be changed later
            account.PasswordHash = hashedPassword;

            context.Accounts.Add(account);
            await context.SaveChangesAsync();

            return account;
        }
        public async Task<TokenResponseDto?> RefreshTokensAsync(RefreshTokenRequestDto request)
        {
            var user = await ValidateRefreshTokenAsync(request.UserId, request.RefreshToken);

            if (user is null)
                return null;

            return await CreateTokenResponse(user);
        }
        private async Task<Account?> ValidateRefreshTokenAsync(Guid userId, string refreshToken)
        {
            var user = await context.Accounts.FindAsync(userId);

            if(user is null ||
                user.RefreshToken != refreshToken || 
                user.RefreshTokenExpiryTime <= DateTime.UtcNow)
            {
                return null;
            }

            return user;
        }
        private static string GenerateRefreshToken()
        {
            var randomNumber = new byte[32];
            using var rng = RandomNumberGenerator.Create();
            rng.GetBytes(randomNumber);
            return Convert.ToBase64String(randomNumber);
        }

        private async Task<string> GenerateAndSaveRefreshTokenAsync(Account user)
        {
            var refreshToken = GenerateRefreshToken();
            user.RefreshToken = refreshToken;
            user.RefreshTokenExpiryTime = DateTime.UtcNow.AddDays(7);

            await context.SaveChangesAsync();
            return refreshToken;
        }

        private async Task<TokenResponseDto> CreateTokenResponse(Account user)
        {
            return new TokenResponseDto
            {
                AccessToken = CreateToken(user),
                RefreshToken = await GenerateAndSaveRefreshTokenAsync(user)
            };
        }
        private string CreateToken(Account user)
        {
            var claims = new List<Claim>
            {
                new("username", user.Username),
                new("accountId", user.Id.ToString()),
                new("role", user.Role)
            };

            var key = new SymmetricSecurityKey(
                Encoding.UTF8.GetBytes(configuration.GetValue<string>("AppSettings:Token")!));

            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha512);

            var tokenDescriptor = new JwtSecurityToken(
                issuer: configuration.GetValue<string>("AppSettings:Issuer"),
                audience: configuration.GetValue<string>("AppSettings:Audience"),
                claims: claims,
                expires: DateTime.UtcNow.AddDays(1),
                signingCredentials: creds
            );

            return new JwtSecurityTokenHandler().WriteToken(tokenDescriptor);
        }
    }
}
