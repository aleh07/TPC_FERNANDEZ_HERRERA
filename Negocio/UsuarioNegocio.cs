using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;


namespace Negocio
{
    public class UsuarioNegocio
    {
        public void agregar(Usuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT Into Usuarios (NombreUsuario,Pass,Nombre,Apellido,FechaNac,Dni,Tipo,Estado) " +
                                   "values (@NombreUsuario,@Pass,@Nombre,@Apellido,@Fecha,@Dni,@Tipo,@Estado)");


                datos.setearParametro("@NombreUsuario", nuevo.NombreUsuario);
                datos.setearParametro("@Pass", nuevo.Pass);
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Apellido", nuevo.Apellido);
                datos.setearParametro("@Fecha", nuevo.Fecha);
                datos.setearParametro("@Dni", nuevo.Dni);
                datos.setearParametro("@Tipo", nuevo.Tipo);
                datos.setearParametro("@Estado", nuevo.Estado);

                datos.ejectutarAccion();


            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
