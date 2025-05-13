using System.ComponentModel.DataAnnotations;

namespace ST10339549_PROG7311_POE_PART2.Models
{
    public class Farmer
    {
        public int FarmerId { get; set; }

        [Required(ErrorMessage = "Farmer name is required")]
        public string FarmerName { get; set; }

        [Required(ErrorMessage = "Email address is required")]
        [EmailAddress(ErrorMessage = "Invalid email address")]
        public string FarmerEmail { get; set; }

        [Required(ErrorMessage = "Password is required")]
        public string FarmerPasswordHash { get; set; }

        [Required(ErrorMessage = "Phone number is required")]
        public string FarmerPhoneNumber { get; set; }

        [Required(ErrorMessage = "Address is required")]
        public string FarmerAddress { get; set; }

        public DateTime CreatedAt { get; set; }
    }
}
