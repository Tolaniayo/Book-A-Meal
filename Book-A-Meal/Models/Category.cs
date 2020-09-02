using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace Book_A_Meal.Models
{
    public class Category
    {
        [Key]
        public int CatId { get; set; }

        [Required(ErrorMessage = "Product Name is Required")]
        [StringLength(150, MinimumLength = 2)]
        public string CatName { get; set; }

        public List<Product> Products { get; set; }
    }
}