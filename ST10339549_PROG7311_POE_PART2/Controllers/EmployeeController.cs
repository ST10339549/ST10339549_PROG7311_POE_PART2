using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ST10339549_PROG7311_POE_PART2.Models;
using ST10339549_PROG7311_POE_PART2.Repository.Interfaces;

namespace ST10339549_PROG7311_POE_PART2.Controllers
{
    [Authorize(Roles = "Employee")]
    public class EmployeeController : Controller
    {
        private readonly IFarmerRepository _farmerRepo;
        private readonly IProductRepository _productRepo;

        public EmployeeController(IFarmerRepository farmerRepo, IProductRepository productRepo)
        {
            _farmerRepo = farmerRepo;
            _productRepo = productRepo;
        }

        public IActionResult AddFarmer() => View();

        [HttpPost]
        public async Task<IActionResult> AddFarmer(Farmer model)
        {
            if (!ModelState.IsValid) return View(model);
            await _farmerRepo.AddAsync(model);
            return RedirectToAction("AllFarmers");
        }

        public async Task<IActionResult> AllFarmers()
        {
            var farmers = await _farmerRepo.GetAllAsync();
            return View(farmers);
        }

        public async Task<IActionResult> FilterProducts(ProductFilter filter)
        {
            var products = await _productRepo.FilterProductsAsync(filter.Category, filter.FromDate, filter.ToDate);
            filter.FilteredProducts = products.ToList();
            filter.AvailableCategories = (await _productRepo.GetAllCategoriesAsync()).ToList();
            return View(filter);
        }
    }
}
