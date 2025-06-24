using Microsoft.Data.Sqlite;
using Microsoft.EntityFrameworkCore;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Models;
using mythos_backend_dotnet.Services;
using mythos_backend_dotnet.Tests.TestUtils;

namespace mythos_backend_dotnet.Tests.Services
{
    public class MythrasPurchaseServiceTests : IDisposable
    {
        private readonly SqliteConnection _connection;
        private readonly MythosDbContext _context;
        private readonly MythrasPurchaseService _service;
        private readonly Guid _userId = Guid.NewGuid();

        public MythrasPurchaseServiceTests()
        {
            (_context, _connection) = InMemoryDbFactory.CreateSqliteInMemory();

            _service = new MythrasPurchaseService(_context);

            _context.MythrasPackages.Add(new MythrasPackage
            {
                MythrasPackageId = 1,
                Name = "Pack 1",
                MythrasAmount = 100,
                BonusMythras = 20,
                Price = 9.99m,
                IsActive = true
            });
            _context.MythrasPackages.Add(new MythrasPackage
            {
                MythrasPackageId = 2,
                Name = "Pack 2",
                MythrasAmount = 50,
                BonusMythras = 10,
                Price = 4.99m,
                IsActive = false
            });

            _context.Accounts.Add(new Account
            {
                Id = _userId,
                Email = "test@example.com",
                Username = "usuarioTest",
                PasswordHash = "irrelevante",
                Role = "reader"
            });
            _context.SaveChanges();
        }

        #region PurchaseMythrasAsync

        [Fact]
        public async Task PurchaseMythrasAsync_Succeeds_WhenValid()
        {
            var dto = CreateValidDto();
            var (success, message, response) = await _service.PurchaseMythrasAsync(_userId, dto);

            Console.WriteLine($"Mensaje devuelto: {message}");

            Assert.Equal("Compra exitosa", message);
            Assert.True(success);
            Assert.NotNull(response);
            Assert.Equal(120, response!.MythrasBalance);
            Assert.NotEqual(default, response.WalletLastUpdated);
        }

        [Fact]
        public async Task PurchaseMythrasAsync_Fails_WhenPackageNotFoundOrInactive()
        {
            var dto = CreateValidDto();
            dto.MythrasPackageId = 999; // paquete no existe

            var (success, message, response) = await _service.PurchaseMythrasAsync(_userId, dto);

            Assert.False(success);
            Assert.Equal("Paquete de Mythras no encontrado o inactivo.", message);
            Assert.Null(response);
        }

        [Fact]
        public async Task PurchaseMythrasAsync_Fails_WhenWalletIsLocked()
        {
            _context.MythosWallets.Add(new MythosWallet
            {
                UserId = _userId,
                MythrasBalance = 0,
                IsLocked = true,
                LastUpdated = DateTime.UtcNow
            });
            _context.SaveChanges();

            var dto = CreateValidDto();

            var (success, message, response) = await _service.PurchaseMythrasAsync(_userId, dto);

            Assert.False(success);
            Assert.Equal("Wallet bloqueada. No se puede realizar la compra.", message);
            Assert.Null(response);
        }

        [Fact]
        public async Task PurchaseMythrasAsync_CreatesWallet_WhenNotExists()
        {
            var dto = CreateValidDto();

            var (success, message, response) = await _service.PurchaseMythrasAsync(_userId, dto);

            var wallet = await _context.MythosWallets
                .AsNoTracking() // para evitar caching de EF
                .FirstOrDefaultAsync(w => w.UserId == _userId);

            Assert.True(success);
            Assert.NotNull(wallet);
            Assert.False(wallet!.IsLocked);
            Assert.Equal(120, wallet.MythrasBalance);
        }

        [Theory]
        [InlineData("", "El número de tarjeta debe tener 16 dígitos.")]
        [InlineData("1234567890123456", "El número de tarjeta no es válido (falló Luhn).")]
        [InlineData("4111111111111", "El número de tarjeta debe tener 16 dígitos.")]
        public async Task PurchaseMythrasAsync_Fails_OnInvalidCardNumber(string cardNumber, string expectedError)
        {
            var dto = CreateValidDto();
            dto.CardNumber = cardNumber;

            var (success, message, response) = await _service.PurchaseMythrasAsync(_userId, dto);

            Assert.False(success);
            Assert.Equal(expectedError, message);
            Assert.Null(response);
        }

