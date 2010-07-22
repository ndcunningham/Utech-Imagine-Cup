<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="Menu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Authentication</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="The Halloween Store - Authentication Tests"></asp:Label>
        &nbsp;<br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Order.aspx">Order a Product</asp:HyperLink>
        <br />
        (All users including anonymous users)<br />
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="MyAccount/MyAccount.aspx">Edit My Account</asp:HyperLink>
        <br />
        (All authenticated users)<br />
        <br />
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Maintenance/Maintenance.aspx">Maintain Data Tables</asp:HyperLink>
        <br />
        (Only users associated with the Admin role)<br />
    
    </div>
    </form>
</body>
</html>
