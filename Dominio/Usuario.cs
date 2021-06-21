using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
   public class Usuario
    {


        public long ID { get; set; }
        public string NombreUsuario { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public DateTime Fecha { get; set; }
        public  int Dni { get; set; }
        public string Pass { get; set; }
        public  char Tipo { get; set; }

        public Usuario(string nombre)
        {
            Nombre = nombre;
        }

        public Usuario(int id, string nombre)
        {
            ID= id;
            Nombre = nombre;
        }

        public override string ToString()
        {
            return Nombre;
        }




    }
}
