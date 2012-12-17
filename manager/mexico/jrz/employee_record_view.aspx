<%@ Page Language="C#" Title="Employee Performance Review : Thermotech" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="employee_record_view.aspx.cs" Inherits="Default2" %>
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
        .style122
        {
            width: 153px;
        }
        .style124
        {
            height: 26px;
            width: 28px;
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
        .total
        {
            background: #ECE9D8;
            width: 300px;
        }
        .style133
        {
            width: 1093px;
            height: 73px;
        }
        .style142
        {
            width: 151px;
        }
        .style144
        {
            width: 139px;
        }
        .style145
        {
            width: 49px;
        }
        .style146
        {
            width: 46px;
        }
        .style148
    {
        width: 549px;
    }
    .DropDown
    {
            background-color: #5D7B9D;
            color: #FFFFFF;
            font-weight: bold;
        }
        .style149
        {
            text-align: right;
        }
        .style150
        {
            background-color: #FFFF00;
            font-weight: bold;
        }
        .style151
        {
            font-weight: bold;
        }
        .style152
        {
            font-size: x-large;
            font-family: "Arial Black";
        }
        .style153
        {
            font-size: x-large;
        }
        </style>
    <link href="style.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ContentPlaceHolderID ="MainContentHolder"  runat="server"  id="Content1">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager> 
    <div id="empSummaryBack">
        <table class="style133">
            <tr>
                <td class="style126">
                    <strong><span class="style152">Juarez Plant</span></strong><br 
                        class="style153" />
    <asp:RadioButtonList ID="RadioButtonListEmpType" runat="server" 
        RepeatDirection ="Horizontal" AutoPostBack="True" 
        onselectedindexchanged="RadioButtonListEmpType_SelectedIndexChanged" CssClass="style151" 
                        Visible="False">
        <asp:ListItem Selected="True">Salaried</asp:ListItem>
        <asp:ListItem>Hourly</asp:ListItem>
    </asp:RadioButtonList>
    <asp:DropDownList ID="DropDownListEmpIDName" runat="server" 
        Width="460px" DataTextField="EmpIDName" 
        DataValueField="EMPID"        
       AppendDataBoundItems ="True" DataSourceID="SDSEmpIDNameSalaried" 
                        onselectedindexchanged="DropDownListEmpIDName_SelectedIndexChanged" 
                        AutoPostBack="True" CssClass="DropDown">
          <asp:ListItem Text ="--SELECT--" Value="" ></asp:ListItem>
       
        </asp:DropDownList>  
                    <asp:RequiredFieldValidator ID="rfvDropDownListEmpIDName" 
        runat="server" ControlToValidate ="DropDownListEmpIDName"></asp:RequiredFieldValidator>
        &nbsp; 
                    <asp:Label ID="LabelErrors" runat="server" CssClass="style150"></asp:Label>
                </td>
                <td class="style127" valign="bottom">
                    <asp:Button ID="ButtonCrystalReport" runat="server" OnClick="ButtonCrystalReport_Click"
                   Text="Display Report" /></td>
                <td class="style124">
                    &nbsp;</td>
            </tr>
            </table>
           <table class="style114">
               <tr>
                   <td class="style145" valign="top">
                                    <span lang="en-us" __designer:mapid="224"><strong __designer:mapid="225">
                       Start Date</strong></span></td>
                   <td class="style142" valign="top">
                                    <asp:TextBox ID="TextBoxStartDate" runat="server"></asp:TextBox>
                                    <cc1:CalendarExtender ID="TextBoxStartDate_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="TextBoxStartDate">
                                    </cc1:CalendarExtender>
                                    <asp:Label ID="LabelDateError" runat="server" CssClass="style150"></asp:Label>
                                    <asp:RequiredFieldValidator ID="rfvStartDateCustom" runat="server" 
                                        ControlToValidate="TextBoxStartDate" 
                           ErrorMessage="Start Date Required" Display="Dynamic"></asp:RequiredFieldValidator>
                                    <br />
                                </td>
                   <td class="style146" valign="top">
                                    <span lang="en-us" __designer:mapid="23d"><strong __designer:mapid="23e">
                       End Date</strong></span></td>
                   <td class="style144" valign="top">
                                    <span lang="en-us" __designer:mapid="240">
                                    <asp:TextBox ID="TextBoxEndDate" runat="server" 
                                        Font-Bold="False">
                                        </asp:TextBox>
                                    <cc1:CalendarExtender ID="TextBoxEndDate_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="TextBoxEndDate">
                                    </cc1:CalendarExtender>
                                    <asp:RequiredFieldValidator ID="rfvEndDateCustom" runat="server" 
                                        ControlToValidate="TextBoxEndDate" ErrorMessage="End  Date Required" 
                                        Font-Bold="False" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </span>
                   </td>
                   <td valign="top">
                       <span lang="en-us" __designer:mapid="240">
                                    <asp:Button ID="ButtonCustomDisplay" runat="server" 
                                        onclick="ButtonCustomDisplay_Click" Text="Display" />
                                    </span>
                   </td>
                   <td valign="top">
                       &nbsp;</td>
               </tr>
        </table>
           <table id="table6" cellpadding="0" class="style114">
               <tr>
                   <td class="style148" valign="top">
    <asp:GridView ID="gvEmployeeTime" runat="server" CellPadding="4" Width="100%"
                    
                  EmptyDataText ="No Record Found." AutoGenerateColumns="False" 
                           DataSourceID="SDS_Custom_Start_Salary" ForeColor="#333333" GridLines="None" 
                    >
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        
        <Columns>
            <asp:BoundField DataField="JobNum" HeaderText="JobNum" 
                SortExpression="JobNum" />
            <asp:BoundField DataField="JobDescription" HeaderText="JobDescription" 
                SortExpression="JobDescription" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" 
                DataFormatString="{0:M/d/yyyy}" />
            <asp:BoundField DataField="TaskType" HeaderText="TaskType" 
                SortExpression="TaskType" />
            <asp:BoundField DataField="Hours" HeaderText="Hours" ReadOnly="True" 
                SortExpression="Hours" />
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
            &nbsp;
                       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                       <ContentTemplate>
                       
                   <asp:GridView ID="gvEmployeeHourly" runat="server" CellPadding="4" Width="100%"
                    
                  EmptyDataText ="No Record Found." AutoGenerateColumns="False" 
                           DataSourceID="SDS_Custom_Start_Hourly" Visible="False" ForeColor="#333333" 
                           GridLines="None" 
                    >
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        
                       <Columns>
                           <asp:BoundField DataField="JobNum" HeaderText="JobNum" 
                               SortExpression="JobNum" />
                           <asp:BoundField DataField="PartDescription" HeaderText="PartDescription" 
                               SortExpression="PartDescription" />
                           <asp:BoundField DataField="ClockInDate" HeaderText="ClockInDate" 
                               SortExpression="ClockInDate" DataFormatString="{0:d}" />
                           <asp:BoundField DataField="ClockinTime" HeaderText="ClockinTime" 
                               SortExpression="ClockinTime" />
                           <asp:BoundField DataField="ClockOutTime" HeaderText="ClockOutTime" 
                               SortExpression="ClockOutTime" />
                           <asp:BoundField DataField="Total Hours" HeaderText="Total Hours" 
                               SortExpression="Total Hours" />
                       </Columns>
        
        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                       <EditRowStyle BackColor="#999999" />
                       <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
    </asp:GridView>
    
    
    </ContentTemplate>
    <Triggers>
    <asp:AsyncPostBackTrigger ControlID ="gvEmployeeHourly" EventName ="Sorting" />
    </Triggers>
    </asp:UpdatePanel>
                   </td>
                   <td valign="top" class="style149">
                       <asp:Label ID="LabelTotalHours" runat="server" Font-Bold="True" 
                           Font-Overline="False" Font-Size="Large" Font-Underline="True"></asp:Label>
                       <br />
                <asp:Chart ID="ChartEmpHours" runat="server" Width="502px">
                    <Legends>
                        <asp:Legend Name="LegendMain" AutoFitMinFontSize="10" 
                            BackImageTransparentColor="Transparent" IsDockedInsideChartArea="False" 
                            TextWrapThreshold="50" BackColor="Transparent">
                        </asp:Legend>
                    </Legends>
                    <Series>
                        <asp:Series ChartType="Pie" Legend="LegendMain" Name="SeriesEmpHours" 
                            IsValueShownAsLabel="True" IsXValueIndexed="True" Label="#PERCENT" 
                            LabelForeColor="Transparent" LegendText="#VALX:  #VALY hrs =  #PERCENT">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1" AlignmentOrientation="All" 
                            BackImageAlignment="Right" BackImageWrapMode="Scaled">
                            <Area3DStyle Enable3D="True" />
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
                   </td>
               </tr>
        </table>
           <br />
            
            
        
    
    </div>
    <br />

    <asp:SqlDataSource ID="SDSEmpIDNameHourly" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
        
        
        
        
        
        SelectCommand="SELECT DISTINCT EmpID, EmpID + '  ' + EName AS EmpIDName, EName FROM JobInfo WHERE (EmpID IS NOT NULL AND EmpID &lt;&gt; 'TP1') ORDER BY EName"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSEmpIDNameSalaried" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
        
        
        
        
        
        
    
        SelectCommand="SELECT DISTINCT UserID AS EmpID, CAST(UserID AS varchar) + ' ' + FName + ' ' + LName AS EmpIDName, FName FROM Users WHERE (UserID &lt;&gt; 2156) AND (Plant = 'JRZ') ORDER BY FName"></asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SDS_Custom_Start_Salary" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
                                        
                                        
        
    
        
        
        SelectCommand="SELECT JobNum, JobDescription, Date, TaskType, Hours + CONVERT (Dec(12 , 2), Minutes / 60.00) AS Hours, Comments FROM EmployeeTimeRecordMexico WHERE (Date BETWEEN @StartDate AND @EndDate) AND (UserID = @UserID) ORDER BY Date">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="StartDate" SessionField="StartDate" />
                                            <asp:SessionParameter DefaultValue="" Name="EndDate" SessionField="EndDate" />
                                            <asp:SessionParameter Name="UserID" SessionField="UserID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
    <br />
                                    <asp:SqlDataSource ID="SDS_Custom_Start_Hourly" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
                                        
                                        
        
    
        
        SelectCommand="SELECT JobNum, PartDescription, ClockInDate, ClockinTime, ClockOutTime, LaborHrs AS [Total Hours] FROM JobInfo WHERE (EmpID = @EID) AND (ClockInDate BETWEEN @StartDate AND @EndDate) ORDER BY ClockInDate">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="EID" SessionField="UserID" />
                                            <asp:SessionParameter Name="StartDate" SessionField="StartDate" />
                                            <asp:SessionParameter DefaultValue="" Name="EndDate" SessionField="EndDate" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenFieldJobNum" runat="server" />
<asp:HiddenField ID="HiddenFieldEmpID" runat="server" />
    <asp:HiddenField ID="HiddenFieldStartDate" runat="server" />
    <asp:HiddenField ID="HiddenFieldEndDate" runat="server" />
    <br />
<br />
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
    </asp:Content>