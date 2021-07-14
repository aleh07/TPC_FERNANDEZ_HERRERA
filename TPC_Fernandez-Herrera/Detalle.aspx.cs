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
    public partial class Detalle : System.Web.UI.Page
    {
        public string hola;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {

                int id = int.Parse(Request.QueryString["id"]);
                List<Componente> listado = (List<Componente>)Session["listarComponentes"];
                Componente seleccionado = listado.Find(x => x.ID == id);
                lblNombre.Text = seleccionado.Nombre;
                lblMarca.Text = seleccionado.marca.Nombre;
                lblDescripcion.Text = seleccionado.Descripcion;
                lblCategoria.Text = seleccionado.categoria.Nombre;
                lblPrecio.Text = Convert.ToString(seleccionado.Precio);
                imgseleccionado.Src = seleccionado.ImagenUrl;
                hola = (seleccionado.ID).ToString();

            }

            catch (Exception ex)
            {

                Session.Add("Error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
    }
}