using System.ComponentModel.DataAnnotations;

namespace ST10339549_PROG7311_POE_PART2.Models
{
    public class Employee
    {
        public int EmployeeId { get; set; }

        [Required(ErrorMessage = "Employee name is required")]
        public string EmployeeName { get; set; }

        [Required(ErrorMessage = "Email address is required")]
        [EmailAddress(ErrorMessage = "Invalid email address")]
        public string EmployeeEmail { get; set; }

        [Required(ErrorMessage = "Password is required")]
        public string EmployeePasswordHash { get; set; }

        [Required(ErrorMessage = "Role title is required")]
        public string EmployeeRoleTitle { get; set; }

        [Required(ErrorMessage = "Phone number is required")]
        public string EmployeePhoneNumber { get; set; }

        public DateTime CreatedAt { get; set; }
    }
}
