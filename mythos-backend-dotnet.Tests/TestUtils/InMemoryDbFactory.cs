using Microsoft.EntityFrameworkCore;
using mythos_backend_dotnet.Data;

namespace mythos_backend_dotnet.Tests.TestUtils
{
    public static class InMemoryDbFactory
    {
        public static MythosDbContext Create()
        {
            var options = new DbContextOptionsBuilder<MythosDbContext>()
                .UseInMemoryDatabase(Guid.NewGuid().ToString())
                .Options;

            return new MythosDbContext(options);
        }
    }
}
