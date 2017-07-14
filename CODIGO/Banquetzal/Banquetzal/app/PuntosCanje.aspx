<%@ Page Title="" Language="C#" MasterPageFile="~/app/MasterCliente.Master" AutoEventWireup="true" CodeBehind="PuntosCanje.aspx.cs" Inherits="Banquetzal.app.PuntosCanje" %>
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
            width: 234px;
            height: 36px;
        }
        .auto-style13 {
            width: 167px;
            height: 36px;
        }
        .auto-style14 {
            width: 219px;
            height: 36px;
        }
        .auto-style15 {
            width: 187px;
            height: 36px;
        }
        .auto-style16 {
            width: 111px;
            height: 36px;
        }
        .auto-style17 {
            width: 33px;
            height: 36px;
        }
    .auto-style18 {
        width: 281px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="three" class="wrapper">
        <div class="inner">
            <header class="align-center">
                <h2>Puntos y canje</h2>
                <p>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style18">&nbsp;</td>
                            <td class="auto-style9">
                                &nbsp;</td>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style18">
                                Mis puntos</td>
                            <td class="auto-style9">
                                <asp:TextBox ID="puntosCliente" runat="server" Enabled="False"></asp:TextBox>
                            </td>
                            <td class="auto-style10">
                                &nbsp;</td>
                            <td class="auto-style7">
                                &nbsp;</td>
                            <td class="auto-style8">
                                &nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style11"></td>
                            <td class="auto-style11">&nbsp;</td>
                            <td class="auto-style18" >
                                Canjear producto</td>
                            <td class="auto-style13">
                                <asp:DropDownList ID="ddlProductos" runat="server" OnSelectedIndexChanged="cuentaDestino_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style14">
                                &nbsp;</td>
                            <td class="auto-style15"></td>
                            <td class="auto-style16"></td>
                            <td class="auto-style17"></td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style18" >
                                &nbsp;</td>
                            <td class="auto-style9">
                                <asp:Label ID="estado" runat="server" ForeColor="Red"></asp:Label>
                            </td>
                            <td class="auto-style10">
                                &nbsp;</td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style18" >
                                &nbsp;</td>
                            <td class="auto-style9">
                                <asp:Button ID="canjear" runat="server" BorderStyle="Dashed" OnClick="Ingresar_Click" Text="Canjear" />
                            </td>
                            <td class="auto-style10">&nbsp;</td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style8">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style18" >
                                &nbsp;</td>
                            <td class="auto-style9">
                                &nbsp;</td>
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
