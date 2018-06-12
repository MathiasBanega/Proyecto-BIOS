<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmTotalRecaudadoporVehiculo.aspx.cs" Inherits="frmTotalRecaudadoporVehiculo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 398px;
        }
        .style2
        {
            width: 422px;
        }
        .style3
        {
            width: 398px;
            height: 23px;
        }
        .style4
        {
            width: 422px;
            height: 23px;
        }
        .style5
        {
            height: 23px;
        }
        .style6
        {
            width: 398px;
            height: 34px;
        }
        .style7
        {
            width: 422px;
            height: 34px;
        }
        .style8
        {
            height: 34px;
        }
        .style9
        {
            width: 398px;
            height: 237px;
        }
        .style10
        {
            width: 422px;
            height: 237px;
        }
        .style11
        {
            height: 237px;
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
                <asp:Label ID="lblCabezal" runat="server" Font-Bold="True" Font-Size="XX-Large" 
                    Font-Underline="True" Text="Total Recaudado"></asp:Label>
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
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblMatricula" runat="server" Text="Matricula"></asp:Label>
            </td>
            <td class="style7">
                <asp:TextBox ID="txtmatricula" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" Width="93px" 
                    onclick="btnBuscar_Click" />
&nbsp;&nbsp;&nbsp; </td>
            <td class="style8">
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
            <td class="style3">
                </td>
            <td class="style4">
                </td>
            <td class="style5">
                </td>
        </tr>
        <tr>
            <td class="style9">
                </td>
            <td class="style10">
                <asp:ListBox ID="lstAlquileres" runat="server" Height="233px" Width="602px">
                </asp:ListBox>
            </td>
            <td class="style11">
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                <asp:Label ID="lblError" runat="server" Font-Size="X-Large"></asp:Label>
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
            <td class="style3">
                </td>
            <td class="style4">
                </td>
            <td class="style5">
                </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="lnkVolver" runat="server" PostBackUrl="~/Default.aspx">Volver</asp:LinkButton>
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
    </table>
    </form>
</body>
</html>
