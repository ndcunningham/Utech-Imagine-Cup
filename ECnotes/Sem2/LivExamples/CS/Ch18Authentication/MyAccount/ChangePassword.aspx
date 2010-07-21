<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="MyAccount_ChangePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Authentication</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Font-Bold="True"
            Text="The Halloween Store - Your Account"></asp:Label>
        <br />
        <br />
        <!-- example -->
        <asp:ChangePassword ID="ChangePassword1" runat="server"
            CancelDestinationPageUrl="MyAccount.aspx"
            ContinueDestinationPageUrl="MyAccount.aspx">
        </asp:ChangePassword>
    </div>
    </form>
</body>
</html>
