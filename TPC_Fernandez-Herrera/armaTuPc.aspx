<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="armaTuPc.aspx.cs" Inherits="TPC_Fernandez_Herrera.armaTuPc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- arma tu pc se muestra una tanda de card que se van a separar por cada categoria 
        el orden tiene que ser 1-motherboard 2-procesador 3-coolers/ventiladores 4-ram 5-fuentes 6-placa de video 7-gabinete 8-pantalla -->

    <div class="container">
        <div class="row row-cols-1 row-cols-md-3 g-4">

            <%foreach (Dominio.Componente item in listaComponente)
                {%>

            <div class="col">

                <div class="card border-dark mb-3" style="width: 18rem; margin-top:20px">
                    <img src="<%= item.ImagenUrl %>" class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title"><%= item.Nombre %></h5>
                        <p class="card-text"><%= item.Descripcion %></p>
                        <p class="card-text"><span class="badge bg-secondary" style="font-size: 20px"><%= item.Precio %></span></p>
                        <asp:button ID="btnAgregar" class="btn btn-secondary" runat="server" OnClick="btnAgregar_Click" Text="Agregar" />
                    </div>
                </div>
            </div>
            <%} %>
        </div>

    </div>
</asp:Content>
