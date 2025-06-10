using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using mythos_backend_dotnet.Models;
using mythos_backend_dotnet.Services;
using System.Security.Claims;

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

        [HttpPut("{id}")]
        [Authorize]
        public async Task<ActionResult> UpdateAccount(Guid id, [FromBody] AccountDto model)
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
            var userIdClaim = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
            if (userIdClaim is null || userIdClaim != id.ToString())
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
