<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmMantenimientoAutos.aspx.cs" Inherits="frmMantenimientoAutos" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 80px;
        }
        .style2
        {
            width: 222px;
        }
        .style3
        {
            width: 80px;
            height: 64px;
        }
        .style4
        {
            width: 222px;
            height: 64px;
        }
        .style5
        {
            height: 64px;
        }
        .style6
        {
            width: 80px;
            height: 23px;
        }
        .style7
        {
            width: 222px;
            height: 23px;
        }
        .style8
        {
            height: 23px;
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
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Label ID="lblCabezal" runat="server" Font-Bold="True" Font-Size="XX-Large" 
                    Font-Underline="True" Text="Mantenimiento Autos"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
                </td>
            <td class="style4">
                </td>
            <td class="style5">
                </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblMatricula" runat="server" Text="Matricula "></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="txtMatricula" runat="server"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtMatricula" ErrorMessage="Matricula incorrecta" 
                    ForeColor="#990000" ValidationExpression="\D{3}\d{4}">Ejemplo: ASD1234</asp:RegularExpressionValidator>
            </td>
            <td>
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" Width="93px" 
                    onclick="btnBuscar_Click" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblMarca" runat="server" Text="Marca "></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="txtMarca" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnAgregar" runat="server" Text="Agregar" Width="93px" 
                    onclick="btnAgregar_Click" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblModelo" runat="server" Text="Modelo "></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="txtModelo" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnModificar" runat="server" Text="Modificar" Width="93px" 
                    onclick="btnModificar_Click" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblAño" runat="server" Text="Año "></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="txtAño" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" Width="93px" 
                    onclick="btnEliminar_Click" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblPuertas" runat="server" Text="Puertas "></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="txtPuertas" runat="server"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="lblCosto" runat="server" Text="Costo "></asp:Label>
            </td>
            <td class="style2">
                <asp:TextBox ID="txtCosto" runat="server"></asp:TextBox>
                <asp:Label ID="lblDolares" runat="server" Text="U$D"></asp:Label>
            </td>
            <td>
                <asp:Button ID="btnLimpiar" runat="server" Text="Limpiar" Width="93px" 
                    onclick="btnLimpiar_Click" />
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
            <td class="style1">
                <asp:Label ID="lblAnclaje" runat="server" Text="Anclaje "></asp:Label>
            </td>
            <td class="style2">
                <asp:RadioButtonList ID="rblAnclaje" runat="server">
                    <asp:ListItem Selected="True">Cinturon</asp:ListItem>
                    <asp:ListItem>Latch</asp:ListItem>
                    <asp:ListItem>ISOFIX</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:Label ID="lblError" runat="server" Font-Size="X-Large"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:LinkButton ID="lnkVolver" runat="server" PostBackUrl="~/Default.aspx">Volver</asp:LinkButton>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
