<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="presentacion.Error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center gap-2 py-2" style="margin-top: 100px; height: 100px"">
        <div class="row align-items-center">
            <div class="col-6">
                <h3>Lamentamos el error...</h3>
                <asp:Label ID="lblError" Text="Pasaron cosas..." runat="server" />
            </div>
            <div class="col-6">
                <asp:Image ID="imgError" ImageUrl="https://static.vecteezy.com/system/resources/thumbnails/020/371/779/small/confused-business-women-sit-at-laptop-at-workplace-with-coffee-cup-burnout-neurosis-stress-error-concept-png.png" runat="server" />
            </div>
        </div>
    </div>


</asp:Content>
