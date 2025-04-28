<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" Inherits="presentacion.Favoritos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Favoritos</h1>
    <div class="container" style="max-width: 80%">
        <div class="row row-cols-1 row-cols-md-3 g-4">
            <asp:Repeater runat="server" ID="repArticulos">
                <ItemTemplate>
                    <div class="col">
                        <div class="card h-100" style="width: 18rem;">
                            <img src="<%#Eval("UrlImagen")%>" class="card-img-top" style="max-width: 300px; max-height: 300px; margin: 0 auto; display: block"
                                onerror="this.onerror=null; this.src = 'https://www.nycourts.gov/courts/ad4/assets/Placeholder.png'" />
                            <div class="card-body">
                                <h5 class="card-title"><%#Eval("Marca")%></h5>
                                <p class="card-text"><i><%#Eval("Modelo")%></i></p>
                                <p class="card-text"><%#Eval("Descripcion")%></p>
                                <p class="card-text">Precio: $<%#Eval("PrecioFormateado")%></p>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
