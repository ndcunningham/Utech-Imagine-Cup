<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Maintenance.aspx.vb" Inherits="Maintenance" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Authentication</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong>The Halloween Store - Maintenance<br />
            <br />
        </strong>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="UnderConstruction.aspx">Maintain categories</asp:HyperLink>
        <br />
        <br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="UnderConstruction.aspx">Maintain products</asp:HyperLink>
        &nbsp;&nbsp;<br />
        <br />
        <asp:LoginName ID="LoginName1" runat="server" FormatString="You are logged in as: {0}" />
        <br />
        If this isn't your correct username, please&nbsp;<asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="../Login.aspx">click here.</asp:HyperLink><br />
        <br />
        <asp:LoginStatus ID="LoginStatus1" runat="server" />
    
    </div>
    </form>
</body>
</html>
