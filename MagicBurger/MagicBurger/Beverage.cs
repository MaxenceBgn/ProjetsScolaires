using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;
using System.Windows.Media.Imaging;
using System.Windows;

namespace MagicBurger
{
    public class Beverage : Item
    {
        public bool IsSoda { get; set; }
        public Beverage(string name, decimal price, bool isSoda) : base(name, price)
        {
            IsSoda = isSoda;
        }

        public static void DisplayAllBeverages(Database database, WrapPanel wrapPanel, Order actualOrder, TextBlock displayedPrice, WrapPanel wrapPanelOrder)
        {
            wrapPanel.Children.Clear();
            foreach (Beverage beverage in database.Beverages)
            {
                Image itemImage = new Image();
                BitmapImage bi = new BitmapImage();
                bi.BeginInit();
                if (beverage.IsSoda) bi.UriSource = new Uri("Ressources/beverages/soda.png", UriKind.Relative);
                else bi.UriSource = new Uri("Ressources/beverages/coffee.png", UriKind.Relative);
                bi.EndInit();
                itemImage.Source = bi;
                itemImage.Width = 50;

                TextBlock title = new TextBlock();
                TextBlock price = new TextBlock();
                title.Text = beverage.Name;
                price.Text = beverage.Price.ToString();

                Button buttonAddCart = new Button();
                buttonAddCart.Content = "Ajouter";

                StackPanel stackpannelBurger = new StackPanel();
                stackpannelBurger.Children.Add(title);
                stackpannelBurger.Children.Add(itemImage);
                stackpannelBurger.Children.Add(price);
                stackpannelBurger.Children.Add(buttonAddCart);
                stackpannelBurger.Margin = new Thickness(30, 30, 30, 30);
                stackpannelBurger.Width = 70;
                title.HorizontalAlignment = HorizontalAlignment.Center;
                price.HorizontalAlignment = HorizontalAlignment.Center;

                wrapPanel.Children.Add(stackpannelBurger);

                buttonAddCart.Click += (sender, e) =>
                {
                    beverage.AddToCart(actualOrder, displayedPrice, wrapPanelOrder);
                };
            }
        }
    }
}
