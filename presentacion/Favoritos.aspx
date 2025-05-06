<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" EnableEventValidation="false" Inherits="presentacion.Favoritos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Header--%>
    <div class="d-flex justify-content-center gap-2 py-4 bg-gradient" style="background-color: #0081A7">
        <h1 style="color: #DBE9EE; font-family: 'Bookman Old Style'; text-shadow: 2px 2px 5px rgba(0,0,0,0.6);">Mis Favoritos</h1>
    </div>
    <%--Sin favoritos--%>
    <%if (articulosFavoritos == null || articulosFavoritos.Count == 0)
        { %>
    <div class="d-flex justify-content-center gap-2 py-2">
        <h3>Parece que aún no tienes ningun favorito...</h3>

    </div>
    <div class="d-flex justify-content-center">
        <p>Agregá tus artículos favoritos para tenerlos reunidos acá.</p>
    </div>
    <div class="d-flex justify-content-center">
        <asp:Image ImageUrl="~/Images/FavoritosVacio.png"
            Style="width: 200px"
            runat="server" />
    </div>
    <% } %>


    <%--Cards--%>
    <div class="container-fluid" style="margin-top: 20px; margin-bottom: 20px">
        <div class="row row-cols-1 row-cols-md-3 g-4 justify-content-center" style="max-width: 100%; margin-left: 100px; margin-right: 100px">
            <asp:Repeater runat="server" ID="repArticulos">
                <ItemTemplate>
                    <div class="col">
                        <div class="card h-100 shadow" style="width: 18rem; background-color: #caf0f8">
                            <img src="<%#Eval("UrlImagen")%>" class="card-img-top" style="height: 200px; width: 100%; object-fit: contain; background-color: white; padding: 10px;"
                                onerror="this.onerror=null; this.src = 'https://www.nycourts.gov/courts/ad4/assets/Placeholder.png'" />
                            <div class="card-body">
                                <h5 class="card-title"><%#Eval("Marca")%></h5>
                                <p class="card-text"><i><%#Eval("Modelo")%></i></p>
                                <p class="card-text"><%#Eval("Descripcion")%></p>
                                <p class="card-text">Precio: $<%#Eval("PrecioFormateado")%></p>
                                <div class="d-flex justify-content-center gap-2 py-2">
                                    <asp:Button CssClass="btn btn-info" BackColor="#DBE9EE" Text="Ver Detalle" ID="btnDetalle" OnClick="btnDetalle_Click" CommandArgument='<%#Eval("id")%>' CommandName="seleccionadoId"  runat="server" />
                                </div>
                                <div class="d-flex justify-content-center">
                                    <asp:Button CssClass="btn btn-info" BackColor="#DBE9EE" Text="Quitar de favoritos" ID="btnEliminarFav" CommandArgument='<%#Eval("IdFavorito")%>' CommandName="favSeleccionadoId" OnClick="btnEliminarFav_Click" runat="server" />
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
