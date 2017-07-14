<%@ Page Title="" Language="C#" MasterPageFile="~/app/TrabajadorMaster.Master" AutoEventWireup="true" CodeBehind="InicioTrabajador.aspx.cs" Inherits="Banquetzal.app.InicioTrabajador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Banner -->
    <section id="banner">
        <h1>
            <asp:label id="nombreLogged" runat="server"></asp:label>
        </h1>
        <p>Bienvenido a Banquetzal.</p>
        <p>&nbsp;</p>
    </section>
</asp:Content>
