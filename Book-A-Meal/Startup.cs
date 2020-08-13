using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Book_A_Meal.Startup))]
namespace Book_A_Meal
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
