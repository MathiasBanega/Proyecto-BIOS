<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 498px;
        }
        .style2
        {
            width: 378px;
        }
        .style3
        {
            width: 498px;
            height: 23px;
        }
        .style4
        {
            width: 378px;
            height: 23px;
        }
        .style5
        {
            height: 23px;
        }
        .style6
        {
            width: 498px;
            height: 31px;
        }
        .style7
        {
            width: 378px;
            height: 31px;
        }
        .style8
        {
            height: 31px;
        }
        .style9
        {
            width: 400px;
            height: 200px;
        }
        .style10
        {
            width: 498px;
            height: 50px;
        }
        .style11
        {
            width: 378px;
            height: 50px;
        }
        .style12
        {
            height: 50px;
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
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                <img alt="" class="style9" src="Imagenes/Logo%20Rentadora.png" /></td>
            <td>
                </td>
        </tr>
        <tr>
            <td class="style10">
                </td>
            <td class="style11">
                </td>
            <td class="style12">
                </td>
        </tr>
        <tr>
            <td class="style6">
                </td>
            <td class="style7">
                <asp:LinkButton ID="lnkMantenimientoClientes" runat="server" 
                    onclick="LinkButton1_Click" PostBackUrl="~/frmMantenimientoClientes.aspx" 
                    Font-Size="X-Large">Mantenimiento de Clientes</asp:LinkButton>
            </td>
            <td class="style8">
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
            <td class="style3">
                </td>
            <td class="style4">
                <asp:LinkButton ID="lnkMantenimientoAutos" runat="server" 
                    PostBackUrl="~/frmMantenimientoAutos.aspx" Font-Size="X-Large" 
                    onclick="lnkMantenimientoAutos_Click">Mantenimiento de Autos</asp:LinkButton>
            </td>
            <td class="style5">
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
                <asp:LinkButton ID="lnkMantenimientoUtilitarios" runat="server" 
                    PostBackUrl="~/frmMantenimientoUtilitarios.aspx" Font-Size="X-Large" 
                    onclick="lnkMantenimientoUtilitarios_Click">Mantenimiento de Utilitarios</asp:LinkButton>
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
                <asp:LinkButton ID="lnkRealizarAlquiler" runat="server" 
                    PostBackUrl="~/frmRealizarAlquiler.aspx" Font-Size="X-Large" 
                    onclick="lnkRealizarAlquiler_Click">Realizar Alquiler</asp:LinkButton>
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
                <asp:LinkButton ID="lnkListadoVehiculosDisponibles" runat="server" 
                    onclick="LinkButton6_Click" 
                    PostBackUrl="~/frmListadodeVehiculosDisponibles.aspx" Font-Size="X-Large">Listado Vehiculos Disponibles</asp:LinkButton>
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
                <asp:LinkButton ID="lnkTotalRecaudado" runat="server" 
                    PostBackUrl="~/frmTotalRecaudadoporVehiculo.aspx" Font-Size="X-Large" 
                    onclick="lnkTotalRecaudado_Click">Total Recaudado por Vehiculo</asp:LinkButton>
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
    </table>
    </form>
</body>
</html>
