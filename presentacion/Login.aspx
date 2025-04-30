<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="presentacion.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            background-color:#DBE9EE !important;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-center align-items-center" style="margin-top: 100px" height: 300px">
        <div class="row">
            <div class="d-flex flex-column align-items-center">
                <div class="mb-3">
                    <asp:TextBox ID="txtboxEmail" CssClass="form-control" runat="server" Width="200px" placeholder="Email" />
                </div>
                <div class="mb-3">
                    <asp:TextBox type="password" ID="txtboxPass" CssClass="form-control" runat="server" Width="200px" placeholder="Contraseña" />
                </div>
                <div class="mb-3" style="margin-top: 30px">
                    <asp:Button Text="Ingresar" OnClick="btnIngresar_Click" CssClass="btn btn-primary btn-sm" ID="btnIngresar" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
