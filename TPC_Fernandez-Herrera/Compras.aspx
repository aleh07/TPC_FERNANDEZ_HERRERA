<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Compras.aspx.cs" Inherits="TPC_Fernandez_Herrera.Compras" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%/*aca pongo lo que me traje el en la session "listausuario" y en la session"carrito"%>
   <p>  <asp:Label ID="lblNombreUsuario" runat="server" /> </p>
     <p>  <asp:Label ID="LblNombre" runat="server" /> </p>
     <p>  <asp:Label ID="LblApellido" runat="server" /> </p>
     
</asp:Content>
