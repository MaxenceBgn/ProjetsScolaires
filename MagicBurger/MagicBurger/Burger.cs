using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace MagicBurger
{
    public class Burger : Item
    {
        public bool IsVege { get; set; }

        public Burger(string name, decimal price, bool isVege) : base(name, price)
        {
            IsVege = isVege;
        }

        /// <summary>
        /// Affiche tous les burgers disponibles dans le menu de sélection
        /// </summary>
        public static void DisplayAllBurgers(Database database, WrapPanel wrapPanel, Order actualOrder, TextBlock displayedPrice, WrapPanel wrapPanelOrder)
            {
                wrapPanel.Children.Clear();
                foreach (Burger burger in database.Burgers)
                {
                    Image itemImage = new Image();
                    BitmapImage bi = new BitmapImage();
                    bi.BeginInit();
                    if (burger.IsVege) bi.UriSource = new Uri("Ressources/burgers/vegeburger.png", UriKind.Relative);
                    else bi.UriSource = new Uri("Ressources/burgers/burger.png", UriKind.Relative);
                    bi.EndInit();
                    itemImage.Source = bi;
                    itemImage.Width = 50;

                    TextBlock title = new TextBlock();
                    TextBlock price = new TextBlock(); 
                    title.Text = burger.Name;
                    price.Text = burger.Price.ToString();

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
                        burger.AddToCart(actualOrder, displayedPrice, wrapPanelOrder);
                    };
                }
            }
        }
}
