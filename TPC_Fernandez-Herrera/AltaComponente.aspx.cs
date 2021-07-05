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
            ddlMarca.DataTextField= "Nombre";
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
            //int idmarca = Convert.ToInt32(ddlMarca.SelectedItem.Value);
            //int idcategoria = Convert.ToInt32(ddlCategoria.SelectedItem.Value);
            aux.Nombre = TxtNombre.Text;
            aux.Descripcion = TxtDescripcion.Text;
            aux.ImagenUrl = TxtImagenUrl.Text;
            aux.Cantidad = Convert.ToInt32(TxtCant.Text);
            aux.Estado = 1;
            aux.marc= 1 ;
            aux.cat= 4;
            negocio.agregar(aux);
            Response.Redirect("GestionStock.aspx");

        }
    }
}