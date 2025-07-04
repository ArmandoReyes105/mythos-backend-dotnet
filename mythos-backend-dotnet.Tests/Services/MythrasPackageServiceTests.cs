using Microsoft.EntityFrameworkCore;
using mythos_backend_dotnet.Data;
using mythos_backend_dotnet.Entities;
using mythos_backend_dotnet.Services;
using mythos_backend_dotnet.Tests.TestUtils;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace mythos_backend_dotnet.Tests.Services
{
    public class MythrasPackageServiceTests
    {
        private readonly MythrasPackageService service;
        private readonly MythosDbContext context; 

        public MythrasPackageServiceTests()
        {
            context = InMemoryDbFactory.Create();
            service = new MythrasPackageService(context);

            context.MythrasPackages.AddRange(
                new MythrasPackage { MythrasPackageId = 1, Name = "ActivePackage1", IsActive = true },
                new MythrasPackage { MythrasPackageId = 2, Name = "InactivePackage", IsActive = false },
                new MythrasPackage { MythrasPackageId = 3, Name = "ActivePackage2", IsActive = true }
            );

            context.SaveChanges();
        }

        #region GetActivePackagesAsync

        [Fact]
        public async Task GetActivePackagesAsync_ReturnsOnlyActivePackages()
        {
            // Act
            var activePackages = await service.GetActivePackagesAsync();

            // Assert
            Assert.NotNull(activePackages);
            Assert.Equal(2, activePackages.Count);
            Assert.All(activePackages, p => Assert.True(p.IsActive));
        }

        [Fact]
        public async Task GetActivePackagesAsync_ReturnsEmptyList_WhenNoActivePackages()
        {
            // Arrange
            var emptyContext = InMemoryDbFactory.Create();
            var emptyService = new MythrasPackageService(emptyContext);

            emptyContext.MythrasPackages.AddRange(
                new MythrasPackage { MythrasPackageId = 1, Name = "ActivePackage1", IsActive = false },
                new MythrasPackage { MythrasPackageId = 2, Name = "InactivePackage", IsActive = false }
            );

            // Act
            var activePackages = await emptyService.GetActivePackagesAsync();

            // Assert
            Assert.NotNull(activePackages);
            Assert.Empty(activePackages);
        }

        #endregion

        #region GetActivePackageByIdAsync

        [Fact]
        public async Task GetActivePackageByIdAsync_ReturnsPackage_WhenActiveAndExists()
        {
            // Arrange
            int targetId = 1;

            // Act
            var package = await service.GetActivePackageByIdAsync(targetId);

            // Assert
            Assert.NotNull(package);
            Assert.Equal(targetId, package.MythrasPackageId);
            Assert.True(package.IsActive);
        }

        [Fact]
        public async Task GetActivePackageByIdAsync_ReturnsNull_WhenPackageInactive()
        {
            // Arrange
            int targetId = 2; // This is inactive package

            // Act
            var package = await service.GetActivePackageByIdAsync(targetId);

            // Assert
            Assert.Null(package);
        }

        [Fact]
        public async Task GetActivePackageByIdAsync_ReturnsNull_WhenPackageDoesNotExist()
        {
            // Arrange
            int targetId = 999;

            // Act
            var package = await service.GetActivePackageByIdAsync(targetId);

            // Assert
            Assert.Null(package);
        }

        #endregion
    }
}
