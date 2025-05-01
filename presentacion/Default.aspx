<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="presentacion.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .contbusqueda {
            background-color: #0081A7;
            width: 100%;
        }

        a:hover {
            text-shadow: 0px 0px 5px rgba(255,255,255,0.77);
            transition: 0.1s ease-in-out;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />

    <div class="contbusqueda py-4 bg-gradient">
        <div class="container">
            <%--Barra de búsqueda rápida.--%>
            <div class="container d-flex justify-content-center gap-2 py-2">
                <asp:TextBox CssClass="form-control" Width="400px" runat="server" ID="txtboxBuscar" placeholder="Buscar" />
                <asp:Button CssClass="btn btn-light" ID="btnBuscar" Text="🔎​" OnClick="btnBuscar_Click" runat="server" />
                <asp:Button CssClass="btn btn-light" Text="​🔃​" ID="btnReset" OnClick="btnReset_Click" runat="server" />
            </div>

            <%--Filtros--%>
            <div class="container text-center">
                <div class="row">
                    <div class="col">
                        <label style="color: #DBE9EE">Marcas</label>
                        <div>
                            <asp:DropDownList OnSelectedIndexChanged="ddlMarcas_SelectedIndexChanged" AutoPostBack="true" CssClass="btn btn-secondary dropdown-toggle" ID="ddlMarcas" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col">
                        <label style="color: #DBE9EE">Categorias</label>
                        <div>
                            <asp:DropDownList OnSelectedIndexChanged="ddlCategoria_SelectedIndexChanged" AutoPostBack="true" CssClass="btn btn-secondary dropdown-toggle" ID="ddlCategoria" runat="server"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="col">
                        <div class="d-flex justify-content-between" style="margin-top: 27px; gap: 10px">
                            <asp:Button CssClass="btn btn-light btn-sm" Text="Ordenar por menor precio" ID="btnMasBarato" OnClick="btnMasBarato_Click" runat="server" />
                            <asp:Button CssClass="btn btn-light btn-sm" Text="Ordenar por mayor precio" ID="btnMasCaro" OnClick="btnMasCaro_Click" runat="server" />
                        </div>
                    </div>
                    <div class="row-cols-md-3" style="margin-top: 15px">
                        <a href="Default.aspx" style="color: #DBE9EE">Mostrar todos los artículos</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--Cards--%>
    <div class="container-fluid" style="margin-top: 20px; margin-bottom: 20px">
        <div class="row row-cols-1 row-cols-md-3 g-4" style="max-width: 100%; margin-left: 100px; margin-right: 100px">
            <asp:Repeater runat="server" ID="repArticulos">
                <ItemTemplate>
                    <div class="col">
                        <div class="card h-100 shadow" style="width: 18rem; background-color: #caf0f8">
                            <img src="<%#Eval("UrlImagen")%>" class="card-img-top" style="height: 200px; width: 100%; object-fit: contain; background-color: white; padding: 10px;"
                                onerror="this.onerror=null; this.src = 'https://www.nycourts.gov/courts/ad4/assets/Placeholder.png'" />
                            <div class="card-body">
                                <h5 class="card-title mb-0"><%#Eval("Marca")%></h5>
                                <p class="card-text mb-3"><i><%#Eval("Modelo")%></i></p>
                                <p class="card-text mb-3"><%#Eval("Descripcion")%></p>
                                <p class="card-text">Precio: $<%#Eval("PrecioFormateado")%></p>
                                <div class="d-flex justify-content-center">
                                    <asp:Button CssClass="btn btn-info" BackColor="#DBE9EE" Text="Ver Detalle" ID="btnDetalle" CommandArgument='<%#Eval("id")%>' CommandName="seleccionadoId" OnClick="btnDetalle_Click" runat="server" />
                                </div>
                                <% if (Session["usuario"] != null)
                                    {  %>
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <div class="d-flex justify-content-center" style="margin-top: 5px">
                                            <asp:Button ID="btnFavorito" OnClick="btnFavorito_Click" CommandArgument='<%#Eval("id")%>' CssClass="btn btn-outline-warning" Style="color: black" CommandName="seleccionadoId" Text="​Agregar a Favoritos​" runat="server" />
                                        </div>
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
