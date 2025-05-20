using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;

namespace mythos_backend_dotnet.Controllers
{
    [Route("api/mythras-packages")]
    [Authorize(Roles = "Admin")]
    [ApiController]
    public class MythrasPackageController : ControllerBase
    {
        private readonly MythosDbContext _context;

        public MythrasPackageController(MythosDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        [AllowAnonymous]
        public async Task<ActionResult<List<MythrasPackage>>> GetAll()
        {
            var packages = await _context.MythrasPackages.Where(p => p.IsActive).ToListAsync<MythrasPackage>();
            return Ok(packages);
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] MythrasPackage package)
        {
            package.CreatedAt = DateTime.UtcNow;
            _context.MythrasPackages.Add(package);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetById), new { id = package.MythrasPackageId }, package);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<MythrasPackage>> GetById(int id)
        {
            var package = await _context.MythrasPackages.FindAsync(id);
            if (package == null) return NotFound();
            return Ok(package);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Update(int id, [FromBody] MythrasPackage model)
        {
            if (id != model.MythrasPackageId) return BadRequest();

            var package = await _context.MythrasPackages.FindAsync(id);
            if (package == null) return NotFound();

            package.Name = model.Name;
            package.MythrasAmount = model.MythrasAmount;
            package.Price = model.Price;
            package.IsActive = model.IsActive;
            package.BonusMythras = model.BonusMythras;

            await _context.SaveChangesAsync();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            var package = await _context.MythrasPackages.FindAsync(id);
            if (package == null) return NotFound();

            _context.MythrasPackages.Remove(package);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}
