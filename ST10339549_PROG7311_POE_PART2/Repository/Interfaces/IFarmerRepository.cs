using ST10339549_PROG7311_POE_PART2.Models;

namespace ST10339549_PROG7311_POE_PART2.Repository.Interfaces
{
    public interface IFarmerRepository : IRepositoryBase<Farmer>
    {
        Task<Farmer> GetByEmailAsync(string email);
        Task<bool> ValidateCredentialsAsync(string email, string password);
    }
}
