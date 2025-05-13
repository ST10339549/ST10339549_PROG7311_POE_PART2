using Dapper;
using ST10339549_PROG7311_POE_PART2.Models;
using ST10339549_PROG7311_POE_PART2.Repository.Interfaces;
using System.Security.Cryptography;
using System.Text;
using Microsoft.Extensions.Logging;

namespace ST10339549_PROG7311_POE_PART2.Repository
{
    public class FarmerRepository : RepositoryBase, IFarmerRepository
    {
        private readonly ILogger<FarmerRepository> _logger;

        public FarmerRepository(IConfiguration configuration, ILogger<FarmerRepository> logger = null) : base(configuration)
        {
            _logger = logger;
        }

        public async Task<IEnumerable<Farmer>> GetAllAsync()
        {
            using var connection = CreateConnection();
            return await connection.QueryAsync<Farmer>("SELECT * FROM Farmers");
        }

        public async Task<Farmer> GetByIdAsync(int id)
        {
            using var connection = CreateConnection();
            return await connection.QuerySingleOrDefaultAsync<Farmer>(
                "SELECT * FROM Farmers WHERE FarmerId = @Id", 
                new { Id = id });
        }

        public async Task<Farmer> GetByEmailAsync(string email)
        {
            using var connection = CreateConnection();
            return await connection.QuerySingleOrDefaultAsync<Farmer>(
                "SELECT * FROM Farmers WHERE FarmerEmail = @Email", 
                new { Email = email });
        }

        public async Task<int> AddAsync(Farmer entity)
        {
            using var connection = CreateConnection();
            entity.CreatedAt = DateTime.Now;
            
            // Hash the password before storing
            entity.FarmerPasswordHash = HashPassword(entity.FarmerPasswordHash);
            
            var sql = @"
                INSERT INTO Farmers (FarmerName, FarmerEmail, FarmerPasswordHash, FarmerPhoneNumber, 
                                     FarmerAddress, CreatedAt)
                VALUES (@FarmerName, @FarmerEmail, @FarmerPasswordHash, @FarmerPhoneNumber, 
                        @FarmerAddress, @CreatedAt);
                SELECT CAST(SCOPE_IDENTITY() as int)";

            return await connection.QuerySingleAsync<int>(sql, entity);
        }

        public async Task<bool> UpdateAsync(Farmer entity)
        {
            using var connection = CreateConnection();
            
            var sql = @"
                UPDATE Farmers
                SET FarmerName = @FarmerName, 
                    FarmerEmail = @FarmerEmail, 
                    FarmerPasswordHash = @FarmerPasswordHash, 
                    FarmerPhoneNumber = @FarmerPhoneNumber, 
                    FarmerAddress = @FarmerAddress
                WHERE FarmerId = @FarmerId";

            var rowsAffected = await connection.ExecuteAsync(sql, entity);
            return rowsAffected > 0;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            using var connection = CreateConnection();
            
            var sql = "DELETE FROM Farmers WHERE FarmerId = @Id";
            
            var rowsAffected = await connection.ExecuteAsync(sql, new { Id = id });
            return rowsAffected > 0;
        }

        public async Task<bool> ValidateCredentialsAsync(string email, string password)
        {
            var farmer = await GetByEmailAsync(email);
            if (farmer == null)
            {
                _logger?.LogWarning("Failed login attempt for non-existent farmer email: {Email}", email);
                return false;
            }

            bool isValid = VerifyPassword(farmer.FarmerPasswordHash, password);
            
            if (!isValid)
            {
                _logger?.LogWarning("Failed login attempt for farmer: {FarmerId}, Email: {Email}", 
                    farmer.FarmerId, email);
            }
            else
            {
                _logger?.LogInformation("Successful login for farmer: {FarmerId}, Email: {Email}", 
                    farmer.FarmerId, email);
            }

            return isValid;
        }
    }
}
