<%@ Page Title="" Language="C#" MasterPageFile="~/app/TrabajadorMaster.Master" AutoEventWireup="true" CodeBehind="NuevaCuenta.aspx.cs" Inherits="Banquetzal.app.NuevaCuenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            width: 168px;
        }

        .auto-style3 {
            width: 236px;
        }

        .auto-style4 {
            width: 248px;
        }

        .auto-style5 {
            height: 48px;
        }

        .auto-style6 {
            width: 168px;
            height: 48px;
        }

        .auto-style7 {
            width: 236px;
            height: 48px;
        }

        .auto-style8 {
            width: 248px;
            height: 48px;
        }

        .auto-style9 {
            height: 39px;
        }

        .auto-style10 {
            width: 168px;
            height: 39px;
        }

        .auto-style11 {
            width: 236px;
            height: 39px;
        }

        .auto-style12 {
            width: 248px;
            height: 39px;
        }

        .auto-style13 {
            height: 38px;
        }

        .auto-style14 {
            width: 168px;
            height: 38px;
        }

        .auto-style15 {
            width: 236px;
            height: 38px;
        }

        .auto-style16 {
            width: 248px;
            height: 38px;
        }

        .auto-style17 {
            height: 32px;
        }

        .auto-style18 {
            width: 168px;
            height: 32px;
        }

        .auto-style19 {
            width: 236px;
            height: 32px;
        }

        .auto-style20 {
            width: 248px;
            height: 32px;
        }

        .auto-style21 {
            height: 33px;
        }

        .auto-style22 {
            width: 168px;
            height: 33px;
        }

        .auto-style23 {
            width: 236px;
            height: 33px;
        }

        .auto-style24 {
            width: 248px;
            height: 33px;
        }

        .auto-style29 {
            height: 36px;
        }

        .auto-style30 {
            width: 168px;
            height: 21px;
        }

        .auto-style31 {
            width: 236px;
            height: 21px;
        }

        .auto-style32 {
            width: 248px;
            height: 21px;
        }

        .auto-style33 {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="align-center">
        <h2>Crear Nueva Cuenta</h2>
        <table class="auto-style1">
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style6">CUI Cliente</td>
                <td class="auto-style7">
                    <asp:TextBox ID="cuiCliente" runat="server" Width="200px" BorderStyle="Inset"></asp:TextBox>
                </td>
                <td class="auto-style8"></td>
                <td class="auto-style29"></td>
            </tr>
            <tr>
                <td class="auto-style9"></td>
                <td class="auto-style10">Monto Apertura</td>
                <td class="auto-style11">
                    <asp:TextBox ID="monto" runat="server" Width="200px" BorderStyle="Inset"></asp:TextBox>
                </td>
                <td class="auto-style12">
                    <asp:Label ID="estado" runat="server" ForeColor="#0033CC"></asp:Label>
                </td>
                <td class="auto-style29"></td>
            </tr>
            <tr>
                <td class="auto-style33"></td>
                <td class="auto-style30">Nomina</td>
                <td class="auto-style31">
                    <asp:CheckBox ID="nomina" runat="server" AutoPostBack="True" Text="Seleccionar si la la cuenta es para una nomina." OnCheckedChanged="nomina_CheckedChanged" />
                </td>
                <td class="auto-style32">
                    <asp:Button ID="crear" runat="server" Text="Crear Cuenta" OnClick="crear_Click" />
                </td>
                <td class="auto-style33"></td>
            </tr>
            <tr>
                <td class="auto-style13"></td>
                <td class="auto-style14">Tipo Cuenta</td>
                <td class="auto-style15">
                    <asp:DropDownList ID="listaTipo" runat="server" >
                    </asp:DropDownList>
                </td>
                <td class="auto-style16">
                    Salarios</td>
                <td class="auto-style29"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="lblPresidente" runat="server" Text="CUI Presidente"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:TextBox ID="boxPresidente" runat="server" BorderStyle="Inset" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="sueldoPresidente" runat="server" BorderStyle="Inset" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style29">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style17"></td>
                <td class="auto-style18">
                    <asp:Label ID="lblVice" runat="server" Text="CUI Vicepresidente"></asp:Label>
                </td>
                <td class="auto-style19">
                    <asp:TextBox ID="boxVice" runat="server" BorderStyle="Inset" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style20">
                    <asp:TextBox ID="sueldoVice" runat="server" BorderStyle="Inset" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style17"></td>
            </tr>
            <tr>
                <td class="auto-style21"></td>
                <td class="auto-style22">
                    <asp:Label ID="lblContador" runat="server" Text="CUI Contador"></asp:Label>
                </td>
                <td class="auto-style23">
                    <asp:TextBox ID="boxContador" runat="server" BorderStyle="Inset" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style24">
                    <asp:TextBox ID="sueldoContador" runat="server" BorderStyle="Inset" Enabled="False"></asp:TextBox>
                </td>
                <td class="auto-style29"></td>
            </tr>
        </table>
    </header>
</asp:Content>
