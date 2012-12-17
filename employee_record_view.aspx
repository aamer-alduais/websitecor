
<%@ Page Language="C#" Title="Employee Job Summary : Thermotech"  MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="employee_record_view.aspx.cs" Inherits="Default2" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ContentPlaceHolderID ="head"   runat="server"  id="first">
    <style type="text/css">
        .table
        {
            background-color: #EAEAEA;
            border: .5px solid #808080;
            padding: 1px;
            margin: 1px;
        }
        .style114
        {
            width: 100%;
        }
        .style116
        {
            width: 120px;
        }
        .style122
        {
            width: 153px;
        }
        .style123
        {
            font-weight: bold;
        }
        .style124
        {
            height: 26px;
            width: 28px;
        }
        .style125
        {
            font-size: medium;
        }
        .style126
        {
            height: 26px;
            text-align: left;
            width: 1032px;
        }
        .style127
        {
            height: 26px;
            width: 19px;
        }
        .style130
        {
            width: 100%;
            height: 102px;
        }
        .style131
        {
            width: 199px;
        }
        .total
        {
            background: #ECE9D8;
            width: 300px;
        }
        .style132
        {
            background: #ECE9D8;
            width: 300px;
            height: 25px;
            text-align: left;
        }
        .style133
        {
            width: 1093px;
            height: 272px;
        }
        .style134
        {
            height: 26px;
        }
        .style135
        {
            height: 208px;
        }
        .style136
    {
        width: 1064px;
        padding-left: 10px;
        margin-left: 10px;
    }
        .style137
    {
            width: 85px;
            padding-left: 10px;
            margin-left: 10px;
        }
    .style138
    {
            width: 336px;
            padding-left: 10px;
            margin-left: 10px;
        }
        .style139
        {
            width: 133px;
            height: 133px;
        }
        .style140
        {
            font-weight: normal;
        }
        .style141
        {
            width: 247px;
        }
        .style142
        {
            background-color: #FFFF00;
        }
        </style>
    <link href="style.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ContentPlaceHolderID ="MainContentHolder"  runat="server"  id="Content1">
    <div id="empSummaryBack">
        <table class="style133">
            <tr>
                <td class="style126">
                    <strong>
                    <span lang="en-us" class="style125">Job</span><span class="style125">s Detail 
                    Page</span></strong></td>
                <td class="style127">
                    </td>
                <td class="style124">
                    </td>
            </tr>
            <tr>
                <td colspan="3" class="style134">
                <asp:RadioButtonList ID="RadioButtonListDailyWeeklyCustom" runat="server" 
                        AutoPostBack="True" RepeatDirection="Horizontal" CssClass="style123" 
                        onselectedindexchanged="RadioButtonListDailyWeeklyCustom_SelectedIndexChanged" CellPadding="-1" CellSpacing="-1">
                    <asp:ListItem Selected="True">Daily or Weekly</asp:ListItem>
                    <asp:ListItem>Custom Dates</asp:ListItem>
                                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="style135"> &nbsp;<asp:Panel ID="PanelDailyWeekly" runat="server" CssClass="table" 
                        Visible="False" class="style128" valign="middle" Height="127px">
                        <table  id="table3" cellpadding="0" cellspacing="0" 
    class="style130" CssClass="tableOption">
                            <tr valign="top">
                                <td class="style139">
                                    
                                    <br />
                                    
                                    <asp:RadioButtonList ID="RadioButtonListDailyWeekly" runat="server" 
                                        RepeatDirection="Horizontal" onselectedindexchanged="RadioButtonListDailyWeekly_SelectedIndexChanged" 
                                        >
                                        <asp:ListItem Selected="True">Daily</asp:ListItem>
                                        <asp:ListItem>Weekly</asp:ListItem>
                                    </asp:RadioButtonList> 
                                  
                                </td>
                                <td class="style141">
                                    <span lang="en-us"><strong>
                                    <br />
                                    Date:</strong>
                                    <br />
                                    </span>
                                    <asp:TextBox ID="TextBoxDailyWeeklyDate" runat="server"></asp:TextBox>
                                    <cc1:CalendarExtender ID="TextBoxDailyWeeklyDate_CalendarExtender" 
                                        runat="server" Enabled="True" 
                                        TargetControlID="TextBoxDailyWeeklyDate">
                                    </cc1:CalendarExtender>
                                    <span lang="en-us">
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvDateWeeklyDaily0" runat="server" 
                                        ControlToValidate="TextBoxDailyWeeklyDate" Display="Dynamic" 
                                        ErrorMessage="Date Required"></asp:RequiredFieldValidator>
                                    <asp:Label ID="LabelStartDate" runat="server" CssClass="style142"></asp:Label>
                                    <asp:Label ID="LabelEndDate" runat="server" CssClass="style142"></asp:Label>
                                    <br />
                                    <asp:Button ID="ButtonDisplayDailyWeekly" runat="server" 
                                        onclick="ButtonDisplayDailyWeekly_Click" Text="Display" />
                                    </span>
                                    </td>
                                <td class="style131">
                                    <span lang="en-us"><strong>
                                    <br />
                                    Job Number:</strong><br />
                                    </span>
                                    <asp:TextBox ID="TextBoxDailyWeeklyJobNum" runat="server"></asp:TextBox>
                                    <span lang="en-us">
                                    <br />
                                    (Optional)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                                    </td>
                                <td valign="middle">
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <asp:Panel ID="PanelCustomDate" runat="server" CssClass="table" Visible="False">
                        <span lang="en-us">&nbsp;</span><table ID="table4" cellpadding="0" cellspacing="0" 
                            class="style114">
                            <tr valign="top">
                                <td class="style116">
                                    <span lang="en-us"><strong>&nbsp;&nbsp;&nbsp; Start Date</strong></span></td>
                                <td class="style138">
                                    <asp:TextBox ID="TextBoxStartDate" runat="server"></asp:TextBox>
                                    <cc1:CalendarExtender ID="TextBoxStartDate_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="TextBoxStartDate">
                                    </cc1:CalendarExtender>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvStartDateCustom" runat="server" 
                                        ControlToValidate="TextBoxStartDate" ErrorMessage="Start Date Required"></asp:RequiredFieldValidator>
                                </td>
                                <td class="style137">
                                    <span lang="en-us"><strong>Job Number</strong></span></td>
                                <td class="style122">
                                    <asp:TextBox ID="TextBoxJobNum" runat="server"></asp:TextBox>
                                    <span lang="en-us" class="style140">(Optional)</span></td>
                                <td>
                                    <span lang="en-us">&nbsp; </span>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr valign="top">
                                <td class="style116">
                                    &nbsp;</td>
                                <td class="style138">
                                    &nbsp;</td>
                                <td class="style137">
                                    &nbsp;</td>
                                <td class="style122">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr valign="top">
                                <td class="style116">
                                    <span lang="en-us"><strong>&nbsp;&nbsp;&nbsp; End Date</strong></span></td>
                                <td class="style138">
                                    <span lang="en-us">
                                    <asp:TextBox ID="TextBoxEndDate" runat="server" 
                                        Font-Bold="False">
                                        </asp:TextBox>
                                    <cc1:CalendarExtender ID="TextBoxEndDate_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="TextBoxEndDate">
                                    </cc1:CalendarExtender>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvEndDateCustom" runat="server" 
                                        ControlToValidate="TextBoxEndDate" ErrorMessage="End  Date Required" 
                                        Font-Bold="False"></asp:RequiredFieldValidator>
                                    <br />
                                    <br />
                                    <asp:Button ID="ButtonCustomDisplay" runat="server" 
                                        onclick="ButtonCustomDisplay_Click" Text="Display" />
                                    </span></td>
                                <td class="style137">
                                    &nbsp;</td>
                                <td class="style122">
                                    &nbsp;</td>
                                <td>
                                    <asp:SqlDataSource ID="SDS_Custom_Start_End" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
                                        SelectCommand="SELECT JobNum, JobDescription, TaskType, Date, Hours, Minutes, Comments FROM EmployeeTimeRecord WHERE (Date BETWEEN @StartDate AND @EndDate) AND (EmpName = @EmpName) ORDER BY Date">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="StartDate" SessionField="StartDate" />
                                            <asp:SessionParameter DefaultValue="" Name="EndDate" SessionField="EndDate" />
                                            <asp:SessionParameter DefaultValue="" Name="EmpName" SessionField="EmpName" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SDS_Custom_Start_End_JobNum" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
                                        SelectCommand="SELECT JobNum, JobDescription, TaskType, Date, Hours, Minutes, Comments FROM EmployeeTimeRecord WHERE (Date BETWEEN @StartDate AND @EndDate) AND (EmpName = @EmpName) AND (JobNum = @JobNum) ORDER BY Date">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="StartDate" SessionField="StartDate" />
                                            <asp:SessionParameter Name="EndDate" SessionField="EndDate" />
                                            <asp:SessionParameter DefaultValue="" Name="EmpName" SessionField="EmpName" />
                                            <asp:SessionParameter Name="JobNum" SessionField="JobNum" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
