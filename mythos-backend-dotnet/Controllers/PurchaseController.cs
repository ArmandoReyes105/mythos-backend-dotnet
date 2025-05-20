using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Models;
using System.Security.Claims;

namespace mythos_backend_dotnet.Controllers
{
    [ApiController]
    [Route("api/purchases")]
    [Authorize]
    public class PurchaseController : ControllerBase
    {
        private readonly MythosDbContext _context;

        public PurchaseController(MythosDbContext context)
        {
            _context = context;
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
    }
}
