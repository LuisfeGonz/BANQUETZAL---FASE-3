<%@ Page Title="" Language="C#" MasterPageFile="~/app/MasterCliente.Master" AutoEventWireup="true" CodeBehind="DatosPersonales.aspx.cs" Inherits="Banquetzal.app.DatosPersonales" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 442px;
        }
        .auto-style3 {
            width: 204px;
        }
        .auto-style4 {
            width: 1764px;
        }
        .auto-style5 {
            width: 1833px;
        }
        .auto-style6 {
            width: 746px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="three" class="wrapper">
        <div class="inner">
            <header class="align-center">
                <h2>Datos personales</h2>
                <p>
                    <table style="width: 100%;">
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style3">
                                <asp:label id="estado_actualizacion" runat="server" forecolor="Red"></asp:label>
                            </td>
                            <td class="auto-style6">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style5">CUI</td>
                            <td class="auto-style3">
                                <asp:textbox id="cui" runat="server" width="225px" enabled="False"></asp:textbox>
                            </td>
                            <td class="auto-style6">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style4"></td>
                            <td class="auto-style5">Usuario</td>
                            <td class="auto-style3">
                                <asp:textbox id="usuario" runat="server" width="225px"></asp:textbox>
                            </td>
                            <td class="auto-style6"></td>
                            <td class="auto-style9"></td>
                        </tr>
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style5">Nombres</td>
                            <td class="auto-style3">
                                <asp:textbox id="nombres" runat="server" width="225px"></asp:textbox>
                            </td>
                            <td class="auto-style6">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style5">Apellidos</td>
                            <td class="auto-style3">
                                <asp:textbox id="apellidos" runat="server" width="225px"></asp:textbox>
                            </td>
                            <td class="auto-style6">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style5">Nacimiento</td>
                            <td class="auto-style3">
                                <asp:textbox id="nacimiento" runat="server" width="225px"></asp:textbox>
                            </td>
                            <td class="auto-style6">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style4"></td>
                            <td class="auto-style5">Puntos preferenciales</td>
                            <td class="auto-style3">
                                <asp:textbox id="puntos" runat="server" enabled="False" width="225px"></asp:textbox>
                            </td>
                            <td class="auto-style6"></td>
                            <td class="auto-style15"></td>
                        </tr>
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style3">
                                <asp:button id="actualizar" runat="server" borderstyle="Dashed" onclick="Ingresar_Click" text="Actualizar" />
                            </td>
                            <td class="auto-style6">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style3">
                                &nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                    </table>
                </p>

            </header>
        </div>
    </section>
</asp:Content>
