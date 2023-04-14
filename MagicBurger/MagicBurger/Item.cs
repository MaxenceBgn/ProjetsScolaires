using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace MagicBurger
{
    public class Item
    {
        public string Name { get; set; }
        public decimal Price { get; set; }

        public Item(string name, decimal price)
        {
            Name = name;
            Price = price;
        }

        public void AddToCart(Order order, TextBlock displayedPrice, WrapPanel wrapPanelOrder)
        {
            order.Items.Add(this);
            order.TotalPrice += Price;
            displayedPrice.Text = order.TotalPrice.ToString() + " €";
            order.DiplayItemOrdered(this, wrapPanelOrder, displayedPrice);
        }
    }
}
