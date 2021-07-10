<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="TPC_Fernandez_Herrera.Registrarse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h3>Usuario</h3>
        <asp:TextBox ID="TxtUsuario" class="form-control" type="text" placeholder="Ingrese su usuario" aria-label="Ingrese Nombre" runat="server"></asp:TextBox>
        <h3>Contraseña</h3>
        <asp:TextBox ID="TxtContraseña" class="form-control" type="text" placeholder="Ingrese su contraseña" aria-label=" Ingrese Descripcion " runat="server"></asp:TextBox>
        <h3>Nombre</h3>
        <asp:TextBox ID="TxtNombre" class="form-control" type="text" placeholder="Ingrese su nombre" aria-label="Ingrese Precio" runat="server"></asp:TextBox>
        <h3>Apellido</h3>
        <asp:TextBox ID="TxtApellido" class="form-control" type="text" placeholder="Ingrese su Apellido" aria-label="Ingrese UrlImagen" runat="server"></asp:TextBox>
       <h3>FechaNacimiento</h3>
        <asp:TextBox ID="TxtFechaNac" class="form-control" type="text" placeholder="Ingrese su Fecha Nacimiento" aria-label="Ingrese Precio" runat="server"></asp:TextBox>
        <h3>Dni</h3>
        <asp:TextBox ID="TxtDni" class="form-control" type="text" placeholder="Ingrese su Dni" aria-label="Ingrese UrlImagen" runat="server"></asp:TextBox>
        <h3>Domicilio</h3>
        <asp:TextBox ID="TxtDomicilio" class="form-control" type="text" placeholder="Ingrese su Domiclio" aria-label="Ingrese UrlImagen" runat="server"></asp:TextBox>
       <h3>Telefono</h3>
        <asp:TextBox ID="Txtelefono" class="form-control" type="text" placeholder="Ingrese su tel" aria-label="Ingrese UrlImagen" runat="server"></asp:TextBox>
        <h3>Email</h3>
        <asp:TextBox ID="Txtemail" class="form-control" type="text" placeholder="Ingrese su Email" aria-label="Ingrese UrlImagen" runat="server"></asp:TextBox>
       

        <asp:Button ID="BtnAgregar" Text="Agregar" onclick="BtnAgregar_Click" runat="server" CssClass="btn btn-secondary" />
    </div>
</asp:Content>
