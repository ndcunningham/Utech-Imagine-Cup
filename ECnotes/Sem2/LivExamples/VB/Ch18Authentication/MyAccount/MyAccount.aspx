<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MyAccount.aspx.vb" Inherits="MyAccount" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Authentication</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="The Halloween Store - My Account"></asp:Label>
        <br />
        <br />
        (Only authenticated users can access this page.)<br />
        <br />
        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="ChangePassword.aspx">Change Password</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="UnderConstruction.aspx">Track Packages</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="UnderConstruction.aspx">Change Billing Address</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="UnderConstruction.aspx">Change Shipping Address</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="UnderConstruction.aspx">Change Preferences</asp:HyperLink>
        <br />
        <br />
        You are logged in as:
        <asp:LoginName ID="LoginName1" runat="server" />
        <br />
        <asp:LoginStatus ID="LoginStatus1" runat="server" />
    
    </div>
    </form>
</body>
</html>
