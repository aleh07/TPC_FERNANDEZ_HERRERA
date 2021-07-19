﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AltaComponente.aspx.cs" Inherits="TPC_Fernandez_Herrera.AltaComponente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <body class="body-register">
  <section class="form-register">
        <h4>Formulario </h4>
        <h3> *</h3>
        <asp:TextBox ID="TxtNombre" class="form-control" type="text" placeholder="Ingrese Nombre" aria-label="Ingrese Nombre" runat="server"></asp:TextBox>
        <h3> *</h3>
        <asp:TextBox ID="TxtDescripcion" class="form-control" type="text" placeholder="Ingrese Descripcion" aria-label=" Ingrese Descripcion " runat="server"></asp:TextBox>
        <h3>*</h3>
        <asp:TextBox ID="TxtPrecio" MaxLength="7" class="form-control" type="text" placeholder="Ingrese Precio" aria-label="Ingrese Precio" runat="server"></asp:TextBox>
        <h3>*</h3>
        <asp:TextBox ID="TxtImagenUrl" class="form-control" type="text" placeholder="Ingrese Url Imagen" aria-label="Ingrese UrlImagen" runat="server"></asp:TextBox>
        <h3> *</h3>
        <asp:TextBox ID="TxtCant" MaxLength="5"  class="form-control" type="text" placeholder="Ingrese Cantidad" aria-label="Ingrese UrlImagen" runat="server"></asp:TextBox>
        
      <h5> Campos Obligatorios(*)</h5>  
      <h3>Marca</h3>
        <asp:DropDownList runat="server" ID="ddlMarca" CssClass="form-control-sm"></asp:DropDownList>

        <h3>Categoria</h3>
        
        <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="form-control-sm"></asp:DropDownList>
        <br />
        <asp:Button ID="BtnAgregar" Text="Agregar" OnClick="BtnAgregar_Click" runat="server" CssClass="btn btn-secondary" />
 </section>
         </body>
</asp:Content>
