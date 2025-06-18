using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using mythos_backend_dotnet.Models;
using mythos_backend_dotnet.Services;
using System.Security.Claims;

namespace mythos_backend_dotnet.Controllers
{
    [Route("api/mythras-purchase")]
    [ApiController]
    public class MythrasPurchaseController(IMythrasPurchaseService mythrasPurchaseService) : ControllerBase
    {
        [HttpPost]
        [Authorize]
        public async Task<IActionResult> PurchaseMythras([FromBody] PurchaseMythrasRequestDto dto)
        {
            var accountIdClaim = User.Claims.FirstOrDefault(c => c.Type == "accountId");
            if (accountIdClaim == null)
                return Unauthorized("No se encontró el ID en el token");
            var userId = Guid.Parse(accountIdClaim.Value);

            var (success, message, response) = await mythrasPurchaseService.PurchaseMythrasAsync(userId, dto);

            if (!success)
                return BadRequest(message);

            return Ok(response);
        }
    }
}