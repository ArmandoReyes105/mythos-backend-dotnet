using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Services;

namespace mythos_backend_dotnet.Controllers
{
    [Route("api/mythras-packages")]
    [ApiController]
    public class MythrasPackageController : ControllerBase
    {
        private readonly MythosDbContext _context;
        private readonly IMythrasPackageService _packageService;

        public MythrasPackageController(MythosDbContext context, IMythrasPackageService packageService)
        {
            _context = context;
            _packageService = packageService;
        }

        [HttpGet]
        [AllowAnonymous]
        public async Task<IActionResult> GetAll()
        {
            var packages = await _packageService.GetActivePackagesAsync();
            return Ok(packages);
        }

        [HttpGet("{id}")]
        [AllowAnonymous]
        public async Task<IActionResult> GetById(int id)
        {
            var package = await _packageService.GetActivePackageByIdAsync(id);
            if (package == null)
                return NotFound("Paquete no encontrado o no activo.");
            return Ok(package);
        }

        [HttpPost]
        [Authorize(Roles = "Admin")]
        public async Task<IActionResult> Create([FromBody] MythrasPackage package)
        {
            package.CreatedAt = DateTime.UtcNow;
            _context.MythrasPackages.Add(package);
            await _context.SaveChangesAsync();
            return CreatedAtAction(nameof(GetById), new { id = package.MythrasPackageId }, package);
        }

        [HttpPut("{id}")]
        [Authorize(Roles = "Admin")]
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
        [Authorize(Roles = "Admin")]
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
