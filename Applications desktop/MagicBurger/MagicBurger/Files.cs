using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MagicBurger
{
    public class Files
    {
        public string Name { get; set; }
        public string Path { get; set; }

        public Files(string name)
        {
            Name = name;
            Path = AppDomain.CurrentDomain.BaseDirectory + Name;
        }
    }
}
