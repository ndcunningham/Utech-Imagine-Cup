<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Category Maintenance w/Templates</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/banner.jpg" /><br /><br />
        <h2>Category Maintenance</h2>
        <asp:GridView ID="GridView1" runat="server"
            AutoGenerateColumns="False" DataKeyNames="CategoryID"
            DataSourceID="SqlDataSource1" ForeColor="Black">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label id="lblGridCategory" runat="server"
                            Text='<%# Bind("CategoryID") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Label id="lblGridCategory" runat="server"
                            Text='<%# Bind("CategoryID") %>'></asp:Label>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="100px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Short Name">
                    <ItemTemplate>
                        <asp:Label ID="lblGridShortName" runat="server"
                            Text='<%# Bind("ShortName") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGridShortName" runat="server"
                            width = "125px" Text='<%# Bind("ShortName") %>'>
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="txtGridShortName" 
                            ErrorMessage="Short Name is a required field."
                            ValidationGroup="Edit">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Long Name">
                    <ItemTemplate>
                        <asp:Label ID="lblGridLongName" runat="server"
                            Text='<%# Bind("LongName") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGridLongName" runat="server"
                            width = "180px" Text='<%# Bind("LongName") %>'>
                        </asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="txtGridLongName" 
                            ErrorMessage="Long Name is a required field."
                            ValidationGroup="Edit">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" />
                    <ItemStyle Width="200px" />
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" ShowEditButton="True"
                    CausesValidation="True" ValidationGroup="Edit" />
                <asp:CommandField ButtonType="Button" ShowDeleteButton="True"
                    CausesValidation="False" />
            </Columns>
            <HeaderStyle BackColor="Silver" Font-Bold="True"
                ForeColor="White" />
            <RowStyle BackColor="White" ForeColor="Black" />
            <AlternatingRowStyle BackColor="WhiteSmoke" ForeColor="Black" />
            <EditRowStyle BackColor="Blue" ForeColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConflictDetection="CompareAllValues"
            ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>" 
            OldValuesParameterFormatString="original_{0}"
            SelectCommand="SELECT [CategoryID], [ShortName], [LongName]
                           FROM [Categories]"
            DeleteCommand="DELETE FROM [Categories]
                           WHERE ([CategoryID] = @original_CategoryID) AND 
                                 ([ShortName] = @original_ShortName) AND 
                                 ([LongName] = @original_LongName)"
            UpdateCommand="UPDATE [Categories] 
                           SET [ShortName] = @ShortName,
                               [LongName] = @LongName
                           WHERE ([CategoryID] = @original_CategoryID) AND 
                                 ([ShortName] = @original_ShortName) AND 
                                 ([LongName] = @original_LongName)"
            InsertCommand="INSERT INTO [Categories]
                                  ([CategoryID], [ShortName], [LongName])
                           VALUES (@CategoryID, @ShortName, @LongName)">
            <DeleteParameters>
                <asp:Parameter Name="original_CategoryID" Type="String" />
                <asp:Parameter Name="original_ShortName" Type="String" />
                <asp:Parameter Name="original_LongName" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="ShortName" Type="String" />
                <asp:Parameter Name="LongName" Type="String" />
                <asp:Parameter Name="original_CategoryID" Type="String" />
                <asp:Parameter Name="original_ShortName" Type="String" />
                <asp:Parameter Name="original_LongName" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="CategoryID" Type="String" />
                <asp:Parameter Name="ShortName" Type="String" />
                <asp:Parameter Name="LongName" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server"
            HeaderText="Please correct the following errors:"
            ValidationGroup="Edit" />
        <br />
        To create a new category, enter the category information
        and click Add New Category.<br />
        <asp:Label ID="lblError" runat="server" EnableViewState="False"
            ForeColor="Red"></asp:Label><br />
        <table>
            <tr>
                <td style="width: 100px">ID:</td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtID" runat="server"
                        EnableViewState="False" Width="100px"></asp:TextBox></td>
                <td style="width: 194px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                        runat="server" ControlToValidate="txtID" 
                        ErrorMessage="ID is a required field." 
                        ValidationGroup="New"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">Short Name:</td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtShortName" runat="server"
                        EnableViewState="False" Width="200px"></asp:TextBox></td>
                <td style="width: 194px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                        runat="server" ControlToValidate="txtShortName"
                        ErrorMessage="Short Name is a required field." 
                        ValidationGroup="New"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">Long Name:</td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtLongName" runat="server"
                        EnableViewState="False" Width="200px"></asp:TextBox></td>
                <td style="width: 194px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                        runat="server" ControlToValidate="txtLongName"
                        ErrorMessage="Long Name is a required field." 
                        ValidationGroup="New"></asp:RequiredFieldValidator></td>
            </tr>
        </table>
        <br />
        <asp:Button ID="btnAdd" runat="server" Text="Add New Category" 
            ValidationGroup="New" />
    </div>
    </form>
</body>
</html>
