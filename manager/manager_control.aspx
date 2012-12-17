<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="manager_control.aspx.cs" Inherits="manager_manager_control" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style125
        {
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentHolder" Runat="Server">
    <div style="padding-left: 200px">
        <br />
        <asp:Button ID="ButtonRedirectHOP" runat="server" Font-Bold="True" 
            Font-Size="X-Large" Height="43px" onclick="ButtonRedirectHOP_Click" 
            Text="Hopkins" Width="245px" />
    <p class="style125">
        <asp:Button ID="ButtonRedirectJRZ" runat="server" Font-Bold="True" 
            Font-Size="X-Large" Height="43px" onclick="ButtonRedirectJRZ_Click" 
            Text="Juarez" Width="245px" />
    </p>
    <p class="style125">
        <asp:Button ID="ButtonRedirectQRO" runat="server" Font-Bold="True" 
            Font-Size="X-Large" Height="43px" onclick="ButtonRedirectQRO_Click" 
            Text="Queretaro" Width="245px" />
            
    </p>
        <p class="style125">
            &nbsp;</p></div>
    </asp:Content>

