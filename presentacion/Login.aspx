<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="presentacion.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                <asp:Button Text="Ingresar" OnClick="btnIngresar_Click" CssClass="btn btn-primary btn-sm" ID="btnIngresar" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
