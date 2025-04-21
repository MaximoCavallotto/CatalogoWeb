<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="presentacion.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Esto es el home</h1>
    <div class="container">   
    <div class="row row-cols-1 row-cols-md-3 g-4">
            <asp:Repeater runat="server" ID="repArticulos">
                <ItemTemplate>
                    <div class="col">
                        <div class="card" style="width: 18rem;">
                            <img src="<%#Eval("UrlImagen")%>" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title"><%#Eval("Marca")%></h5>
                                <p class="card-text"><i><%#Eval("Modelo")%></i></p>
                                <p class="card-text"><%#Eval("Descripcion")%></p>
                                <p class="card-text">Precio: <%#Eval("PrecioFormateado")%></p>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        </div>
   
</asp:Content>
