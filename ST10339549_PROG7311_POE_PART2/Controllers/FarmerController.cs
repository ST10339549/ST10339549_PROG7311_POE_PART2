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

        // GET: AddProduct
        public IActionResult AddProduct() => View();

        // POST: AddProduct
        [HttpPost]
        public async Task<IActionResult> AddProduct(Product model)
        {
            if (!ModelState.IsValid) return View(model);

            model.FarmerId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier));
            await _productRepo.AddAsync(model);
            return RedirectToAction("MyProducts");
        }

        // GET: MyProducts
        public async Task<IActionResult> MyProducts()
        {
            int farmerId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier));
            var products = await _productRepo.GetByFarmerIdAsync(farmerId);
            return View(products);
        }

        // GET: EditProduct
        [HttpGet]
        public async Task<IActionResult> EditProduct(int id)
        {
            var product = await _productRepo.GetByIdAsync(id);
            int farmerId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier));

            if (product == null || product.FarmerId != farmerId)
                return Unauthorized();

            return View(product);
        }

        // POST: EditProduct
        [HttpPost]
        public async Task<IActionResult> EditProduct(Product model)
        {
            if (!ModelState.IsValid) return View(model);

            int farmerId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier));
            if (model.FarmerId != farmerId)
                return Unauthorized();

            await _productRepo.UpdateAsync(model);
            return RedirectToAction("MyProducts");
        }

        // GET: DeleteProduct
        [HttpGet]
        public async Task<IActionResult> DeleteProduct(int id)
        {
            var product = await _productRepo.GetByIdAsync(id);
            int farmerId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier));

            if (product == null || product.FarmerId != farmerId)
                return Unauthorized();

            return View(product);
        }

        // POST: DeleteProduct (Confirmed)
        [HttpPost, ActionName("DeleteProduct")]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var product = await _productRepo.GetByIdAsync(id);
            int farmerId = int.Parse(User.FindFirstValue(ClaimTypes.NameIdentifier));

            if (product == null || product.FarmerId != farmerId)
                return Unauthorized();

            await _productRepo.DeleteAsync(id);
            return RedirectToAction("MyProducts");
        }
    }
}
