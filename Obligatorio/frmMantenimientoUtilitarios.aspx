<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMantenimientoUtilitarios.aspx.cs" Inherits="frmMantenimientoUtilitarios" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 81px;
        }
        .style2
        {
            width: 81px;
            height: 23px;
        }
        .style3
        {
            height: 23px;
        }
        .style4
        {
            width: 218px;
        }
        .style5
        {
            height: 23px;
            width: 218px;
        }
        .style6
        {
            width: 81px;
            height: 26px;
        }
        .style7
        {
            width: 218px;
            height: 26px;
        }
        .style8
        {
            height: 26px;
        }
        .style9
        {
            width: 81px;
            height: 64px;
        }
        .style10
        {
            width: 218px;
            height: 64px;
        }
        .style11
        {
            height: 64px;
        }
        .style12
        {
            width: 81px;
            height: 30px;
        }
        .style13
        {
            width: 218px;
            height: 30px;
        }
        .style14
        {
            height: 30px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <table style="width:100%;">
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                <asp:Label ID="lblCabezal" runat="server" Font-Bold="True" Font-Size="XX-Large" 
                    Font-Underline="True" Text="Mantenimiento Utilitarios"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style9">
                </td>
            <td class="style10">
                </td>
            <td class="style11">
                </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblMatricula" runat="server" Text="Matricula "></asp:Label>
&nbsp;&nbsp;&nbsp; </td>
            <td class="style4">
                <asp:TextBox ID="txtMatricula" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtMatricula" ErrorMessage="Matricula incorrecta" 
                    ForeColor="#990000" ValidationExpression="\D{3}\d{4}">Ejemplo: ASD1234</asp:RegularExpressionValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style12">
                </td>
            <td class="style13">
                &nbsp;</td>
            <td class="style14">
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" Width="93px" 
                    onclick="btnBuscar_Click" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblMarca" runat="server" Text="Marca "></asp:Label>
&nbsp;&nbsp;&nbsp; </td>
            <td class="style4">
                <asp:TextBox ID="txtMarca" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnAgregar" runat="server" Text="Agregar" Width="93px" 
                    onclick="btnAgregar_Click" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblModelo" runat="server" Text="Modelo "></asp:Label>
&nbsp;&nbsp;&nbsp; </td>
            <td class="style4">
                <asp:TextBox ID="txtModelo" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnModificar" runat="server" Text="Modificar" Width="93px" 
                    onclick="btnModificar_Click" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblAño" runat="server" Text="Año "></asp:Label>
&nbsp;&nbsp;&nbsp; </td>
            <td class="style4">
                <asp:TextBox ID="txtAño" runat="server" ontextchanged="TextBox7_TextChanged"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" Width="93px" 
                    onclick="btnEliminar_Click" />
            </td>
        </tr>
        <tr>
            <td class="style6">
                <asp:Label ID="lblPuertas" runat="server" Text="Puertas "></asp:Label>
&nbsp;&nbsp;&nbsp; </td>
            <td class="style7">
                <asp:TextBox ID="txtPuertas" runat="server"></asp:TextBox>
            </td>
            <td class="style8">
                </td>
        </tr>
        <tr>
            <td class="style2">
                </td>
            <td class="style5">
                </td>
            <td class="style3">
                </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblCosto" runat="server" Text="Costo"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td class="style4">
                <asp:TextBox ID="txtCosto" runat="server"></asp:TextBox>
&nbsp;<asp:Label ID="lblDolares" runat="server" Text="U$D"></asp:Label>
            &nbsp;&nbsp;&nbsp; 
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                <asp:Button ID="btnLimpiar" runat="server" onclick="btnLimpiar_Click" 
                    Text="Limpiar" Width="92px" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblCapacidad" runat="server" Text="Capacidad"></asp:Label>
&nbsp;&nbsp;&nbsp; </td>
            <td class="style4">
                <asp:TextBox ID="txtCapacidad" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblTipo" runat="server" Text="Tipo"></asp:Label>
&nbsp;&nbsp;&nbsp; </td>
            <td class="style4">
                <asp:RadioButtonList ID="rblTipo" runat="server">
                    <asp:ListItem Selected="True">Furgoneta</asp:ListItem>
                    <asp:ListItem>Pick Up</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:Label ID="lblError" runat="server" Font-Size="X-Large"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                </td>
            <td class="style5">
                &nbsp;</td>
            <td class="style3">
                <asp:LinkButton ID="lnkVolver" runat="server" PostBackUrl="~/Default.aspx">Volver</asp:LinkButton>
            </td>
        </tr>
    </table>
    </form>
    </body>
</html>
