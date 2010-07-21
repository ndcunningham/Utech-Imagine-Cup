<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Cart.aspx.vb" Inherits="Cart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Chapter 19: Cart Profile</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="Image1" runat="server"
            ImageUrl="~/Images/banner.jpg" /><br /><br />
        <asp:Label ID="lblCartTitle" runat="server"
            Text="Your shopping cart:"></asp:Label><br />
        <table style="width: 500px;" cellspacing="0" 
               cellpadding="0" border="0">
            <tr>
                <td style="width: 286px; height: 153px">&nbsp;
                    <asp:ListBox ID="lstCart" Runat="server"
                        Width="267px" Height="135px">
                    </asp:ListBox>
                </td>
                <td style="height: 153px">
                    <asp:Button ID="btnRemove" Runat="server"
                        Width="100px" Text="Remove Item" />
                    <br /><br />
                    <asp:Button ID="btnEmpty" Runat="server"
                        Width="100px" Text="Empty Cart" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnContinue" Runat="server" 
            Text="Continue Shopping" PostBackUrl="~/Order.aspx" />
        &nbsp;&nbsp;
        <asp:Button ID="btnCheckOut" Runat="server" 
            Text="Check Out" /><br /><br />
        <asp:LoginStatus ID="LoginStatus1" runat="server" />    
    </div>
    </form>
</body>
</html>
