<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <br />
    Your shopping cart:<br />
    <table border="0" cellpadding="0" cellspacing="0" style="width: 500px">
        <tr>
            <td style="width: 286px; height: 153px">
                <asp:ListBox ID="lstCart" runat="server" Height="135px" Width="267px"></asp:ListBox>
            </td>
            <td style="height: 153px">
                <asp:Button ID="btnRemove" runat="server" Text="Remove Item" Width="100px" OnClick="btnRemove_Click" /><br />
                <br />
                <asp:Button ID="btnEmpty" runat="server" Text="Empty Cart" Width="100px" OnClick="btnEmpty_Click" />
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnContinue" runat="server" PostBackUrl="~/Order.aspx" Text="Continue Shopping" />&nbsp;
    <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" OnClick="btnCheckOut_Click" /><br />
    <br />
    <asp:Label ID="lblMessage" runat="server"></asp:Label>    
</asp:Content>
