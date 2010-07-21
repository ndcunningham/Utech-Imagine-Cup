<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Order.aspx.vb" Inherits="Order" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Shopping Cart</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="Image1" runat="server"
            ImageUrl="~/Images/banner.jpg" /><br /><br />
        <asp:Label ID="Label1" runat="server"
            Text="Please select a product:"></asp:Label>
        <asp:DropDownList ID="ddlProducts" runat="server" Width="150px"
            AutoPostBack="True" DataSourceID="SqlDataSource1"
            DataTextField="Name" DataValueField="ProductID">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>"
            SelectCommand="SELECT [ProductID], [Name] FROM [Products]
                ORDER BY [Name]">
        </asp:SqlDataSource>
        <br />
        <asp:FormView ID="FormView1" runat="server"
            DataSourceID="SqlDataSource2">
            <ItemTemplate>
              <table>
                <tr>
                  <td style="height: 22px; width: 250px">
                    <asp:Label ID="lblName" runat="server"
                        Font-Bold="True" Font-Size="Larger"
                        Text='<%# Bind("Name") %>' >
                    </asp:Label>
                  </td>
                  <td rowspan="4" valign="top" style="width: 20px"></td>
                  <td rowspan="4" valign="top">
                    <asp:Image ID="imgProduct" runat="server" Height="200px"
                        ImageUrl='<%# Bind("ImageFile", "Images/Products/{0}") %>' />
                  </td>
                </tr>
                <tr>
                  <td style="width: 250px">
                    <asp:Label ID="lblShortDescription" runat="server"
                        Text='<%# Bind("ShortDescription") %>'>
                    </asp:Label>
                  </td>
                </tr>
                <tr>
                  <td style="width: 250px">
                    <asp:Label ID="lblLongDescription" runat="server"
                        Text='<%# Bind("LongDescription") %>'>
                    </asp:Label>
                  </td>
                </tr>
                <tr>
                  <td style="width: 250px">
                    <asp:Label ID="lblUnitPrice" runat="server"
                        Font-Bold="True" Font-Size="Larger"
                        Text='<%# Bind("UnitPrice", "{0:c} each") %>'>
                    </asp:Label>
                  </td>
                </tr>
              </table>
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
            ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>"
            SelectCommand="SELECT [ProductID], [Name], [ShortDescription],
                  [LongDescription], [ImageFile], [UnitPrice] 
                FROM [Products] 
                WHERE ([ProductID] = @ProductID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlProducts" Name="ProductID"
                    PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource><br />
        <asp:Label ID="Label2" runat="server" BorderWidth="0px" Text="Quantity:" 
            Width="80px"></asp:Label>
        <asp:TextBox ID="txtQuantity" runat="server" Width="80px"></asp:TextBox>
        <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txtQuantity" Display="Dynamic" 
            ErrorMessage="Quantity is a required field.">
        </asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToValidate="txtQuantity" Display="Dynamic" 
            ErrorMessage="Quantity must be greater than zero." 
            Operator="GreaterThan" ValueToCompare="0">
        </asp:CompareValidator><br /><br />
        <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" />&nbsp;
        <asp:Button ID="Button1" runat="server"  Text="Go to Cart"
            CausesValidation="False" PostBackUrl="~/Cart.aspx" />
    </div>
    </form>
</body>
</html>
