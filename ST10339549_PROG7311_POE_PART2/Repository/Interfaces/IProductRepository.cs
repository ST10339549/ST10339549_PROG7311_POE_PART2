using ST10339549_PROG7311_POE_PART2.Models;

namespace ST10339549_PROG7311_POE_PART2.Repository.Interfaces
{
    public interface IProductRepository : IRepositoryBase<Product>
    {
        Task<IEnumerable<Product>> GetByFarmerIdAsync(int farmerId);
        Task<IEnumerable<string>> GetAllCategoriesAsync();
        Task<IEnumerable<Product>> FilterProductsAsync(string? category, DateTime? fromDate, DateTime? toDate);
    }
}
