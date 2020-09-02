using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Book_A_Meal.DAL;

namespace Book_A_Meal.Models.Home
{
    public class Item
    {
        public Tbl_Product Product { get; set; }
        public int Quantity { get; set; }
    }
}