using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
   public class TiposPedidos
    {
        public Int32 Id { get; set; }
        public string Nombre { get; set; }

        public TiposPedidos(string nombre)
        {
            Nombre = nombre;
        }

        public TiposPedidos(int id, string nombre)
        {
            Id = id;
            Nombre = nombre;
        }



        public override string ToString()
        {
            return Nombre;
        }
    }
}
