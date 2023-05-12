using MaxouPizza.Models;
using Microsoft.EntityFrameworkCore;

namespace MaxouPizza.Data
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options) { }
        public DbSet<Pizza> Pizzas { get; set; }

    }
}
