<%@ Page Title="" Language="C#" MasterPageFile="~/app/TrabajadorMaster.Master" AutoEventWireup="true" CodeBehind="EstadoCuenta.aspx.cs" Inherits="Banquetzal.app.EstadoCuenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 22px;
        }
        .auto-style2 {
            width: 33px;
        }
        .auto-style4 {
            width: 41px;
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="three" class="wrapper">
        <div class="inner">
            <header class="align-center">
                <h2>Estado de cuenta</h2>
                <p>
                    <table style="width: 100%;">
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
                            <td >&nbsp;</td>
                            <td >Cuenta</td>
                            <td>
                                <asp:TextBox ID="cuenta" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td class="auto-style9">
                                Fecha inicio</td>
                            <td class="auto-style10">
                                <asp:TextBox ID="fechainicio" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td class="auto-style7">Fecha fin</td>
                            <td class="auto-style8" >
                                <asp:TextBox ID="fechafin" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td >
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">
                                &nbsp;</td>
                            <td class="auto-style9">
                                <asp:GridView ID="tablaEstado" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" EmptyDataText="Esperando a cargar un estado" HorizontalAlign="Center" ShowHeaderWhenEmpty="True" >
                                    <FooterStyle BackColor="White" ForeColor="#000066" />
                                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                                    <RowStyle ForeColor="#000066" />
                                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                                </asp:GridView>
                            </td>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style9">
                                <asp:Button ID="obtener" runat="server" BorderStyle="Dashed" OnClick="Ingresar_Click" Text="Obtener" />
                            </td>
                            <td class="auto-style10">
                                <asp:Button ID="PDF" runat="server" Enabled="False" OnClick="PDF_Click" Text="PDF" />
                            </td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
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
                    </table>
                </p>

            </header>
        </div>
    </section>
</asp:Content>
