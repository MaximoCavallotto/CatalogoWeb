<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="presentacion.Registro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Registrate</h1>
    <div class="row">
    <div class="col-4">
        <div class="mb-3">
            <label for="txtboxEmail">Email:</label>
            <asp:TextBox ID="txtboxEmail" CssClass="form-control" runat="server" />
        </div>
        <div class="mb-3">
            <label for="txtboxPass">Contraseña:</label>
            <asp:TextBox type="password" ID="txtboxPass" CssClass="form-control" runat="server" />
        </div>
        <div class="mb-3">
            <asp:button Text="Registrarse"  CssClass="btn btn-primary btn-sm" id="btnRegistrarse" onclick="btnRegistrarse_Click" runat="server" />
            <a href="Default.aspx">Cancelar</a>
        </div>
    </div>
</div>
</asp:Content>
