using Microsoft.Data.Sqlite;
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

        public static (MythosDbContext, SqliteConnection) CreateSqliteInMemory()
        {
            var connection = new SqliteConnection("Filename=:memory:");
            connection.Open();

            var options = new DbContextOptionsBuilder<MythosDbContext>()
                .UseSqlite(connection)
                .Options;

            var context = new MythosDbContext(options);
            context.Database.EnsureCreated();

            return (context, connection); 
        }
    }
}
