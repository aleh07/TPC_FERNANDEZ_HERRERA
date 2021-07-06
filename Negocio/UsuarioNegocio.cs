using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
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

        public Usuario ValidarUsuarios(string usuario, string pass)
        {
            Usuario cuenta = new Usuario();
            AccesoDatos Datos = new AccesoDatos();

            Datos.setearConsulta("select u.Id,u.nombre,u.apellido,u.fechanac,u.dni from usuarios as u where u.NOMBREUSUARIO= '" + usuario + "'and u.PASS='" + pass +"'") ;
            Datos.ejecutarLectura();

            try
            {
                Datos.Lector.Read();
                
                    Usuario aux = new Usuario();
                    aux.ID = (long)Datos.Lector["Id"];
                    aux.Nombre = (string)Datos.Lector["Nombre"];
                    aux.Apellido = (string)Datos.Lector["Apellido"];
                    aux.Fecha = (DateTime)Datos.Lector["fechanac"];
                    aux.Dni = (int)Datos.Lector["dni"];

      
                
                return aux;
            }
            catch (Exception )
            {

                return null;
            }
            finally
            {
                Datos.cerrarConexion();
            }


        }
    }
}
