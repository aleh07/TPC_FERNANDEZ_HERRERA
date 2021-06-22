<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="TPC_Fernandez_Herrera.Inicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div class="cover d-flex justify-content-center align-items-center flex-column ">
        <h1>
          Compu Solution
        </h1>
        <p>
          Todo lo que necesitas esta aca
        </p>
     
          <a class="btn btn-dark" href="NuestraEmpresa.aspx" runat="server">Conoce mas</a>
        
      </div>
    <div class="container" style="margin-top:20px">  
    <%foreach (Dominio.Componente item in lista)
        {%>
    <div class="card border-dark mb-3" style="width: 18rem;">
        <img src=<%= item.ImagenUrl %> class="card-img-top" alt="...">
        <div class="card-body">
            <h5 class="card-title"><%= item.Nombre %></h5>
            <p class="card-text"><%= item.Descripcion %></p>
            <p class="card-text"> <span class="badge bg-secondary" style="font-size:20px"><%= item.Precio %></span></p>
            <a href="#" class="btn btn-secondary" >Carrito</a>
            <a href="#" class="btn btn-secondary" >Favoritos</a>
        </div>
    </div>
    <%} %>

    </div>
</asp:Content>
