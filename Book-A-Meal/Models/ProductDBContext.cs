using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.Entity;

namespace Book_A_Meal.Models
{
    public class ProductDBContext : DbContext
    {
        public ProductDBContext() : base("MyConn")
        {
        }
        public DbSet<Product> Products { get; set; }
        public DbSet<Category> Categories { get; set; }
    }
}