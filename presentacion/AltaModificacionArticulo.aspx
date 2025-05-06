<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="AltaModificacionArticulo.aspx.cs" Inherits="presentacion.AltaModificacionArticulo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .validator {
            color: red;
            font-style: italic;
            font-size: 13px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager runat="server" />

    <div class="container py-2" style="width: 85%">
        <div class="row">
            <div class="col-12 d-flex justify-content-center gap-5 py-2" style="margin-top: 50px">
                <div class="mb-3">
                    <label for="ddlMarca" class="form-label">Marca: </label>
                    <asp:DropDownList ID="ddlMarca" CssClass="btn btn-outline-dark dropdown-toggle" runat="server"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="ddlCategoria" class="form-label">Categoria: </label>
                    <asp:DropDownList ID="ddlCategoria" CssClass="btn btn-outline-dark dropdown-toggle" runat="server"></asp:DropDownList>
                    <div class="mb-3">
                    </div>
                </div>
            </div>
        </div>
        <div class="container py-2" style="width: 85%">
            <div class="row">
                <div class="col-6">
                    <div class="mb-3">
                        <label for="txtboxModelo" class="form-label">Modelo: </label>
                        <asp:TextBox ID="txtboxModelo" CssClass="form-control" runat="server" />
                        <asp:RequiredFieldValidator ErrorMessage="Debes ingresar el modelo del producto." CssClass="validator" ControlToValidate="txtboxModelo" runat="server" />
                    </div>
                    <div class="mb-3">
                        <label for="txtboxCodigo" class="form-label">Código: </label>
                        <asp:TextBox ID="txtboxCodigo" CssClass="form-control" runat="server" />
                        <asp:RequiredFieldValidator ErrorMessage="Debes ingresar el código del producto." CssClass="validator" ControlToValidate="txtboxCodigo" runat="server" />
                    </div>
                    <div class="mb-3">
                        <label for="txtboxDescripcion" class="form-label">Descripción: </label>
                        <asp:TextBox ID="txtboxDescripcion" CssClass="form-control" runat="server" />
                        <asp:RequiredFieldValidator ErrorMessage="Debes ingresar una descripción para el producto" CssClass="validator" ControlToValidate="txtboxDescripcion" runat="server" />
                    </div>
                    <div class="mb-3">
                        <label for="txtboxPrecio" class="form-label">Precio: </label>
                        <asp:TextBox ID="txtboxPrecio" CssClass="form-control" runat="server" />
                        <asp:RequiredFieldValidator ErrorMessage="Debes ingresar el precio del producto" CssClass="validator" ControlToValidate="txtboxPrecio" runat="server" />
                        <asp:RegularExpressionValidator ValidationExpression="^[0-9]+$" CssClass="validator" ErrorMessage="Ingrese solo números enteros." ControlToValidate="txtboxPrecio" runat="server" />
                    </div>

                </div>

                <div class="col-6">
                    <div class="mb-3">
                        <label for="urlImagenProducto" class="form-label">Url imagen: </label>
                        <asp:TextBox ID="txtboxUrlImagenProducto" AutoPostBack="true" OnTextChanged="txtboxUrlImagenProducto_TextChanged" CssClass="form-control" runat="server" />
                        <div class="mb-3 d-flex align-items-center" style="margin-top: 40px; max-height: 200px">
                            <asp:Image ID="imgArticulo"
                                CssClass=" img-fluid mb-3" Style="max-width: 200px; max-height: 200px; margin: 0 auto; display: block"
                                ImageUrl="https://i0.wp.com/port2flavors.com/wp-content/uploads/2022/07/placeholder-614.png?w=1200&ssl=1"
                                runat="server" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container py-2" style="width: 85%">
            <div class="row">
                <div class="mb-3 d-flex align-items-center justify-content-center gap-2">
                    <div class="col-6 d-flex justify-content-center align-items-center gap-2">
                        <asp:Button Text="Aceptar" OnClick="btnAceptar_Click" CssClass="btn btn-primary" ID="btnAceptar" runat="server" />
                        <a href="Administracion.aspx">Cancelar</a>
                    </div>

                    <div class="col-6 d-flex justify-content-center align-items-center gap-2">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:Button CssClass="btn btn-warning" Visible="false" OnClick="btneliminar_Click" Text="Eliminar" ID="btneliminar" runat="server" />
                                <% if (banEliminar)
                                    { %>
                                <asp:CheckBox Text="Confirmar eliminacíon" ID="chboxEliminar" runat="server" />
                                <asp:Button CssClass="btn btn-danger" Text="Eliminar" ID="btnConfirmarEliminacion" OnClick="btnConfirmarEliminacion_Click" runat="server" />
                                <%  }
                                %>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
