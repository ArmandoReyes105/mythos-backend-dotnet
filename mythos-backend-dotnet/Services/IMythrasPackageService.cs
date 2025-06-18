using mythos_backend_dotnet.Entities;

namespace mythos_backend_dotnet.Services
{
    public interface IMythrasPackageService
    {
        Task<List<MythrasPackage>> GetActivePackagesAsync();
        Task<MythrasPackage?> GetActivePackageByIdAsync(int id);
    }
}