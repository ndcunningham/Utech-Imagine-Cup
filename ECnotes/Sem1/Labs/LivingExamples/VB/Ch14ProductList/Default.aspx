<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Product List</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/banner.jpg" /><br />
        <br />
        <asp:GridView ID="GridView1" runat="server"
            AllowSorting="True"
            AllowPaging="True" PageSize="8"
            DataKeyNames="ProductID" DataSourceID="SqlDataSource1"
            AutoGenerateColumns="False"
            CellPadding="4" GridLines="None" ForeColor="Black">
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="ID"
                    ReadOnly="True" SortExpression="ProductID">
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="75px" />
                </asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="Name"
                    SortExpression="Name">
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:BoundField DataField="CategoryID" HeaderText="Category"
                    SortExpression="CategoryID, Name" />
                <asp:BoundField DataField="UnitPrice" DataFormatString="{0:c}"
                    HeaderText="Unit Price" HtmlEncode="False">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
                <asp:BoundField DataField="OnHand" HeaderText="On Hand">
                    <ItemStyle HorizontalAlign="Right" />
                </asp:BoundField>
            </Columns>
            <HeaderStyle BackColor="Silver" Font-Bold="True"
                ForeColor="White" />
            <RowStyle BackColor="White" ForeColor="Black" />
            <AlternatingRowStyle BackColor="WhiteSmoke" ForeColor="Black" />
            <FooterStyle BackColor="Silver" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="Silver" ForeColor="Blue"
                HorizontalAlign="Center" />
            <PagerSettings Mode="NumericFirstLast" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>"
            SelectCommand="SELECT [ProductID], [Name], [CategoryID], [UnitPrice], [OnHand] 
                           FROM [Products] 
                           ORDER BY [ProductID]">
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
