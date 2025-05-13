using ST10339549_PROG7311_POE_PART2.Models;

namespace ST10339549_PROG7311_POE_PART2.Repository.Interfaces
{
    public interface IEmployeeRepository : IRepositoryBase<Employee>
    {
        Task<Employee> GetByEmailAsync(string email);
        Task<bool> ValidateCredentialsAsync(string email, string password);
    }
}
