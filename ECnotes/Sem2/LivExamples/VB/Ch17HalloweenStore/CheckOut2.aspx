<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CheckOut2.aspx.vb" Inherits="CheckOut2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Halloween Store</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/banner.jpg" /><br />
        <br />
        <strong>Shipping method:<br />
        </strong>
        <br />
        <asp:RadioButton ID="rdoGround" runat="server" Checked="True" Text="UPS Ground" /><br />
        <asp:RadioButton ID="rdo2Day" runat="server" Text="UPS Second Day" /><br />
        <asp:RadioButton ID="rdoFedEx" runat="server" Text="Federal Express Overnight" /><br />
        <br />
        <strong>Payment information:<br />
        </strong>
        <br />
        <table>
            <tr>
                <td style="width: 175px" rowspan="2" valign="top">
                    <asp:ListBox ID="lstCardType" runat="server" Width="150px">
                        <asp:ListItem Selected="True" Value="None">--Select a credit card--</asp:ListItem>
                        <asp:ListItem>Visa</asp:ListItem>
                        <asp:ListItem Value="MC">MasterCard</asp:ListItem>
                        <asp:ListItem Value="AMEX">American Express</asp:ListItem>
                    </asp:ListBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lstCardType"
                        Display="None" ErrorMessage="You must select a credit card." InitialValue="None">*</asp:RequiredFieldValidator></td>
                <td align="right" style="width: 100px" valign="top">
                    Number:</td>
                <td style="width: 180px" valign="top">
                    <asp:TextBox ID="txtCardNumber" runat="server" MaxLength="20" Width="150px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCardNumber"
                        ErrorMessage="Credit card number is required." Display="None">*</asp:RequiredFieldValidator></td>
                <td style="width: 160px" rowspan="2" valign="top">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" HeaderText="Please correct the following errors:"
                        Width="225px" />
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 100px" valign="top">
                    Expiration date:</td>
                <td style="width: 180px" valign="top">
                    <asp:DropDownList ID="ddlMonth" runat="server" Width="88px">
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
                        <asp:ListItem Value="1">November</asp:ListItem>
                        <asp:ListItem Value="12">December</asp:ListItem>
                    </asp:DropDownList>&nbsp;<asp:DropDownList ID="ddlYear" runat="server" Width="58px">
                    </asp:DropDownList></td>
            </tr>
        </table>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>"
            InsertCommand="INSERT INTO Invoices (CustEMail, OrderDate, Subtotal, ShipMethod, Shipping, SalesTax, Total, CreditCardType, CardNumber, ExpirationMonth, ExpirationYear) VALUES (@CustEMail, @OrderDate, @Subtotal, @ShipMethod, @Shipping, @SalesTax, @Total, @CreditCardType, @CardNumber, @ExpirationMonth, @ExpirationYear)">
            <InsertParameters>
                <asp:Parameter Name="CustEMail" />
                <asp:Parameter Name="OrderDate" />
                <asp:Parameter Name="Subtotal" Type="Decimal"/>
                <asp:Parameter Name="ShipMethod" />
                <asp:Parameter Name="Shipping" Type="Decimal" />
                <asp:Parameter Name="SalesTax" Type="Decimal" />
                <asp:Parameter Name="Total" Type="Decimal" />
                <asp:Parameter Name="CreditCardType" />
                <asp:Parameter Name="CardNumber" />
                <asp:Parameter Name="ExpirationMonth" Type="Int16" />
                <asp:Parameter Name="ExpirationYear" Type="Int16" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:HalloweenConnectionString %>"
            InsertCommand="INSERT INTO LineItems (InvoiceNumber, ProductID, UnitPrice, Quantity)
                           VALUES (@InvoiceNumber, @ProductID, @UnitPrice, @Quantity)">
            <InsertParameters>
                <asp:Parameter Name="InvoiceNumber" />
                <asp:Parameter Name="ProductID" />
                <asp:Parameter Name="UnitPrice" Type="Decimal" />
                <asp:Parameter Name="Quantity" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Button ID="btnAccept" runat="server" Text="Accept Order" />&nbsp;<asp:Button
            ID="btnCancel" runat="server" Text="Cancel Order" CausesValidation="False" />&nbsp;<asp:Button ID="btnContinue"
                runat="server" Text="Continue Shopping" CausesValidation="False" />
    </form>
</body>
</html>
