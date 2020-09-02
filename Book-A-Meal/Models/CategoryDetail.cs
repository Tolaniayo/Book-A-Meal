﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Runtime.CompilerServices;
using System.Web.Mvc;

namespace Book_A_Meal.Models
{
    public class CategoryDetail
    {
        public int CategoryId { get; set; }
        [Required(ErrorMessage = "Category Name Required") ]
        [StringLength(100, ErrorMessage = "Minumu 3 and minumum and 5 and maximum 100 charaters are allowed", MinimumLength = 3)]
        public string CategoryName { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<bool> IsDelete { get; set; }

    }
    public class ProductDetail
    {
        public int ProductId { get; set; }
        [Required(ErrorMessage = "Product Name is Required")]
        [StringLength(100, ErrorMessage = "Minumu 3 and minumum and 5 and maximum 100 charaters are allowed", MinimumLength = 3)]
        public string ProductName { get; set; }
        [Required]
        [Range(1,50)]
        public Nullable<int> CategoryId { get; set; }
        public Nullable<bool> IsActive { get; set; }
        public Nullable<bool> IsDelete { get; set; }
        public Nullable<System.DateTime> CreatedDate { get; set; }
        public Nullable<System.DateTime> ModifiedDate { get; set; }
        [Required(ErrorMessage = "Description is Required")]
        public Nullable<System.DateTime> Description { get; set; }
        public string ProductImage { get; set; }
        public Nullable<bool> IsFeatured { get; set; }
        [Required]
        [Range(typeof(int), "1", "500", ErrorMessage ="Invalid Quantity")]
        public Nullable<int> Quantity { get; set; }
        [Required]
        [Range(typeof(decimal), "1", "200", ErrorMessage = "invalid Price")]
        public Nullable<decimal> Price { get; set; }
        public SelectList Categories { get; set; }


    }
}