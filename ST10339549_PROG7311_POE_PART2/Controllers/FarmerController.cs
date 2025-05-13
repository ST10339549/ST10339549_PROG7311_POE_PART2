using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ST10339549_PROG7311_POE_PART2.Models;
using ST10339549_PROG7311_POE_PART2.Repository.Interfaces;

namespace ST10339549_PROG7311_POE_PART2.Controllers
{
    [Authorize(Roles = "Farmer")]
    public class FarmerController : Controller
    {
        private readonly IProductRepository _productRepo;

        public FarmerController(IProductRepository productRepo)
        {
            _productRepo = productRepo;
        }

        public IActionResult AddProduct() => View();

        [HttpPost]
        public async Task<IActionResult> AddProduct(Product model)
        {
            if (!ModelState.IsValid) return View(model);

            // Assume FarmerId is somehow retrieved from session or context
            model.FarmerId = 1; // placeholder
            await _productRepo.AddAsync(model);
            return RedirectToAction("MyProducts");
        }

        public async Task<IActionResult> MyProducts()
        {
            // Assume FarmerId is somehow retrieved from session or context
            var products = await _productRepo.GetByFarmerIdAsync(1); // placeholder
            return View(products);
        }
    }
}
