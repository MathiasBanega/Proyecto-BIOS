<%@ Page Language="C#" AutoEventWireup="true" CodeFile="frmRealizarAlquiler.aspx.cs" Inherits="frmRealizarAlquiler" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 305px;
        }
        .style3
        {
            width: 305px;
            height: 26px;
        }
        .style5
        {
            height: 26px;
        }
        .style6
        {
            width: 305px;
            height: 64px;
        }
        .style8
        {
            height: 64px;
        }
        #Select1
        {
            width: 227px;
        }
        .style9
        {
            width: 305px;
            height: 23px;
        }
        .style11
        {
            height: 23px;
        }
        .style12
        {
            width: 519px;
        }
        .style13
        {
            width: 519px;
            height: 64px;
        }
        .style14
        {
            width: 519px;
            height: 26px;
        }
        .style15
        {
            width: 519px;
            height: 23px;
        }
        .style16
        {
            width: 305px;
            height: 65px;
        }
        .style17
        {
            width: 519px;
            height: 65px;
        }
        .style18
        {
            height: 65px;
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
            <td class="style12">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblCabezal" runat="server" Font-Bold="True" Font-Size="XX-Large" 
                    Font-Underline="True" Text="Realizar Alquiler"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
            </td>
            <td class="style13">
                &nbsp;</td>
            <td class="style8">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
            </td>
            <td class="style14">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Large" 
                    Font-Underline="False" Text="Matricula Vehiculo: "></asp:Label>
                &nbsp;&nbsp;
                <asp:TextBox ID="txtMatricula" runat="server"></asp:TextBox>
            </td>
            <td class="style5">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Large" 
                    Text="C.I Cliente:"></asp:Label>
&nbsp;&nbsp;
                <asp:TextBox ID="txtCedula" runat="server"></asp:TextBox>
                <asp:Label ID="Label5" runat="server" Text="(Sin puntos ni guiones)" 
                    Font-Bold="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style12">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtMatricula" ErrorMessage="Matricula incorrecta" 
                    ForeColor="Black" ValidationExpression="\D{3}\d{4}">Ejemplo: ASD1234</asp:RegularExpressionValidator>
            </td>
            <td>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtCedula" ErrorMessage="Cedula incorrecta" 
                    ForeColor="Black" ValidationExpression="\d{8}">Cedula Incorrecta</asp:RegularExpressionValidator>
                </td>
        </tr>
        <tr>
            <td class="style16">
                </td>
            <td class="style17">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="X-Large" 
                    Text="Seleccione fecha de Inicio"></asp:Label>
            </td>
            <td class="style18">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="X-Large" 
                    Text="Seleccione fecha de Devolucion"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td class="style12">
                <asp:Calendar ID="mvwInicio" runat="server" Height="190px" Width="350px" 
                    BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" 
                    Font-Size="9pt" ForeColor="Black" NextPrevFormat="FullMonth" 
                    EnableTheming="True" onselectionchanged="Calendar1_SelectionChanged">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                        VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" 
                        Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                </asp:Calendar>
            </td>
            <td>
                <asp:Calendar ID="mvwFin" runat="server" BackColor="White" 
                    BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" 
                    ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" 
                        VerticalAlign="Bottom" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                    <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" 
                        Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                    <TodayDayStyle BackColor="#CCCCCC" />
                </asp:Calendar>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style12">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style12">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:Button ID="btnAlquilar" runat="server" Text="Realizar Alquiler" 
                    onclick="btnAlquilar_Click" Font-Bold="True" Height="56px" Width="178px" />
            </td>
            <td>
                <asp:Button ID="btnCosto" runat="server" Font-Bold="True" Height="56px" 
                    onclick="btnCosto_Click" Text="Consultar Costo" Width="178px" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style12">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style12">
                <asp:Label ID="lblError" runat="server" Font-Size="X-Large"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style9">
                &nbsp;</td>
            <td class="style15">
                </td>
            <td class="style11">
                </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style12">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style12">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="lnkVolver" runat="server" PostBackUrl="~/Default.aspx" 
                    Font-Size="X-Large">Volver</asp:LinkButton>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style12">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style12">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style12">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style12">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </form>
</body>
</html>
