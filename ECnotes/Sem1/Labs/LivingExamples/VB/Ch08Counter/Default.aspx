<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Chapter 8: Counter</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label ID="lblSessionClicks" runat="server"></asp:Label><br />
        <br />
        <asp:Label ID="lblApplicationClicks" runat="server"></asp:Label><br />
        <br />
        <asp:Button ID="btnPost" runat="server" Text="Post" />&nbsp;</div>
    </form>
</body>
</html>
