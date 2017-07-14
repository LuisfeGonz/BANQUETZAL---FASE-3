<%@ Page Title="" Language="C#" MasterPageFile="~/app/MasterCliente.Master" AutoEventWireup="true" CodeBehind="InicioCliente.aspx.cs" Inherits="Banquetzal.app.InicioCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Banner -->
    <section id="banner">
        <h1>
            <asp:Label ID="nombreLogged" runat="server"></asp:Label>
        </h1>
        <p>Bienvenido a Banquetzal.</p>
        <p>&nbsp;</p>
    </section>
</asp:Content>
