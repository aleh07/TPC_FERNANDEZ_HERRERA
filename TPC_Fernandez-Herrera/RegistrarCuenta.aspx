<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RegistrarCuenta.aspx.cs" Inherits="TPC_Fernandez_Herrera.Loggin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <body class="body-register">
  <section class="form-register">

    <h4 id="Titulo">Formulario Registro</h4>
      <asp:TextBox ID="TxtNombre" class="controls" type="text" placeholder="Ingrese su Nombre"  aria-label="Ingrese Nombre" runat="server"></asp:TextBox>
      <asp:TextBox ID="TxtApellido" class="controls" type="text" placeholder="Ingrese su Apellido" aria-label="Ingrese Nombre" runat="server"></asp:TextBox>
      <asp:TextBox ID="TxtEmail" class="controls" type="email"  placeholder="Ingrese su Email" aria-label="Ingrese Nombre" runat="server"></asp:TextBox>
      <asp:TextBox ID="TxtPass" class="controls" MaxLength="8" type="password" placeholder="Ingrese su Contraseña 8 caracteres max" aria-label="Ingrese Nombre" runat="server"></asp:TextBox>

    <asp:Button ID="BtnAgregar" Text="Registrar" onclick="BtnAgregar_Click" runat="server" CssClass="botons" type="submit"/>

    <p><a href="Login.aspx">¿Ya tengo Cuenta?</a></p>
  </section>

</body>

</asp:Content>
