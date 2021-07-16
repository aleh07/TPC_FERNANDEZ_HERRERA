<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Detalle.aspx.cs" Inherits="TPC_Fernandez_Herrera.Detalle" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
      <div class="table-stock">
     
        <div class="columnas ">
            
                <div class="img">
                    <img src="srcImg" class="card-img-top" ID="imgseleccionado" runat="server" />
                </div>
                <div class="columna2 centrado">
                    <p style="font-size:2.5rem ;color:chartreuse"> <asp:Label Text="lala" ID="lblNombre" runat="server" /></p>
                    <div >
                            <p>Marca: <asp:Label Text="lala" ID="lblMarca" runat="server" /></p>
                            <p>Categoria: <asp:Label Text="lala" ID="lblCategoria" runat="server" /></p>
                            <p >Precio: $<asp:Label Text="lala" ID="lblPrecio" runat="server" /></p>
                            <p >Descripcion: <asp:Label Text="lala" ID="lblDescripcion" runat="server" /></p>
                            <a href="CarritoCompra.aspx?id=<%  = hola %>"class="btn btn-secondary">Agregar al carrito</a>
                    </div>
                    
                    
                </div>
            
        </div>
    </div>
</asp:Content>
