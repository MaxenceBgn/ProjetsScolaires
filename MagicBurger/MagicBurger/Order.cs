using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.IO;

namespace MagicBurger
{
    public class Order
    {
        public int Id { get; set; }
        public List<Item> Items { get; set; }
        public decimal TotalPrice { get; set; }

        public Order(int id, List<Item> items, decimal totalPrice)
        {
            Id = id;
            Items = items;
            TotalPrice = totalPrice;
        }

        /// <summary>
        /// Affiche tous les items commandés dans le récapitualif du panier (droite du menu principal)
        /// </summary>
        public void DiplayItemOrdered(Item itemToAdd, WrapPanel wrapPanelOrder, TextBlock displayedPrice)
        {
            StackPanel stackPanel = new StackPanel();
            stackPanel.Orientation = Orientation.Horizontal;

            TextBlock nameItem = new TextBlock();
            TextBlock priceItem = new TextBlock();
            nameItem.Text = $"{itemToAdd.Name}   ";
            nameItem.FontWeight = FontWeights.Bold;
            priceItem.Text = itemToAdd.Price.ToString();

            Image itemImage = new Image();
            BitmapImage bi = new BitmapImage();
            bi.BeginInit();
            bi.UriSource = new Uri("Ressources/icon_cross_order.png", UriKind.Relative);
            bi.EndInit();
            itemImage.Source = bi;
            itemImage.Width = 15;
            itemImage.Margin = new Thickness(5, 0, 5, 0);

            Button buttonExitOrder = new Button();
            buttonExitOrder.Content = itemImage;
            buttonExitOrder.BorderThickness = new Thickness(0);
            buttonExitOrder.Background = Brushes.Transparent;
            buttonExitOrder.MouseEnter += (s, e) => { buttonExitOrder.Background = Brushes.Transparent; };
            buttonExitOrder.Click += (sender, e) => { DeleteItemFromOrderPanel(itemToAdd, stackPanel, wrapPanelOrder, displayedPrice); };


            stackPanel.Children.Add(nameItem);
            stackPanel.Children.Add(priceItem);
            stackPanel.Children.Add(buttonExitOrder);

            wrapPanelOrder.Children.Add(stackPanel);
        }

        /// <summary>
        /// Supprime un item du panier (droite du menu principal)
        /// </summary>
        public void DeleteItemFromOrderPanel(Item itemToDelete, StackPanel stackPanelToDelete, WrapPanel wrapPanelOrder, TextBlock displayedPrice)
        {
            Items.Remove(itemToDelete);
            wrapPanelOrder.Children.Remove(stackPanelToDelete);
            TotalPrice -= itemToDelete.Price;
            displayedPrice.Text = TotalPrice.ToString() + " €";
        }
    }
}
