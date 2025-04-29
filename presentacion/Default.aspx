<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="presentacion.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />
    <h1>Esto es el home</h1>
    <%--Barra de búsqueda rápida.--%>
    <div class="container">
        <asp:TextBox runat="server" ID="txtboxBuscar" />
        <asp:Button ID="btnBuscar" Text="🔎​" OnClick="btnBuscar_Click" runat="server" />
        <asp:Button Text="​🔃​" ID="btnReset" OnClick="btnReset_Click" runat="server" />
    </div>
    <%--Filtros--%>

    <div class="container text-center">
        <div class="row">
            <div class="col">
                <label>Marcas</label>
                <div>
                    <asp:DropDownList onselectedindexchanged="ddlMarcas_SelectedIndexChanged" autopostback="true" CssClass="btn btn-secondary dropdown-toggle" ID="ddlMarcas" runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="col">
                <label>Categoria</label>
                <div>
                    <asp:DropDownList OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged" AutoPostBack="true" CssClass="btn btn-secondary dropdown-toggle" ID="ddlCategoria" runat="server"></asp:DropDownList>
                </div>
            </div>
        </div>
    </div>

    <%--Cards--%>
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
                                <asp:Button Text="Ver Detalle" ID="btnDetalle" CommandArgument='<%#Eval("id")%>' CommandName="seleccionadoId" OnClick="btnDetalle_Click" runat="server" />
                                <% if (Session["usuario"] != null)
                                    {  %>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <asp:Button ID="btnFavorito" OnClick="btnFavorito_Click" CommandArgument='<%#Eval("id")%>' CommandName="seleccionadoId" Text="⭐​" runat="server" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>

                                <%} %>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

</asp:Content>
