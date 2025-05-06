<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Detalles.aspx.cs" Inherits="presentacion.Detalles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card text-center">
                    <div class="card-header">
                        <asp:Label ID="lblTitulo" Text="" runat="server" />
                    </div>
                    <div class="card-body">
                        <asp:Image ID="imgImagen" ImageUrl="" runat="server" Style="max-width: 300px; max-height: 300px; margin: 0 auto; display: block"
                             onerror="this.onerror=null; this.src = 'https://www.nycourts.gov/courts/ad4/assets/Placeholder.png'"/>
                        <p>
                            <asp:Label ID="lblDescripcion" Text="" runat="server" Font-Italic="True" />
                        </p>
                        <p>
                            <asp:Label ID="lblPrecio" Text="" runat="server" />
                        </p>
                        <a href="Default.aspx" class="btn btn-outline-primary">Regresar</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
