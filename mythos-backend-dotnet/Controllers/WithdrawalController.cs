using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using mythos_backend_dotnet.Models;
using mythos_backend_dotnet.Services;
using System.Security.Claims;

namespace mythos_backend_dotnet.Controllers
{
    [Route("api/withdrawals")]
    [ApiController]
    public class WithdrawalController(IWithdrawalService withdrawalService) : ControllerBase
    {
        [HttpPost]
        [Authorize(Roles = "writer")]
        public async Task<IActionResult> RequestWithdrawal([FromBody] CreateWithdrawalRequestDto dto)
        {
            var accountIdClaim = User.Claims.FirstOrDefault(c => c.Type == "accountId");
            if (accountIdClaim == null)
                return Unauthorized("No se encontró el ID en el token");

            var userId = Guid.Parse(accountIdClaim.Value);
            var response = await withdrawalService.RequestWithdrawalAsync(userId, dto);

            if (response.Status == "Aceptado")
                return Ok(response);
            return BadRequest(response);
        }
    }
}