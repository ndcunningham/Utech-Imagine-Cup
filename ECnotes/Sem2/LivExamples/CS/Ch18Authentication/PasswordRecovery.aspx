<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PasswordRecovery.aspx.cs" Inherits="PasswordRecovery" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Authentication</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="Label1" runat="server" Font-Bold="True"
            Text="Welcome to the Halloween Store"></asp:Label>
        <br />
        <br />
        <asp:PasswordRecovery ID="PasswordRecovery1" runat="server">
            <MailDefinition From="vpougatchev@utech.edu.com">
            </MailDefinition>
        </asp:PasswordRecovery>
        </div>
    </form>
</body>
</html>
