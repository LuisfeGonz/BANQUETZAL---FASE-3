<%@ Page Title="" Language="C#" MasterPageFile="~/app/InicioMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Banquetzal.app.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style type="text/css">
        .auto-style1 {
            width: 227px;
        }

        .auto-style2 {
            width: 271px;
        }
        .auto-style3 {
            width: 509px;
        }
        .auto-style4 {
            width: 229px;
        }
        .auto-style5 {
        width: 728px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="three" class="wrapper">
        <div class="inner">
            <header class="align-center">
                <h2>Inicie Sesión</h2>
                <p>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style3">
                                <asp:Label ID="estado_login" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">Usuario</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="usuario" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">
                                <asp:Label ID="Label2" runat="server" Text="Contraseña"></asp:Label>
                            </td>
                            <td class="auto-style3">
                                <asp:TextBox ID="contrasena" runat="server" TextMode="Password" Width="225px"></asp:TextBox>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style3">
                                <asp:Button ID="Ingresar" runat="server" BorderStyle="Dashed" OnClick="Ingresar_Click" Text="Ingresar" />
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                    </table>
                </p>

            </header>
        </div>
    </section>
</asp:Content>
