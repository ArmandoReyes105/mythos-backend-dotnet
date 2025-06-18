using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Models;
using Microsoft.EntityFrameworkCore;

namespace mythos_backend_dotnet.Services
{
    public class MythrasPurchaseService : IMythrasPurchaseService
    {
        private readonly MythosDbContext _context;

        public MythrasPurchaseService(MythosDbContext context)
        {
            _context = context;
        }

        public async Task<(bool, string, PurchaseMythrasResponseDto?)> PurchaseMythrasAsync(Guid userId, PurchaseMythrasRequestDto dto)
        {
            var mythrasPackage = await GetActiveMythrasPackage(dto.MythrasPackageId);
            if (mythrasPackage == null)
                return (false, "Paquete de Mythras no encontrado o inactivo.", null);

            if (!ValidateCard(dto, out var errorMsg))
                return (false, errorMsg, null);

            var wallet = await GetOrCreateWallet(userId);
            if (wallet.IsLocked)
                return (false, "Wallet bloqueada. No se puede realizar la compra.", null);

            return await ProcessMythrasPurchase(wallet, mythrasPackage, dto);
        }

        private async Task<MythrasPackage?> GetActiveMythrasPackage(int packageId)
        {
            return await _context.MythrasPackages
                .FirstOrDefaultAsync(mp => mp.MythrasPackageId == packageId && mp.IsActive);
        }

        private async Task<MythosWallet> GetOrCreateWallet(Guid userId)
        {
            var wallet = await _context.MythosWallets.FirstOrDefaultAsync(w => w.UserId == userId);
            if (wallet == null)
            {
                wallet = new MythosWallet
                {
                    UserId = userId,
                    MythrasBalance = 0,
                    IsLocked = false,
                    LastUpdated = DateTime.UtcNow
                };
                await _context.MythosWallets.AddAsync(wallet);
                await _context.SaveChangesAsync();
            }
            return wallet;
        }

        private async Task<(bool, string, PurchaseMythrasResponseDto?)> ProcessMythrasPurchase(
            MythosWallet wallet, MythrasPackage mythrasPackage, PurchaseMythrasRequestDto dto)
        {
            using var transaction = await _context.Database.BeginTransactionAsync();
            try
            {
                var totalMythras = mythrasPackage.MythrasAmount + mythrasPackage.BonusMythras;
                wallet.MythrasBalance += totalMythras;
                wallet.LastUpdated = DateTime.UtcNow;

                var tx = new Transaction
                {
                    AccountId = wallet.UserId,
                    MythrasPackageId = mythrasPackage.MythrasPackageId,
                    SuscriptionPlanId = null,
                    Type = "CompraMythras",
                    AmountRealMoney = mythrasPackage.Price.ToString("F2"),
                    PaymentMethod = dto.CardType,
                    Status = "Completado",
                    CreatedAt = DateTime.UtcNow
                };

                await _context.Transactions.AddAsync(tx);
                await _context.SaveChangesAsync();
                await transaction.CommitAsync();

                var response = new PurchaseMythrasResponseDto
                {
                    Message = "¡Compra realizada exitosamente!",
                    MythrasBalance = wallet.MythrasBalance,
                    WalletLastUpdated = wallet.LastUpdated
                };
                return (true, "Compra exitosa", response);
            }
            catch (Exception ex)
            {
                await transaction.RollbackAsync();
                return (false, "Error al procesar la compra: " + ex.Message, null);
            }
        }

        private bool ValidateCard(PurchaseMythrasRequestDto dto, out string error)
        {
            if (!ValidateCardNumber(dto.CardNumber, out error))
                return false;

            if (!ValidateCardHolder(dto.CardHolder, out error))
                return false;

            if (!ValidateExpiryDate(dto.ExpiryDate, out error))
                return false;

            if (!ValidateCvc(dto.Cvc, out error))
                return false;

            if (!ValidateCardType(dto.CardNumber, dto.CardType, out error))
                return false;

            if (!ValidateBillingAddress(dto.BillingAddress, out error))
                return false;

            return true;
        }

        private bool ValidateCardNumber(string cardNumber, out string error)
        {
            error = "";
            if (string.IsNullOrWhiteSpace(cardNumber) || cardNumber.Length != 16 || !cardNumber.All(char.IsDigit))
            {
                error = "El número de tarjeta debe tener 16 dígitos.";
                return false;
            }
            if (!LuhnCheck(cardNumber))
            {
                error = "El número de tarjeta no es válido (falló Luhn).";
                return false;
            }
            return true;
        }

        private bool ValidateCardHolder(string cardHolder, out string error)
        {
            error = "";
            if (string.IsNullOrWhiteSpace(cardHolder) || cardHolder.Length < 4 || !cardHolder.All(c => char.IsLetter(c) || char.IsWhiteSpace(c)))
            {
                error = "El nombre del titular debe ser mínimo de 4 letras, solo letras y espacios.";
                return false;
            }
            return true;
        }

        private bool ValidateExpiryDate(string expiry, out string error)
        {
            error = "";
            if (string.IsNullOrWhiteSpace(expiry) || expiry.Length != 5 || expiry[2] != '/')
            {
                error = "La fecha de expiración debe estar en formato MM/YY.";
                return false;
            }
            var parts = expiry.Split('/');
            if (!int.TryParse(parts[0], out int month) || month < 1 || month > 12)
            {
                error = "El mes de expiración es inválido.";
                return false;
            }
            if (!int.TryParse(parts[1], out int year))
            {
                error = "El año de expiración es inválido.";
                return false;
            }
            year += 2000;
            var expiryDate = new DateTime(year, month, DateTime.DaysInMonth(year, month));
            if (expiryDate < DateTime.UtcNow.Date)
            {
                error = "La tarjeta está vencida.";
                return false;
            }
            return true;
        }

        private bool ValidateCvc(string cvc, out string error)
        {
            error = "";
            if (string.IsNullOrWhiteSpace(cvc) || cvc.Length != 3 || !cvc.All(char.IsDigit))
            {
                error = "El código de seguridad (CVC) debe tener 3 dígitos numéricos.";
                return false;
            }
            return true;
        }

        private bool ValidateCardType(string cardNumber, string type, out string error)
        {
            error = "";
            if (type == "Visa" && cardNumber.StartsWith("4")) return true;
            if (type == "Mastercard" && cardNumber.StartsWith("5")) return true;
            error = "El tipo de tarjeta no coincide con el número proporcionado (Visa inicia con 4, Mastercard con 5).";
            return false;
        }

        private bool ValidateBillingAddress(BillingAddressDto? address, out string error)
        {
            error = "";
            if (address == null || string.IsNullOrWhiteSpace(address.Street) || string.IsNullOrWhiteSpace(address.PostalCode) || string.IsNullOrWhiteSpace(address.City) || string.IsNullOrWhiteSpace(address.Country))
            {
                error = "Todos los campos de dirección de facturación son obligatorios.";
                return false;
            }
            if (address.PostalCode.Length < 4)
            {
                error = "El código postal debe tener al menos 4 caracteres.";
                return false;
            }
            return true;
        }

        private bool LuhnCheck(string number)
        {
            int sum = 0;
            bool alternate = false;
            for (int i = number.Length - 1; i >= 0; i--)
            {
                int n = int.Parse(number[i].ToString());
                if (alternate)
                {
                    n *= 2;
                    if (n > 9)
                        n -= 9;
                }
                sum += n;
                alternate = !alternate;
            }
            return sum % 10 == 0;
        }
    }
}