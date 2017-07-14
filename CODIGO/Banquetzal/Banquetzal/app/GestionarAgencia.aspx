<%@ Page Title="" Language="C#" MasterPageFile="~/app/TrabajadorMaster.Master" AutoEventWireup="true" CodeBehind="GestionarAgencia.aspx.cs" Inherits="Banquetzal.app.GestionarAgencia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 24px;
        }
        .auto-style2 {
            width: 35px;
        }
        .auto-style3 {
            width: 45px;
        }
        .auto-style4 {
            width: 47px;
        }
        .auto-style5 {
            width: 207px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="three" class="wrapper">
        <div class="inner">
            <header class="align-center">
                <h2>Gestionar Agencia Bancaria</h2>
                <p>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style3">
                                <asp:Label ID="estado_agencia" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">Nombre</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="nombre" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">
                                Direccion</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="direccion" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style4">
                                Fondos</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="fondos" runat="server" Width="225px"></asp:TextBox>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style3">
                                <asp:Button ID="ingresar" runat="server" BorderStyle="Dashed" OnClick="Ingresar_Click" Text="Ingresar" />
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
