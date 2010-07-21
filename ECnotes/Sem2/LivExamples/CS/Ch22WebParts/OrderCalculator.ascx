<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OrderCalculator.ascx.cs" Inherits="OrderCalculator" %>

<asp:Panel ID="Panel1" runat="server" Height="75px" Width="242px">
    <table>
        <tr>
            <td style="height: 21px">
                <asp:Label ID="Label1" runat="server" BorderWidth="0px" Text="Price" Width="60px"></asp:Label>
            </td>
            <td style="height: 21px">
                <asp:Label ID="Label2" runat="server" BorderWidth="0px" Text="Quantity" Width="60px"></asp:Label>
            </td>
            <td style="width: 67px; height: 21px">
                <asp:Label ID="Label3" runat="server" BorderWidth="0px" Text="Total" Width="60px"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:TextBox ID="txtPrice" runat="server" Width="60px"></asp:TextBox>
            </td>
            <td>
                <asp:TextBox ID="txtQuantity" runat="server" Width="60px"></asp:TextBox>
            </td>
            <td style="width: 67px">
                <asp:Label ID="lblTotal" runat="server" Width="80px" BorderWidth="0px"></asp:Label>
            </td>
        </tr>
    </table>
    <asp:Button ID="btnCalculate" runat="server" Text="Calculate" OnClick="btnCalculate_Click" /></asp:Panel>