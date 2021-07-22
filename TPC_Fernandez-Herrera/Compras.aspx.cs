using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace TPC_Fernandez_Herrera
{
    public partial class Compras : System.Web.UI.Page
    {
        Componente producto = new Componente();
        public Carrito carrito = new Carrito();
        Item item = new Item();
       
       

        protected void Page_Load(object sender, EventArgs e)
        {
            //aca intente mostrar en esto label lo que se traigo guardado en la session "usuario"
            
            Usuario usuariologuiado = new Usuario();
            usuariologuiado = (Usuario)Session["cuenta"];

            PedidoNegocio negocio = new PedidoNegocio();

            List<TiposPedidos> tipoLista = negocio.listar();
            Session.Add("listaTipos", tipoLista);
            
            LblNombre.Text = usuariologuiado.Nombre +" "+usuariologuiado.Apellido;
            LblEmail.Text = usuariologuiado.Email;
           
            try
            {
                string id = Request.QueryString["ID"];
                carrito = (Carrito)Session["carrito"];
                if (carrito == null) carrito = new Carrito();
                if (carrito.Items == null) carrito.Items = new List<Item>();

                if (!IsPostBack)
                {
                    if (id != null)
                    {
                        if (carrito.Items.Find(x => x.componente.ID.ToString() == id) == null)
                        {
                            List<Componente> listado = (List<Componente>)Session["ListarComponentes"];
                            producto = listado.Find(x => x.ID.ToString() == id);

                            item.SubTotal = producto.Precio;
                            item.componente = producto;
                            item.Cantidad = 1;
                        }
                    }
                    //Repeater
                    repetidor.DataSource = carrito.Items;
                    repetidor.DataBind();
                }
                lblTotal.Text = carrito.totalCarrito(carrito).ToString();
                Session.Add("carrito", carrito);

                GenerarCarrito();
            }
            catch (Exception ex)
            {
                throw ex;

            }


        }

        protected void GenerarCarrito()
        {
            Usuario usuariologuiado = (Usuario)Session["cuenta"];
            Carrito carrito = new Carrito();
            CarritoNegocio negocio = new CarritoNegocio();

            carrito.IdUsuario = usuariologuiado.ID;
            negocio.Agregar(carrito, 0);
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                var argument = ((Button)sender).CommandArgument;

                carrito = (Carrito)Session["carrito"];
                Item item1 = carrito.Items.Find(x => x.componente.ID.ToString() == argument);
                carrito.Items.Remove(item1);
                Session.Add("carrito", carrito);
                repetidor.DataSource = null;
                repetidor.DataSource = carrito.Items;
                repetidor.DataBind();
                lblTotal.Text = carrito.totalCarrito(carrito).ToString();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                var cantidad = lblPrueba.Text;
                if (cantidad != "")
                {
                    var argument = ((Button)sender).CommandArgument;
                    carrito = (Carrito)Session["carrito"];
                    Item item1 = carrito.Items.Find(x => x.componente.ID.ToString() == argument);
                    item1.Cantidad = int.Parse(cantidad);
                    Session.Add("carrito", carrito);
                    repetidor.DataSource = null;
                    repetidor.DataSource = carrito.Items;
                    repetidor.DataBind();
                    lblTotal.Text = carrito.totalCarrito(carrito).ToString();
                }
            }
            catch (Exception ex)
            {
                throw ex;

            }
        }

        protected void txtCantidad_TextChanged(object sender, EventArgs e)
        {
            try
            {
                var cantidad = ((TextBox)sender).Text;
                lblPrueba.Text = cantidad;
            }
            catch (Exception ex)
            {
                
                throw ex;
            }
        }

        protected void btnConfirmarCompra_Click(object sender, EventArgs e)
        {
            ComponenteNegocio componenteNegocio = new ComponenteNegocio();
            CarritoNegocio carritoNegocio = new CarritoNegocio();
            ItemNegocio itemNegocio = new ItemNegocio();
            Carrito CarritoSession = (Carrito) Session["carrito"];
            List<Carrito> listaCarritos = carritoNegocio.ListaCarritos();
            Usuario usuario = (Usuario)Session["Cuenta"];
            Carrito carrito = listaCarritos.Find(x => x.IdUsuario == usuario.ID);
            List<Componente> listado = (List<Componente>)Session["ListarComponentes"];
            


            foreach (Item item in CarritoSession.Items)
            { 
                    item.IdCarrito = carrito.Id;
                    itemNegocio.Agregar(item);
                    decimal Total =+ item.SubTotal * item.Cantidad;
                
                    Componente producto = listado.Find(x => x.ID == item.componente.ID);
                    int cantidad = producto.Cantidad - item.Cantidad;
                    
                    componenteNegocio.ActualizarStock(item.componente.ID, cantidad);
                    
                carritoNegocio.Total(carrito.Id,Total);    
            }


            PedidoNegocio negocio = new PedidoNegocio();
            List<TiposPedidos> listaTipos = (List<TiposPedidos>)Session["listaTipos"];

            //aca agrego la direccion y un telefono es es opcional por que son campos null en la DB y genero  un pedido ahi si con todos los datos necesarios
            //desorrolar la funcion en negocio que inserte en la  DB un pedido
            Pedidos pedido = new Pedidos();
            pedido.usuario = usuario;
            pedido.direccion = TxtDireccion.Text;
            pedido.Telefono = Convert.ToInt32(TxtTelefono.Text);
            //cargar en la DB los tipos de pedidos
            pedido.Tipos = listaTipos.Find(x => x.Id == 1);

            pedido.carrito = carrito;

            negocio.agregar(pedido);
            //mandar mensaje de alta exitosa 
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Pedido Realizado');window.location ='Inicio.aspx';", true);

        }
    }
}