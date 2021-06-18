using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace TPC_Fernadez_Herrera.Negocio
{
    public class Acceso_a_Datos
    {

      
            private SqlConnection conexion;
            private SqlCommand comando;
            private SqlDataReader lector;

            public Acceso_a_Datos()
            {
                conexion = new SqlConnection("data source=.\\SQLEXPRESS; initial catalog=Fernandez_Herrera_DB; integrated security=sspi");
                comando = new SqlCommand();
            }

            public void setearConsulta(string consulta)
            {
                comando.CommandType = System.Data.CommandType.Text;
                comando.CommandText = consulta;
            }

            public void ejecutarLectura()
            {
                comando.Connection = conexion;
                conexion.Open();
                lector = comando.ExecuteReader();
            }
            public void setearParametro(string nombre, object valor)
            {
                comando.Parameters.AddWithValue(nombre, valor);
            }

            public void cerrarConexion()
            {
                if (lector != null)
                    lector.Close();
                conexion.Close();
            }

            public SqlDataReader Lector
            {
                get { return lector; }
            }

            internal void ejectutarAccion()
            {
                comando.Connection = conexion;
                conexion.Open();
                comando.ExecuteNonQuery();
            }
        
    }
}