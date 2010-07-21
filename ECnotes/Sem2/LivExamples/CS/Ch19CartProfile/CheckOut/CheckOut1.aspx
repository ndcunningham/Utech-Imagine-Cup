<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CheckOut1.aspx.cs" Inherits="CheckOut_CheckOut1" %>

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
        Please enter the following information:<br />
        <br />
        <table>
          <tr>
            <td style="width: 100px">
                <div style="text-align: right">
                        First Name:</div>
            </td>
            <td style="width: 402px">
                <asp:TextBox ID="txtFirstName" runat="server"
                    Height="22px" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1"
                    runat="server" ControlToValidate="txtFirstName"
                    ErrorMessage="First Name is required.">
                </asp:RequiredFieldValidator>
            </td>
          </tr>
          <tr>
            <td style="width: 100px">
                <div style="text-align: right">Last name:</div>
            </td>
            <td style="width: 402px">
                <asp:TextBox ID="txtLastName" runat="server"
                    Height="22px" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
                    runat="server" ControlToValidate="txtLastName"
                    ErrorMessage="Last Name is required.">
                </asp:RequiredFieldValidator>
            </td>
          </tr>
          <tr>
            <td style="width: 100px">
                <div style="text-align: right">Address:</div>
            </td>
            <td style="width: 402px">
                <asp:TextBox ID="txtAddress" runat="server"
                    Height="22px" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                    runat="server" ControlToValidate="txtAddress"
                    ErrorMessage="Address is required.">
                </asp:RequiredFieldValidator>
            </td>
          </tr>
          <tr>
            <td style="width: 100px">
                <div style="text-align: right">City:</div>
            </td>
            <td style="width: 402px">
                <asp:TextBox ID="txtCity" runat="server"
                    Height="22px" Width="201px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4"
                    runat="server" ControlToValidate="txtCity"
                    ErrorMessage="City is required.">
                </asp:RequiredFieldValidator>
            </td>
          </tr>
          <tr>
            <td style="width: 100px">
                <div style="text-align: right">State:</div>
            </td>
            <td style="width: 402px">
                <asp:DropDownList ID="ddlState" runat="server">
                </asp:DropDownList>
            </td>
          </tr>
          <tr>
            <td style="width: 100px">
                <div style="text-align: right">Zip code:</div>
            </td>
            <td style="width: 402px">
                <asp:TextBox ID="txtZipCode" runat="server"
                    Height="22px" Width="110px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5"
                    runat="server" ControlToValidate="txtZipCode"
                    ErrorMessage="Zip code is required.">
                </asp:RequiredFieldValidator>
            </td>
          </tr>
          <tr>
            <td style="width: 100px">
                <div style="text-align: right">Phone:</div>
            </td>
            <td style="width: 402px">
                <asp:TextBox ID="txtPhone" runat="server"
                    Height="22px" Width="199px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6"
                    runat="server" ControlToValidate="txtPhone"
                    ErrorMessage="Phone is required."></asp:RequiredFieldValidator>
            </td>
          </tr>
          <tr>
            <td style="width: 100px">
                <div style="text-align: right">Email:</div>
            </td>
            <td style="width: 402px">
                <asp:TextBox ID="txtEmail" runat="server"
                    Height="22px" Width="200px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7"
                    runat="server" ControlToValidate="txtEmail"
                    ErrorMessage="Email is required.">
                </asp:RequiredFieldValidator>
            </td>
          </tr>
        </table>
        <br />&nbsp;
        <asp:Button ID="btnCheckout" runat="server"
            Text="Continue Checkout" OnClick="btnCheckout_Click" />&nbsp;
        <asp:Button ID="btnCancel" runat="server"
            CausesValidation="False" Text="Cancel Order" OnClick="btnCancel_Click" />
        <asp:Button ID="btnContinue" runat="server"
            CausesValidation="False" Text="Continue Shopping" OnClick="btnContinue_Click" />
        <br /><br />
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    
    </div>
    </form>
</body>
</html>
