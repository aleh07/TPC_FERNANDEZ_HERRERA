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
        public List<Usuario> Listar()
        {
            List<Usuario> lista = new List<Usuario>();
            AccesoDatos Datos = new AccesoDatos();

            Datos.setearConsulta("select ID,NOMBRE,APELLIDO,EMAIL,PASS,TIPO from USUARIOS");
            Datos.ejecutarLectura();

            try
            {
                while (Datos.Lector.Read())
                {
                    Usuario aux = new Usuario();
                    aux.ID = (long)Datos.Lector["ID"];
                    aux.Nombre = (string)Datos.Lector["NOMBRE"];
                    aux.Apellido = (string)Datos.Lector["APELLIDO"];                 
                    aux.Email= (string)Datos.Lector["EMAIL"];              
                    aux.Pass = (string)Datos.Lector["PASS"];
                    aux.Tipo = (string)Datos.Lector["TIPO"];
                   
               

                    lista.Add(aux);
                }
                return lista;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                Datos.cerrarConexion();
            }
        }

        public void agregar(Usuario nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT Into Usuarios (Nombre,Apellido,Email,Pass,Tipo,Estado) " +
                                   "values (@Nombre,@Apellido,@Email,@Pass,@Tipo,@Estado)");


              
                
                datos.setearParametro("@Nombre", nuevo.Nombre);
                datos.setearParametro("@Apellido", nuevo.Apellido);
                datos.setearParametro("@Email",nuevo.Email);
                datos.setearParametro("@Pass", nuevo.Pass);
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

           // Datos.setearConsulta("select u.Estado,u.NombreUsuario,u.Dni,u.Direcion,u.Telefono,u.Id,u.Nombre,u.Apellido,u.Email,u.Pass,u.Tipo from usuarios as u where u.Email= '" + usuario + "'and u.Pass='" + pass + "'");
            Datos.setearConsulta("select u.Id,u.Nombre,u.Apellido,u.Email,u.Pass,u.Tipo from usuarios as u where u.Email= '" + usuario + "'and u.Pass='" + pass + "'");
            Datos.ejecutarLectura();

            try
            {
                Datos.Lector.Read();

                Usuario aux = new Usuario();
                //estos atributos al estar nulos en la debe me dan error buscar la manera de que se puedan cargar a AUX aunke sean nulos como hice con nombreusuario
                //aux.Estado = Convert.ToBoolean(Datos.Lector["Estado"]);
                //aux.NombreUsuario= Convert.ToString(Datos.Lector["NombreUsuario"]);               
                //aux.Dni =(int)Datos.Lector["Dni"];
                //aux.Domicilio = (string)Datos.Lector["Direcion"];
                //aux.Telefono = (int)Datos.Lector["Telefono"];               
                aux.ID = (long)Datos.Lector["Id"];
                aux.Nombre = (string)Datos.Lector["Nombre"];
                aux.Apellido = (string)Datos.Lector["Apellido"];
                aux.Pass = (string)Datos.Lector["Pass"];
                aux.Tipo = (string)Datos.Lector["Tipo"];



                return aux;
            }
            catch (Exception)
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
