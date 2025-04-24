<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Administracion.aspx.cs" Inherits="presentacion.Administracion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Panel de Administrador</h3>
    <%--Filtro Rapido--%>
    <div class="row">
        <div class="col-6">
            <div class="mb-3 d-flex align-items-center gap-2">
                <label for="txtboxFiltroRapido" class="form-label mb-0">Buscar: </label>
                <asp:TextBox ID="txtboxFiltroRapido" AutoPostBack="true" OnTextChanged="txtboxFiltroRapido_TextChanged" CssClass="form-control" runat="server" />
                <asp:Button ID="btnLimpiarFiltro" Text="Limpiar" CssClass="btn btn-outline-success btn-sm" UseSubmitBehavior="false" OnClick="btnLimpiarFiltro_Click" runat="server" />
            </div>
            <%--Filtro Avanzado--%>
            <div class="mb-3">
                <asp:CheckBox ID="chboxFiltroAvanzado" AutoPostBack="true" Text="Filtro Avanzado" OnCheckedChanged="chboxFiltroAvanzado_CheckedChanged" runat="server" />
            </div>
            <% if (chboxFiltroAvanzado.Checked)
                {  %>
            <div class="mb-3 d-flex align-items-center gap-2">
                <label for="ddlCampo">Campo: </label>
                <asp:DropDownList OnSelectedIndexChanged="ddlCampo_SelectedIndexChanged" AutoPostBack="true" ID="ddlCampo" runat="server">
                    <asp:ListItem Text="Marca" />
                    <asp:ListItem Text="Descripción" />
                    <asp:ListItem Text="Precio" />
                </asp:DropDownList>
                <label for="ddlCriterio">Criterio: </label>
                <asp:DropDownList ID="ddlCriterio" runat="server">
                    <asp:ListItem Text="Comienza con" />
                    <asp:ListItem Text="Termina con" />
                    <asp:ListItem Text="Contiene" />
                </asp:DropDownList>
                <label for="txtboxFiltro">Filtro:</label>
                <asp:TextBox ID="txtboxFiltro" runat="server" />
                <asp:Button ID="btnBuscarFiltroAvanzado" OnClick="btnBuscarFiltroAvanzado_Click" Text="Buscar" runat="server" />
                <asp:Button Text="🗑️​" ID="btnBorrarFiltro" OnClick="btnBorrarFiltro_Click" runat="server" />
            </div>
            <% }%>
            <%--Data Grid--%>
            <asp:GridView ID="dgvArticulos" OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged" DataKeyNames="Id" AutoGenerateColumns="false" runat="server" CssClass="table table-light">
                <Columns>
                    <asp:BoundField HeaderText="Marca" DataField="Marca" />
                    <asp:BoundField HeaderText="Modelo" DataField="Modelo" />
                    <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
                    <asp:BoundField HeaderText="Precio" DataField="PrecioFormateado" />
                    <asp:CommandField ShowSelectButton="true" SelectText="✏️​" HeaderText="Editar" />
                </Columns>
            </asp:GridView>
            <a href="AltaModificacionArticulo.aspx">Agregar</a>
        </div>
    </div>
</asp:Content>
