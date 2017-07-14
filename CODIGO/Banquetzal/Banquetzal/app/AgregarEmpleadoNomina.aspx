<%@ Page Title="" Language="C#" MasterPageFile="~/app/MasterCliente.Master" AutoEventWireup="true" CodeBehind="AgregarEmpleadoNomina.aspx.cs" Inherits="Banquetzal.app.AgregarEmpleadoNomina" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
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

        .auto-style29 {
            height: 36px;
        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="align-center">
        <h2>Agragar Nuevo Empleado a Nómina</h2>
        <table class="auto-style1">
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">Nominas</td>
                <td class="auto-style7">
                    <asp:DropDownList ID="nominas" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style8">&nbsp;</td>
                <td class="auto-style29">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style6">CUI nuevo empleado</td>
                <td class="auto-style7">
                    <asp:TextBox ID="cuiCliente" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8"></td>
                <td class="auto-style29"></td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">Crear cuenta nueva</td>
                <td class="auto-style7">
                    <asp:CheckBox ID="nuevaCuenta" runat="server" AutoPostBack="True" OnCheckedChanged="nuevaCuenta_CheckedChanged" Text="Seleccionar si desea crear una nueva cuenta." />
                </td>
                <td class="auto-style8">
                    <asp:Label ID="estado" runat="server" ForeColor="#0033CC"></asp:Label>
                </td>
                <td class="auto-style29">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">Cuenta seleccionada empleado</td>
                <td class="auto-style7">
                    <asp:TextBox ID="cuentaElegida" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:Button ID="agregar" runat="server" Text="Agregar" OnClick="crear_Click" />
                </td>
                <td class="auto-style29">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9"></td>
                <td class="auto-style10">Salario</td>
                <td class="auto-style11">
                    <asp:TextBox ID="salario" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style12">
                    &nbsp;</td>
                <td class="auto-style29"></td>
            </tr>
            </table>
    </header>
</asp:Content>
