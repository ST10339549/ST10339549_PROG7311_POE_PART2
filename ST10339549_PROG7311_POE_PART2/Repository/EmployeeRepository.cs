using Dapper;
using ST10339549_PROG7311_POE_PART2.Models;
using ST10339549_PROG7311_POE_PART2.Repository.Interfaces;

namespace ST10339549_PROG7311_POE_PART2.Repository
{
    public class EmployeeRepository : RepositoryBase, IEmployeeRepository
    {
        public EmployeeRepository(IConfiguration configuration) : base(configuration)
        {
        }

        public async Task<IEnumerable<Employee>> GetAllAsync()
        {
            using var connection = CreateConnection();
            return await connection.QueryAsync<Employee>("SELECT * FROM Employees");
        }

        public async Task<Employee> GetByIdAsync(int id)
        {
            using var connection = CreateConnection();
            return await connection.QuerySingleOrDefaultAsync<Employee>(
                "SELECT * FROM Employees WHERE EmployeeId = @Id", 
                new { Id = id });
        }

        public async Task<Employee> GetByEmailAsync(string email)
        {
            using var connection = CreateConnection();
            return await connection.QuerySingleOrDefaultAsync<Employee>(
                "SELECT * FROM Employees WHERE EmployeeEmail = @Email", 
                new { Email = email });
        }

        public async Task<int> AddAsync(Employee entity)
        {
            using var connection = CreateConnection();
            entity.CreatedAt = DateTime.Now;
            
            var sql = @"
                INSERT INTO Employees (EmployeeName, EmployeeEmail, EmployeePasswordHash, 
                                      EmployeeRoleTitle, EmployeePhoneNumber, CreatedAt)
                VALUES (@EmployeeName, @EmployeeEmail, @EmployeePasswordHash, 
                        @EmployeeRoleTitle, @EmployeePhoneNumber, @CreatedAt);
                SELECT CAST(SCOPE_IDENTITY() as int)";

            return await connection.QuerySingleAsync<int>(sql, entity);
        }

        public async Task<bool> UpdateAsync(Employee entity)
        {
            using var connection = CreateConnection();
            
            var sql = @"
                UPDATE Employees
                SET EmployeeName = @EmployeeName, 
                    EmployeeEmail = @EmployeeEmail, 
                    EmployeePasswordHash = @EmployeePasswordHash, 
                    EmployeeRoleTitle = @EmployeeRoleTitle, 
                    EmployeePhoneNumber = @EmployeePhoneNumber
                WHERE EmployeeId = @EmployeeId";

            var rowsAffected = await connection.ExecuteAsync(sql, entity);
            return rowsAffected > 0;
        }

        public async Task<bool> DeleteAsync(int id)
        {
            using var connection = CreateConnection();
            
            var sql = "DELETE FROM Employees WHERE EmployeeId = @Id";
            
            var rowsAffected = await connection.ExecuteAsync(sql, new { Id = id });
            return rowsAffected > 0;
        }

        public async Task<bool> ValidateCredentialsAsync(string email, string password)
        {
            var employee = await GetByEmailAsync(email);
            if (employee == null)
                return false;

            // This is a simple password verification - in a real app, use proper password hashing
            return employee.EmployeePasswordHash == password;
        }
    }
}
