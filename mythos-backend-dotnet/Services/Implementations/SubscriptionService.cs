using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Services.Interfaces;
using mythos_backend_dotnet.UnitOfWork;

namespace mythos_backend_dotnet.Services.Implementations
{
    public class SubscriptionService(IUnitOfWork _unitOfWork) : ISubscriptionService
    {
        public async Task<bool> SubscribeToPlanAsync(Guid userId, int planId)
        {
            var plan = await _unitOfWork.Subscriptions.GetActivePlanByIdAsync(planId);
            if (plan == null)
                throw new InvalidOperationException("El plan no existe o está inactivo.");

            if (await _unitOfWork.AccountSubscriptions.HasActiveSubscription(userId))
                throw new InvalidOperationException("Ya tienes una suscripción activa.");

            await _unitOfWork.BeginTransactionAsync();

            try
            {
                _unitOfWork.Transactions.Add(new Transaction
                {
                    AccountId = userId,
                    SuscriptionPlanId = planId,
                    Type = "Subscription",
                    AmountRealMoney = plan.Price.ToString("F2"),
                    PaymentMethod = "Simulated",
                    Status = "Completed",
                    CreatedAt = DateTime.UtcNow
                });

                _unitOfWork.AccountSubscriptions.Add(new AccountSuscriptionPlan
                {
                    AccountId = userId,
                    SuscriptionPlanId = planId,
                    StartDate = DateTime.UtcNow,
                    EndDate = DateTime.UtcNow.AddDays(plan.DurationDays),
                    Status = "Active"
                });

                await _unitOfWork.MythosWallet.AddBonusAsync(userId, plan.MythrasMonthlyBonus);
                await _unitOfWork.SaveAsync();

                await _unitOfWork.CommitTransactionAsync();
            }
            catch
            {
                await _unitOfWork.RollbackTransactionAsync();
                throw;
            }

            return true; 
        }
    }
}
