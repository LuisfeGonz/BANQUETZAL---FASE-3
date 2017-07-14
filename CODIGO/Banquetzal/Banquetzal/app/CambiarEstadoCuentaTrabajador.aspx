<%@ Page Title="" Language="C#" MasterPageFile="~/app/TrabajadorMaster.Master" AutoEventWireup="true" CodeBehind="CambiarEstadoCuentaTrabajador.aspx.cs" Inherits="Banquetzal.app.CambiarEstadoCuentaTrabajador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 30px;
        }

        .auto-style6 {
            width: 290px;
        }
        .auto-style7 {
            width: 38px;
        }
        .auto-style8 {
            width: 160px;
        }
        .auto-style9 {
            width: 324px;
        }
        .auto-style10 {
            width: 160px;
            height: 33px;
        }
        .auto-style11 {
            width: 290px;
            height: 33px;
        }
        .auto-style12 {
            width: 38px;
            height: 33px;
        }
        .auto-style13 {
            width: 324px;
            height: 33px;
        }
        .auto-style14 {
            width: 30px;
            height: 33px;
        }
        .auto-style15 {
            width: 160px;
            height: 39px;
        }
        .auto-style16 {
            width: 290px;
            height: 39px;
        }
        .auto-style17 {
            width: 38px;
            height: 39px;
        }
        .auto-style18 {
            width: 324px;
            height: 39px;
        }
        .auto-style19 {
            width: 30px;
            height: 39px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="three" class="wrapper">
        <div class="inner">
            <header class="align-center">
                <h2>Cambiar estado de cuenta</h2>
                <p>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td class="auto-style7">
                                <asp:Label ID="estado" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style10"></td>
                            <td class="auto-style11">Ingrese numero de cuenta</td>
                            <td class="auto-style12">
                                <asp:TextBox ID="cuenta" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td class="auto-style13">
                                <asp:Button ID="cargar" runat="server" Height="43px" OnClick="cargar_Click" Text="Cargar datos" Width="178px" />
                            </td>
                            <td class="auto-style14"></td>
                        </tr>
                        <tr>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style6" >
                                CUI</td>
                            <td class="auto-style7">
                                <asp:TextBox ID="cui" runat="server" Width="225px" Enabled="False"></asp:TextBox>
                            </td>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style6" >
                                Nombre del propietario</td>
                            <td class="auto-style7">
                                <asp:TextBox ID="nombre" runat="server" Enabled="False" Width="225px"></asp:TextBox>
                            </td>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style15"></td>
                            <td class="auto-style16" >
                                Estado de cuenta</td>
                            <td class="auto-style17">
                                <asp:DropDownList ID="listaEstados" runat="server" AutoPostBack="True" Enabled="False" OnSelectedIndexChanged="listaEstados_SelectedIndexChanged" Width="260px">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style18"></td>
                            <td class="auto-style19"></td>
                        </tr>
                        <tr>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td class="auto-style7">
                                <asp:Button ID="cambiar" runat="server" BorderStyle="Dashed" Text="Cambiar estado" OnClick="cambiar_Click" Enabled="False" />
                            </td>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                    </table>
                </p>

            </header>
        </div>
    </section>
</asp:Content>
