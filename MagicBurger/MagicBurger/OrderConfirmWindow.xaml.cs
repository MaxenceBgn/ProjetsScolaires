using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace MagicBurger
{
    public partial class OrderConfirmWindow : Window
    {
        public Order ActualOrder { get; set; }
        public OrderConfirmWindow(Order actualOrder)
        {
            ActualOrder = actualOrder;
            InitializeComponent();

            DisplayOrder();
        }

        /// <summary>
        /// Affiche le récapitulatif total de la commande
        /// </summary>
        public void DisplayOrder()
        {
            foreach (Item item in ActualOrder.Items)
            {
                Border borderStackPanel = new Border();
                StackPanel stackPanel = new StackPanel();

                TextBlock nameItem = new TextBlock();
                TextBlock priceItem = new TextBlock();
                nameItem.Text = $"{item.Name}   ";
                nameItem.FontWeight = FontWeights.Bold;
                priceItem.Text = item.Price.ToString();

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

                buttonExitOrder.Click += (sender, e) => { DeleteItemFromConfirmOrderPanel(); };

                stackPanel.Children.Add(nameItem);
                stackPanel.Children.Add(priceItem);
                stackPanel.Children.Add(buttonExitOrder);
                borderStackPanel.Child = stackPanel;
                borderStackPanel.BorderBrush = Brushes.Gray;
                borderStackPanel.BorderThickness = new Thickness(1);
                borderStackPanel.Margin = new Thickness(0,0,10,0);

                WrapPanel_body.Children.Add(borderStackPanel);
            }
        }

        public void DeleteItemFromConfirmOrderPanel()
        {
            //(item, displayedPrice, (FrameworkElement)sender) liste des paramètres à passer dans la fonction
        }
    }
}
