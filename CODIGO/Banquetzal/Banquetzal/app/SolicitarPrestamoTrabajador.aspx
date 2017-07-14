<%@ Page Title="" Language="C#" MasterPageFile="~/app/TrabajadorMaster.Master" AutoEventWireup="true" CodeBehind="SolicitarPrestamoTrabajador.aspx.cs" Inherits="Banquetzal.app.SolicitarPrestamoTrabajador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 18px;
        }

        .auto-style2 {
            width: 19px;
        }

        .auto-style3 {
            width: 20px;
        }

        .auto-style4 {
            width: 21px;
        }

        .auto-style5 {
            width: 207px;
        }

        .auto-style6 {
            width: 207px;
            height: 34px;
        }

        .auto-style7 {
            height: 34px;
        }

        .auto-style8 {
            width: 20px;
            height: 34px;
        }

        .auto-style9 {
            width: 19px;
            height: 34px;
        }

        .auto-style10 {
            width: 207px;
            height: 23px;
        }

        .auto-style11 {
            height: 23px;
        }

        .auto-style12 {
            width: 20px;
            height: 23px;
        }

        .auto-style13 {
            width: 19px;
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="three" class="wrapper">
        <div class="inner">
            <header class="align-center">
                <h2>Solicitud de Prestamo</h2>
                <p>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style3">
                                <asp:Label ID="estado_Solicitud" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td>CUI cliente</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="cui" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td>Monto</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="monto" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style10"></td>
                            <td class="auto-style11">Tipo de prestamo</td>
                            <td class="auto-style12">
                                <asp:DropDownList ID="tipo" runat="server" Width="260px">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style13"></td>
                            <td class="auto-style13"></td>
                        </tr>
                        <tr>
                            <td class="auto-style6"></td>
                            <td class="auto-style7">Modalidad de pago</td>
                            <td class="auto-style8">
                                <asp:DropDownList ID="modalidad" runat="server" Width="260px">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style9"></td>
                            <td class="auto-style9"></td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style3">
                                <asp:Button ID="ingresar" runat="server" BorderStyle="Dashed" OnClick="Ingresar_Click" Text="Enviar solicitud" />
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style3">&nbsp;</td>
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
