<%@ Page Title="" Language="C#" MasterPageFile="~/app/TrabajadorMaster.Master" AutoEventWireup="true" CodeBehind="AgregarProducto.aspx.cs" Inherits="Banquetzal.app.AgregarProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 271px;
        }

        .auto-style4 {
            width: 266px;
        }

        .auto-style5 {
            width: 728px;
        }
    .auto-style6 {
        width: 728px;
        height: 36px;
    }
    .auto-style7 {
        width: 266px;
        height: 36px;
    }
    .auto-style8 {
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
                <h2>Agregar Producto</h2>
                <p>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td>
                                <asp:Label ID="estado" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">Historial Productos</td>
                            <td>
                                <asp:DropDownList ID="ddlProducto" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">Nuevo</td>
                            <td>
                                <asp:CheckBox ID="nuevo" runat="server" Text="Seleccione si desea agregar un producto nuevo" AutoPostBack="True" Font-Bold="False" Font-Size="12pt" OnCheckedChanged="nuevo_CheckedChanged" />
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">Nombre</td>
                            <td>
                                <asp:TextBox ID="nombre" runat="server" Width="225px" Enabled="False">--Deshabilitado--</asp:TextBox>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style6"></td>
                            <td class="auto-style7">Valor (en puntos)</td>
                            <td class="auto-style8">
                                <asp:TextBox ID="valor" runat="server" Width="225px" Enabled="False" >--Deshabilitado--</asp:TextBox>
                            </td>
                            <td class="auto-style9"></td>
                            <td class="auto-style9"></td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">Proveedor</td>
                            <td>
                                <asp:DropDownList ID="ddlProveedor" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">Cantidad</td>
                            <td>
                                <asp:TextBox ID="cantidad" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td>
                                <asp:Button ID="agregar" runat="server" BorderStyle="Dashed" Text="Agregar" OnClick="agregar_Click" Height="48px" />
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                    </table>
                </p>

            </header>
        </div>
    </section>
</asp:Content>
