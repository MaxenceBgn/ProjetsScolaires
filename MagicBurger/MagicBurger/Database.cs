using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Numerics;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using System.Windows;
using System.IO;
using System.Text.Json.Serialization;

namespace MagicBurger
{
    public class Database
    {
        public List<Burger> Burgers { get; set; }
        public List<Beverage> Beverages { get; set; }


        public Database() 
        {
            Burgers = new List<Burger>();
            Beverages = new List<Beverage>();
        }

        public void InitialiseDB(Files jsonBurgersFile, Files jsonBeveragesFile)
        {
            string jsonString = "";
            StreamReader srBurger = new StreamReader(jsonBurgersFile.Path);
            jsonString = srBurger.ReadToEnd(); 
            srBurger.Close();
            try
            {
                Burgers = JsonSerializer.Deserialize<List<Burger>>(jsonString);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            StreamReader srBeverages = new StreamReader(jsonBeveragesFile.Path);
            jsonString = srBeverages.ReadToEnd();
            srBeverages.Close();
            try
            {
                Beverages = JsonSerializer.Deserialize<List<Beverage>>(jsonString);
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
