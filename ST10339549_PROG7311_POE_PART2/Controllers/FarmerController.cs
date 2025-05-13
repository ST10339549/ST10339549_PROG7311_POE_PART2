using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ST10339549_PROG7311_POE_PART2.Models;
using ST10339549_PROG7311_POE_PART2.Repository.Interfaces;
using System.Security.Claims;

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

            // Get FarmerId from claims
            model.FarmerId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier));
            await _productRepo.AddAsync(model);
            return RedirectToAction("MyProducts");
        }

        public async Task<IActionResult> MyProducts()
        {
            // Get FarmerId from claims
            int farmerId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier));
            var products = await _productRepo.GetByFarmerIdAsync(farmerId);
            return View(products);
        }
    }
}
