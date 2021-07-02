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
    public partial class AltaComponente : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            MarcaNegocio marcaNegocio = new MarcaNegocio();
            CategoriaNegocio categoriaNegocio = new CategoriaNegocio();

            List<Marca> ListaMarcas = marcaNegocio.listar();
            ddlMarca.DataSource = ListaMarcas;
            ddlMarca.DataTextField = "Nombre";
            ddlMarca.DataValueField = "Id";
            ddlMarca.DataBind();

            List<Categoria> ListaCategoria = categoriaNegocio.listar();
            ddlCategoria.DataSource = ListaCategoria;
            ddlCategoria.DataTextField = "Nombre";
            ddlCategoria.DataValueField = "Id";
            ddlCategoria.DataBind();

        }
       

    protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            ComponenteNegocio negocio = new ComponenteNegocio();

             Componente aux = new Componente();

            aux.Nombre = TxtNombre.Text;
            aux.Descripcion = TxtDescripcion.Text;
            aux.ImagenUrl = TxtImagenUrl.Text;
            aux.marca.Id = Convert.ToInt32(ddlMarca.SelectedValue);
            aux.categoria.Id = Convert.ToInt32(ddlCategoria.SelectedItem.Value);

            negocio.agregar(aux);
            Response.Redirect("GestionStock.aspx");

        }
    }
}