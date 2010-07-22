<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" 
AutoEventWireup="false" CodeFile="Order.aspx.vb" 
Inherits="Order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <br />
    <asp:Label ID="Label1" runat="server"
        Text="Please select a product:"></asp:Label>
    <asp:DropDownList ID="ddlProducts" runat="server" Width = "150px"
        DataSourceID="AccessDataSource1" DataTextField="Name"
        DataValueField="ProductID" AutoPostBack="True">
    </asp:DropDownList>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server"
        DataFile="~/App_Data/Halloween.mdb"
        SelectCommand="SELECT [ProductID], [Name], [ShortDescription],&#13;&#10;            [LongDescription], [ImageFile], [UnitPrice] &#13;&#10;            FROM [Products] ORDER BY [Name]">
    </asp:AccessDataSource>
    <br />
    <table>
        <tr >
            <td style="width: 250px; height: 22px">
                <asp:Label ID="lblName" runat="server" 
                    Font-Bold="false" Font-Size="Larger">
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
                    Font-Bold="true" Font-Size="Larger">
                </asp:Label>
                <asp:Label ID="Label2" runat="server" Text="each" 
                    Font-Bold="true" Font-Size="Larger">
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
        ErrorMessage="Quantity is a required field."></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator1" runat="server" 
        ControlToValidate="txtQuantity" Display="Dynamic" 
        ErrorMessage="Quantity must be greater than zero." 
        Operator="GreaterThan" Type="Integer" 
        ValueToCompare="0"></asp:CompareValidator><br /><br />
    <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" />&nbsp;
    <asp:Button ID="btnCart" runat="server" CausesValidation="False" 
        PostBackUrl="~/Cart.aspx" Text="Go to Cart" /></asp:Content>
