<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Administracion.aspx.cs" Inherits="presentacion.Administracion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-center align-items-center" style="margin-top: 20px">

        <%--Filtro Rapido--%>
        <div class="row w-100 justify-content-center align-items-center">
            <div class="col-6">
                <div class="mb-3 justify-content-center d-flex align-items-center gap-2">
                    <asp:TextBox ID="txtboxFiltroRapido" AutoPostBack="true" OnTextChanged="txtboxFiltroRapido_TextChanged" placeHolder="Buscá por marca o modelo" CssClass="form-control" runat="server" Style="width: 400px" />
                    <asp:Button ID="btnLimpiarFiltro" Text="Limpiar" CssClass="btn btn-outline-success btn-sm" UseSubmitBehavior="false" OnClick="btnLimpiarFiltro_Click" runat="server" />
                </div>
                <%--Filtro Avanzado--%>
                <div class="mb-3">
                    <asp:CheckBox ID="chboxFiltroAvanzado" AutoPostBack="true" Text="Filtro Avanzado" OnCheckedChanged="chboxFiltroAvanzado_CheckedChanged" runat="server" />
                </div>
                <% if (chboxFiltroAvanzado.Checked)
                    {  %>
                <div class="mb-3 d-flex justify-content-center align-items-center gap-2">
                    <label for="ddlCampo">Campo: </label>
                    <asp:DropDownList OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged" Style="border-radius: 5px" AutoPostBack="true" ID="ddlCampo" runat="server">
                        <asp:ListItem Text="Marca" />
                        <asp:ListItem Text="Descripción" />
                        <asp:ListItem Text="Precio" />
                    </asp:DropDownList>
                    <label for="ddlCriterio">Criterio: </label>
                    <asp:DropDownList ID="ddlCriterio" Style="border-radius: 5px" runat="server">
                        <asp:ListItem Text="Comienza con" />
                        <asp:ListItem Text="Termina con" />
                        <asp:ListItem Text="Contiene" />
                    </asp:DropDownList>
                    <label for="txtboxFiltro">Filtro:</label>
                    <asp:TextBox CssClass="form-control" Style="width: 200px" ID="txtboxFiltro" runat="server" />
                    <asp:Button CssClass="btn btn-outline-success btn-sm" ID="btnBuscarFiltroAvanzado" OnClick="btnBuscarFiltroAvanzado_Click" Text="Buscar" runat="server" />
                    <asp:Button CssClass="btn btn-outline-success btn-sm" Text="🗑️​" ID="btnBorrarFiltro" OnClick="btnBorrarFiltro_Click" runat="server" />
                </div>
                <% }%>
                <%--Data Grid--%>
                <asp:GridView ID="dgvArticulos" OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged" DataKeyNames="Id" AutoGenerateColumns="false" runat="server" CssClass="table table-primary align-middle table-bordered">
                    <Columns>
                        <asp:BoundField HeaderText="Marca" DataField="Marca" />
                        <asp:BoundField HeaderText="Modelo" DataField="Modelo" />
                        <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
                        <asp:BoundField HeaderText="Precio" DataField="PrecioFormateado" />
                        <asp:CommandField ShowSelectButton="true" SelectText="✏️​" HeaderText="Editar" />
                    </Columns>
                </asp:GridView>
                <div class="mb-3 justify-content-center d-flex align-items-center gap-2">
                    <a class="btn btn-primary" href="AltaModificacionArticulo.aspx">Agregar nuevo artículo</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