&nbsp;</asp:Panel>
    
                </td>
            </tr>
            </table>
    
    </div>
    <br />
    <table id="table5" cellpadding="0"  cellspacing ="0" class="style136">
        <tr>
            <td>
                    <span lang="en-us"><strong>Job Summary</strong></span></td>
        </tr>
        <tr>
            <td>
    <asp:GridView ID="gvEmployeeTime" runat="server" CellPadding="4" Width="98%"
                    
                  EmptyDataText ="No Record Found." 
                    onrowdatabound="gvEmployeeTime_RowDataBound" AutoGenerateColumns="False" 
                    ForeColor="#333333" GridLines="None" 
                    >
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        
        <Columns>
            <asp:BoundField DataField="JobNum" HeaderText="JobNum" 
                SortExpression="JobNum" />
            <asp:BoundField DataField="JobDescription" HeaderText="JobDescription" 
                SortExpression="JobDescription" />
            <asp:BoundField DataField="TaskType" HeaderText="TaskType" 
                SortExpression="TaskType" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="Hours" HeaderText="Hours" 
                SortExpression="Hours" />
            <asp:BoundField DataField="Minutes" HeaderText="Minutes" 
                SortExpression="Minutes" />
            <asp:BoundField DataField="Comments" HeaderText="Comments" 
                SortExpression="Comments" />
        </Columns>
        
        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>

    <p class="style132">
        <span lang="en-us"><span class="style125"><strong>Total Time: </strong></span>&nbsp;</span><asp:Label 
            ID="LabelHours" runat="server" Font-Bold="True" Font-Size="14pt" Text="hrs"></asp:Label><span lang="en-us">&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelMins" runat="server" Font-Bold="True" Font-Size="14pt" 
            Text="mins"></asp:Label>
        </span></p>
            </td>
        </tr>
    </table>

    <asp:ScriptManager ID="ScriptManagerAJAX" runat="server">
    </asp:ScriptManager>
    <br />
