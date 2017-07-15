<%@ Page Title="" Language="C#" MasterPageFile="~/app/TrabajadorMaster.Master" AutoEventWireup="true" CodeBehind="ReportesGerentesAgencias.aspx.cs" Inherits="Banquetzal.ReportesGerentesAgencias" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 33px;
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
            width: 179px;
        }

        .auto-style12 {
            width: 113px;
        }

        .auto-style13 {
            width: 175px;
        }

        .auto-style14 {
            width: 132px;
        }

        .auto-style15 {
            width: 153px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="three" class="wrapper">
        <div class="inner">
            <header class="align-center">
                <h2>Reportes gerenciales</h2>
                <p>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style5">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style9">
                                <asp:Label ID="estado" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style9">Tipo</td>
                            <td class="auto-style10">
                                <asp:DropDownList ID="ddlReporte" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style9">
                                <asp:Button ID="verReporte" runat="server" BorderStyle="Dashed" Text="Ver" OnClick="verReporte_Click" />
                            </td>
                            <td class="auto-style10">
                                <asp:Button ID="guardarPDF" runat="server" Enabled="False" Text="Guardar" />
                            </td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </p>
                <p>
                    <table>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style15">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style14">&nbsp;</td>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style13">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style11">&nbsp;</td>
                            <td class="auto-style15">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style12">&nbsp;</td>
                            <td class="auto-style14">
                                <asp:GridView ID="tablaReporte" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                                    <AlternatingRowStyle BackColor="#DCDCDC" />
                                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#000065" />
                                </asp:GridView>
                            </td>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style13">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style15">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style14">&nbsp;</td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style13">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style15">&nbsp;</td>
                            <td class="auto-style8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style14">&nbsp;</td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style13">&nbsp;</td>
                        </tr>
                    </table>
                </p>

            </header>
        </div>
    </section>
</asp:Content>
