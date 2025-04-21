<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Administracion.aspx.cs" Inherits="presentacion.Administracion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-6">
            <asp:GridView ID="dgvArticulos" OnSelectedIndexChanged="dgvArticulos_SelectedIndexChanged" DataKeyNames="Id" AutoGenerateColumns="false" runat="server" CssClass="table table-light">
                <Columns>
                    <asp:BoundField HeaderText="Marca" DataField="Marca"/>
                    <asp:BoundField HeaderText="Modelo" DataField="Modelo"/>
                    <asp:BoundField HeaderText="Descripcion" DataField="Marca"/>
                    <asp:BoundField HeaderText="Precio" DataField="PrecioFormateado"/>
                    <asp:CommandField ShowSelectButton="true" SelectText="✏️​" HeaderText="Editar"/>   
                </Columns>
            </asp:GridView>
            <a href="AltaModificacionArticulo.aspx">Agregar</a>
        </div>
    </div>
</asp:Content>
