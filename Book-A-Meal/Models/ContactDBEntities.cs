using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using Book_A_Meal.Models;
using Book_A_Meal.DAL;

namespace Book_A_Meal.Models
{
    
        public partial class ContactDBEntities : DbContext
        {
            public ContactDBEntities()
                : base("name=ContactDBEntities")
            {
            }

            protected override void OnModelCreating(DbModelBuilder modelBuilder)
            {
                throw new UnintentionalCodeFirstException();
            }

            
        }
}

