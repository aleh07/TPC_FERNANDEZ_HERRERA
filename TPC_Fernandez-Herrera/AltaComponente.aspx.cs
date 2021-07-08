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
            if(!IsPostBack)
            {
                MarcaNegocio marcaNegocio = new MarcaNegocio();
                CategoriaNegocio categoriaNegocio = new CategoriaNegocio();

                List<Marca> ListaMarcas = marcaNegocio.listar();
                Session.Add("listaMarcas", ListaMarcas);
                ddlMarca.DataSource = ListaMarcas;
                ddlMarca.DataTextField = "Nombre";
                ddlMarca.DataValueField = "Id";
                ddlMarca.DataBind();

                List<Categoria> ListaCategoria = categoriaNegocio.listar();

                Session.Add("listaCat", ListaCategoria);

                ddlCategoria.DataSource = ListaCategoria;
                ddlCategoria.DataTextField = "Nombre";
                ddlCategoria.DataValueField = "Id";
                ddlCategoria.DataBind();
            }
            

        }
       

    protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            ComponenteNegocio negocio = new ComponenteNegocio();
            Componente aux = new Componente();
            ///para poder cargar los dropdowns hay que pasarle los objetos buscado con el find de las listas
            List<Marca> marcas = (List<Marca>) Session["listaMarcas"];
            List<Categoria> categorias = (List<Categoria>)Session["listaCat"];
           
            aux.Nombre = TxtNombre.Text;
            aux.Descripcion = TxtDescripcion.Text;
            aux.ImagenUrl = TxtImagenUrl.Text;
            aux.Cantidad = Convert.ToInt32(TxtCant.Text);
<<<<<<< HEAD
            aux.Estado = true;
            aux.marc= 1 ;
            aux.cat= 4;
=======
            aux.Estado = 1;
            aux.marca = marcas.Find(x => x.Id == int.Parse(ddlMarca.SelectedValue));
            aux.categoria = categorias.Find(x => x.Id == Convert.ToInt32(ddlCategoria.SelectedItem.Value));
            aux.Precio = decimal.Parse(TxtPrecio.Text);

>>>>>>> 35f33dd30c7e4ba24304deb229c3bd6ecd06df2f
            negocio.agregar(aux);

            Response.Redirect("GestionStock.aspx");

        }
    }
}