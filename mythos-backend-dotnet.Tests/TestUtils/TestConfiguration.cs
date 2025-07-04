using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace mythos_backend_dotnet.Tests.TestUtils
{
    public static class TestConfiguration
    {
        public static IConfiguration Create()
        {
            var settings = new Dictionary<string, string?>
            {
                { "AppSettings:Token", "cfxeyGKrRV6Rfa0FpUhLhQVNzQ4AJpQ1vxz0Jkgc0a6y2yySecUJC2V9PbUyQzCn" },
                { "AppSettings:Issuer", "MythosIssuer" },
                { "AppSettings:Audience", "MythosAudience" }
            };

            return new ConfigurationBuilder().AddInMemoryCollection(settings).Build();
        }
    }
}
