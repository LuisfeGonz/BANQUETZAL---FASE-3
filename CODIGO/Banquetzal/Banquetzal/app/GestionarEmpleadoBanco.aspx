<%@ Page Title="" Language="C#" MasterPageFile="~/app/TrabajadorMaster.Master" AutoEventWireup="true" CodeBehind="GestionarEmpleadoBanco.aspx.cs" Inherits="Banquetzal.app.GestionarEmpleadoBanco" %>

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="three" class="wrapper">
        <div class="inner">
            <header class="align-center">
                <h2>Gestionar Trabajador</h2>
                <p>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style3">
                                <asp:Label ID="estado_empleado" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">CUI</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="cui" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">Usuario</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="usuario" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">
                                Nombres</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="nombres" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style1">Apellidos</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="apellidos" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style1">Telefono</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="telefono" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style1">Direccion</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="direccion" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style1">Puesto</td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="listaRol" runat="server" Width="260px">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style1">Agencia</td>
                            <td class="auto-style3">
                                <asp:DropDownList ID="listaAgencia" runat="server" Width="260px">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style3">
                                <asp:Button ID="ingresar" runat="server" BorderStyle="Dashed" Text="Ingresar" OnClick="ingresar_Click" />
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
