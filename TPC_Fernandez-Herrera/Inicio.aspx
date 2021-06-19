<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="TPC_Fernandez_Herrera.Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <%foreach (Dominio.Componente item in lista)
        {%>
    <div class="card" style="width: 18rem;">
        <img src=<%= item.ImagenUrl %> class="card-img-top" alt="...">
        <div class="card-body">
            <h5 class="card-title"><%= item.Nombre %></h5>
            <p class="card-text"><%= item.Descripcion %></p>
            <a href="#" class="btn btn-primary">Carrito</a>
        </div>
    </div>
    <%} %>
</asp:Content>

