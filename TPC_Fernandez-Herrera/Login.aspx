<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPC_Fernandez_Herrera.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <body class="body-register">
  <section class="form-register">
    <h4>Ingrese su Cuenta</h4> 
    <asp:TextBox ID="TxtEmail" class="controls" type="Mail" placeholder="Ingrese su Email" aria-label="Ingrese Nombre" runat="server"></asp:TextBox>
    <asp:TextBox ID="TxtPass" class="controls" type="password" placeholder="Ingrese su Contraseña" aria-label="Ingrese Nombre" runat="server"></asp:TextBox>
     <asp:Button ID="BtnAgregar" Text="ENTRAR" onclick="BtnAgregar_Click" runat="server" CssClass="botons" />
    <p><a href="RegistrarCuenta.aspx">Registrarme</a></p>
 
  </section>

</body>

</asp:Content>

