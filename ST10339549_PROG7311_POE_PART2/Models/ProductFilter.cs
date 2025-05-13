namespace ST10339549_PROG7311_POE_PART2.Models
{
    public class ProductFilter
    {
        public string? Category { get; set; }

        public DateTime? FromDate { get; set; }

        public DateTime? ToDate { get; set; }

        public List<Product>? FilteredProducts { get; set; }

        public List<string>? AvailableCategories { get; set; }
    }
}
