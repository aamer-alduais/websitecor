<%@ Page Title="Login : Thermotech"  Language="C#" MasterPageFile="~/Login.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style28
    {
        width: 794%;
        height: 277px;
    }
        .style31
    {
            width: 312px;
        }
        .style30
    {
        text-align: left;
    }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentHolder" Runat="Server">
    <asp:Login ID="LoginMain" runat="server" BackColor="#F7F6F3" BorderColor="#E6E2D8" 
                                        BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" 
                                        Font-Size="Smaller" ForeColor="#333333" Height="152px" Width="403px" 
                                        FailureText="Username or Password incorrect." 
                                        onauthenticate="LoginMain_Authenticate" 
                                        DestinationPageUrl="~/Default.aspx">
    <TextBoxStyle Font-Size="0.8em" />
    <LoginButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid" 
                                            BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" />
    <LayoutTemplate>
        <table border="0" cellpadding="4" cellspacing="0" 
                                                style="border-collapse:collapse;">
            <tr>
                <td>
                    <table border="0" cellpadding="0" style="height:152px;width:403px;">
                        <tr>
                            <td colspan="2" 
                                                                    
                                                                    style="color:White;background-color:#5D7B9D;font-size:0.9em;font-weight:bold;" 
                                                                    class="style30">
                                <font size="2">&nbsp;Log In</font></td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" 
                                                                        Font-Size="10pt">User Name:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server" Font-Size="0.8em" 
                                                                        Width="120px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                                                        ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                                                        ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" 
                                                                        Font-Size="10pt">Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" Font-Size="0.8em" TextMode="Password" 
                                                                        Width="120px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                                                        ControlToValidate="Password" ErrorMessage="Password is required." 
                                                                        ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                                                    &nbsp;</td>
                            <td>
                                <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="color:Red;">
                                                                    &nbsp;</td>
                            <td align="left" style="color:Red;">
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2">
                                <asp:Button ID="LoginButton" runat="server" BackColor="#FFFBFF" 
                                                                        BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" 
                                                                        Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284775" Text="Log In" 
                                                                        ValidationGroup="Login1" />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </LayoutTemplate>
    <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
    <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" 
                                            ForeColor="White" />
</asp:Login>
</asp:Content>

