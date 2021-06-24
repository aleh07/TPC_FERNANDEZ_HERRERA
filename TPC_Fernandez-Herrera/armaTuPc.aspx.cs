using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace TPC_Fernandez_Herrera
{
    public partial class armaTuPc : System.Web.UI.Page
    {
        public List<Componente> listaComponente ;
        List<Componente> listaArmado;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (listaArmado == null)
                {
                    cargarCatalogo();
                    listaComponente = (List<Componente>)Session["ListaComponente"];
                    Session.Add("armadoPc", listaArmado);
                }
                else
                {

                }
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        public void cargarCatalogo()
        {
            
            List<Componente> listaComponentes = (List<Componente>)Session["ListarComponentes"];
            
            if (listaArmado == null)
            {
                listaComponente = listaComponentes.FindAll(x => x.categoria.Nombre.Contains("Procesadores"));
                Session.Add("listaComponente", listaComponente);
                
            }
            else if(listaArmado.Count == 1){
                listaComponente = listaComponentes.FindAll(x => x.categoria.Nombre.ToUpper().Contains("cartucho"));
                Session.Add("listaComponente", listaComponente);
            }

        }


        protected void btnAgregar_Click(object sender, EventArgs e)
        {

        }
    }
}