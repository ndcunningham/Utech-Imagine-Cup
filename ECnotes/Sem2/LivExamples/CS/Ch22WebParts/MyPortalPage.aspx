<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyPortalPage.aspx.cs" Inherits="MyPortalPage" %>

<%@ Register Src="OrderCalculator.ascx" TagName="OrderCalculator" TagPrefix="uc1" %>
<%@ Register Src="ProductList.ascx" TagName="ProductList" TagPrefix="uc1" %>
<%@ Register Src="CustomerList.ascx" TagName="CustomerList" TagPrefix="uc1" %>

<%@ Register TagPrefix="mma" Namespace="murach" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Web Parts</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <h1>Halloween Store - Sales Portal</h1>

        <asp:WebPartManager ID="WebPartManager1" runat="server"></asp:WebPartManager>       

        <asp:WebPartZone ID="WebPartZone1" runat="server" 
            HeaderText="Zone 1 - Horizontal Layout" 
            LayoutOrientation="Horizontal">
            <ZoneTemplate>
                <uc1:OrderCalculator ID="OrderCalculator1" runat="server" Title="Order Calculator"/>
                <mma:HalloweenCounter ID="HalloweenCounter1" runat="server" />
            </ZoneTemplate>
            <EmptyZoneTextStyle />
        </asp:WebPartZone>

        <asp:WebPartZone ID="WebPartZone2" runat="server" 
            HeaderText="Zone 2 - Vertical Layout">
            <ZoneTemplate>
                <uc1:ProductList ID="ProductList1" runat="server" Title="Product List">
                </uc1:ProductList>
            </ZoneTemplate>
        </asp:WebPartZone>
        <br />

        <asp:Label ID="Label3" runat="server" Text="Display Mode: "></asp:Label>
        <asp:RadioButtonList ID="rdoDisplayMode" runat="server" AutoPostBack="True" 
            RepeatDirection="Horizontal" Width="455px" OnSelectedIndexChanged="rdoDisplayMode_SelectedIndexChanged">
                <asp:ListItem Value="Browse Page" Selected="True">Browse Page</asp:ListItem>
                <asp:ListItem Value="Move Parts">Move Parts</asp:ListItem>
                <asp:ListItem Value="Add Parts">Add Parts</asp:ListItem>
                <asp:ListItem>Edit Parts</asp:ListItem>
        </asp:RadioButtonList><br />

        <asp:CatalogZone ID="CatalogZone1" runat="server" 
            HeaderText="Catalog of Web Parts">
            <ZoneTemplate>
                <asp:PageCatalogPart ID="PageCatalogPart1" runat="server" />
                <asp:DeclarativeCatalogPart ID="DeclarativeCatalogPart1" runat="server">
                    <WebPartsTemplate>
                        <uc1:CustomerList ID="CustomerList1" runat="server" 
                            Title="Customer List"/>
                    </WebPartsTemplate>
                </asp:DeclarativeCatalogPart>
            </ZoneTemplate>
            <CloseVerb Visible="False" />
            <HeaderCloseVerb Visible="False" />
        </asp:CatalogZone>

        <asp:EditorZone ID="EditorZone1" runat="server">
            <ZoneTemplate>
                <asp:AppearanceEditorPart ID="AppearanceEditorPart1" runat="server" />
            </ZoneTemplate>
        </asp:EditorZone>

    </div>
    </form>
</body>
</html>
