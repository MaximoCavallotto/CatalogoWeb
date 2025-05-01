<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="presentacion.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-center align-items-center" style="margin-top: 100px; height: 100px">
        <div class="row">
            <div class="d-flex flex-column align-items-center">
                <div class="mb-3">
                    <asp:TextBox ID="txtboxEmail" CssClass="form-control" placeholder="Email" Width="300px" runat="server" />
                </div>
                <div class="mb-3">
                    <asp:TextBox type="password" ID="txtboxPass" CssClass="form-control" placeholder="Contraseña" Width="300px" runat="server" />
                </div>
                <div class="mb-3">
                    <asp:Button Text="Registrarse" CssClass="btn btn-primary btn-sm" ID="btnRegistrarse" OnClick="btnRegistrarse_Click" runat="server" />
                    <a href="Default.aspx">Cancelar</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
