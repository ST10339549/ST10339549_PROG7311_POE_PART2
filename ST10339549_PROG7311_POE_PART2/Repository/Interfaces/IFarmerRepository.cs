using ST10339549_PROG7311_POE_PART2.Models;

namespace ST10339549_PROG7311_POE_PART2.Repository.Interfaces
{
    public interface IFarmerRepository
    {
        Task<IEnumerable<Farmer>> GetAllAsync();
        Task<Farmer> GetByIdAsync(int id);
        Task<Farmer> GetByEmailAsync(string email);
        Task<int> AddAsync(Farmer entity);
        Task<bool> UpdateAsync(Farmer entity);
        Task<bool> DeleteAsync(int id);
        Task<bool> ValidateCredentialsAsync(string email, string password);
    }
}
