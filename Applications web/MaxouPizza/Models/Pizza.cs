using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace MaxouPizza.Models
{
    public class Pizza
    {
        public int PizzaID { get; set; }
        [Display(Name = "Nom")]
        public string Name { get; set; }
        [Display(Name = "Prix (€)")]
        public float Price { get; set; }
        [Display(Name = "Végétarienne")]
        public bool Vegetarian { get; set; }
        [Display(Name = "Ingrédients")]
        public string Ingredients { get; set; }
    }
}
