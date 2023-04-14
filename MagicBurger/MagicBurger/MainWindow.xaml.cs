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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace MagicBurger
{
    public partial class MainWindow : Window
    {
        public Database ActualDatabase { get; set; } = new Database();
        public Order ActualOrder { get; set; } = new Order(1, new List<Item>() { }, 0);

        public MainWindow(Database actualdatabase, Order actualOrder)
        {
            ActualDatabase = actualdatabase;
            ActualOrder = actualOrder;
        }

        public MainWindow()
        {
            //Initialisation
            InitializeComponent();
            Files jsonBurgers = new Files("burgers.json");
            Files jsonBeverages = new Files("beverages.json");
            ActualDatabase.InitialiseDB(jsonBurgers, jsonBeverages);

            Burger.DisplayAllBurgers(ActualDatabase, WrapPanel_body, ActualOrder, TextBlock_DisplayedPrice, WrapPanel_order);
        }

        private void Button_Click_SodaMenu(object sender, RoutedEventArgs e)
        {
            Beverage.DisplayAllBeverages(ActualDatabase, WrapPanel_body, ActualOrder, TextBlock_DisplayedPrice, WrapPanel_order);
        }

        private void Button_Click_BurgerMenu(object sender, RoutedEventArgs e)
        {
            Burger.DisplayAllBurgers(ActualDatabase, WrapPanel_body, ActualOrder, TextBlock_DisplayedPrice, WrapPanel_order);
        }

        private void Button_Click_Order(object sender, RoutedEventArgs e)
        {
            ActualOrder.ConfirmOrder(WrapPanel_body, WrapPanel_CartPanel);
        }
    }
}
