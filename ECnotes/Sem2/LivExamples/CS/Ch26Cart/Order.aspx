<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Shopping Cart</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="Image1" runat="server"
            ImageUrl="~/Images/banner.jpg" /><br /><br />
        <asp:Label ID="Label1" runat="server"
            Text="Please select a product:"></asp:Label>
        <asp:DropDownList ID="ddlProducts" runat="server" Width = "150px"
            DataSourceID="AccessDataSource1" DataTextField="Name"
            DataValueField="ProductID" AutoPostBack="True">
        </asp:DropDownList>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server"
            DataFile="~/App_Data/Halloween.mdb"
            SelectCommand="SELECT [ProductID], [Name], [ShortDescription],
                [LongDescription], [ImageFile], [UnitPrice] 
                FROM [Products] ORDER BY [Name]">
        </asp:AccessDataSource>
        <br />
        <table>
            <tr >
                <td style="width: 250px; height: 22px">
                    <asp:Label ID="lblName" runat="server" 
                        Font-Bold="False" Font-Size="Larger">
                    </asp:Label>
                </td>
                <td style="width: 20px" rowspan="4">
                </td>
                <td rowspan="4" valign="top">
                    <asp:Image ID="imgProduct" runat="server" Height="200" />
                </td>
            </tr>
            <tr>
                <td style="width: 250px">
                    <asp:Label ID="lblShortDescription" runat="server">
                    </asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 250px">
                    <asp:Label ID="lblLongDescription" runat="server">
                    </asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 250px">
                    <asp:Label ID="lblUnitPrice" runat="server" 
                        Font-Bold="True" Font-Size="Larger">
                    </asp:Label>
                    <asp:Label ID="Label2" runat="server" Text="each" 
                        Font-Bold="True" Font-Size="Larger">
                    </asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Quantity:" 
            Width="80px" BorderWidth = "0px"></asp:Label>
        <asp:TextBox ID="txtQuantity" runat="server" Width="80px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
            ControlToValidate="txtQuantity" Display="Dynamic"
            ErrorMessage="Quantity is a required field.">
        </asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator1" runat="server"
            ControlToValidate="txtQuantity" Display="Dynamic"
            ErrorMessage="Quantity must range from 1 to 500." 
            MaximumValue="500" MinimumValue="1" Type="Integer">
        </asp:RangeValidator><br /><br />
        <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" OnClick="btnAdd_Click" />&nbsp;
        <asp:Button ID="btnCart" runat="server" CausesValidation="False" 
            PostBackUrl="~/Cart.aspx" Text="Go to Cart" /><br />
        <br />
        &nbsp;<asp:Label ID="lblDaysUntilHalloween" runat="server" Text="Label"></asp:Label></div>
    </form>
</body>
</html>
