namespace mythos_backend_dotnet.Repositories.Interfaces
{
    public interface IMythosWalletRepository
    {
        Task AddBonusAsync(Guid userId, int bonus);
    }
}
