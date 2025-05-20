using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;

namespace mythos_backend_dotnet.Controllers
{
    
    [Route("api/subscription-plans")]
    [Authorize(Roles = "Admin")]
    [ApiController]
    public class SuscriptionPlanController : ControllerBase
    {
        private readonly MythosDbContext _context;

        public SuscriptionPlanController(MythosDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [AllowAnonymous]
        public async Task<ActionResult<List<SuscriptionPlan>>> GetAll()
        {
            var plans = await _context.SuscriptionPlans.Where(p => p.IsActive).ToListAsync<SuscriptionPlan>();
            return Ok(plans);
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] SuscriptionPlan plan)
        {
            plan.CreatedAt = DateTime.UtcNow;
            _context.SuscriptionPlans.Add(plan);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetById), new { id = plan.SuscriptionPlanId }, plan);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<SuscriptionPlan>> GetById(int id)
        {
            var plan = await _context.SuscriptionPlans.FindAsync(id);
            if (plan == null) return NotFound();
            return Ok(plan);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] SuscriptionPlan model)
        {
            if (id != model.SuscriptionPlanId) return BadRequest();

            var plan = await _context.SuscriptionPlans.FindAsync(id);
            if (plan == null) return NotFound();

            plan.Name = model.Name;
            plan.Price = model.Price;
            plan.DurationDays = model.DurationDays;
            plan.MythrasMonthlyBonus = model.MythrasMonthlyBonus;
            plan.ExtraBenefits = model.ExtraBenefits;
            plan.IsActive = model.IsActive;

            await _context.SaveChangesAsync();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var plan = await _context.SuscriptionPlans.FindAsync(id);
            if (plan == null) return NotFound();

            _context.SuscriptionPlans.Remove(plan);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}
