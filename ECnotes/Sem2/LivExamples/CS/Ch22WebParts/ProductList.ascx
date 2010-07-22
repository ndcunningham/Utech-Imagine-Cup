<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ProductList.ascx.cs" Inherits="ProductList" %>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="Data Source=localhost\SQLExpress;
        Initial Catalog=Halloween;
        Integrated Security=True" 
    SelectCommand="SELECT ProductID, Name, UnitPrice 
                   FROM Products ORDER BY Name">
</asp:SqlDataSource>

<asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1"
    AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
    PageSize="6" Width="400px">
    <Columns>
        <asp:BoundField DataField="ProductID" HeaderText="ProductID" 
            ReadOnly="True" SortExpression="ProductID" />
        <asp:BoundField DataField="Name" HeaderText="Name" 
            SortExpression="Name" />
        <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" 
            SortExpression="UnitPrice" 
            DataFormatString="{0:c}" HtmlEncode="False" />
    </Columns>
</asp:GridView>

