using Dapper;
using ST10339549_PROG7311_POE_PART2.Models;
using ST10339549_PROG7311_POE_PART2.Repository.Interfaces;

namespace ST10339549_PROG7311_POE_PART2.Repository
{
    public class ProductRepository : RepositoryBase, IProductRepository
    {
        public ProductRepository(IConfiguration configuration) : base(configuration)
        {
        }

        public async Task<IEnumerable<Product>> GetAllAsync()
        {
            using var connection = CreateConnection();
            return await connection.QueryAsync<Product>("SELECT * FROM Products");
        }

        public async Task<Product> GetByIdAsync(int id)
        {
            using var connection = CreateConnection();
            return await connection.QuerySingleOrDefaultAsync<Product>(
                "SELECT * FROM Products WHERE ProductId = @Id", 
                new { Id = id });
        }

        public async Task<IEnumerable<Product>> GetByFarmerIdAsync(int farmerId)
        {
            using var connection = CreateConnection();
            return await connection.QueryAsync<Product>(
                "SELECT * FROM Products WHERE FarmerId = @FarmerId", 
                new { FarmerId = farmerId });
        }

        public async Task<int> AddAsync(Product entity)
        {
            using var connection = CreateConnection();
            entity.CreatedAt = DateTime.Now;
            
            var sql = @"
                INSERT INTO Products (FarmerId, ProductName, ProductCategory, Description, 
                                     Quantity, UnitPrice, ProductionDate, CreatedAt)
                VALUES (@FarmerId, @ProductName, @ProductCategory, @Description, 
                        @Quantity, @UnitPrice, @ProductionDate, @CreatedAt);
                SELECT CAST(SCOPE_IDENTITY() as int)";

            return await connection.QuerySingleAsync<int>(sql, entity);
        }

        public async Task<bool> UpdateAsync(Product entity)
        {
            using var connection = CreateConnection();
            
            var sql = @"
                UPDATE Products
                SET FarmerId = @FarmerId, 
                    ProductName = @ProductName, 
                    ProductCategory = @ProductCategory, 
                    Description = @Description, 
                    Quantity = @Quantity, 
                    UnitPrice = @UnitPrice, 
                    ProductionDate = @ProductionDate
                WHERE ProductId = @ProductId";

            var rowsAffected = await connection.ExecuteAsync(sql, entity);
            return rowsAffected > 0;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            using var connection = CreateConnection();
            
            var sql = "DELETE FROM Products WHERE ProductId = @Id";
            
            var rowsAffected = await connection.ExecuteAsync(sql, new { Id = id });
            return rowsAffected > 0;
        }

        public async Task<IEnumerable<string>> GetAllCategoriesAsync()
        {
            using var connection = CreateConnection();
            return await connection.QueryAsync<string>("SELECT DISTINCT ProductCategory FROM Products");
        }

        public async Task<IEnumerable<Product>> FilterProductsAsync(string? category, DateTime? fromDate, DateTime? toDate)
        {
            using var connection = CreateConnection();
            
            var sql = "SELECT * FROM Products WHERE 1=1";
            var parameters = new DynamicParameters();

            if (!string.IsNullOrEmpty(category))
            {
                sql += " AND ProductCategory = @Category";
                parameters.Add("Category", category);
            }

            if (fromDate.HasValue)
            {
                sql += " AND ProductionDate >= @FromDate";
                parameters.Add("FromDate", fromDate.Value);
            }

            if (toDate.HasValue)
            {
                sql += " AND ProductionDate <= @ToDate";
                parameters.Add("ToDate", toDate.Value);
            }

            return await connection.QueryAsync<Product>(sql, parameters);
        }
    }
}
