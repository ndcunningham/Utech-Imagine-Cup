<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Authentication</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Font-Bold="True"
            Text="The Halloween Store - Log In"></asp:Label>
        <br />
        <br />
        <asp:Login ID="Login1" runat="server">
        </asp:Login>
        <br />
        Forgot your password?
        <asp:HyperLink ID="HyperLink1" runat="server"
            NavigateUrl="PasswordRecovery.aspx">Click here</asp:HyperLink>
        <br />
        Need to create a new account?
        <asp:HyperLink ID="HyperLink2" runat="server"
            NavigateUrl="CreateUser.aspx">Click here</asp:HyperLink>
        <br />
    </div>
    </form>
</body>
</html>
