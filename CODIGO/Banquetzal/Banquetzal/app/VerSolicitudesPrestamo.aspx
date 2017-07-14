<%@ Page Title="" Language="C#" MasterPageFile="~/app/TrabajadorMaster.Master" AutoEventWireup="true" CodeBehind="VerSolicitudesPrestamo.aspx.cs" Inherits="Banquetzal.app.VerSolicitudesPrestamo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        
        .auto-style2 {
            width: 271px;
        }

        .auto-style3 {
            width: 509px;
        }

        .auto-style4 {
            width: 360px;
        }

        .auto-style5 {
            width: 692px;
        }
        .auto-style6 {
            width: 692px;
            height: 36px;
        }
        .auto-style7 {
            width: 360px;
            height: 36px;
        }
        .auto-style8 {
            width: 509px;
            height: 36px;
        }
        .auto-style9 {
            width: 271px;
            height: 36px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="three" class="wrapper">
        <div class="inner">
            <header class="align-center">
                <h2>Solicitudes de prestamo</h2>
                <p>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style3">
                                <asp:Label ID="estado" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">Solicitante</td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="ddlSolicitantes" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlSolicitantes_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style2">
                                &nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style6"></td>
                            <td class="auto-style7">
                                Monto</td>
                            <td class="auto-style8">
                                <asp:TextBox ID="monto" runat="server" Enabled="False"></asp:TextBox>
                            </td>
                            <td class="auto-style9"></td>
                            <td class="auto-style9"></td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">Saldo</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="saldo" runat="server" Enabled="False"></asp:TextBox>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">Estado</td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="ddlEstados" runat="server" Enabled="False">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style2">
                                <asp:Button ID="Confirmar" runat="server" BorderStyle="Dashed" Text="Confirmar" OnClick="Confirmar_Click" />
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">Tipo</td>
                            <td >
                                <asp:TextBox ID="tipo" runat="server" Enabled="False"></asp:TextBox>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">Modalidad de pago</td>
                            <td >
                                <asp:TextBox ID="modalidad" runat="server" Enabled="False"></asp:TextBox>
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
