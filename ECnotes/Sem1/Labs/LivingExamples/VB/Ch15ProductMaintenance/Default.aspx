<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Product Maintenance</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/banner.jpg" /><br />
        <br />
        <table>
          <tr>
            <td style="width: 300px" valign="top">
              <asp:GridView ID="GridView1" runat="server"
                  AllowSorting="True" AllowPaging="True"
                  DataKeyNames="ProductID" DataSourceID="SqlDataSource1"
                  AutoGenerateColumns="False" SelectedIndex="0"
                  CellPadding="4" GridLines="None" ForeColor="Black">
                  <Columns>
                    <asp:BoundField DataField="ProductID" HeaderText="ID"
                        ReadOnly="True">
                      <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="75px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Name" HeaderText="Name">
                      <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="200px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="CategoryID" HeaderText="Category" />
                    <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                  </Columns>
                  <HeaderStyle BackColor="Silver" Font-Bold="True"
                      ForeColor="White" />
                  <RowStyle BackColor="White" ForeColor="Black" />
                  <AlternatingRowStyle BackColor="WhiteSmoke" ForeColor="Black" />
                  <SelectedRowStyle BackColor="Blue" ForeColor="White" />
                  <FooterStyle BackColor="Silver" Font-Bold="True" ForeColor="White" />
                  <PagerStyle BackColor="Silver" ForeColor="Blue"
                      HorizontalAlign="Center" />
              </asp:GridView>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                  ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>"
                  SelectCommand="SELECT [ProductID], [Name], [CategoryID]
                      FROM [Products] ORDER BY [ProductID]">
              </asp:SqlDataSource>
            </td>
            <td style="width: 400px" valign="top">
                <asp:DetailsView ID="DetailsView1" runat="server" 
                    DataSourceID="SqlDataSource2"  DataKeyNames="ProductID"
                    Height="50px" Width="400px" AutoGenerateRows="False" 
                    BackColor="White" BorderColor="White" BorderStyle="Ridge" 
                    BorderWidth="2px" CellPadding="3" CellSpacing="1" 
                    GridLines="None">
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <Fields>
                        <asp:BoundField DataField="ProductID" HeaderText="Product ID:"
                            ReadOnly="True" SortExpression="ProductID">
                            <HeaderStyle HorizontalAlign="Left" Width="150px" />
                            <ItemStyle Width="250px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Name" HeaderText="Name:">
                            <HeaderStyle HorizontalAlign="Left" Width="150px" />
                            <ItemStyle Width="250px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ShortDescription" 
                           HeaderText="Short Description:">
                            <HeaderStyle HorizontalAlign="Left" Width="150px" />
                            <ItemStyle Width="250px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="LongDescription" 
                            HeaderText="Long Description:">
                            <HeaderStyle HorizontalAlign="Left" Width="150px" />
                            <ItemStyle Width="250px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CategoryID" 
                            HeaderText="Category ID:">
                            <HeaderStyle HorizontalAlign="Left" Width="150px" />
                            <ItemStyle Width="250px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ImageFile" 
                            HeaderText="Image File:" SortExpression="ImageFile">
                            <HeaderStyle HorizontalAlign="Left" Width="150px" />
                            <ItemStyle Width="250px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="UnitPrice" 
                            HeaderText="Unit Price:" DataFormatString="{0:c}" 
                            HtmlEncode="False">
                            <HeaderStyle HorizontalAlign="Left" Width="150px" />
                            <ItemStyle Width="250px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="OnHand" HeaderText="On Hand:">
                            <HeaderStyle HorizontalAlign="Left" Width="150px" />
                            <ItemStyle Width="250px" />
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Button" 
                            ShowDeleteButton="True" 
                            ShowEditButton="True"
                            ShowInsertButton="True" />
                    </Fields>
                    <HeaderStyle BackColor="Silver" Font-Bold="True" 
                        ForeColor="Black" />
                    <EditRowStyle BackColor="Blue" Font-Bold="True" 
                        ForeColor="White" />
                </asp:DetailsView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConflictDetection="CompareAllValues"
                    ConnectionString="<%$ ConnectionStrings:HalloweenConnection %>" 
                    OldValuesParameterFormatString="original_{0}"
                    SelectCommand="SELECT [ProductID], [Name], [ShortDescription],
                                          [LongDescription], [CategoryID], [ImageFile], 
                                          [UnitPrice], [OnHand]
                                   FROM [Products] 
                                   WHERE ([ProductID] = @ProductID)"
                    DeleteCommand="DELETE FROM [Products]
                                   WHERE ([ProductID] = @original_ProductID) AND 
                                         ([Name] = @original_Name) AND 
                                         ([ShortDescription] = @original_ShortDescription) AND 
                                         ([LongDescription] = @original_LongDescription) AND 
                                         ([CategoryID] = @original_CategoryID) AND 
                                         (([ImageFile] = @original_ImageFile) OR ((ImageFile IS NULL) AND (@original_ImageFile IS NULL))) AND 
                                         ([UnitPrice] = @original_UnitPrice) AND ([OnHand] = @original_OnHand)"
                    InsertCommand="INSERT INTO [Products] ([ProductID], [Name],
                                               [ShortDescription], [LongDescription], [CategoryID], 
                                               [ImageFile], [UnitPrice], [OnHand]) 
                                   VALUES (@ProductID, @Name, @ShortDescription,
                                           @LongDescription, @CategoryID, @ImageFile, 
                                           @UnitPrice, @OnHand)"
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
                                         (([ImageFile] = @original_ImageFile) OR ((ImageFile IS NULL) AND (@original_ImageFile IS NULL))) AND 
                                         ([UnitPrice] = @original_UnitPrice) AND 
                                         ([OnHand] = @original_OnHand)">
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
                <asp:Label ID = "lblError" runat="server" ForeColor="Red"
                    EnableViewState="False"></asp:Label>
            </td>
          </tr>
        </table>
    </div>
    </form>
</body>
</html>
