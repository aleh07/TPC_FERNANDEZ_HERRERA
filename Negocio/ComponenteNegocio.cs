using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace Negocio
{
    public class ComponenteNegocio
    {
        public List<Componente> Listar()
        {
            List<Componente> lista = new List<Componente>();
            AccesoDatos Datos = new AccesoDatos();

            Datos.setearConsulta("select Co.Id Id,Nombre,Co.Descripcion,Precio,ImagenUrl,M.Descripcion Marca,M.ID IDMarca ,Ca.Descripcion Categoria,Ca.ID IDCategoria from COMPONENTES Co, CATEGORIAS Ca, Marcas M Where Co.IdCategoria = Ca.Id and Co.IdMarca = M.Id");
            Datos.ejecutarLectura();

                try
                {
                    while (Datos.Lector.Read())
                    {
                        Componente aux = new Componente();                     
                        aux.ID = (long)Datos.Lector["Id"];
                        aux.Nombre = (string)Datos.Lector["Nombre"];  
                    //buscar la manera para que sean solo 2 digitos luego de la coma
                        aux.Precio = (Decimal)Datos.Lector["Precio"];         
                        aux.Descripcion = (string)Datos.Lector["Descripcion"];
                        aux.ImagenUrl = (string)Datos.Lector["ImagenUrl"];

                        aux.marca = new Marca((int)Datos.Lector["IDMarca"], (string)Datos.Lector["Marca"]);

                        aux.categoria = new Categoria((int)Datos.Lector["IDCategoria"], (string)Datos.Lector["Categoria"]);

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
    }
}
