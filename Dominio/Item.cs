using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Item
    {
        public Componente componente { get; set; }
        public int Cantidad { get; set; }
        public decimal SubTotal { get; set; }
    }
}
