<%@ Page Language="C#" MasterPageFile="~/Login.master" AutoEventWireup="true" CodeFile="verselect.aspx.cs" Inherits="verselect" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            color: #FF0000;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentHolder" Runat="Server">
    <p class="style3">
        Please choose Vantage Archive for the jobs prior to Jan 1, 2011 since all the 
        previous jobs in vantage was closed. For jobs from Jan 1, 2011 onwards, please 
        choose Epicor 9 Database. This is due to the reason that we recently upgrade to 
        EPICOR 905 from EPICOR VANTAGE.</p>
                                                                                          <p class="style3">
                                                                                              If you have any questions or concerns, please contact hasan.kazmi@thermotech.com</p>
    <p>
        <b>
        <asp:Button ID="Button_vOld_Redirect" runat="server" Font-Size="XX-Large" 
            Height="100px" Text="Vantage Archive" Width="300px" 
            onclick="Button_vOld_Redirect_Click" />
        </b>
    </p>
    <p>
        <b>
        <asp:Button ID="Button_Epicor9_Redirect" runat="server" Font-Size="XX-Large" Height="100px" 
            Text="Epicor 9 Database" Width="300px" 
            onclick="Button_Epicor9_Redirect_Click" />
        </b>
    </p>
</asp:Content>

