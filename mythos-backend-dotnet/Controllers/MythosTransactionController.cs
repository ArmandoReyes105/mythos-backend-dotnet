using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Models;
using mythos_backend_dotnet.Services;
using System.Security.Claims;

namespace mythos_backend_dotnet.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MythosTransactionController : ControllerBase
    {
        private readonly MythosDbContext _context;
        private readonly IMythosTransactionService _transactionService;

        public MythosTransactionController(MythosDbContext context, IMythosTransactionService transactionService)
        {
            _context = context;
            _transactionService = transactionService;
        }

        // GET api/mythos-transactions (transacciones del usuario autenticado)
        [HttpGet]
        public async Task<ActionResult<List<MythosTransaction>>> GetUserTransactions()
        {
            var userId = Guid.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier));

            var transactions = await _context.MythosTransactions
                .Where(t => t.AccountId == userId || t.CounterpartyAccountId == userId)
                .OrderByDescending(t => t.CreatedAt).ToListAsync();

            return Ok(transactions);
        }

        // POST api/mythos-transactions (crear una nueva transacción)
        [HttpPost]
        public async Task<IActionResult> CreateTransaction([FromBody] CreateMythosTransactionDto dto)
        {
            var userId = Guid.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier));

            // Validar saldo y existencia de cuentas
            var sender = await _context.Accounts.FindAsync(userId);
            var receiver = await _context.Accounts.FindAsync(dto.CounterpartyAccountId);

            if (sender == null || receiver == null) return BadRequest("Cuentas inválidas");

            // Aquí deberías validar saldo, etc. (esto es un ejemplo)
            if (dto.Amount <= 0) return BadRequest("Monto inválido");

            // TODO: Validar saldo suficiente

            var newBalanceSender = 0; // Obtener saldo actualizado (falta lógica)

            var transaction = new MythosTransaction
            {
                Type = dto.Type,
                Amount = dto.Amount,
                BalanceAfter = newBalanceSender,
                CreatedAt = DateTime.UtcNow,
                AccountId = sender.Id,
                CounterpartyAccountId = receiver.Id,
            };

            _context.MythosTransactions.Add(transaction);
            await _context.SaveChangesAsync();

            return CreatedAtAction(nameof(GetUserTransactions), new { id = transaction.MythosTransactionId }, transaction);
        }

        // POST api/mythos-transaction/donate
        [HttpPost("donate")]
        [Authorize(Roles = "Reader")]
        public async Task<IActionResult> Donate([FromBody] CreateDonationDto dto)
        {
            var accountIdStr = User.Claims.FirstOrDefault(c => c.Type == "accountId")?.Value;
            if (accountIdStr == null)
                return Unauthorized("No se puede identificar al usuario.");

            if (!Guid.TryParse(accountIdStr, out Guid senderAccountId))
                return Unauthorized("Identificador de usuario inválido.");

            var (success, message) = await _transactionService.DonateAsync(senderAccountId, dto.ReceiverAccountId, dto.Amount);

            if (!success)
                return BadRequest(message);

            return Ok(message);
        }
    }
}
