using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;

namespace TPC_Fernandez_Herrera
{
    public partial class GestionStock : System.Web.UI.Page
    {
        public List<Componente> listaComponentes;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    listaComponentes = (List<Componente>)Session["ListarComponentes"];

                }
                repetidor.DataSource = listaComponentes;
                repetidor.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
            
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {

        }

        protected void txtCantidad_TextChanged(object sender, EventArgs e)
        {

        }

        protected void btnModificar_Click1(object sender, EventArgs e)
        {

        }
    }
}