using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dominio;

namespace TPC_Fernadez_Herrera.Negocio
{
    public class Categoria_Negocio
    {

        
            public List<Categoria> listar()
            {
                List<Categoria> lista = new List<Categoria>();
                Acceso_a_Datos datos = new Acceso_a_Datos();

                try
                {
                    datos.setearConsulta("select id, descripcion from Categorias");
                    datos.ejecutarLectura();

                    while (datos.Lector.Read())
                    {
                        lista.Add(new Categoria((int)datos.Lector["id"], (string)datos.Lector["descripcion"]));
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