using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using mythos_backend_dotnet.Models;
using mythos_backend_dotnet.Services;

namespace mythos_backend_dotnet.Controllers
{
    [Route("api/account")]
    [ApiController]
    public class AccountController(IAccountService accountService) : ControllerBase
    {
        [HttpGet("{id}")]
        [Authorize]
        public async Task<ActionResult<AccountDto>> GetAccountById(Guid id)
        {
            var account = await accountService.GetAccountByIdAsync(id);

            if (account == null)
                return NotFound();

            return Ok(account);
        }

        [HttpGet()]
        [Authorize]
        public async Task<ActionResult<AccountResponseDto>> GetAccountByAccessTokenCookie()
        {

            var accountIdClaim = User.Claims.FirstOrDefault(c => c.Type == "accountId");
            if (accountIdClaim == null)
                return Unauthorized("No se encontró el ID en el token");

            var accountId = Guid.Parse(accountIdClaim.Value);

            var account = await accountService.GetAccountByAccessTokenCookieAsync(accountId);

            if (account == null)
                return NotFound();

            return Ok(account);
        }

        [HttpPut("{id}")]
        [Authorize]
        public async Task<ActionResult> UpdateAccount(Guid id, [FromBody] EditProfileRequestDto model)
        {
            var result = await accountService.UpdateAccountAsync(id, model);

            if (result is null)
                return NotFound();

            return Ok();
        }

        [HttpPut("{id}/password")]
        [Authorize]
        public async Task<ActionResult> ChangePassword(Guid id, [FromBody] ChangePasswordRequest request)
        {
            var userIdClaim = User.Claims.FirstOrDefault(c => c.Type == "accountId");
            if (userIdClaim is null || userIdClaim.Value != id.ToString())
                return Forbid();

            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var success = await accountService.ChangePasswordAsync(id, request);

            if (!success)
                return NotFound();

            return NoContent();
        }
    }
}
