<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AltaComponente.aspx.cs" Inherits="TPC_Fernandez_Herrera.AltaComponente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <h3>Nombre</h3>
        <asp:TextBox ID="TxtNombre" class="form-control" type="text" placeholder="Ingrese Nombre" aria-label="Ingrese Nombre" runat="server"></asp:TextBox>
        <h3>Descripcion</h3>
        <asp:TextBox ID="TxtDescripcion" class="form-control" type="text" placeholder="Default input" aria-label=" Ingrese Descripcion " runat="server"></asp:TextBox>
        <h3>Precio</h3>
        <asp:TextBox ID="Precio" class="form-control" type="text" placeholder="Default input" aria-label="Ingrese Precio" runat="server"></asp:TextBox>
        <h3>ImagenUrl</h3>
        <asp:TextBox ID="TxtImagenUrl" class="form-control" type="text" placeholder="Default input" aria-label="Ingrese UrlImagen" runat="server"></asp:TextBox>
        <h3>Marca</h3>
        <asp:DropDownList runat="server" ID="ddlMarca" CssClass="form-control-sm"></asp:DropDownList>

        <h3>Categoria</h3>
        
        <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="form-control-sm"></asp:DropDownList>

        <asp:Button ID="BtnAgregar" Text="Agregar" OnClick="BtnAgregar_Click" runat="server" CssClass="btn btn-secondary" />
    </div>


</asp:Content>
