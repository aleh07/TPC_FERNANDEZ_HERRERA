<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AltaComponente.aspx.cs" Inherits="TPC_Fernandez_Herrera.AltaComponente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- no puedo hacer que ande el script -->
    <script type="text/javascript">

        function Validar() {
            var nombre = document.getElementById("TxtNombre").value;
            var descripcion = document.getElementById("TxtDescripcion").value;
            var precio = document.getElementById("TxtPrecio").value;
            var cantidad = document.getElementById("TxtCantidad").value;
            let ok = true;

            if (nombre === "") {
               alert("completar campos")
               
                ok = false;
            } else { ok = true; document.getElementById("TxtNombre").className += " valid-feedback" }

            return ok;
        }
    </script>

    <div class="container">
        <h3>Nombre</h3>
        <asp:TextBox ID="TxtNombre" class="form-control" type="text" placeholder="Ingrese Nombre" ClientIDMode="Static" aria-label="Ingrese Nombre" runat="server"></asp:TextBox>
        <h3>Descripcion</h3>
        <asp:TextBox ID="TxtDescripcion" class="form-control" type="text" placeholder="Ingrese Descripcion" aria-label=" Ingrese Descripcion " runat="server"></asp:TextBox>
        <h3>Precio</h3>
        <asp:TextBox ID="TxtPrecio" class="form-control" type="text" placeholder="Ingrese Precio" aria-label="Ingrese Precio" runat="server"></asp:TextBox>
        <h3>ImagenUrl</h3>
        <asp:TextBox ID="TxtImagenUrl" class="form-control" type="text" placeholder="Ingrese UrlImagen" aria-label="Ingrese UrlImagen" runat="server"></asp:TextBox>

        <h3>Cantidad</h3>
        <asp:TextBox ID="TxtCant" class="form-control" type="text" placeholder="Ingrese Cantidad" aria-label="Ingrese UrlImagen" runat="server"></asp:TextBox>

        <h3>Marca</h3>
        <asp:DropDownList runat="server" ID="ddlMarca" CssClass="form-control-xl"></asp:DropDownList>

        <h3>Categoria</h3>
        <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="form-control-xl"></asp:DropDownList>

        <asp:Button ID="BtnAgregar" Text="Agregar" OnClientClick="return Validar()" OnClick="BtnAgregar_Click" runat="server" Class="btn btn-secondary " />
    </div>
</asp:Content>
