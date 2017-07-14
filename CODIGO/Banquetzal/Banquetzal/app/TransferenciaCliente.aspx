<%@ Page Title="" Language="C#" MasterPageFile="~/app/MasterCliente.Master" AutoEventWireup="true" CodeBehind="TransferenciaCliente.aspx.cs" Inherits="Banquetzal.app.TransferenciaCliente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 33px;
        }

        .auto-style4 {
            width: 194px;
        }

        .auto-style5 {
            width: 234px;
        }

        .auto-style7 {
            width: 187px;
        }

        .auto-style8 {
            width: 111px;
        }

        .auto-style9 {
            width: 167px;
        }

        .auto-style10 {
            width: 219px;
        }

        .auto-style11 {
            width: 234px;
            height: 36px;
        }

        .auto-style13 {
            width: 167px;
            height: 36px;
        }

        .auto-style14 {
            width: 219px;
            height: 36px;
        }

        .auto-style15 {
            width: 187px;
            height: 36px;
        }

        .auto-style16 {
            width: 111px;
            height: 36px;
        }

        .auto-style17 {
            width: 33px;
            height: 36px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="three" class="wrapper">
        <div class="inner">
            <header class="align-center">
                <h2>Transferencia a cuentas propias</h2>
                <p>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style4">Cuenta Origen</td>
                            <td class="auto-style9">
                                <asp:DropDownList ID="ddlOrigen" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style11"></td>
                            <td class="auto-style11">&nbsp;</td>
                            <td class="auto-style4">Cuenta Destino</td>
                            <td class="auto-style13">
                                <asp:DropDownList ID="ddlDestino" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style14">&nbsp;</td>
                            <td class="auto-style15"></td>
                            <td class="auto-style16"></td>
                            <td class="auto-style17"></td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">Monto</td>
                            <td class="auto-style9">
                                <asp:TextBox ID="monto" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style9">
                                <asp:Label ID="estado" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style9">
                                <asp:Button ID="transferir" runat="server" BorderStyle="Dashed" OnClick="transferir_Click" Text="Transferir" />
                            </td>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                    </table>
                </p>

            </header>
        </div>
    </section>
</asp:Content>
