using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Models;
using mythos_backend_dotnet.Services.Interfaces;
using System.Security.Claims;

namespace mythos_backend_dotnet.Controllers
{
    [ApiController]
    [Route("api/purchases")]
    [Authorize]
    public class PurchaseController : ControllerBase
    {
        private readonly MythosDbContext _context;
        private readonly IPurchaseService _purchaseService;

        public PurchaseController(MythosDbContext context, IPurchaseService purchaseService)
        {
            _context = context;
            _purchaseService = purchaseService;
        }

        // GET api/purchases (compras del usuario)
        [HttpGet]
        public async Task<ActionResult<List<Purchase>>> GetUserPurchases()
        {
            var userId = Guid.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier));

            var purchases = await _context.Purchases
                .Where(p => p.AccountId == userId)
                .OrderByDescending(p => p.PurchaseDate)
                .ToListAsync();

            return Ok(purchases);
        }

        // POST api/purchases (crear compra)
        [HttpPost]
        public async Task<IActionResult> CreatePurchase([FromBody] CreatePurchaseDto dto)
        {
            var userId = Guid.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier));

            // Aquí deberías validar que la transacción existe y corresponde

            var purchase = new Purchase
            {
                ContentId = dto.ContentId,
                MythrasPrice = dto.MythrasPrice,
                PurchaseDate = DateTime.UtcNow,
                AccountId = userId,
                MythosTransactionId = dto.MythosTransactionId
            };

            _context.Purchases.Add(purchase);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetUserPurchases), new { id = purchase.PurchaseId }, purchase);
        }

        [HttpGet("contents")]
        [Authorize] // Asegúrate de tener middleware para extraer el usuario
        public async Task<IActionResult> GetPurchasedContentIds()
        {
            var accountIdClaim = User.Claims.FirstOrDefault(c => c.Type == "accountId");
            if (accountIdClaim is null)
                return Unauthorized("No se encontró el usuario autenticado");

            if (!Guid.TryParse(accountIdClaim.Value, out var accountId))
                return BadRequest("Formato de AccountId inválido");

            var contentIds = await _purchaseService.GetPurchasedContentIdsAsync(accountId);
            return Ok(contentIds); // Devuelve lista de strings
        }

        [HttpPost("buy")]
        [Authorize]
        public async Task<IActionResult> BuyChapter([FromBody] PurchaseRequestDto request)
        {
            // Obtener userId del token
            var userIdClaim = User.Claims.FirstOrDefault(c => c.Type == "accountId");
            if (userIdClaim == null) return Unauthorized("Token inválido o expirado");

            if (!Guid.TryParse(userIdClaim.Value, out var userId))
                return Unauthorized("Id de usuario inválido");

            var (success, message, newBalance) = await _purchaseService.PurchaseContentAsync(userId, request);

            if (!success)
                return BadRequest(new { success = false, message, newBalance });

            return Ok(new { success = true, message, newBalance });
        }

        [HttpGet("statistics-author")]
        public async Task<IActionResult> GetPurchaseStats(
            [FromQuery] DateTime startDate,
            [FromQuery] DateTime endDate)
        {
            if (startDate > endDate)
                return BadRequest("La fecha de inicio no puede ser posterior a la fecha de fin.");

            var stats = await _purchaseService.GetPurchaseStatisticsAsync(startDate, endDate);
            return Ok(stats);
        }
    }

    
}
