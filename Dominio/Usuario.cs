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
        public string Email { get; set; }


        public string Domicilio { get; set; }

        public int Telefono { get; set; }
        public DateTime Fecha { get; set; }
        public  int Dni { get; set; }
        public string Pass { get; set; }
        public  char Tipo { get; set; }
        public bool Estado { get; set; }

       

        public override string ToString()
        {
            return Nombre;
        }




    }
}
