<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Product Maintenance (FormView)</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/banner.jpg" />
        <br />
        <br />
        <table >
          <tr>
            <td style="width: 300px" valign="top">
                <asp:GridView ID="GridView1" runat="server" 
                    AllowSorting="True" AllowPaging="True"
                    DataKeyNames="ProductID" DataSourceID="SqlDataSource1"
                    AutoGenerateColumns="False" 
                    CellPadding="4"  ForeColor="Black" GridLines="None">
                    <Columns>
                      <asp:BoundField DataField="ProductID" HeaderText="ID" 
                          ReadOnly="True" SortExpression="ProductID">
                          <HeaderStyle HorizontalAlign="Left"  />
                          <ItemStyle Width="75px" />
                      </asp:BoundField>
                      <asp:BoundField DataField="Name" HeaderText="Name" 
                          SortExpression="Name">
                          <HeaderStyle HorizontalAlign="Left" />
                          <ItemStyle Width="200px" />
                      </asp:BoundField>
                      <asp:BoundField DataField="CategoryID" HeaderText="Category" 
                          SortExpression="CategoryID" />
                      <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                    </Columns>
                    <HeaderStyle BackColor="Silver" Font-Bold="True" 
                        ForeColor="White"/>
                    <RowStyle BackColor="White" ForeColor="Black" />
                    <AlternatingRowStyle BackColor="WhiteSmoke" ForeColor="Black" />
                    <SelectedRowStyle BackColor="Blue" ForeColor="White" />
                    <FooterStyle BackColor="Silver" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="Silver" ForeColor="Blue" 
                        HorizontalAlign="Center" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>"
                    SelectCommand="SELECT [ProductID], [Name], [CategoryID], 
                        [UnitPrice], [OnHand] FROM [Products] ORDER BY [ProductID]">
                 </asp:SqlDataSource>
              </td>
              <td style="width: 400px" valign="top">
                  <asp:FormView ID="FormView1" runat="server" BackColor="White" BorderColor="#999999"
                      BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="ProductID"
                      DataSourceID="SqlDataSource2" GridLines="Vertical" Width="300px">
                      <FooterStyle BackColor="Silver" ForeColor="White" />
                      <RowStyle BackColor="WhiteSmoke" ForeColor="Black" />
                      <EditItemTemplate>
                          ProductID:
                          <asp:Label ID="ProductIDLabel1" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label><br />
                          Name:
                          <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>'>
                          </asp:TextBox><br />
                          ShortDescription:
                          <asp:TextBox ID="ShortDescriptionTextBox" runat="server" Text='<%# Bind("ShortDescription") %>'>
                          </asp:TextBox><br />
                          LongDescription:
                          <asp:TextBox ID="LongDescriptionTextBox" runat="server" Text='<%# Bind("LongDescription") %>'>
                          </asp:TextBox><br />
                          CategoryID:
                          <asp:TextBox ID="CategoryIDTextBox" runat="server" Text='<%# Bind("CategoryID") %>'>
                          </asp:TextBox><br />
                          ImageFile:
                          <asp:TextBox ID="ImageFileTextBox" runat="server" Text='<%# Bind("ImageFile") %>'>
                          </asp:TextBox><br />
                          UnitPrice:
                          <asp:TextBox ID="UnitPriceTextBox" runat="server" Text='<%# Bind("UnitPrice") %>'>
                          </asp:TextBox><br />
                          OnHand:
                          <asp:TextBox ID="OnHandTextBox" runat="server" Text='<%# Bind("OnHand") %>'>
                          </asp:TextBox><br />
                          <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                              Text="Update">
                          </asp:LinkButton>
                          <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                              Text="Cancel">
                          </asp:LinkButton>
                      </EditItemTemplate>
                      <InsertItemTemplate>
                          ProductID:
                          <asp:TextBox ID="ProductIDTextBox" runat="server" Text='<%# Bind("ProductID") %>'>
                          </asp:TextBox><br />
                          Name:
                          <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>'>
                          </asp:TextBox><br />
                          ShortDescription:
                          <asp:TextBox ID="ShortDescriptionTextBox" runat="server" Text='<%# Bind("ShortDescription") %>'>
                          </asp:TextBox><br />
                          LongDescription:
                          <asp:TextBox ID="LongDescriptionTextBox" runat="server" Text='<%# Bind("LongDescription") %>'>
                          </asp:TextBox><br />
                          CategoryID:
                          <asp:TextBox ID="CategoryIDTextBox" runat="server" Text='<%# Bind("CategoryID") %>'>
                          </asp:TextBox><br />
                          ImageFile:
                          <asp:TextBox ID="ImageFileTextBox" runat="server" Text='<%# Bind("ImageFile") %>'>
                          </asp:TextBox><br />
                          UnitPrice:
                          <asp:TextBox ID="UnitPriceTextBox" runat="server" Text='<%# Bind("UnitPrice") %>'>
                          </asp:TextBox><br />
                          OnHand:
                          <asp:TextBox ID="OnHandTextBox" runat="server" Text='<%# Bind("OnHand") %>'>
                          </asp:TextBox><br />
                          <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                              Text="Insert">
                          </asp:LinkButton>
                          <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                              Text="Cancel">
                          </asp:LinkButton>
                      </InsertItemTemplate>
                      <PagerStyle BackColor="Silver" ForeColor="White" HorizontalAlign="Center" />
                      <HeaderStyle BackColor="Silver" Font-Bold="True" ForeColor="White" />
                      <EditRowStyle BackColor="Silver" Font-Bold="True" ForeColor="White" />
                      <ItemTemplate>
                          ProductID:
                          <asp:Label ID="ProductIDLabel" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label><br />
                          Name:
                          <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>'></asp:Label><br />
                          ShortDescription:
                          <asp:Label ID="ShortDescriptionLabel" runat="server" Text='<%# Bind("ShortDescription") %>'>
                          </asp:Label><br />
                          LongDescription:
                          <asp:Label ID="LongDescriptionLabel" runat="server" Text='<%# Bind("LongDescription") %>'>
                          </asp:Label><br />
                          CategoryID:
                          <asp:Label ID="CategoryIDLabel" runat="server" Text='<%# Bind("CategoryID") %>'>
                          </asp:Label><br />
                          ImageFile:
                          <asp:Label ID="ImageFileLabel" runat="server" Text='<%# Bind("ImageFile") %>'></asp:Label><br />
                          UnitPrice:
                          <asp:Label ID="UnitPriceLabel" runat="server" Text='<%# Bind("UnitPrice", "{0:c}") %>'></asp:Label><br />
                          OnHand:
                          <asp:Label ID="OnHandLabel" runat="server" Text='<%# Bind("OnHand") %>'></asp:Label><br />
                          <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
                              Text="Edit">
                          </asp:LinkButton>
                          <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete"
                              Text="Delete">
                          </asp:LinkButton>
                          <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
                              Text="New">
                          </asp:LinkButton>
                      </ItemTemplate>
                  </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>"
                      SelectCommand="SELECT [ProductID], [Name], [ShortDescription], 
                          [LongDescription], [CategoryID], [ImageFile], [UnitPrice], [OnHand] 
                          FROM [Products] WHERE ([ProductID] = @ProductID)" 
                          ConflictDetection="CompareAllValues" 
                          OldValuesParameterFormatString="original_{0}" 
                          DeleteCommand="DELETE FROM [Products] 
                                         WHERE ([ProductID] = @original_ProductID) AND 
                                               ([Name] = @original_Name) AND 
                                               ([ShortDescription] = @original_ShortDescription) AND 
                                               ([LongDescription] = @original_LongDescription) AND 
                                               ([CategoryID] = @original_CategoryID) AND 
                                               (([ImageFile] = @original_ImageFile) OR (ImageFile IS NULL) AND (@original_ImageFile IS NULL))) AND 
                                               ([UnitPrice] = @original_UnitPrice) AND ([OnHand] = @original_OnHand)" 
                          InsertCommand="INSERT INTO [Products] ([ProductID], [Name], 
                                                     [ShortDescription], [LongDescription], [CategoryID], 
                                                     [ImageFile], [UnitPrice], [OnHand]) 
                                         VALUES (@ProductID, @Name, @ShortDescription, @LongDescription, 
                                                 @CategoryID, @ImageFile, @UnitPrice, @OnHand)" 
                          UpdateCommand="UPDATE [Products] 
                                         SET [Name] = @Name, 
                                             [ShortDescription] = @ShortDescription, 
                                             [LongDescription] = @LongDescription, 
                                             [CategoryID] = @CategoryID, 
                                             [ImageFile] = @ImageFile, 
                                             [UnitPrice] = @UnitPrice, 
                                             [OnHand] = @OnHand 
                                         WHERE ([ProductID] = @original_ProductID) AND 
                                               ([Name] = @original_Name) AND 
                                               ([ShortDescription] = @original_ShortDescription) AND 
                                               ([LongDescription] = @original_LongDescription) AND 
                                               ([CategoryID] = @original_CategoryID) AND 
                                               (([ImageFile] = @original_ImageFile) OR (ImageFile IS NULL) AND (@original_ImageFile IS NULL))) AND 
                                               ([UnitPrice] = @original_UnitPrice) AND ([OnHand] = @original_OnHand)">
                      <SelectParameters>
                          <asp:ControlParameter ControlID="GridView1" Name="ProductID" 
                              PropertyName="SelectedValue" Type="String" />
                      </SelectParameters>
                      <DeleteParameters>
                          <asp:Parameter Name="original_ProductID" Type="String" />
                          <asp:Parameter Name="original_Name" Type="String" />
                          <asp:Parameter Name="original_ShortDescription" Type="String" />
                          <asp:Parameter Name="original_LongDescription" Type="String" />
                          <asp:Parameter Name="original_CategoryID" Type="String" />
                          <asp:Parameter Name="original_ImageFile" Type="String" />
                          <asp:Parameter Name="original_UnitPrice" Type="Decimal" />
                          <asp:Parameter Name="original_OnHand" Type="Int32" />
                      </DeleteParameters>
                      <UpdateParameters>
                          <asp:Parameter Name="Name" Type="String" />
                          <asp:Parameter Name="ShortDescription" Type="String" />
                          <asp:Parameter Name="LongDescription" Type="String" />
                          <asp:Parameter Name="CategoryID" Type="String" />
                          <asp:Parameter Name="ImageFile" Type="String" />
                          <asp:Parameter Name="UnitPrice" Type="Decimal" />
                          <asp:Parameter Name="OnHand" Type="Int32" />
                          <asp:Parameter Name="original_ProductID" Type="String" />
                          <asp:Parameter Name="original_Name" Type="String" />
                          <asp:Parameter Name="original_ShortDescription" Type="String" />
                          <asp:Parameter Name="original_LongDescription" Type="String" />
                          <asp:Parameter Name="original_CategoryID" Type="String" />
                          <asp:Parameter Name="original_ImageFile" Type="String" />
                          <asp:Parameter Name="original_UnitPrice" Type="Decimal" />
                          <asp:Parameter Name="original_OnHand" Type="Int32" />
                      </UpdateParameters>
                      <InsertParameters>
                          <asp:Parameter Name="ProductID" Type="String" />
                          <asp:Parameter Name="Name" Type="String" />
                          <asp:Parameter Name="ShortDescription" Type="String" />
                          <asp:Parameter Name="LongDescription" Type="String" />
                          <asp:Parameter Name="CategoryID" Type="String" />
                          <asp:Parameter Name="ImageFile" Type="String" />
                          <asp:Parameter Name="UnitPrice" Type="Decimal" />
                          <asp:Parameter Name="OnHand" Type="Int32" />
                      </InsertParameters>
                  </asp:SqlDataSource><br />
                  <asp:Label ID="lblError" runat="server" ForeColor="Red" 
                      EnableViewState="False"></asp:Label>&nbsp;
              </td>
          </tr>
        </table>
    </div>
    </form>
</body>
</html>

