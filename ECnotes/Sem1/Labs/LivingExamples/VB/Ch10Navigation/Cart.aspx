<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Cart.aspx.vb" Inherits="Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <br />Your shopping cart:<br />
    <table style="width: 500px" cellspacing="0" 
            cellpadding="0" border="0">
        <tr>
            <td style="width: 286px; height: 153px">
                <asp:ListBox ID="lstCart" runat="server"
                    Width="267px" Height="135px">
                </asp:ListBox>
            </td>
            <td style="height: 153px">
                <asp:Button ID="btnRemove" runat="server" 
                    Width="100px" Text="Remove Item" /><br /><br />
                <asp:Button ID="btnEmpty" runat="server" 
                    Width="100px" Text="Empty Cart" />
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="btnContinue" runat="server"
        PostBackUrl="~/Order.aspx" Text="Continue Shopping" />&nbsp;
    <asp:Button ID="btnCheckOut" runat="server" Text="Check Out" /><br />
    <br />
    <asp:Label ID="lblMessage" runat="server"></asp:Label>
</asp:Content>

