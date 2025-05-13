using System.ComponentModel.DataAnnotations;

namespace ST10339549_PROG7311_POE_PART2.Models
{
    public class Product
    {
        public int ProductId { get; set; }

        [Required(ErrorMessage = "Farmer ID is required")]
        public int FarmerId { get; set; }

        [Required(ErrorMessage = "Product name is required")]
        public string ProductName { get; set; }

        [Required(ErrorMessage = "Product category is required")]
        public string ProductCategory { get; set; }

        [Required(ErrorMessage = "Description is required")]
        public string Description { get; set; }

        [Required(ErrorMessage = "Quantity is required")]
        [Range(0, int.MaxValue, ErrorMessage = "Quantity must be a positive number")]
        public int Quantity { get; set; }

        [Required(ErrorMessage = "Unit price is required")]
        [Range(0, double.MaxValue, ErrorMessage = "Unit price must be a positive number")]
        public decimal UnitPrice { get; set; }

        [Required(ErrorMessage = "Production date is required")]
        public DateTime ProductionDate { get; set; }

        public DateTime CreatedAt { get; set; }
    }
}
