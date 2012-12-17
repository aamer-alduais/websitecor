<%@ Page Language="C#" Title="Manual Entry [Hourly Employee] : Thermotech" MasterPageFile ="~/MasterPage.master" AutoEventWireup="true" CodeFile="manual_time_sheet.aspx.cs" Inherits="time_sheet" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ContentPlaceHolderID ="head"   runat="server"  id="first">
    <style type="text/css">
        .mainTable
        {
            width: 92%;
            border-collapse: collapse;
        }
        .style6
        {
            width: 80px;
        }
        .DropDown
    {
            background-color: #5D7B9D;
            color: #FFFFFF;
            font-weight: bold;
        }
        .style143
        {
            width: 100%;
        }
        .style144
        {
            width: 89px;
        }
        .style145
        {
            width: 581px;
            font-weight: 700;
            margin-left: 40px;
        }
        .style149
        {
            width: 89px;
            height: 25px;
        }
        .style150
        {
            height: 25px;
        }
        .style151
        {
            width: 106px;
        }
    .style152
    {
        width: 50px;
        height: 25px;
    }
    .style153
    {
        width: 50px;
    }
    </style>
    <link href="style.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ContentPlaceHolderID ="MainContentHolder"  runat="server"  id="Content1">
    <table class="style143">
        <tr>
            <td class="style152">
                &nbsp;</td>
            <td colspan="2" rowspan="2">
                    <strong>Manual Time Entry for Hourly Employees<br />
                </strong>
    <asp:DropDownList ID="DropDownListEmpIDName" runat="server" 
        Width="460px" DataTextField="EmpIDName" 
        DataValueField="EMPID"        
       AppendDataBoundItems ="True" DataSourceID="SDSEmpIDNameHourly" 
                        onselectedindexchanged="DropDownListEmpIDName_SelectedIndexChanged" 
                        AutoPostBack="True" CssClass="DropDown">
          <asp:ListItem Text ="--SELECT--" Value="" ></asp:ListItem>
       
        </asp:DropDownList>  
                    <asp:RequiredFieldValidator ID="rfvDropDownListEmpIDName" 
        runat="server" ControlToValidate ="DropDownListEmpIDName"></asp:RequiredFieldValidator>
            </td>
            <td class="style149">
            </td>
            <td class="style150">
            </td>
        </tr>
        <tr>
            <td class="style153">
                &nbsp;</td>
            <td class="style144">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style153">
                &nbsp;</td>
            <td class="style151">
                &nbsp;</td>
            <td class="style145">
                    <asp:Label ID="LabelEmpName" runat="server" Font-Bold="True" Font-Size="Medium"></asp:Label>
                </td>
            <td class="style144">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style153">
                    &nbsp;</td>
            <td class="style151">
                    <span lang="en-us"><strong>Job Number</strong></span></td>
            <td class="style145">
                    <asp:DropDownList ID="DropDownListJobNumber" runat="server" AutoPostBack="True" 
                        DataSourceID="SqlDataSourceJobNum" DataTextField="JOBNUM" 
                        DataValueField="JOBNUM" 
                        onselectedindexchanged="DropDownListJobNumber_SelectedIndexChanged" 
                        AppendDataBoundItems ="true" CausesValidation="True">
                        <asp:ListItem Text ="--SELECT--" Value=""></asp:ListItem>
                        
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvDropDownListJobNumber" runat="server" ControlToValidate ="DropDownListJobNumber"></asp:RequiredFieldValidator>
                </td>
            <td class="style144">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style153">
                &nbsp;</td>
            <td class="style151">
                &nbsp;</td>
            <td class="style145">
                &nbsp;</td>
            <td class="style144">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style153">
                    &nbsp;</td>
            <td class="style151">
                    <span lang="en-us"><strong>Date</strong></span></td>
            <td class="style145">
                    <asp:TextBox ID="TextBoxDate" runat="server"></asp:TextBox>
                    <cc1:CalendarExtender ID="TextBoxDate_CalendarExtender" runat="server" 
                        Enabled="True" TargetControlID="TextBoxDate" PopupPosition="Right">
                    </cc1:CalendarExtender>
                    &nbsp;<br />
                    <asp:RequiredFieldValidator ID="rfvDate" runat="server" 
                        ErrorMessage="Date Required" ControlToValidate="TextBoxDate" 
                        SetFocusOnError="True" ValidationGroup="FormSubmit" Display="Dynamic">Date Required</asp:RequiredFieldValidator>
                &nbsp;<asp:HiddenField ID="HiddenJobDate" runat="server" />
                </td>
            <td class="style144">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style153">
                &nbsp;</td>
            <td class="style151">
                &nbsp;</td>
            <td class="style145">
                &nbsp;</td>
            <td class="style144">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style153">
                    &nbsp;</td>
            <td class="style151">
                    <strong>Clock In Time</strong></td>
            <td class="style145">
                    <asp:TextBox ID="TextBoxClockInTime" runat="server" Width="50px" 
                    Height="23px"></asp:TextBox>
                    <span lang="en-us"> 
                    <br />
                    <asp:RequiredFieldValidator ID="rfvHours" runat="server" 
                        ErrorMessage="Hour Required" ControlToValidate="TextBoxClockInTime" 
                        SetFocusOnError="True" ValidationGroup="FormSubmit" Display="Dynamic" >Hour Required</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvHoursNum" runat="server" 
                        ControlToValidate="TextBoxClockOutTime" ErrorMessage="Only Numbers are allowed" 
                        SetFocusOnError="True" Type="Double" ValidationGroup="FormSubmit" 
                        Display="Dynamic" Operator="DataTypeCheck">Only Numbers are allowed</asp:CompareValidator>
                    </span>
            </td>
            <td class="style144">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style153">
                &nbsp;</td>
            <td class="style151">
                &nbsp;</td>
            <td class="style145">
                &nbsp;</td>
            <td class="style144">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style153">
                    &nbsp;</td>
            <td class="style151">
                    <strong>Clock Out Time</strong></td>
            <td class="style145">
                    <asp:TextBox ID="TextBoxClockOutTime" runat="server" Width="50px" 
                    Height="23px"></asp:TextBox>
                    <span lang="en-us"> 
                    <br />
                    <asp:RequiredFieldValidator ID="rfvHours0" runat="server" 
                        ErrorMessage="Hour Required" ControlToValidate="TextBoxClockOutTime" 
                        SetFocusOnError="True" ValidationGroup="FormSubmit" Display="Dynamic" >Hour Required</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvHoursNum0" runat="server" 
                        ControlToValidate="TextBoxClockOutTime" ErrorMessage="Only Numbers are allowed" 
                        SetFocusOnError="True" Type="Double" ValidationGroup="FormSubmit" 
                        Display="Dynamic" Operator="DataTypeCheck">Only Numbers are allowed</asp:CompareValidator>
                    </span>
            </td>
            <td class="style144">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style153">
                &nbsp;</td>
            <td class="style151">
                &nbsp;</td>
            <td class="style145">
                &nbsp;</td>
            <td class="style144">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style153">
                &nbsp;</td>
            <td class="style151">
                &nbsp;</td>
            <td class="style145">
                    <asp:Label ID="LabelRecordError" runat="server" ForeColor="#FF3300"></asp:Label>
                </td>
            <td class="style144">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style153">
                &nbsp;</td>
            <td class="style151">
                &nbsp;</td>
            <td class="style145">
                    <asp:Button ID="ButtonSubmit" runat="server" Text="Submit" Width="80px" 
                        ValidationGroup="FormSubmit" onclick="ButtonSubmit_Click" 
                        style="height: 26px" />
                    <input id="ResetForm" class="style6" type="reset" value="Reset" /></td>
            <td class="style144">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
        
    <asp:ScriptManager ID="AJAXScriptManager" runat="server">
    </asp:ScriptManager>
        <asp:HiddenField ID="HiddenFieldProjectID" runat="server" />
        <br />
    
    <asp:SqlDataSource ID="SDSEmpIDNameHourly" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
        
        
        
    
        SelectCommand="SELECT DISTINCT EMPID, EMPID + ': ' + ENAME AS EmpIDName FROM Employees"></asp:SqlDataSource>
        <br />
<br />
<br />
<br />
                    <asp:SqlDataSource ID="SqlDataSourceJobNum" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
                        
                        SelectCommand="select Distinct JOBNUM  from jobs where JOBNUM like '%N%' ;"></asp:SqlDataSource>
                    <cc1:DropDownExtender ID="SqlDataSourceJobNum_DropDownExtender" runat="server" 
                        DynamicServicePath="" Enabled="True" TargetControlID="SqlDataSourceJobNum">
                    </cc1:DropDownExtender>
                    <asp:HiddenField ID="HiddenEID" runat="server" />
                    <asp:HiddenField ID="HiddenJobNum" runat="server" />
                    </asp:Content>