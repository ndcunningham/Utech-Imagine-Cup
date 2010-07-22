<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Checkout.aspx.vb" Inherits="Checkout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Checkout Wizard</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <strong>Halloween Superstore - Checkout</strong><br />
        <br />
        <asp:Wizard ID="wizCheckout" runat="server" ActiveStepIndex="0" 
            Width="739px" >
            <WizardSteps>
                <asp:WizardStep ID="WizardStep1" runat="server"
                    Title="Step 1: Contact Info">
                    Please enter your contact information:<br /><br />
                    <table>
                      <tr>
                        <td style="width: 100px">
                            <div style="text-align: right">
                                First Name:</div>
                        </td>
                        <td style="width: 402px">
                            <asp:TextBox ID="txtFirstName" runat="server"
                                Height="22px" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator1" 
                                runat="server" 
                                ControlToValidate="txtFirstName"
                                ErrorMessage="First Name is required."></asp:RequiredFieldValidator>
                        </td>
                      </tr>
                      <tr>
                        <td style="width: 100px">
                            <div style="text-align: right">
                                Last name:</div>
                        </td>
                        <td style="width: 402px">
                            <asp:TextBox ID="txtLastName" runat="server"
                                Height="22px" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator2" 
                                runat="server" 
                                ControlToValidate="txtLastName"
                                ErrorMessage="Last Name is required."></asp:RequiredFieldValidator>
                        </td>
                      </tr>
                      <tr>
                        <td style="width: 100px">
                            <div style="text-align: right">
                                Email:</div>
                        </td>
                        <td style="width: 402px">
                            <asp:TextBox ID="txtEmail" runat="server"
                                Height="22px" Width="200px"></asp:TextBox>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator3" 
                                runat="server" 
                                ControlToValidate="txtEmail"
                                ErrorMessage="Email is required."></asp:RequiredFieldValidator>
                        </td>
                      </tr>
                    </table>
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep2" runat="server"
                     Title="Step 2: Shipping Method">
                    Please select a shipping method:<br /><br />
                    <asp:RadioButton ID="rdoUPSGround" runat="server"
                        Checked="True" GroupName="ShipVia" Text="UPS Ground" />
                    <br />
                    <asp:RadioButton ID="rdoUPS2Day" runat="server"
                        GroupName="ShipVia" Text="UPS Second Day" />
                    <br />
                    <asp:RadioButton ID="rdoFedEx" runat="server"
                        GroupName="ShipVia" Text="Federal Express Overnight" />
                    <br />
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep3" runat="server"
                    Title="Step 3: Credit Card Info">
                    Please enter your credit card information:<br />
                    <br />
                    <table>
                      <tr>
                        <td rowspan="2" style="width: 100px">
                            <div style="text-align: right">
                                <asp:ListBox ID="lstCardType"
                                    runat="server">
                                    <asp:ListItem Selected="True"
                                        Value="VISA">Visa</asp:ListItem>
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
                            <asp:TextBox ID="txtCardNumber" runat="server"
                                Height="22px" Width="262px"></asp:TextBox>
                        </td>
                      </tr>
                      <tr>
                        <td style="width: 143px; height: 16px">
                            <div style="text-align: right">
                                &nbsp; Expiration Date:</div>
                        </td>
                        <td style="width: 265px; height: 16px"
                            valign="middle">
                            <asp:DropDownList ID="ddlExpirationMonth"
                                runat="server">
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
                                runat="server">
                            </asp:DropDownList>
                        </td>
                      </tr>
                    </table>
                </asp:WizardStep>
            </WizardSteps>
        </asp:Wizard>
    </div>
    </form>
</body>
</html>
