<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Authentication</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong>The Halloween Store - Order Page<br />
            <br />
        </strong>Anonymous users and authenticated users can access this page.<br />
        <br />
        <!-- example -->
        <asp:LoginView ID="LoginView1" runat="server">
            <LoggedInTemplate>
                <asp:LoginName ID="LoginName1" runat="server" BorderWidth="0px"
                    FormatString="You are logged in. {0}" Width="363px" /><br />
                <asp:LoginStatus ID="LoginStatus2" runat="server" />
            </LoggedInTemplate>
            <AnonymousTemplate>
                <asp:Label ID="Label1" runat="server"
                    Text="You are not logged in." Width="148px"></asp:Label><br />
                <asp:LoginStatus ID="LoginStatus1" runat="server" />
            </AnonymousTemplate>
        </asp:LoginView>
    
    </div>
    </form>
</body>
</html>