        [Theory]
        [InlineData("", "El nombre del titular debe ser mínimo de 4 letras, solo letras y espacios.")]
        [InlineData("A1b", "El nombre del titular debe ser mínimo de 4 letras, solo letras y espacios.")]
        [InlineData("Jo3n", "El nombre del titular debe ser mínimo de 4 letras, solo letras y espacios.")]
        public async Task PurchaseMythrasAsync_Fails_OnInvalidCardHolder(string cardHolder, string expectedError)
        {
            var dto = CreateValidDto();
            dto.CardHolder = cardHolder;

            var (success, message, response) = await _service.PurchaseMythrasAsync(_userId, dto);

            Assert.False(success);
            Assert.Equal(expectedError, message);
            Assert.Null(response);
        }

        [Theory]
        [InlineData("13/25", "El mes de expiración es inválido.")]
        [InlineData("00/25", "El mes de expiración es inválido.")]
        [InlineData("12-25", "La fecha de expiración debe estar en formato MM/YY.")]
        [InlineData("12/aa", "El año de expiración es inválido.")]
        public async Task PurchaseMythrasAsync_Fails_OnInvalidExpiryDateFormat(string expiryDate, string expectedError)
        {
            var dto = CreateValidDto();
            dto.ExpiryDate = expiryDate;

            var (success, message, response) = await _service.PurchaseMythrasAsync(_userId, dto);

            Assert.False(success);
            Assert.Equal(expectedError, message);
            Assert.Null(response);
        }

        [Fact]
        public async Task PurchaseMythrasAsync_Fails_WhenCardExpired()
        {
            var dto = CreateValidDto();
            dto.ExpiryDate = DateTime.UtcNow.AddMonths(-1).ToString("MM/yy");

            var (success, message, response) = await _service.PurchaseMythrasAsync(_userId, dto);

            Assert.False(success);
            Assert.Equal("La tarjeta está vencida.", message);
            Assert.Null(response);
        }

        [Theory]
        [InlineData("", "El código de seguridad (CVC) debe tener 3 dígitos numéricos.")]
        [InlineData("12", "El código de seguridad (CVC) debe tener 3 dígitos numéricos.")]
        [InlineData("12A", "El código de seguridad (CVC) debe tener 3 dígitos numéricos.")]
        public async Task PurchaseMythrasAsync_Fails_OnInvalidCvc(string cvc, string expectedError)
        {
            var dto = CreateValidDto();
            dto.Cvc = cvc;

            var (success, message, response) = await _service.PurchaseMythrasAsync(_userId, dto);

            Assert.False(success);
            Assert.Equal(expectedError, message);
            Assert.Null(response);
        }

        [Theory]
        [InlineData("Visa", "4111111111111111", true)]
        [InlineData("Mastercard", "5555555555554444", true)] // Número válido Mastercard (comienza con 55)
        [InlineData("Visa", "5555555555554444", false)]
        [InlineData("Mastercard", "4111111111111111", false)]
        public async Task PurchaseMythrasAsync_Fails_OnInvalidCardType(string cardType, string cardNumber, bool expectedSuccess)
        {
            var dto = CreateValidDto();
            dto.CardType = cardType;
            dto.CardNumber = cardNumber;

            var (success, message, response) = await _service.PurchaseMythrasAsync(_userId, dto);

            if (expectedSuccess)
            {
                Assert.True(success);
                Assert.NotNull(response);
            }
            else
            {
                Assert.False(success);
                Assert.Equal("El tipo de tarjeta no coincide con el número proporcionado (Visa inicia con 4, Mastercard con 5).", message);
                Assert.Null(response);
            }
        }

        [Fact]
        public async Task PurchaseMythrasAsync_Fails_OnInvalidBillingAddress()
        {
            var dto = CreateValidDto();
            dto.BillingAddress = new BillingAddressDto
            {
                Street = "",
                PostalCode = "123",
                City = "",
                Country = ""
            };

            var (success, message, response) = await _service.PurchaseMythrasAsync(_userId, dto);

            Assert.False(success);
            Assert.Equal("Todos los campos de dirección de facturación son obligatorios.", message);
            Assert.Null(response);
        }

        #endregion

        #region Helpers

        private PurchaseMythrasRequestDto CreateValidDto() => new()
        {
            MythrasPackageId = 1,
            CardNumber = "4111111111111111",
            CardHolder = "Juan Perez",
            ExpiryDate = DateTime.UtcNow.AddYears(1).ToString("MM/yy"),
            Cvc = "123",
            CardType = "Visa",
            BillingAddress = new BillingAddressDto
            {
                Street = "Calle Falsa 123",
                PostalCode = "12345",
                City = "Ciudad",
                Country = "MX"
            }
        };

        #endregion

        public void Dispose()
        {
            _context.Dispose();
            _connection.Dispose();
        }
    }

}
