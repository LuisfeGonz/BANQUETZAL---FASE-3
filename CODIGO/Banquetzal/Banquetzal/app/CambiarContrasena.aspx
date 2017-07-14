<%@ Page Title="" Language="C#" MasterPageFile="~/app/InicioMaster.Master" AutoEventWireup="true" CodeBehind="CambiarContrasena.aspx.cs" Inherits="Banquetzal.app.CambiarContrasena" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        
        .auto-style2 {
            width: 271px;
        }

        .auto-style3 {
            width: 509px;
        }

        .auto-style4 {
            width: 258px;
        }

        .auto-style5 {
            width: 706px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="three" class="wrapper">
        <div class="inner">
            <header class="align-center">
                <h2>Cambiar Contrasena</h2>
                <p>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style3">
                                <asp:Label ID="estado_cambio" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">Contrasena Actual</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="actual" runat="server" Width="225px" TextMode="Password"></asp:TextBox>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">
                                <asp:Label ID="Label2" runat="server" Text="Contraseña"></asp:Label>
                            &nbsp;Nueva</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="nueva" runat="server" TextMode="Password" Width="225px"></asp:TextBox>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">Verificar Contrasena</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="verificacion" runat="server" TextMode="Password" Width="225px"></asp:TextBox>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style3">
                                <asp:Button ID="cambiar" runat="server" BorderStyle="Dashed" OnClick="Ingresar_Click" Text="Cambiar" />
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                    </table>
                </p>

            </header>
        </div>
    </section>
</asp:Content>
