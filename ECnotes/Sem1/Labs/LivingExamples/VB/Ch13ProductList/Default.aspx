<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Product List</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="Image1" runat="server"
            ImageUrl="~/Images/banner.jpg" /><br /><br />
        Choose a category:
        <asp:DropDownList ID="ddlCategory" runat="server"
             AutoPostBack="True" Width="130px" DataSourceID="SqlDataSource1"
             DataTextField="LongName" DataValueField="CategoryID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>"
            SelectCommand="SELECT [CategoryID], [LongName]
                FROM [Categories]
                ORDER BY [LongName]">
        </asp:SqlDataSource>
        <br />
        <br />
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
            <HeaderTemplate>
                <table>
                    <tr>
                        <td style="width: 100px">ID</td>
                        <td style="width: 200px">Product</td>
                        <td style="width: 80px" align="right">Unit Price</td>
                        <td style="width: 80px" align="right">On Hand</td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemTemplate>
                <table>
                    <tr>
                        <td style="width: 100px">
                            <asp:Label ID="lblID" runat="server"
                                Text='<%# Eval("ProductID") %>'></asp:Label></td>
                        <td style="width: 200px">
                            <asp:Label ID="lblName" runat="server"
                                Text='<%# Eval("Name") %>'></asp:Label></td>
                        <td style="width: 80px" align="right">
                            <asp:Label ID="lblUnitPrice" runat="server"
                                Text='<%# Eval("UnitPrice", "{0:c}") %>'></asp:Label></td>
                        <td style="width: 80px" align="right">
                            <asp:Label ID="lblOnHand" runat="server"
                                Text='<%# Eval("OnHand") %>'></asp:Label></td>
                    </tr>
                </table>
            </ItemTemplate>
            <AlternatingItemStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
            ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>"
            SelectCommand="SELECT [ProductID], [Name], [UnitPrice], [OnHand]
                FROM [Products]
                WHERE ([CategoryID] = @CategoryID)
                ORDER BY [ProductID]">
            <SelectParameters>
                <asp:ControlParameter  Name="CategoryID" Type="String"
                    ControlID="ddlCategory" PropertyName="SelectedValue"  />
            </SelectParameters>
        </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
