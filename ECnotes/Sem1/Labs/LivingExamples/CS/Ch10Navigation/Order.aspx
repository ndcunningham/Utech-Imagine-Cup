<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <br />
    <asp:Label ID="Label1" runat="server" Text="Please select a product:"></asp:Label>
    <asp:DropDownList ID="ddlProducts" runat="server" AutoPostBack="True" DataSourceID="AccessDataSource1"
        DataTextField="Name" DataValueField="ProductID" Width="150px">
    </asp:DropDownList>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/Halloween.mdb"
        SelectCommand="SELECT [ProductID], [Name], [ShortDescription],&#13;&#10;                [LongDescription], [ImageFile], [UnitPrice] &#13;&#10;                FROM [Products] ORDER BY [Name]">
    </asp:AccessDataSource>
    <br />
    <table>
        <tr>
            <td style="width: 250px; height: 22px">
                <asp:Label ID="lblName" runat="server" Font-Bold="False" Font-Size="Larger">
                </asp:Label>
            </td>
            <td rowspan="4" style="width: 20px">
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
                <asp:Label ID="lblUnitPrice" runat="server" Font-Bold="True" Font-Size="Larger">
                </asp:Label>
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Larger" Text="each">
                </asp:Label>
            </td>
        </tr>
    </table>
    <br />
    <asp:Label ID="Label3" runat="server" BorderWidth="0px" Text="Quantity:" Width="80px"></asp:Label>
    <asp:TextBox ID="txtQuantity" runat="server" Width="80px"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtQuantity"
        Display="Dynamic" ErrorMessage="Quantity is a required field.">
    </asp:RequiredFieldValidator>
    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtQuantity"
        Display="Dynamic" ErrorMessage="Quantity must range from 1 to 500." MaximumValue="500"
        MinimumValue="1" Type="Integer">
    </asp:RangeValidator><br />
    <br />
    <asp:Button ID="btnAdd" runat="server" Text="Add to Cart" OnClick="btnAdd_Click" />&nbsp;
    <asp:Button ID="btnCart" runat="server" CausesValidation="False" PostBackUrl="~/Cart.aspx"
        Text="Go to Cart" />    
    <br /><br />
</asp:Content>
