<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="presentacion.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Mi Perfil</h1>
    <div class="row">
        <div class="col-6">
            <div class="mb-3">
                <label for="txtboxEmail" class="form-label">Email: </label>
                <asp:TextBox ID="txtboxEmail" CssClass="form-control" runat="server" />
            </div>
            <div class="mb-3">
                <label for="txtboxNombre" class="form-label">Nombre: </label>
                <asp:TextBox ID="txtboxNombre" CssClass="form-control" runat="server" />
            </div>
            <div class="mb-3">
                <label for="txtboxApellido" class="form-label">Apellido: </label>
                <asp:TextBox ID="txtboxApellido" CssClass="form-control" runat="server" />
            </div>
            <div class="mb-3">
                <asp:Button ID="btnGuardar" OnClick="btnGuardar_Click" Text="Guardar" runat="server" />
                <a href="Default.aspx">Regresar</a>
            </div>
            <div class="mb-3">
                <asp:Label Style="color: blue" Visible="false" ID="lblPerfilActualizado" Text="Perfil Actualizado" runat="server" />
            </div>
        </div>
        <div class="col-6">
            <div class="mb-3">
                <label for="txtImagen">Imagen de Perfil:</label>
                <input type="file" id="txtImagen" runat="server" class="form-control" />
                <asp:Image ID="imgPerfil" ImageUrl="https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png" runat="server" CssClass=" img-fluid mb-3" />
            </div>
        </div>
    </div>
</asp:Content>
