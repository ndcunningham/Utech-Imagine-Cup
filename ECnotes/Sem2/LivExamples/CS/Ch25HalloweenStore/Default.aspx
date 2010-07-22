<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="ValeriLibrary" Namespace="ValeriLibrary" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;</div>
        &nbsp;
        <cc1:CaptionedBox ID="CaptionedBox1" Visible="false" CaptionPadding="20px"  
            Caption="Name: " CaptionWidth="75px" RightAlignCaption="true" runat="server">
        </cc1:CaptionedBox><br />
        <cc1:DateDDL ID="DateDDL1" Visible="true" CaptionPadding="20px" 
            Caption="Birthday :" runat="server" />
        <br />
        <br />
        <cc1:DaysUntil ID="DaysUntil1" Visible="false" 
             TextBefore="There are only " 
             TextAfter="more shopping days until Halloween" 
             runat="server" />
    </form>
</body>
</html>
