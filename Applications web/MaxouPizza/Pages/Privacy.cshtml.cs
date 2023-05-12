using MaxouPizza.Data;
using MaxouPizza.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;

namespace MaxouPizza.Pages
{
    public class PrivacyModel : PageModel
    {
        private readonly ILogger<PrivacyModel> _logger;
        DataContext _dataContext;

        public PrivacyModel(ILogger<PrivacyModel> logger, DataContext datacontext)
        {
            _logger = logger;
            _dataContext = datacontext;
        }

        public void OnGet()
        {
            //Pizza pizza = new Pizza() { Name = "4 fromages", Price = 10.5f, Vegetarian = true, Ingredients = "Mozzarella, Emmental, Brie, Roquefort" };
            //_dataContext.Pizzas.Add(pizza);
            //_dataContext.SaveChanges();
        }
    }
}