<br />
    <asp:SqlDataSource ID="SDS_DateOnly" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
        SelectCommand="SELECT JobNum, JobDescription, TaskType, Date, Hours, Minutes, Comments FROM EmployeeTimeRecord WHERE (Date = @Date) AND (EmpName = @EmpName) ORDER BY Date">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="" Name="Date" 
                SessionField="DateContainer" />
            <asp:SessionParameter DefaultValue="" Name="EmpName" SessionField="EmpName" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_Weekly" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
        SelectCommand="SELECT JobNum, JobDescription, TaskType, Date, Hours, Minutes, Comments FROM EmployeeTimeRecord WHERE (Date BETWEEN @StartDate AND @EndDate) AND (EmpName = @EmpName) ORDER BY Date">
        <SelectParameters>
            <asp:SessionParameter Name="StartDate" SessionField="StartDateWeekly" />
            <asp:SessionParameter Name="EndDate" SessionField="EndDateWeekly" />
            <asp:SessionParameter DefaultValue="" Name="EmpName" SessionField="EmpName" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SDS_Date_JobNum" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
        SelectCommand="SELECT JobNum, JobDescription, TaskType, Date, Hours, Minutes, Comments FROM EmployeeTimeRecord WHERE (Date = @Date) AND (EmpName = @EmpName) AND (JobNum = @JobNum) ORDER BY Date">
        <SelectParameters>
            <asp:SessionParameter Name="Date" SessionField="DateContainer" />
            <asp:SessionParameter DefaultValue="" Name="EmpName" SessionField="EmpName" />
            <asp:SessionParameter DefaultValue="" Name="JobNum" SessionField="JobNum" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:SqlDataSource ID="SDS_Date_JobNumWeekly" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
        SelectCommand="SELECT JobNum, JobDescription, TaskType, Date, Hours, Minutes, Comments FROM EmployeeTimeRecord WHERE  (Date BETWEEN @StartDate AND @EndDate)  AND (EmpName = @EmpName) AND (JobNum = @JobNum) ORDER BY Date">
        <SelectParameters>
            <asp:SessionParameter Name="StartDate" SessionField="StartDateWeekly" />
            <asp:SessionParameter Name="EndDate" SessionField="EndDateWeekly" />
            <asp:SessionParameter DefaultValue="" Name="EmpName" SessionField="EmpName" />
            <asp:SessionParameter DefaultValue="" Name="JobNum" SessionField="JobNum" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>