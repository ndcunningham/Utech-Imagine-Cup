<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckOut1.aspx.cs" Inherits="CheckOut1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Chapter 17: Halloween Store</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/banner.jpg" /><br />
        <br />
        Please enter the following information:<br />
        &nbsp;<table>
            <tr>
                <td style="width: 100px">
                    Email:</td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtEmail" runat="server" Width="150px" MaxLength="25">
                    </asp:TextBox></td>
                <td style="width: 176px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Email is a required field.">
                    </asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">First name:</td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtFirstName" runat="server" Width="150px"
                        MaxLength="20"></asp:TextBox></td>
                <td style="width: 176px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        ControlToValidate="txtFirstName"
                        ErrorMessage="First name is a required field.">
                    </asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">Last name:</td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtLastName" runat="server" Width="150px"
                        MaxLength="20"></asp:TextBox></td>
                <td style="width: 176px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                        ControlToValidate="txtLastName"
                        ErrorMessage="Last name is a required field.">
                    </asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">Address:</td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtAddress" runat="server" Width="250px"
                        MaxLength="40"></asp:TextBox></td>
                <td style="width: 176px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                        ControlToValidate="txtAddress"
                        ErrorMessage="Address is a required field.">
                    </asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">City:</td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtCity" runat="server" Width="180px" MaxLength="30">
                    </asp:TextBox></td>
                <td style="width: 176px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                        ControlToValidate="txtCity"
                        ErrorMessage="City is a required field.">
                    </asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">State:</td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtState" runat="server" Width="25px" MaxLength="2">
                    </asp:TextBox></td>
                <td style="width: 176px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                        ControlToValidate="txtState"
                        ErrorMessage="State is a required field.">
                    </asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">Zip code:</td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtZipCode" runat="server" Width="75px" MaxLength="9">
                    </asp:TextBox></td>
                <td style="width: 176px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                        ControlToValidate="txtZipCode"
                        ErrorMessage="Zip code is a required field.">
                    </asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">Phone:</td>
                <td style="width: 100px">
                    <asp:TextBox ID="txtPhone" runat="server" Width="150px" MaxLength="20">
                    </asp:TextBox></td>
                <td style="width: 176px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                        ControlToValidate="txtPhone"
                        Display="Dynamic" ErrorMessage="Phone is a required field.">
                    </asp:RequiredFieldValidator></td>
            </tr>
        </table>
   
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>"
            DeleteCommand="DELETE FROM [Customers] WHERE [Email] = @original_Email"
            InsertCommand="INSERT INTO [Customers] ([Email], [LastName], [FirstName],
                                       [Address], [City], [State], [ZipCode], [PhoneNumber]) 
                           VALUES (@Email, @LastName, @FirstName, @Address, @City, 
                                   @State, @ZipCode, @PhoneNumber)"
            SelectCommand="SELECT * FROM [Customers] WHERE ([Email] = @Email)"
            UpdateCommand="UPDATE [Customers]
                           SET [LastName] = @LastName, [FirstName] = @FirstName,
                               [Address] = @Address, [City] = @City, [State] = @State,
                               [ZipCode] = @ZipCode, [PhoneNumber] = @PhoneNumber 
                           WHERE [Email] = @original_Email">
            <SelectParameters>
                <asp:Parameter Name="Email" Type="String" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="original_Email" Type="String" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="PhoneNumber" Type="String" />
                <asp:Parameter Name="original_Email" Type="String" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="Address" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="ZipCode" Type="String" />
                <asp:Parameter Name="PhoneNumber" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        &nbsp;
        <br />
        <asp:Button ID="btnCheckOut" runat="server" Text="Continue Checkout"
            OnClick="btnCheckOut_Click" />&nbsp;
        <asp:Button ID="btnCancel" runat="server" Text="Cancel Order"
            CausesValidation="False" OnClick="btnCancel_Click" />&nbsp;
        <asp:Button ID="btnContinue" runat="server"
            Text="Continue Shopping" CausesValidation="False" OnClick="btnContinue_Click" />
    </form>
</body>
</html>
