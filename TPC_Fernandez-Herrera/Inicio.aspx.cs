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
    public partial class Inicio : System.Web.UI.Page
    {
        public List<Componente> listaComponentes { get; set; }
       
        protected void Page_Load(object sender, EventArgs e)
        {
            ComponenteNegocio negocio = new ComponenteNegocio();
            try
            {
                if (Session["listarbuscados"] == null)
                {
                    listaComponentes = negocio.Listar();
                    Session.Add("ListarComponentes", listaComponentes);
                }
                else
                {
                    listaComponentes = (List<Componente>)Session["listabuscados"];
                    Session["listabuscados"] = null;
                }

            }
            catch (Exception)
            {

                throw;
            }
            
        }

     
        
        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            List<Componente> ListaBuscados = new List<Componente>();
            if (Session["listabuscados"] == null)
            {
                Session.Add("listabuscados",ListaBuscados);
            }
            ListaBuscados = (List<Componente>) Session["ListarComponentes"];
            Session["listabuscados"] = ListaBuscados.FindAll(c => c.Nombre.ToUpper().Contains(TxtBuscar.Text.ToUpper()));
            Session["ListarComponentes"] = Session["listabuscados"];
            Response.Redirect("Inicio.aspx");
          
        }
    }
}