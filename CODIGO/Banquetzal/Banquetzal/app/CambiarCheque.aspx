<%@ Page Title="" Language="C#" MasterPageFile="~/app/TrabajadorMaster.Master" AutoEventWireup="true" CodeBehind="CambiarCheque.aspx.cs" Inherits="Banquetzal.app.CambiarCheque" %>

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
                                <asp:Label ID="estado_cambio" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style9">Cuenta</td>
                            <td class="auto-style8">
                                <asp:TextBox ID="cuenta" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style9">ID Cheque</td>
                            <td class="auto-style8">
                                <asp:TextBox ID="cheque" runat="server" Width="225px"></asp:TextBox>
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
                            <td class="auto-style9">Nombre transaccionista</td>
                            <td class="auto-style8">
                                <asp:TextBox ID="transaccionista" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style8">
                                <asp:Button ID="Ingresar" runat="server" BorderStyle="Dashed" OnClick="Ingresar_Click" Text="Ingresar" />
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
