<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="armaTuPc.aspx.cs" Inherits="TPC_Fernandez_Herrera.armaTuPc" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- arma tu pc se muestra una tanda de card que se van a separar por cada categoria 
        el orden tiene que ser 1-motherboard 2-procesador 3-coolers/ventiladores 4-ram 5-fuentes 6-placa de video 7-gabinete 8-pantalla -->

    <div class="container">
        <div class="row row-cols-1 row-cols-md-3 g-4">

            <asp:Repeater runat="server" ID="repetidor">
                <ItemTemplate>

                    <div class="col">
                        <div class="card border-dark mb-3" style="width: 18rem; margin-top: 20px">
                            <img src="<%#Eval("ImagenUrl")%>" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title"><%#Eval("Nombre")%></h5>
                                <p class="card-text"><%#Eval("Descripcion")%></p>
                                <p class="card-text"><span class="badge bg-secondary" style="font-size: 20px"><%#Eval("Precio")%></span></p>
                                <asp:Button CssClass="btn btn-secondary" Text="Agregar" ID="btnAgregar" OnClick="btnAgregar_Click" AutoPostBack="true" CommandArgument='<%#Eval("ID")%>' runat="server" />
                            </div>
                        </div>
                    </div>

                </ItemTemplate>
            </asp:Repeater>
        </div>

    </div>
</asp:Content>
