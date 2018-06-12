<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMantenimientoClientes.aspx.cs" Inherits="frmMantenimientoClientes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            height: 23px;
        }
        .style2
        {
            width: 127px;
        }
        .style3
        {
            height: 23px;
            width: 127px;
        }
        .style4
        {
            width: 361px;
        }
        .style5
        {
            height: 23px;
            width: 361px;
        }
        .style6
        {
            height: 64px;
            width: 127px;
        }
        .style7
        {
            height: 64px;
            width: 361px;
        }
        .style8
        {
            height: 64px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <table style="width:100%;">
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                <asp:Label ID="lblCabezal" runat="server" Font-Bold="True" Font-Size="XX-Large" 
                    Font-Underline="True" Text="Mantenimiento Clientes"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style6">
                </td>
            <td class="style7">
                </td>
            <td class="style8">
                </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="lblCedula" runat="server" Text="Cedula "></asp:Label>
            </td>
            <td class="style4">
                <asp:TextBox ID="txtCedula" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtCedula" ErrorMessage="Cedula incorrecta" 
                    ForeColor="#990000" ValidationExpression="\d{8}">*</asp:RegularExpressionValidator>
                <asp:Label ID="Label1" runat="server" Text="(Sin puntos ni guiones)" 
                    Font-Bold="False"></asp:Label>
            </td>
            <td>
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" Width="93px" 
                    onclick="btnBuscar_Click" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre "></asp:Label>
            </td>
            <td class="style4">
                <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnAgregar" runat="server" Text="Agregar" Width="93px" 
                    onclick="btnAgregar_Click" />
            </td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="lblTarjetadeCredito" runat="server" Text="Tarjeta de Credito "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td class="style4">
                <asp:TextBox ID="txtTarjeta" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" Width="93px" 
                    onclick="btnEliminar_Click" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="lblTelefono" runat="server" Text="Telefono "></asp:Label>
            </td>
            <td class="style4">
                <asp:TextBox ID="txtTelefono" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnModificar" runat="server" Text="Modificar" Width="93px" 
                    onclick="btnModificar_Click" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="lblDireccion" runat="server" Text="Direccion "></asp:Label>
            </td>
            <td class="style4">
                <asp:TextBox ID="txtDireccion" runat="server"></asp:TextBox>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="lblFechanacimiento" runat="server" Text="Fecha Nacimiento "></asp:Label>
            </td>
            <td class="style4">
                <asp:TextBox ID="txtFechaN" runat="server" 
                    ontextchanged="txtFechaN_TextChanged"></asp:TextBox>
                <asp:Label ID="Label2" runat="server" Text="(dd/mm/yyyy)"></asp:Label>
            </td>
            <td>
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" Width="93px" 
                    onclick="btnLimpiar_Click" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                <asp:Label ID="lblError" runat="server" Font-Size="X-Large"></asp:Label>
            </td>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                    ForeColor="#990000" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                <asp:LinkButton ID="lnkVolver" runat="server" PostBackUrl="~/Default.aspx">Volver</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </form>
</body>
</html>
