<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AltaModificacionArticulo.aspx.cs" Inherits="presentacion.AltaModificacionArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />
    <h1>Formulario de alta o modificacion</h1>
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <label for="ddlMarca" class="form-label">Marca: </label>
                <asp:DropDownList ID="ddlMarca" CssClass="btn btn-outline-dark dropdown-toggle" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <label for="ddlCategoria" class="form-label">Categoria: </label>
                <asp:DropDownList ID="ddlCategoria" CssClass="btn btn-outline-dark dropdown-toggle" runat="server"></asp:DropDownList>
            </div>
            <div class="mb-3">
                <label for="txtboxModelo" class="form-label">Modelo: </label>
                <asp:TextBox ID="txtboxModelo" CssClass="form-control" runat="server" />
            </div>
            <div class="mb-3">
                <label for="txtboxCodigo" class="form-label">Código: </label>
                <asp:TextBox ID="txtboxCodigo" CssClass="form-control" runat="server" />
            </div>
            <div class="mb-3">
                <label for="txtboxDescripcion" class="form-label">Descripción: </label>
                <asp:TextBox ID="txtboxDescripcion" CssClass="form-control" runat="server" />
            </div>

            <div class="mb-3">
                <label for="txtboxPrecio" class="form-label">Precio: </label>
                <asp:TextBox ID="txtboxPrecio" CssClass="form-control" runat="server" />
            </div>
            <div class="mb-3">
                <asp:Button Text="Aceptar" OnClick="btnAceptar_Click" CssClass="btn btn-primary" ID="btnAceptar" runat="server" />
                <a href="Default.aspx">Cancelar</a>
            </div>
        </div>
        <div class="col-6">
            <div class="mb-3">
                <label for="urlImagenProducto" class="form-label">Url imagen: </label>
                <asp:TextBox ID="txtboxUrlImagenProducto" AutoPostBack="true" OnTextChanged="txtboxUrlImagenProducto_TextChanged" CssClass="form-control" runat="server" />
                <asp:Image ID="imgArticulo" Width="400px"
                    ImageUrl="https://i0.wp.com/port2flavors.com/wp-content/uploads/2022/07/placeholder-614.png?w=1200&ssl=1"
                    runat="server" CssClass="img-fluid mb-3" />
            </div>
            <div class="mb-3">
                <asp:Button CssClass="btn btn-danger" visible="false" OnClick="btneliminar_Click" Text="Eliminar" ID="btneliminar" runat="server" />
            </div>
            <asp:UpdatePanel runat="server">
                <ContentTemplate>
                    <% if (banEliminar)
                        { %>
                    <div class="mb-3">
                        <asp:CheckBox Text="Confirmar eliminacíon" ID="chboxEliminar" runat="server" />
                        <asp:Button Text="Eliminar" ID="btnConfirmarEliminacion" OnClick="btnConfirmarEliminacion_Click" runat="server" />
                    </div>

                    <%  }
                    %>
                </ContentTemplate>
            </asp:UpdatePanel>


        </div>
    </div>
</asp:Content>
