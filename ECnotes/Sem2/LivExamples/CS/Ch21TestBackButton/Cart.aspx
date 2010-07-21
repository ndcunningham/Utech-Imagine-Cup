<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Shopping Cart</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/banner.jpg" /><br />
        <br />
        Your shopping cart:<br />
        <table border="0" cellpadding="0" cellspacing="0" style="width: 500px">
            <tr>
                <td style="width: 286px; height: 153px">
                    <asp:ListBox ID="lstCart" runat="server" Height="135px" Width="267px"></asp:ListBox>
                </td>
                <td style="height: 153px">
                    <asp:Button ID="btnRemove" runat="server" Text="Remove Item" Width="100px" OnClick="btnRemove_Click" /><br />
                    <br />
                    <asp:Button ID="btnEmpty" runat="server" Text="Empty Cart" Width="100px" OnClick="btnEmpty_Click" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnContinue" runat="server" PostBackUrl="~/Order.aspx" Text="Continue Shopping" />&nbsp;
        <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" OnClick="btnCheckOut_Click" /><br />
        <br />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    
    </div>
    </form>
</body>
</html>
