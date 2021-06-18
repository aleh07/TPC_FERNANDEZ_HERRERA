using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dominio;
namespace TPC_Fernadez_Herrera.Negocio
{
    public class Marca_Negocio
    {
       
            public List<Marca> listar()
            {
                List<Marca> lista = new List<Marca>();
                Acceso_a_Datos datos = new Acceso_a_Datos();

                try
                {
                    datos.setearConsulta("select id, descripcion from MARCAS");
                    datos.ejecutarLectura();

                    while (datos.Lector.Read())
                    {
                        lista.Add(new Marca((int)datos.Lector["id"], (string)datos.Lector["descripcion"]));
                    }

                    return lista;
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                finally
                {
                    datos.cerrarConexion();
                }
            }

        
    }
}