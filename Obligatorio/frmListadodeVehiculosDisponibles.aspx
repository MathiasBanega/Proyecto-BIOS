<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmListadodeVehiculosDisponibles.aspx.cs" Inherits="frmListadodeVehiculosDisponibles" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            height: 23px;
        }
        .style4
        {
            width: 465px;
        }
        .style5
        {
            height: 23px;
            width: 465px;
        }
        .style6
        {
            width: 363px;
        }
        .style7
        {
            height: 23px;
            width: 363px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <table style="width:100%;">
        <tr>
            <td class="style6">
                &nbsp;</td>
            <td class="style4">
                <asp:Label ID="lblCabezal" runat="server" Font-Bold="True" Font-Size="XX-Large" 
                    Font-Underline="True" Text="Listado Vehiculos Disponibles"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                </td>
            <td class="style5">
                </td>
            <td class="style1">
                </td>
        </tr>
        <tr>
            <td class="style7">
            </td>
            <td class="style5">
            </td>
            <td class="style1">
            </td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style5">
                <asp:Label ID="lblFechaI" runat="server" Text="Fecha de inicio "></asp:Label>
&nbsp;
                <asp:TextBox ID="txtFechaI" runat="server"></asp:TextBox>
&nbsp;<asp:Label ID="Label1" runat="server" Text="(dd/mm/aaaa)"></asp:Label>
            </td>
            <td class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            <td class="style5">
                <asp:Label ID="lblFechaF" runat="server" Text="Fecha de fin "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:TextBox ID="txtFechaF" runat="server"></asp:TextBox>
&nbsp;<asp:Label ID="Label2" runat="server" Text="(dd/mm/aaaa)"></asp:Label>
            </td>
            <td class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style5">
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblVehiculos" runat="server" Font-Bold="True" 
                    Font-Underline="True" Text="Vehiculos Disponibles" Font-Size="XX-Large"></asp:Label>
                <br />
                <br />
                <asp:ListBox ID="LstDisponibles" runat="server" Height="315px" Width="557px" 
                    onselectedindexchanged="ListBox1_SelectedIndexChanged">
                </asp:ListBox>
                <br />
                <br />
                <asp:Label ID="lblError" runat="server" Font-Size="X-Large"></asp:Label>
            </td>
            <td class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style5">
            </td>
            <td class="style1">
            </td>
        </tr>
        <tr>
            <td class="style7">
            </td>
            <td class="style5">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnBuscar" 
                    runat="server" Text="Buscar " Width="135px" 
                    BackColor="White" Height="58px" onclick="btnBuscar_Click" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
            <td class="style1">
            </td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style5">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="lnkVolver" runat="server" PostBackUrl="~/Default.aspx">Volver</asp:LinkButton>
            </td>
            <td class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
        </tr>
    </table>
    </form>
</body>
</html>
