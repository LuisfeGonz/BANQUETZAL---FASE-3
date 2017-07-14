<%@ Page Title="" Language="C#" MasterPageFile="~/app/TrabajadorMaster.Master" AutoEventWireup="true" CodeBehind="OperacionesTrabajador.aspx.cs" Inherits="Banquetzal.app.OperacionesTrabajador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 761px;
        }
        .auto-style2 {
            width: 755px;
        }
        .auto-style4 {
            width: 747px;
        }
        .auto-style5 {
            width: 1638px;
        }
        .auto-style6 {
            width: 899px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="three" class="wrapper">
        <div class="inner">
            <header class="align-center">
                <h2>Operaciones Bancarias</h2>
                <p>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">
                                Seleccione la operacion que desea realizar</td>
                            <td class="auto-style6">
                                <asp:DropDownList ID="listaTipoOperacion" runat="server" AutoPostBack="True" OnSelectedIndexChanged="listaTipoOperacion_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style6">
                                &nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">
                                &nbsp;</td>
                            <td class="auto-style6">
                                &nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style6">
                                &nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                    </table>
                </p>

            </header>
        </div>
    </section>
</asp:Content>
