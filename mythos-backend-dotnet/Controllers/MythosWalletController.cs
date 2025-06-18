using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using mythos_backend_dotnet.Services;
using System.Security.Claims;

namespace mythos_backend_dotnet.Controllers
{
    [Route("api/wallet")]
    [ApiController]
    public class MythosWalletController(IMythosWalletService walletService) : ControllerBase
    {
        [HttpGet]
        [Authorize]
        public async Task<IActionResult> GetMyWallet()
        {
            var accountIdClaim = User.Claims.FirstOrDefault(c => c.Type == "accountId");
            if (accountIdClaim == null)
                return Unauthorized("No se encontró el ID en el token");
            var userId = Guid.Parse(accountIdClaim.Value);

            var wallet = await walletService.GetWalletByUserIdAsync(userId);
            if (wallet == null)
                return NotFound("El usuario no tiene wallet registrada.");
            return Ok(wallet);
        }

        [HttpPut("block")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> BlockWallet([FromQuery] Guid userId)
        {
            var result = await walletService.BlockWalletAsync(userId);
            if (!result)
                return BadRequest("No se pudo bloquear la wallet (ya está bloqueada o no existe).");
            return Ok("Wallet bloqueada.");
        }

        [HttpPut("unblock")]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> UnblockWallet([FromQuery] Guid userId)
        {
            var result = await walletService.UnblockWalletAsync(userId);
            if (!result)
                return BadRequest("No se pudo desbloquear la wallet (ya está desbloqueada o no existe).");
            return Ok("Wallet desbloqueada.");
        }
    }
}