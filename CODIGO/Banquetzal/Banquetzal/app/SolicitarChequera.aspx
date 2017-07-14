<%@ Page Title="" Language="C#" MasterPageFile="~/app/TrabajadorMaster.Master" AutoEventWireup="true" CodeBehind="SolicitarChequera.aspx.cs" Inherits="Banquetzal.app.SolicitarChequera" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 12px;
        }
        .auto-style3 {
            width: 14px;
        }
        .auto-style4 {
            width: 321px;
        }
        .auto-style5 {
            width: 233px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="three" class="wrapper">
        <div class="inner">
            <header class="align-center">
                <h2>Solicitar Chequera</h2>
                <p>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style3">
                                <asp:Label ID="estado_chequera" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style5">Numero de cuenta</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="cuenta" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style5">
                                &nbsp;</td>
                            <td class="auto-style3">
                                &nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style3">
                                <asp:Button ID="solicitar" runat="server" BorderStyle="Dashed" OnClick="Ingresar_Click" Text="Solicitar" />
                            </td>
                            <td>&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style3">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                    </table>
                </p>

            </header>
        </div>
    </section>
</asp:Content>
