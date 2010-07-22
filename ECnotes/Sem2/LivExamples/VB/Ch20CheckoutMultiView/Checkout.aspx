<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Checkout.aspx.vb" Inherits="Checkout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Checkout MultiView</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong>Halloween Superstore - Checkout<br />
        </strong>
        <br />
        <asp:MultiView ID="mvCheckout" Runat="server" ActiveViewIndex="0">
            <asp:View ID="vContact" Runat="server">
                Please enter your contact information:<br /><br />
                <table>
                  <tr>
                    <td style="width: 100px">
                        <div style="text-align: right">
                            First Name:</div>
                    </td>
                    <td style="width: 402px">
                        <asp:TextBox ID="txtFirstName" Runat="server"
                            Width="200px" Height="22px"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1" Runat="server" 
                            ErrorMessage="First Name is required."
                            ControlToValidate="txtFirstName">
                        </asp:RequiredFieldValidator>
                    </td>
                  </tr>
                  <tr>
                    <td style="width: 100px">
                        <div style="text-align: right">
                            Last name:</div>
                    </td>
                    <td style="width: 402px">
                        <asp:TextBox ID="txtLastName" Runat="server"
                            Width="200px" Height="22px"></asp:TextBox>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2" Runat="server" 
                            ErrorMessage="Last Name is required."
                            ControlToValidate="txtLastName">
                        </asp:RequiredFieldValidator>
                    </td>
                  </tr>
                  <tr>
                    <td style="width: 100px">
                        <div style="text-align: right">
                            Email:</div>
                    </td>
                    <td style="width: 402px">
                        <asp:TextBox ID="txtEmail" Runat="server"
                            Width="200px" Height="22px"></asp:TextBox>
                        <asp:RequiredFieldValidator 
                            ID="RequiredFieldValidator3" Runat="server" 
                            ErrorMessage="Email is required."
                            ControlToValidate="txtEmail">
                        </asp:RequiredFieldValidator>
                    </td>
                  </tr>
                </table>
                <br />
                <asp:Button ID="Button1" runat="server"
                    CommandName="NextView" Text="Next" />
            </asp:View>
            <asp:View ID="vShippingMethod" Runat="server">
                <asp:Panel ID="Panel1" Runat="server" Width="492">
                    Please select a shipping method:<br /><br />
                    <asp:RadioButton ID="rdoUPSGround" Runat="server" 
                        Text="UPS Ground" GroupName="ShipVia"
                        Checked="True" />
                    <br />
                    <asp:RadioButton ID="rdoUPS2Day" Runat="server" 
                        Text="UPS Second Day" GroupName="ShipVia" />
                    <br />
                    <asp:RadioButton ID="rdoFedEx" Runat="server" 
                        Text="Federal Express Overnight" GroupName="ShipVia" />
                    <br />
                </asp:Panel><br />
                <asp:Button ID="Button2" runat="server" 
                    CommandName="PrevView" Text="Previous" />
                <asp:Button ID="Button3" runat="server" 
                    CommandName="NextView" Text="Next" />
            </asp:View>
            <asp:View ID="vCreditCard" Runat="server">
                <asp:Panel ID="Panel2" Runat="server" Width="492px">
                    Please enter your credit card information:<br />
                    <br />
                    <table>
                      <tr>
                        <td style="width: 100px" rowspan="2">
                            <div style="text-align: right">
                                <asp:ListBox ID="listCardType"
                                    Runat="server">
                                    <asp:ListItem Value="VISA"
                                        Selected="True">Visa</asp:ListItem>
                                    <asp:ListItem Value="MC">
                                        MasterCard</asp:ListItem>
                                    <asp:ListItem Value="AMEX">
                                        American Express</asp:ListItem>
                                </asp:ListBox>
                            </div>
                        </td>
                        <td style="width: 143px">
                            <div style="text-align: right">
                                Card Number:</div>
                        </td>
                        <td style="width: 265px" valign="middle">
                            <asp:TextBox ID="txtCardNumber" Runat="server"
                                Height="22px" Width="262px"></asp:TextBox>
                        </td>
                      </tr>
                      <tr>
                        <td style="width: 143px; height: 16px">
                            <div style="text-align: right">
                                &nbsp; Expiration Date:</div>
                        </td>
                        <td style="width: 265px; height: 16px" valign="middle">
                            <asp:DropDownList ID="ddlExpirationMonth"
                                Runat="server">
                                <asp:ListItem Value="1">January</asp:ListItem>
                                <asp:ListItem Value="2">February</asp:ListItem>
                                <asp:ListItem Value="3">March</asp:ListItem>
                                <asp:ListItem Value="4">April</asp:ListItem>
                                <asp:ListItem Value="5">May</asp:ListItem>
                                <asp:ListItem Value="6">June</asp:ListItem>
                                <asp:ListItem Value="7">July</asp:ListItem>
                                <asp:ListItem Value="8">August</asp:ListItem>
                                <asp:ListItem Value="9">September</asp:ListItem>
                                <asp:ListItem Value="10">October</asp:ListItem>
                                <asp:ListItem Value="11">November</asp:ListItem>
                                <asp:ListItem Value="12">December</asp:ListItem>
                            </asp:DropDownList>&nbsp;
                            <asp:DropDownList ID="ddlExpirationYear"
                                Runat="server"></asp:DropDownList>
                        </td>
                      </tr>
                    </table>
                    <br />
                    <asp:Button ID="Button4" runat="server"
                        CommandName="PrevView" Text="Previous" />
                    <asp:Button ID="btnFinish" Runat="server"
                        Height="24px" Text="Finish"
                        CommandName="NextView" />
                </asp:Panel>
            </asp:View>
            <asp:View ID="vFinish" runat="server">
                Your order is complete!<br /><br />
                Here is the data you entered:<br /><br />
                <asp:TextBox ID="txtMessage" runat="server" 
                    Height="182px" TextMode="MultiLine" Width="346px">
                </asp:TextBox><br />
            </asp:View>
        </asp:MultiView></div>
    </form>
</body>
</html>
