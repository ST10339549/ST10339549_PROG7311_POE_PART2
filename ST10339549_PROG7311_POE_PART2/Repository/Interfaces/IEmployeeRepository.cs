using ST10339549_PROG7311_POE_PART2.Models;

namespace ST10339549_PROG7311_POE_PART2.Repository.Interfaces
{
    public interface IEmployeeRepository
    {
        Task<IEnumerable<Employee>> GetAllAsync();
        Task<Employee> GetByIdAsync(int id);
        Task<Employee> GetByEmailAsync(string email);
        Task<int> AddAsync(Employee entity);
        Task<bool> UpdateAsync(Employee entity);
        Task<bool> DeleteAsync(int id);
        Task<bool> ValidateCredentialsAsync(string email, string password);
    }
}
