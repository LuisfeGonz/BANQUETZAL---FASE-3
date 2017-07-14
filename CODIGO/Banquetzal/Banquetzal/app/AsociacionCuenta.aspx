<%@ Page Title="" Language="C#" MasterPageFile="~/app/TrabajadorMaster.Master" AutoEventWireup="true" CodeBehind="AsociacionCuenta.aspx.cs" Inherits="Banquetzal.app.AsociacionCuenta" %>

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

        .auto-style6 {
            width: 728px;
            height: 50px;
        }

        .auto-style7 {
            width: 229px;
            height: 50px;
        }

        .auto-style8 {
            width: 509px;
            height: 50px;
        }

        .auto-style9 {
            width: 271px;
            height: 50px;
        }

        .auto-style10 {
            width: 728px;
            height: 34px;
        }

        .auto-style11 {
            width: 229px;
            height: 34px;
        }

        .auto-style12 {
            width: 509px;
            height: 34px;
        }

        .auto-style13 {
            width: 271px;
            height: 34px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="three" class="wrapper">
        <div class="inner">
            <header class="align-center">
                <h2>Asociacion de cuentas</h2>
                <p>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style10"></td>
                            <td class="auto-style11">CUI CLIENTE</td>
                            <td>
                                <asp:textbox id="cui" runat="server" width="225px"></asp:textbox>
                            </td>
                            <td class="auto-style13"></td>
                            <td class="auto-style13"></td>
                        </tr>
                        <tr>
                            <td class="auto-style6"></td>
                            <td class="auto-style7">Cuenta a asociar</td>
                            <td>
                                <asp:textbox id="cuenta" runat="server" width="225px"></asp:textbox>
                            </td>
                            <td class="auto-style9"></td>
                            <td class="auto-style9"></td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style1">&nbsp;</td>
                            <td>
                                <asp:label id="estado" runat="server" forecolor="Red"></asp:label>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td>
                                <asp:button id="asociar" runat="server" borderstyle="Dashed" text="Asociar" onclick="asociar_Click" />
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
