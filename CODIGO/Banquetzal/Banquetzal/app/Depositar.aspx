<%@ Page Title="" Language="C#" MasterPageFile="~/app/TrabajadorMaster.Master" AutoEventWireup="true" CodeBehind="Depositar.aspx.cs" Inherits="Banquetzal.app.Depositar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 272px;
        }
        .auto-style2 {
            width: 277px;
        }
        .auto-style3 {
            width: 337px;
        }
        .auto-style4 {
            width: 272px;
            height: 35px;
        }
        .auto-style5 {
            width: 337px;
            height: 35px;
        }
        .auto-style6 {
            width: 277px;
            height: 35px;
        }
        .auto-style7 {
            height: 35px;
        }
        .auto-style8 {
            width: 272px;
            height: 36px;
        }
        .auto-style9 {
            width: 337px;
            height: 36px;
        }
        .auto-style10 {
            width: 277px;
            height: 36px;
        }
        .auto-style11 {
            height: 36px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="three" class="wrapper">
        <div class="inner">
            <header class="align-center">
                <h2>Realizar Depósito</h2>
                <p>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style2">
                                <asp:Label ID="estado_deposito" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style4"></td>
                            <td class="auto-style5">Forma de deposito</td>
                            <td class="auto-style6">
                                <asp:DropDownList ID="modoDeposito" runat="server" AutoPostBack="True" OnSelectedIndexChanged="modoDeposito_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style7"></td>
                            <td class="auto-style7"></td>
                        </tr>
                        <tr>
                            <td class="auto-style8"></td>
                            <td class="auto-style9">A cuenta</td>
                            <td class="auto-style10">
                                <asp:TextBox ID="cuenta" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td class="auto-style11"></td>
                            <td class="auto-style11"></td>
                        </tr>
                        <tr>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style3">ID de cheque</td>
                            <td class="auto-style2">
                                <asp:TextBox ID="idcheque" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style3">Cuenta de cheque</td>
                            <td class="auto-style2">
                                <asp:TextBox ID="cuentacheque" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style3">Monto</td>
                            <td class="auto-style2">
                                <asp:TextBox ID="monto" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style3">Nombre</td>
                            <td class="auto-style2">
                                <asp:TextBox ID="transaccionista" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style2">
                                <asp:Button ID="btndepositar" runat="server" BorderStyle="Dashed" OnClick="Ingresar_Click" Text="Depositar" />
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </p>

            </header>
        </div>
    </section>
</asp:Content>
