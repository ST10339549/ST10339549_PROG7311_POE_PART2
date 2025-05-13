using System.ComponentModel.DataAnnotations;

namespace ST10339549_PROG7311_POE_PART2.Models
{
    public class ErrorViewModel
    {
        [Required(ErrorMessage = "Request ID is required")]
        public string? RequestId { get; set; }

        public bool ShowRequestId => !string.IsNullOrEmpty(RequestId);
    }
}
