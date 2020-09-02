using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace Book_A_Meal.Models
{
    public class Product
    {
        [Key]
        public int Id { get; set; }
        [Required(ErrorMessage = "Product Name is Required")]
        [StringLength(150, MinimumLength = 2) ]
        public string Name { get; set; }
        public string ImageUrl { get; set; }

        public int CatId { get; set; }

        public Category category { get; set; }
    }
}