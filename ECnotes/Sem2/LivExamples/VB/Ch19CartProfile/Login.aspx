<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Chapter 19: Cart Profile</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="Image1" runat="server"
            ImageUrl="~/Images/banner.jpg" /><br /><br />
        <asp:Login ID="Login1" runat="server">
        </asp:Login>
        <br />
        Forgot your password?
        <asp:HyperLink ID="HyperLink1" runat="server"
            NavigateUrl="PasswordRecovery.aspx">Click here
            </asp:HyperLink>
        <br />
        Need to create a new account?
        <asp:HyperLink ID="HyperLink2" runat="server"
            NavigateUrl="CreateUser.aspx">Click here
            </asp:HyperLink>
        <br />
    </div>
    </form>
</body>
</html>
