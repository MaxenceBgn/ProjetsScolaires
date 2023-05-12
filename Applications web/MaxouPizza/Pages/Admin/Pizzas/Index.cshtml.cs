using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using MaxouPizza.Data;
using MaxouPizza.Models;
using Microsoft.AspNetCore.Authorization;

namespace MaxouPizza.Pages.Admin.Pizzas
{
    [Authorize]
    public class IndexModel : PageModel
    {
        private readonly MaxouPizza.Data.DataContext _context;

        public IndexModel(MaxouPizza.Data.DataContext context)
        {
            _context = context;
        }

        public IList<Pizza> Pizza { get;set; } = default!;

        public async Task OnGetAsync()
        {
            if (_context.Pizzas != null)
            {
                Pizza = await _context.Pizzas.ToListAsync();
            }
        }
    }
}
