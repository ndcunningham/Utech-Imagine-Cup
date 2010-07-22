<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Future Value</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <img src="Images/UTECH-crest.gif" alt="Utech" /><br /><br />
        <strong><span style="font-size: 20pt; color: blue">401K 
            Future Value Calculator</span></strong><br /><br />
        <table>
            <tr>
                <td style="width: 149px">Monthly investment</td>
                <td style="width: 71px">
                    <asp:DropDownList ID="ddlMonthlyInvestment" 
                        runat="server" Width="106px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width: 149px">Annual interest rate</td>
                <td style="width: 71px">
                    <asp:TextBox ID="txtInterestRate" runat="server" Width="100px">6.0</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 149px">Number of years</td>
                <td style="width: 71px">
                    <asp:TextBox ID="txtYears" runat="server" Width="100px">10</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 149px">Future value</td>
                <td style="width: 71px">
                    <asp:Label ID="lblFutureValue" runat="server" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="width: 149px; height: 25px;"></td>
                <td style="width: 100px; height: 25px;"></td>
            </tr>
            <tr>
                <td style="width: 149px">
                    <asp:Button ID="btnCalculate" runat="server"
                        OnClick="btnCalculate_Click" Text="Calculate" Width="100px" />
                </td>
                <td style="width: 100px">
                    <asp:Button ID="btnClear" runat="server"
                        OnClick="btnClear_Click" Text="Clear" Width="100px" />
                </td>
            </tr>
        </table>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="txtInterestRate" Display="Dynamic" 
            ErrorMessage="Interest rate is required.">
        </asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator1" runat="server" 
            ControlToValidate="txtInterestRate"
            Display="Dynamic" ErrorMessage="Interest rate must range from 1 to 20." 
            MaximumValue="20" MinimumValue="1" Type="Double">
        </asp:RangeValidator><br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="txtYears" Display="Dynamic" 
            ErrorMessage="Number of years is required.">
        </asp:RequiredFieldValidator>
        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtYears"
            Display="Dynamic" ErrorMessage="Years must range from 1 to 45." MaximumValue="45"
            MinimumValue="1" Type="Integer">
        </asp:RangeValidator>
    </div>
    </form>
</body>
</html>
