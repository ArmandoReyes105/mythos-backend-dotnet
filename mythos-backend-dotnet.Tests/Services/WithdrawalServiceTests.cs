using Microsoft.Data.Sqlite;
using Microsoft.EntityFrameworkCore;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Tests.TestUtils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace mythos_backend_dotnet.Tests.Services
{
    public class WithdrawalServiceTests : IDisposable
    {
        private readonly MythosDbContext _context;
        private readonly SqliteConnection _connection;
        private readonly WithdrawalService _service;
        private readonly Guid _userId = Guid.NewGuid();

        public WithdrawalServiceTests()
        {
            (_context, _connection) = InMemoryDbFactory.CreateSqliteInMemory();
            _service = new WithdrawalService(_context);

            _context.Accounts.Add(new Account { Id = _userId, Email = "autor@correo.com", Role = "writer" });
            _context.MythosWallets.Add(new MythosWallet { UserId = _userId, MythrasBalance = 500, IsLocked = false });
            _context.SaveChanges();
        }

        [Fact]
        public async Task RequestWithdrawalAsync_Succeeds_WhenValid()
        {
            var dto = CreateValidDto();

            var result = await _service.RequestWithdrawalAsync(_userId, dto);

            Assert.Equal("Retiro solicitado exitosamente.", result.Message);
            Assert.Equal(dto.Amount, result.WithdrawnMythras);
            Assert.Equal(dto.Amount, result.AmountInPesos);
            Assert.Equal("Aceptado", result.Status);
        }

        [Fact]
        public async Task RequestWithdrawalAsync_Fails_WhenUserNotFound()
        {
            var result = await _service.RequestWithdrawalAsync(Guid.NewGuid(), CreateValidDto());

            Assert.Equal("Solo escritores pueden solicitar retiros.", result.Message);
            Assert.Equal("Rechazado", result.Status);
        }

        [Fact]
        public async Task RequestWithdrawalAsync_Fails_WhenWalletNotFound()
        {
            var userId = Guid.NewGuid();
            _context.Accounts.Add(new Account { Id = userId, Role = "writer" });
            _context.SaveChanges();

            var result = await _service.RequestWithdrawalAsync(userId, CreateValidDto());

            Assert.Equal("No tienes wallet activa o está bloqueada.", result.Message);
        }

        [Fact]
        public async Task RequestWithdrawalAsync_Fails_WhenWalletIsLocked()
        {
            _context.MythosWallets.First().IsLocked = true;
            _context.SaveChanges();

            var result = await _service.RequestWithdrawalAsync(_userId, CreateValidDto());

            Assert.Equal("No tienes wallet activa o está bloqueada.", result.Message);
        }

        [Fact]
        public async Task RequestWithdrawalAsync_Fails_WhenAmountIsInvalid()
        {
            var dto = CreateValidDto();
            dto.Amount = 0;

            var result = await _service.RequestWithdrawalAsync(_userId, dto);

            Assert.Equal("La cantidad a retirar debe ser mayor a cero.", result.Message);
        }

        [Fact]
        public async Task RequestWithdrawalAsync_Fails_WhenInsufficientBalance()
        {
            var dto = CreateValidDto();
            dto.Amount = 9999;

            var result = await _service.RequestWithdrawalAsync(_userId, dto);

            Assert.Equal("Saldo insuficiente para el retiro.", result.Message);
        }

        [Theory]
        [InlineData("", "El número de tarjeta debe tener 16 dígitos.")]
        [InlineData("1234567890123456", "El número de tarjeta no es válido (falló la validación Luhn).")]
        [InlineData("4111111111111", "El número de tarjeta debe tener 16 dígitos.")]
        public async Task RequestWithdrawalAsync_Fails_OnInvalidCardNumber(string card, string expected)
        {
            var dto = CreateValidDto();
            dto.CardNumber = card;

            var result = await _service.RequestWithdrawalAsync(_userId, dto);

            Assert.Equal(expected, result.Message);
        }

        [Theory]
        [InlineData("", "El nombre del titular es obligatorio y debe tener al menos 4 caracteres.")]
        [InlineData("Ab", "El nombre del titular es obligatorio y debe tener al menos 4 caracteres.")]
        public async Task RequestWithdrawalAsync_Fails_OnInvalidCardHolder(string holder, string expected)
        {
            var dto = CreateValidDto();
            dto.CardHolder = holder;

            var result = await _service.RequestWithdrawalAsync(_userId, dto);

            Assert.Equal(expected, result.Message);
        }

        [Fact]
        public async Task RequestWithdrawalAsync_Fails_WhenBankIsEmpty()
        {
            var dto = CreateValidDto();
            dto.Bank = "";

            var result = await _service.RequestWithdrawalAsync(_userId, dto);

            Assert.Equal("El banco es obligatorio.", result.Message);
        }

        private CreateWithdrawalRequestDto CreateValidDto() => new()
        {
            Amount = 100,
            CardNumber = "4111111111111111",
            CardHolder = "Juan Perez",
            Bank = "BBVA"
        };

        public void Dispose()
        {
            _context.Dispose();
            _connection.Dispose();
        }
    }

}
