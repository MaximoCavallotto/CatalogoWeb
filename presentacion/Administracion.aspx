<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Administracion.aspx.cs" Inherits="presentacion.Administracion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h3>Panel de Administrador</h3>
    <div class="row">
        <div class="col-6">
            <div class="mb-3 d-flex align-items-center gap-2">
                <label for="txtboxFiltroRapido" class="form-label mb-0">Buscar: </label>
                <asp:TextBox ID="txtboxFiltroRapido" AutoPostBack="true" OnTextChanged="txtboxFiltroRapido_TextChanged" CssClass="form-control" runat="server" />
                <asp:Button ID="btnLimpiarFiltro" Text="Limpiar" cssclass="btn btn-outline-success btn-sm" UseSubmitBehavior="false" OnClick="btnLimpiarFiltro_Click" runat="server" />
            </div>


            <asp:GridView ID="dgvArticulos" OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged" DataKeyNames="Id" AutoGenerateColumns="false" runat="server" CssClass="table table-light">
                <Columns>
                    <asp:BoundField HeaderText="Marca" DataField="Marca" />
                    <asp:BoundField HeaderText="Modelo" DataField="Modelo" />
                    <asp:BoundField HeaderText="Descripcion" DataField="Marca" />
                    <asp:BoundField HeaderText="Precio" DataField="PrecioFormateado" />
                    <asp:CommandField ShowSelectButton="true" SelectText="✏️​" HeaderText="Editar" />
                </Columns>
            </asp:GridView>
            <a href="AltaModificacionArticulo.aspx">Agregar</a>
        </div>
    </div>
</asp:Content>
