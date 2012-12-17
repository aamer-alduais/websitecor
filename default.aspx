<%@ Page Title="Welcome " Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="_default" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style124
    {
        width: 100%;
    }
        .style127
        {
            width: 386px;
            text-align: left;
        }
        .style128
        {
            width: 386px;
            text-align: left;
            height: 34px;
        }
        .style129
        {
            height: 34px;
        }
        .style130
        {
            font-size: x-small;
            background-color: #FFFFFF;
            color: #808080;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentHolder" Runat="Server">
    <table class="style124">
    <tr>
        <td class="style128">
            <p>
    Welcome&nbsp;
    <asp:Label ID="LabelGreeting" runat="server" Font-Bold="True"></asp:Label>
    ! <span lang="en-us">
                <br />
                <asp:HyperLink ID="HyperLinkChangePassword" 
                    runat="server" NavigateUrl="~/password_change.aspx" CssClass="style130"><span lang="en-us">Change 
				Your Password</span></asp:HyperLink></span></p>
<p>
    Please select a menu item from the left.</p>
        </td>
        <td class="style129" valign="top">
				&nbsp;</td>
    </tr>
    <tr>
        <td class="style127">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
</asp:Content>

