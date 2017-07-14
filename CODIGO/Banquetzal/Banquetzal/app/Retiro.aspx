<%@ Page Title="" Language="C#" MasterPageFile="~/app/TrabajadorMaster.Master" AutoEventWireup="true" CodeBehind="Retiro.aspx.cs" Inherits="Banquetzal.app.Retiro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style8 {
            width: 318px;
        }

        .auto-style9 {
            width: 243px;
        }

        .auto-style10 {
            width: 311px;
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
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style8">
                                <asp:Label ID="estado" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style9">Cuenta</td>
                            <td class="auto-style8">
                                <asp:TextBox ID="cuenta" runat="server" Width="225px" style="height: 21px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style9">CUI cliente</td>
                            <td class="auto-style8">
                                <asp:TextBox ID="cui" runat="server" Enabled="False" Width="225px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style9">Nombre cliente</td>
                            <td class="auto-style8">
                                <asp:TextBox ID="nombre" runat="server" Enabled="False" Width="225px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style9">Monto</td>
                            <td class="auto-style8">
                                <asp:TextBox ID="monto" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style9">
                                <asp:Button ID="verificar" runat="server" OnClick="verificar_Click" Text="Verificar datos" />
                            </td>
                            <td class="auto-style8">
                                <asp:Button ID="retirar" runat="server" BorderStyle="Dashed" Text="Retirar" Enabled="False" OnClick="retirar_Click" />
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </p>

            </header>
        </div>
    </section>
</asp:Content>
