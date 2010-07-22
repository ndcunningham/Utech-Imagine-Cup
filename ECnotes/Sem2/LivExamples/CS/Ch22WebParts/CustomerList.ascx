<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CustomerList.ascx.cs" Inherits="CustomerList" %>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="Data Source=localhost\SQLExpress;
        Initial Catalog=Halloween;
        Integrated Security=True" 
    SelectCommand="SELECT FirstName, LastName, Email, PhoneNumber
                   FROM Customers ORDER BY LastName">
</asp:SqlDataSource>

<asp:GridView ID="GridView1" runat="server" 
    DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True" 
    PageSize="6" Width="600px">
</asp:GridView>
