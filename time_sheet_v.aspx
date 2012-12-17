<%@ Page Language="C#" Title="Time Entry : Thermotech" MasterPageFile ="~/MasterPage.master" AutoEventWireup="true" CodeFile="time_sheet_v.aspx.cs" Inherits="time_sheet" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ContentPlaceHolderID ="head"   runat="server"  id="first">
    <style type="text/css">
        .mainTable
        {
            width: 100%;
            border-collapse: collapse;
        }
        .style2
        {
            width: 142px;
        }
        .style4
        {
            width: 142px;
            height: 19px;
        }
        .style5
        {
            height: 19px;
        }
        .style6
        {
            width: 80px;
        }
        .style110
        {
            width: 142px;
            height: 12px;
        }
        .style111
        {
            width: 520px;
            height: 12px;
        }
        .style112
        {
            height: 12px;
        }
        .style113
        {
            width: 55px;
        }
        .style114
        {
            width: 55px;
            height: 12px;
        }
        .style115
        {
            width: 55px;
            height: 19px;
        }
        .style124
    {
        height: 12px;
        width: 587px;
        padding-left: 10px;
        margin-left: 10px;
    }
    .style125
    {
        height: 19px;
        width: 587px;
        padding-left: 10px;
        margin-left: 10px;
    }
    .style126
    {
        width: 587px;
    }
    .style130
    {
        width: 587px;
        height: 21px;
    }
    .style131
    {
        height: 21px;
    }
    .style132
    {
        width: 55px;
        height: 21px;
    }
    .style133
    {
        width: 142px;
        height: 21px;
    }
        .style138
        {
            height: 30px;
        }
        .style139
        {
            width: 55px;
            height: 30px;
        }
        .style140
        {
            width: 520px;
        }
        .style141
        {
            width: 520px;
            height: 21px;
        }
        .style142
    {
        font-size: medium;
    }
        </style>
    <link href="style.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ContentPlaceHolderID ="MainContentHolder"  runat="server"  id="Content1">
  
   
        <table cellpadding="0" class="mainTable">
            <tr>
                <td class="style139">
                    </td>
                <td class="style138" valign="top" colspan="2">
                    <span class="style142"><strong>Time Entry for</strong></span>
                    <asp:Label ID="LabelEmpName" runat="server" Font-Bold="True" Font-Size="Medium"></asp:Label>
                </td>
                <td valign="top" colspan="2" class="style138">
                </td>
            </tr>
            <tr>
                <td class="style113">
                    &nbsp;</td>
                <td class="style2" valign="top">
                    <span lang="en-us">Job Number</span></td>
                <td class="style140" valign="top">
                    <asp:DropDownList ID="DropDownListJobNumber" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSourceJobNum" DataTextField="JobNum" 
                        DataValueField="JobNum" 
                        onselectedindexchanged="DropDownListJobNumber_SelectedIndexChanged" 
                        AppendDataBoundItems ="True" CausesValidation="True" BackColor="#5D7B9D" 
                        Font-Bold="True" ForeColor="White">
                        <asp:ListItem Text ="--SELECT--" Value=""></asp:ListItem>
                        
                    </asp:DropDownList>
                    <br />
                    <strong>[For non-job activities, don&#39;t select a job number]</strong><br />
                    <asp:SqlDataSource ID="SqlDataSourceJobNum" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
                        
                        
                        
                        
                        
                        
                        
                        SelectCommand="SELECT JobNum, Plant FROM JobNums WHERE (Plant = 'JRZ') AND (JobNum LIKE 'NJ%') OR (JobNum LIKE 'J%') AND (JobNum NOT LIKE 'JUF%') AND (JobNum NOT LIKE 'JF%') 
UNION


SELECT JobNum, Plant FROM JobNumsJRZ
ORDER BY JobNum DESC"></asp:SqlDataSource>
                    <cc1:DropDownExtender ID="SqlDataSourceJobNum_DropDownExtender" runat="server" 
                        DynamicServicePath="" Enabled="True" TargetControlID="SqlDataSourceJobNum">
                    </cc1:DropDownExtender>
                </td>
                <td valign="top" colspan="2">
                    <asp:RequiredFieldValidator ID="rfvDropDownListJobNumber" runat="server" ControlToValidate ="DropDownListJobNumber"></asp:RequiredFieldValidator>
                    <br />
                    <br />
                                </td>
            </tr>
            <tr>
                <td class="style113">
                    &nbsp;</td>
                <td class="style2" valign="top">
                    &nbsp;</td>
                <td class="style140">
                    &nbsp;</td>
                <td valign="top" class="style126">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style113">
                    &nbsp;</td>
                <td class="style2" valign="top">
                    <span lang="en-us">Job Description</span></td>
                <td class="style140">
                    <asp:TextBox ID="TextBoxJobDescription" runat="server" 
                        Width="206px" ReadOnly="True"></asp:TextBox>
                    <asp:HiddenField ID="HiddenJobDescription" runat="server" />
                </td>
                <td valign="top" class="style126">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style114">
                    </td>
                <td class="style110" valign="top">
                    </td>
                <td class="style111">
                    </td>
                <td valign="top" class="style124">
                    </td>
                <td class="style112">
                    </td>
            </tr>
            <tr>
                <td class="style115">
                    </td>
                <td class="style4" valign="top">
                    <span lang="en-us">Task Type</span></td>
                <td class="style5" colspan="2">
                    <asp:DropDownList ID="DropDownListTaskType" runat="server" Width="268px">
                    </asp:DropDownList>
                    <asp:RadioButtonList ID="RadioButtonListTaskType" runat="server" 
                        AutoPostBack="True" 
                        onselectedindexchanged="RadioButtonListTaskType_SelectedIndexChanged" 
                        RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">General</asp:ListItem>
                        <asp:ListItem Value="JobRelated">Job Related</asp:ListItem>
                        <asp:ListItem>Maintenance</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="style5">
                    </td>
            </tr>
            <tr>
                <td class="style113">
                    &nbsp;</td>
                <td class="style2" valign="top">
                    &nbsp;</td>
                <td class="style140">
                    &nbsp;</td>
                <td valign="top" class="style126">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style113">
                    </td>
                <td class="style2" valign="top">
                    <span lang="en-us">Date</span></td>
                <td class="style140">
                    <asp:TextBox ID="TextBoxDate" runat="server"></asp:TextBox>
                    &nbsp; 
                    <cc1:CalendarExtender ID="TextBoxDate_CalendarExtender" runat="server" 
                        Enabled="True" TargetControlID="TextBoxDate" PopupPosition="Right">
                    </cc1:CalendarExtender>
                    <asp:HiddenField ID="HiddenJobDate" runat="server" />
                </td>
                <td valign="top" colspan="2">
                    <asp:RequiredFieldValidator ID="rfvDate" runat="server" 
                        ErrorMessage="Date Required" ControlToValidate="TextBoxDate" 
                        SetFocusOnError="True" ValidationGroup="FormSubmit" Display="Dynamic">Date Required</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style113">
                    &nbsp;</td>
                <td class="style2" valign="top">
                    &nbsp;</td>
                <td class="style140">
                    &nbsp;</td>
                <td valign="top" class="style126">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style113">
                    &nbsp;</td>
                <td class="style2" valign="top">
                    <span lang="en-us">Duration</span></td>
                <td class="style140">
                    <asp:TextBox ID="TextBoxHours" runat="server" Width="50px"></asp:TextBox>
                    <span lang="en-us">&nbsp;Hrs 
                    <br />
                    </span>
                    <asp:TextBox ID="TextBoxMinutes" runat="server" Width="50px"></asp:TextBox>
                    <span lang="en-us">&nbsp;Mins </span></td>
                <td valign="top" colspan="2">
                    <span lang="en-us"> 
                    <asp:RequiredFieldValidator ID="rfvHours" runat="server" 
                        ErrorMessage="Hour Required" ControlToValidate="TextBoxHours" 
                        SetFocusOnError="True" ValidationGroup="FormSubmit" Display="Dynamic" >Hour Required</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvHoursNum" runat="server" 
                        ControlToValidate="TextBoxHours" ErrorMessage="Only Numbers are allowed" 
                        SetFocusOnError="True" Type="Integer" ValidationGroup="FormSubmit" 
                        Display="Dynamic" Operator="DataTypeCheck">Only Numbers are allowed</asp:CompareValidator>
                    <br />
                    <asp:RequiredFieldValidator ID="rfvMinutes" runat="server" 
                        ErrorMessage="Minutes Required" ControlToValidate="TextBoxMinutes" 
                        SetFocusOnError="True" ValidationGroup="FormSubmit" Display="Dynamic">Minutes Required</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvMinNum" runat="server" 
                        ControlToValidate="TextBoxMinutes" ErrorMessage="Only Numbers are allowed" 
                        SetFocusOnError="True" Type="Integer" ValidationGroup="FormSubmit" 
                        Operator ="DataTypeCheck" Display="Dynamic">Only Numbers are allowed</asp:CompareValidator>
                    </span>
                    </td>
            </tr>
            <tr>
                <td class="style113">
                    &nbsp;</td>
                <td class="style2" valign="top">
                    &nbsp;</td>
                <td class="style140">
                    &nbsp;</td>
                <td valign="top" class="style126">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style113">
                    &nbsp;</td>
                <td class="style2" valign="top">
                    <span lang="en-us">Comments</span></td>
                <td class="style140">
                    <asp:TextBox ID="TextBoxComments" runat="server" Rows="5" TextMode="MultiLine" 
                        Width="278px"></asp:TextBox>
                </td>
                <td valign="top" class="style126">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style113">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style140">
                    &nbsp;</td>
                <td valign="top" class="style126">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style132">
                    </td>
                <td class="style133">
                    </td>
                <td class="style141">
                    <asp:Label ID="LabelRecordError" runat="server" ForeColor="#FF3300"></asp:Label>
                </td>
                <td valign="top" class="style130">
                    </td>
                <td class="style131">
                    </td>
            </tr>
            <tr>
                <td class="style113">
                    &nbsp;</td>
                <td class="style2">
                    &nbsp;</td>
                <td class="style140">
                    <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" Width="80px" 
                        ValidationGroup="FormSubmit" onclick="ButtonSubmit_Click" />
                    <span lang="en-us">&nbsp; </span>
                    <input id="ResetForm" class="style6" type="reset" value="Reset" /><br />
                    <br />
                    <br />
                </td>
                <td valign="top" class="style126">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        
    <asp:ScriptManager ID="AJAXScriptManager" runat="server">
    </asp:ScriptManager>
        <asp:HiddenField ID="HiddenFieldProjectID" runat="server" />
        </asp:Content>