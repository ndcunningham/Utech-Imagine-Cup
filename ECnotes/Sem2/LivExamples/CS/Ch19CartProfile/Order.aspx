<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Cart Profile</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="Image1" runat="server"
            ImageUrl="~/Images/banner.jpg" /><br /><br />
        <asp:Label ID="Label1" runat="server" Text="Please select a product:">
        </asp:Label>
        <asp:DropDownList ID="ddlProducts" runat="server" AutoPostBack="True" 
            DataSourceID="AccessDataSource1" DataTextField="Name" 
            DataValueField="ProductID" Width="150px">
        </asp:DropDownList>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
            DataFile="~\\App_Data\\Halloween.mdb"
            SelectCommand="SELECT [Name], [ProductID], [ShortDescription], 
                [LongDescription], [UnitPrice], [ImageFile] 
                FROM [Products] ORDER BY [Name]">
        </asp:AccessDataSource>
        <br />
        <br />
        <table>
            <tr>
                <td style="height: 22px; width: 250px">
                    <asp:Label ID="lblName" runat="server" Font-Bold="True" 
                        Font-Size="Larger"></asp:Label>
                </td>
                <td style="width: 20px" rowspan="4" valign="top">
                </td>
                <td style="width: 10px" rowspan="4" valign="top">
                    <asp:Image ID="imgProduct" runat="server" Height="200px" />
                </td>
            </tr>
            <tr>
                <td style="width: 250">
                    <asp:Label ID="lblShortDescription" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 250">
                    <asp:Label ID="lblLongDescription" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 250">
                    <asp:Label ID="lblUnitPrice" runat="server" Font-Bold="True" 
                        Font-Size="Larger"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" 
                        Font-Size="Larger" Text="each"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        <asp:Label ID="Label3" runat="server" BorderWidth="0px" Text="Quantity:" 
            Width="80px"></asp:Label>
        <asp:TextBox ID="txtQuantity" runat="server" Width="80px">
        </asp:TextBox>&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txtQuantity" Display="Dynamic" 
            ErrorMessage="Quantity is a required field.">
        </asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToValidate="txtQuantity" Display="Dynamic" 
            ErrorMessage="Quantity must be greater than zero." 
            Operator="GreaterThan" Type="Integer" ValueToCompare="0">
        </asp:CompareValidator><br />
        <br />
        &nbsp;<asp:Button ID="btnAdd" runat="server" Text="Add to Cart" OnClick="btnAdd_Click" />&nbsp;
        <asp:Button ID="btnCart" runat="server" CausesValidation="False" 
            PostBackUrl="~/Cart.aspx" Text="Go To Cart" />
        <br />
        <br />
    </div>
    </form>
</body>
</html>
