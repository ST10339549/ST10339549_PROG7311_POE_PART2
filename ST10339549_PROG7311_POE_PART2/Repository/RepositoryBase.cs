using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

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

        // Password hashing utility methods
        protected string HashPassword(string password)
        {
            using (var sha256 = SHA256.Create())
            {
                // Convert the password to a byte array and compute the hash
                byte[] hashedBytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));

                // Convert the hashed byte array to a string
                var builder = new StringBuilder();
                for (int i = 0; i < hashedBytes.Length; i++)
                {
                    builder.Append(hashedBytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        protected bool VerifyPassword(string storedHash, string password)
        {
            string passwordHash = HashPassword(password);
            return storedHash == passwordHash;
        }
    }
}
