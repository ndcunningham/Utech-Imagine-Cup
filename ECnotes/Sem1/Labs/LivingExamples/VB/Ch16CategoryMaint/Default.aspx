<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Chapter 16: Category Maintenance</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/banner.jpg" /><br /><br />
        <h2>Category Maintenance</h2>
        <asp:GridView ID="GridView1" runat="server" 
            DataSourceID="ObjectDataSource1" DataKeyNames="CategoryID"
            AutoGenerateColumns="False" ForeColor="Black" >
            <Columns>
                <asp:BoundField DataField="CategoryID" ReadOnly="True"
                    HeaderText="Category ID" >
                    <ItemStyle Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="ShortName" HeaderText="Short Name" >
                    <ItemStyle Width="150px" />
                </asp:BoundField>
                <asp:BoundField DataField="LongName" HeaderText="Long Name" >
                    <ItemStyle Width="200px" />
                </asp:BoundField>
                <asp:CommandField ButtonType="Button" ShowEditButton="True" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True" />
            </Columns>
            <HeaderStyle BackColor="Silver" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="White" ForeColor="Black" />
            <AlternatingRowStyle BackColor="WhiteSmoke" ForeColor="Black" />
            <EditRowStyle BackColor="Blue" ForeColor="White" />
        </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            TypeName="CategoryDB" 
            SelectMethod="GetCategories" 
            InsertMethod="InsertCategory" 
            DeleteMethod="DeleteCategory"
            UpdateMethod="UpdateCategory"
            ConflictDetection="CompareAllValues" 
            OldValuesParameterFormatString="original_{0}" >
            <UpdateParameters>
                <asp:Parameter Name="CategoryID" Type="String" />
                <asp:Parameter Name="ShortName" Type="String" />
                <asp:Parameter Name="LongName" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="CategoryID" Type="String" />
                <asp:Parameter Name="ShortName" Type="String" />
                <asp:Parameter Name="LongName" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource><br />
        
        <asp:Label ID="lblError" runat="server" EnableViewState="False"
            ForeColor="Red">
        </asp:Label><br />
        To create a new category, enter the category information
        and click Insert.<br /><br />
        <asp:DetailsView ID="DetailsView1" runat="server" 
            AutoGenerateRows="False" DataSourceID="ObjectDataSource1"
            DefaultMode="Insert" Height="50px" Width="300px" 
            GridLines="None" BorderStyle="None" CellSpacing="5" >
            <Fields>
                <asp:BoundField DataField="CategoryID" 
                    HeaderText="Category ID:" />
                <asp:BoundField DataField="ShortName" 
                    HeaderText="Short Name:" />
                <asp:BoundField DataField="LongName" 
                    HeaderText="Long Name:" />
                <asp:CommandField ButtonType="Button" 
                    ShowInsertButton="True" />
            </Fields>
        </asp:DetailsView>
    </div>
    </form>
</body>
</html>
