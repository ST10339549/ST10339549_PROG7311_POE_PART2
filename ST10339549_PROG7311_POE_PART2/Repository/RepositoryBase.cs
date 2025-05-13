using Dapper;
using System.Data;
using System.Data.SqlClient;

namespace ST10339549_PROG7311_POE_PART2.Repository
{
    public abstract class RepositoryBase
    {
        protected readonly string _connectionString;

        protected RepositoryBase(IConfiguration configuration)
        {
            _connectionString = configuration.GetConnectionString("DefaultConnection")
                ?? throw new ArgumentNullException("Connection string 'DefaultConnection' not found.");
        }

        protected IDbConnection CreateConnection()
        {
            return new SqlConnection(_connectionString);
        }

        // SQL Helper methods can be added here if needed
    }
}
