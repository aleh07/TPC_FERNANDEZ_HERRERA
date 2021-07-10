<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="TPC_Fernandez_Herrera.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <body class="body-register">
  <section class="form-register">
    <h4>Ingrese su Cuenta</h4> 
    <input class="controls" type="email" name="correo" id="correo" placeholder="Ingrese su Correo">
    <input class="controls" type="password" name="password" id="password" placeholder="Ingrese su Contraseña">
      
    <p><a class="botons" href="Compras.aspx">ENTRAR</a></p>
     
    <p><a href="RegistrarCuenta.aspx">Registrarme</a></p>
 
  </section>

</body>

</asp:Content>

