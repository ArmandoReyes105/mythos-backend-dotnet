using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Models;
using mythos_backend_dotnet.Services;

namespace mythos_backend_dotnet.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController(IAuthService authService) : ControllerBase
    {

        [HttpPost("register")]
        public async Task<ActionResult<Account>> Register(CreateAccountRequestDto request)
        {
            var user = await authService.RegisterAsync(request);

            if (user is null)
                return BadRequest(new { message = "El nombre de usuario ya existe. Por favor intente con otro." });

            return Ok(user);
        }

        [HttpPost("login")]
        public async Task<ActionResult<TokenResponseDto>> Login(AccountDto request)
        {
            var response = await authService.LoginAsync(request);

            if (response is null)
                return BadRequest("Invalid username or password.");

            var accessTokenOptions = new CookieOptions
            {
                HttpOnly = true,
                Secure = true,
                SameSite = SameSiteMode.None,
                Expires = DateTime.UtcNow.AddDays(1)
            };

            var refreshTokenOptions = new CookieOptions
            {
                HttpOnly = true,
                Secure = false,
                SameSite = SameSiteMode.Strict,
                Expires = DateTime.UtcNow.AddDays(7)
            };

            Response.Cookies.Append("accessToken", response.AccessToken, accessTokenOptions);
            Response.Cookies.Append("refreshToken", response.RefreshToken, refreshTokenOptions);

            return Ok(new { message = "Login successful" });
        }

        [HttpPost("refresh-token")]
        public async Task<ActionResult> RefreshToken()
        {
            var refreshToken = Request.Cookies["refreshToken"];
            var userIdString = User.Claims.FirstOrDefault(c => c.Type == "accountId")?.Value;

            if (string.IsNullOrEmpty(refreshToken) || string.IsNullOrEmpty(userIdString) || !Guid.TryParse(userIdString, out var userId))
            {
                return Unauthorized("Invalid refresh token or user.");
            }

            var result = await authService.RefreshTokensAsync(userId, refreshToken);

            if (result is null)
                return Unauthorized("Invalid refresh token.");

            var accessTokenOptions = new CookieOptions
            {
                HttpOnly = true,
                Secure = false,
                SameSite = SameSiteMode.Strict,
                Expires = DateTime.UtcNow.AddDays(1)
            };

            var refreshTokenOptions = new CookieOptions
            {
                HttpOnly = true,
                Secure = false,
                SameSite = SameSiteMode.Strict,
                Expires = DateTime.UtcNow.AddDays(7)
            };

            Response.Cookies.Append("accessToken", result.AccessToken, accessTokenOptions);
            Response.Cookies.Append("refreshToken", result.RefreshToken, refreshTokenOptions);

            return Ok(new { message = "Token refreshed successfully" });
        }


        [Authorize]
        [HttpGet]
        public IActionResult AuthenticatedOnlyEndpoint()
        {
            return Ok("You are authenticated!");
        }

        [Authorize]
        [HttpPost("logout")]
        public IActionResult Logout()
        {
            Response.Cookies.Delete("accessToken");
            Response.Cookies.Delete("refreshToken");
            return Ok(new { message = "Logged out successfully" });
        }

        [Authorize(Roles = "Admin")]
        [HttpGet("admin-only")]
        public IActionResult AdminOnlyEndpoint()
        {
            return Ok("You are an admin!");
        }
    }
}
