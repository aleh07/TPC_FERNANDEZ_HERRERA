using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;

namespace TPC_Fernandez_Herrera
{
    public partial class Carrito : System.Web.UI.Page
    {


        //Componente producto = new Componente();
        //public Carrito carrito = new Carrito();
        //Item item = new Item();
        //decimal total;

        protected void Page_Load(object sender, EventArgs e)
        {
        //    try
        //    {
        //    //    string id = Request.QueryString["ID"];
        //    //    carrito = (Carrito)Session["carrito"];
        //    //    if (carrito == null) carrito = new Carrito();
        //    //    //carrito.Items = (List<ItemCarrito>)Session["carrito"];
        //    //    if (carrito.Items == null) carrito.Items = new List<Item>();

        //    //    if (!IsPostBack)
        //    //    {
        //    //        if (id != null)
        //    //        {
        //    //            if (carrito.Items.Find(x => x.Producto.Id.ToString() == id) == null)
        //    //            {
        //    //                List<Componente> listado = (List<Componente>)Session["ListarComponentes"];
        //    //                producto = listado.Find(x => x.ID.ToString() == id);

        //    //                item.SubTotal = producto.Precio;
        //    //                item.componente = producto;
        //    //                item.Cantidad = 1;
        //    //                carrito.FechaCarrito = DateTime.Today;
        //    //                //itemCarritos.Items = (List<ItemCarrito>)Session["carrito"];
        //    //                carrito.Items.Add(item);

        //    //            }
        //    //        }
        //    //        //Repeater
        //    //        repetidor.DataSource = carrito.Items;
        //    //        repetidor.DataBind();
        //    //    }
        //    //    lblTotal.Text = carrito.totalCarrito(carrito).ToString();
        //    //    Session.Add("carrito", carrito);
        //    //}
        //    //catch (Exception ex)
        //    //{

        //    //    Session.Add("Error", ex.ToString());
        //    //    Response.Redirect("Error.aspx");
        //    //}



       }
    }
}