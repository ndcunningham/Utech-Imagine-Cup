<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Confirmation.aspx.cs" Inherits="Confirmation" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Chapter 17: Halloween Store</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/banner.jpg" /><br />
        <br />
        <asp:Label ID="lblConfirm" runat="server"></asp:Label><br />
        <br />
        <asp:Button ID="btnReturn" runat="server" Text="Return to Order Page"
            OnClick="btnReturn_Click" />
    </div>
    </form>
</body>
</html>
