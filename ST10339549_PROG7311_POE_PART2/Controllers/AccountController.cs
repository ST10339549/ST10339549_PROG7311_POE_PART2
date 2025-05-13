using Microsoft.AspNetCore.Mvc;
using ST10339549_PROG7311_POE_PART2.Repository.Interfaces;
using ST10339549_PROG7311_POE_PART2.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using System.Security.Claims;

namespace ST10339549_PROG7311_POE_PART2.Controllers
{
    public class AccountController : Controller
    {
        private readonly IFarmerRepository _farmerRepo;
        private readonly IEmployeeRepository _employeeRepo;

        public AccountController(IFarmerRepository farmerRepo, IEmployeeRepository employeeRepo)
        {
            _farmerRepo = farmerRepo;
            _employeeRepo = employeeRepo;
        }

        [HttpGet]
        public IActionResult Login() => View();

        [HttpPost]
        public async Task<IActionResult> Login(string email, string password, UserRole role)
        {
            bool isValid = false;
            ClaimsIdentity identity = null;

            if (role == UserRole.Farmer)
            {
                var farmer = await _farmerRepo.GetByEmailAsync(email);
                isValid = await _farmerRepo.ValidateCredentialsAsync(email, password);
                if (isValid)
                {
                    identity = new ClaimsIdentity(new[]
                    {
                        new Claim(ClaimTypes.NameIdentifier, farmer.FarmerId.ToString()),
                        new Claim(ClaimTypes.Name, farmer.FarmerName),
                        new Claim(ClaimTypes.Role, "Farmer")
                    }, CookieAuthenticationDefaults.AuthenticationScheme);
                }
            }
            else
            {
                var employee = await _employeeRepo.GetByEmailAsync(email);
                isValid = await _employeeRepo.ValidateCredentialsAsync(email, password);
                if (isValid)
                {
                    identity = new ClaimsIdentity(new[]
                    {
                        new Claim(ClaimTypes.NameIdentifier, employee.EmployeeId.ToString()),
                        new Claim(ClaimTypes.Name, employee.EmployeeName),
                        new Claim(ClaimTypes.Role, "Employee")
                    }, CookieAuthenticationDefaults.AuthenticationScheme);
                }
            }

            if (!isValid) 
            {
                ViewBag.LoginError = "Invalid email, password, or role selected.";
                return View();
            }

            var principal = new ClaimsPrincipal(identity);
            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, principal);
            
            // Redirect to role-specific pages
            if (role == UserRole.Farmer)
                return RedirectToAction("MyProducts", "Farmer");
            else
                return RedirectToAction("AllFarmers", "Employee");
        }

        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync();
            return RedirectToAction("Login");
        }
    }
}
