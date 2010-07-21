<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<%@ Register Src="DaysUntil.ascx" TagName="DaysUntil" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Halloween Store</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="Image1" runat="server"
            ImageUrl="~/Images/banner.jpg" /><br /><br />
        Your shopping cart:<br />
        <table style="width: 500px" cellspacing="0" 
                cellpadding="0" border="0">
            <tr>
                <td style="width: 286px; height: 153px">
                    <asp:ListBox ID="lstCart" runat="server"
                        Width="267px" Height="135px">
                    </asp:ListBox>
                </td>
                <td style="height: 153px">
                    <asp:Button ID="btnRemove" runat="server" 
                        Width="100px" Text="Remove Item" OnClick="btnRemove_Click" /><br /><br />
                    <asp:Button ID="btnEmpty" runat="server" 
                        Width="100px" Text="Empty Cart" OnClick="btnEmpty_Click" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnContinue" runat="server"
            PostBackUrl="~/Order.aspx" Text="Continue Shopping" />&nbsp;
        <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" OnClick="btnCheckOut_Click" /><br />
        <br />
        <uc1:DaysUntil ID="DaysUntil1" runat="server" />
        <br />
        <br />
        <asp:Label ID="lblMessage" runat="server"></asp:Label></div>
    </form>
</body>
</html>
