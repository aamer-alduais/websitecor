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
        width: 717px;
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
            width: 450px;
        }
        </style>
    <link href="style.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ContentPlaceHolderID ="MainContentHolder"  runat="server"  id="Content1">
    <asp:Button ID="ButtonToggleView" runat="server" Text="Hours by Department" 
        onclick="ButtonToggleView_Click" ValidationGroup="PostPage" />
    
    
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    
    <asp:MultiView ID="MultiViewEmployeeHours" runat="server" ActiveViewIndex="0">
        <asp:View ID="EmployeeHoursSummary" runat="server">    
        <div id="empSummaryBack">
        <table class="style133">
            <tr>
                <td class="style126">
    <asp:RadioButtonList ID="RadioButtonListEmpType" runat="server" 
        RepeatDirection ="Horizontal" AutoPostBack="True" 
        onselectedindexchanged="RadioButtonListEmpType_SelectedIndexChanged" CssClass="style151">
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
                                    <span lang="en-us"><strong>
                       Start Date</strong></span></td>
                   <td class="style142" valign="top">
                                    <asp:TextBox ID="TextBoxStartDate" runat="server"></asp:TextBox>
                                    
                                    <cc1:CalendarExtender ID="TextBoxStartDate_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="TextBoxStartDate">
                                    </cc1:CalendarExtender>
                                    
                                    <asp:Label ID="LabelDateError" runat="server" CssClass="style150"></asp:Label>
                                    <asp:RequiredFieldValidator ID="rfvStartDateCustom" runat="server" 
                                        ControlToValidate="TextBoxStartDate" 
                           ErrorMessage="Start Date Required" Display="Dynamic" ValidationGroup="Dates"></asp:RequiredFieldValidator>
                                    <br />
                                </td>
                   <td class="style146" valign="top">
                                    <span lang="en-us"><strong>
                       End Date</strong></span></td>
                   <td class="style144" valign="top">
                                    <span lang="en-us">
                                    <asp:TextBox ID="TextBoxEndDate" runat="server" 
                                        Font-Bold="False">
                                        </asp:TextBox>
                                    
                                    <cc1:CalendarExtender ID="TextBoxEndDate_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="TextBoxEndDate">
                                    </cc1:CalendarExtender>
                                    
                                    <asp:RequiredFieldValidator ID="rfvEndDateCustom" runat="server" 
                                        ControlToValidate="TextBoxEndDate" ErrorMessage="End  Date Required" 
                                        Font-Bold="False" Display="Dynamic" ValidationGroup="Dates"></asp:RequiredFieldValidator>
                                    </span>
                   </td>
                   <td valign="top">
                       <span lang="en-us">
                                    <asp:Button ID="ButtonCustomDisplay" runat="server" 
                                        onclick="ButtonCustomDisplay_Click" Text="Display" 
                           ValidationGroup="Dates" />
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
                           DataSourceID="SDS_Custom_Start_Salary" Visible="False" ForeColor="#333333" 
                           GridLines="None" onrowdatabound="gvEmployeeTime_RowDataBound" 
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
                           GridLines="None" onrowdatabound="gvEmployeeHourly_RowDataBound" 
                    >
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        
                       <Columns>
                           <asp:BoundField DataField="JobNum" HeaderText="JobNum" 
                               SortExpression="JobNum" ReadOnly="True" />
                           <asp:BoundField DataField="PartDescription" HeaderText="PartDescription" 
                               SortExpression="PartDescription" ReadOnly="True" />
                           <asp:BoundField DataField="CLOCKINDATE" HeaderText="ClockInDate" 
                               SortExpression="CLOCKINDATE" DataFormatString="{0:MM/dd/yyyy}" 
                               ReadOnly="True" />
                           <asp:BoundField DataField="ClockinTime" HeaderText="ClockinTime" 
                               SortExpression="ClockinTime" ReadOnly="True" />
                           <asp:BoundField DataField="ClockOutTime" HeaderText="ClockOutTime" 
                               SortExpression="ClockOutTime" ReadOnly="True" />
                           <asp:BoundField DataField="LaborHrs" HeaderText="LaborHrs" 
                               SortExpression="LaborHrs" ReadOnly="True" />
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
                       <asp:Panel ID="PanelSalariedCharts" runat="server">
                      
                       
                       <asp:Label ID="LabelTotalHours" runat="server" Font-Bold="True" 
                           Font-Overline="False" Font-Size="Large" Font-Underline="True"></asp:Label>
                       <br />
                       <br />
                       <asp:Chart ID="ChartEmployeeHours" runat="server" 
                           DataSourceID="sdsEmpHoursSalaried" Width="600px">
                           <Legends>
                               <asp:Legend AutoFitMinFontSize="10" BackColor="Transparent" 
                                   BackImageTransparentColor="Transparent" IsTextAutoFit="False" 
                                   LegendItemOrder="SameAsSeriesOrder" LegendStyle="Column" Name="LegendEmpHours" 
                                   TableStyle="Tall" TextWrapThreshold="50">
                               </asp:Legend>
                           </Legends>
                           <Series>
                               <asp:Series ChartType="Pie" IsValueShownAsLabel="True" IsXValueIndexed="True" 
                                   Label="#PERCENT" LabelForeColor="Transparent" Legend="LegendEmpHours" 
                                   LegendText="#VALX: #VALY hrs = #PERCENT" Name="SeriesEmpHours" 
                                   XValueMember="TaskType" YValueMembers="Hours">
                               </asp:Series>
                           </Series>
                           <ChartAreas>
                               <asp:ChartArea Name="ChartArea1">
                                   <Area3DStyle Enable3D="True" Inclination="40" />
                               </asp:ChartArea>
                           </ChartAreas>
                       </asp:Chart>
                       <br />
                       <asp:Label ID="lblJobsPerHour" runat="server" Font-Bold="True" 
                           Font-Size="Large" Visible="False"></asp:Label>
                       <br />
                       <br />
                       <asp:Chart ID="ChartEmpHoursPerJobs" runat="server" 
                           DataSourceID="sdsHoursPerJobs" Height="500px" Width="600px">
                           <Legends>
                               <asp:Legend AutoFitMinFontSize="10" BackColor="Transparent" 
                                   BackImageTransparentColor="Transparent" Docking="Bottom" 
                                   IsDockedInsideChartArea="False" LegendItemOrder="SameAsSeriesOrder" 
                                   MaximumAutoSize="100" Name="LegendMain" TableStyle="Wide" TextWrapThreshold="0">
                               </asp:Legend>
                           </Legends>
                           <Series>
                               <asp:Series ChartType="Pie" IsValueShownAsLabel="True" IsXValueIndexed="True" 
                                   Label="#PERCENT" LabelForeColor="Transparent" Legend="LegendMain" 
                                   LegendText="#VALX:  #VALY hrs =  #PERCENT" Name="SeriesEmpHours" 
                                   XValueMember="JobNum" YValueMembers="Hours">
                               </asp:Series>
                           </Series>
                           <ChartAreas>
                               <asp:ChartArea AlignmentOrientation="All" BackImageAlignment="Center" 
                                   Name="ChartArea1">
                                   <Area3DStyle Enable3D="True" />
                               </asp:ChartArea>
                           </ChartAreas>
                       </asp:Chart>
                       
                       
                        </asp:Panel>
                        <br />
                       
                       <asp:Panel ID="PanelHourlyCharts" runat="server">
                       
                      
                       
                           <asp:Label ID="lblHourlyTotal" runat="server" Font-Bold="True" 
                               Font-Size="Large"></asp:Label>
                           <br />
                       
                      
                       
                           <asp:Chart ID="ChartHourly" runat="server" DataSourceID="sdsHourlyEmpHours" 
                               Width="600px">
                               <Legends>
                                   <asp:Legend Name="LegendHourly">
                                   </asp:Legend>
                               </Legends>
                               <Series>
                                   <asp:Series ChartType="Pie" IsValueShownAsLabel="True" Label="#PERCENT" 
                                       LabelForeColor="Transparent" Legend="LegendHourly" 
                                       LegendText="#VALX: #VALY = #PERCENT" Name="Series1" XValueMember="JobNum" 
                                       YValueMembers="Total Hours">
                                   </asp:Series>
                               </Series>
                               <ChartAreas>
                                   <asp:ChartArea Name="ChartArea1">
                                       <Area3DStyle Enable3D="True" />
                                   </asp:ChartArea>
                               </ChartAreas>
                           </asp:Chart>
                       <asp:SqlDataSource ID="sdsHourlyEmpHours" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
                           SelectCommand="select JobNum,SUM(laborhrs) as 'Total Hours' from(
SELECT DISTINCT IndirectCode + '- Indirect Labor' AS JobNum, Description AS 'PartDescription', CLOCKINDATE, ClockinTime, ClockOutTime, LaborHrs FROM indirect WHERE (EmployeeNum = @EmpID) AND (CLOCKINDATE BETWEEN @StartDate AND @EndDate) AND (RTRIM(EmployeeNum) NOT LIKE '%[a-z]%') UNION SELECT DISTINCT JobNum, PartDescription, ClockInDate, ClockinTime, ClockOutTime, LaborHrs AS [Total Hours] FROM JobInfo WHERE (EmpID = @EmpID) AND (ClockInDate BETWEEN @StartDate AND @EndDate) AND (RTRIM(EmployeeNum) NOT LIKE '%[a-z]%') ) as hourlyquery
group by JobNum ">
                           <SelectParameters>
                               <asp:SessionParameter Name="EmpID" SessionField="UserID" />
                               <asp:SessionParameter DefaultValue="" Name="StartDate" 
                                   SessionField="StartDate" />
                               <asp:SessionParameter DefaultValue="" Name="EndDate" SessionField="EndDate" />
                           </SelectParameters>
                       </asp:SqlDataSource>
                       <br />
                       <span ID="ctl00_MainContentHolder_LabelTotalHoursPerJob" 
                           style="FONT-SIZE: large; FONT-WEIGHT: bold; TEXT-DECORATION: underline">
                       <br />
                       </span><span ID="ctl00_MainContentHolder_LabelTotalHoursPerJob" 
                           style="FONT-WEIGHT: bold; TEXT-DECORATION: underline"></span>
                           
                           <br />
                    </asp:Panel>
                       <br />
                   </td>
               </tr>
        </table>
           <br />
            
            
        
    
    </div>
        </asp:View>
        
        <asp:View ID="EmployeeHoursByJobs" runat="server">
            <table class="style114">
                <tr>
                    <td class="style145" valign="top">
                        &nbsp;</td>
                    <td class="style142" valign="top">
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="27px" Width="186px" 
                            DataSourceID="sdsDeptCodes" DataTextField="ResourceGrpID" 
                            DataValueField="ResourceGrpID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="sdsDeptCodes" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
                            SelectCommand="SELECT DISTINCT [ResourceGrpID] FROM [JobInfo] WHERE ([ResourceGrpID] &lt;&gt;'')">
                        </asp:SqlDataSource>
                    </td>
                    <td class="style146" valign="top">
                        &nbsp;</td>
                    <td class="style144" valign="top">
                        &nbsp;</td>
                    <td valign="top">
                        &nbsp;</td>
                    <td valign="top">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style145" valign="top">
                        &nbsp;</td>
                    <td class="style142" valign="top">
                        &nbsp;</td>
                    <td class="style146" valign="top">
                        &nbsp;</td>
                    <td class="style144" valign="top">
                        &nbsp;</td>
                    <td valign="top">
                        &nbsp;</td>
                    <td valign="top">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style145" valign="top">
                        <span lang="en-us"><strong>Start Date</strong></span></td>
                    <td class="style142" valign="top">
                        <asp:TextBox ID="TextBoxStartDateJobHours" runat="server"></asp:TextBox>
                        
                        <cc1:CalendarExtender ID="TextBoxStartDateJobHours_CalendarExtender" 
                            runat="server" Enabled="True" TargetControlID="TextBoxStartDateJobHours">
                        </cc1:CalendarExtender>
                        
                        <asp:Label ID="LabelDateErrorJobHours" runat="server" CssClass="style150"></asp:Label>
                        <asp:RequiredFieldValidator ID="rfvStartDateCustomJobHours" runat="server" 
                            ControlToValidate="TextBoxStartDateJobHours" Display="Dynamic" 
                            ErrorMessage="Start Date Required" ValidationGroup="JobDates"></asp:RequiredFieldValidator>
                        <br />
                    </td>
                    <td class="style146" valign="top">
                        <span lang="en-us"><strong>End Date</strong></span></td>
                    <td class="style144" valign="top">
                        <span lang="en-us">
                        <asp:TextBox ID="TextBoxEndDateJobHours" runat="server" Font-Bold="False"></asp:TextBox>
                        <cc1:CalendarExtender ID="TextBoxEndDateJobHours_CalendarExtender" 
                            runat="server" Enabled="True" TargetControlID="TextBoxEndDateJobHours">
                        </cc1:CalendarExtender>
                        <asp:RequiredFieldValidator ID="rfvEndDateCustomJobHours" runat="server" 
                            ControlToValidate="TextBoxEndDateJobHours" Display="Dynamic" 
                            ErrorMessage="End  Date Required" Font-Bold="False" ValidationGroup="JobDates"></asp:RequiredFieldValidator>
                        </span>
                    </td>
                    <td valign="top">
                        <span lang="en-us">
                        <asp:Button ID="ButtonCustomDisplayJobHours" runat="server" 
                            onclick="ButtonCustomDisplayJobHours_Click" Text="Display" 
                            ValidationGroup="JobDates" />
                        </span>
                    </td>
                    <td valign="top">
                        &nbsp;</td>
                </tr>
            </table>
            <table class="style114">
                <tr>
                    <td class="style152" valign="top">
                        <asp:GridView ID="gvJobHours" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" DataSourceID="SDSJobHours" ForeColor="#333333" GridLines="None">
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField DataField="JobNum" HeaderText="JobNum" 
                                    SortExpression="JobNum" />
                                <asp:BoundField DataField="Hours" HeaderText="Hours" ReadOnly="True" 
                                    SortExpression="Hours" />
                            </Columns>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SDSJobHours" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
                            SelectCommand="SELECT     'Indirect Labor' as JobNum, SUM(LaborHrs) 'Hours'
                       FROM          indirect AS i
                       WHERE      (CLOCKINDATE BETWEEN @StartDate AND @EndDate) AND (ResourceGrpID &lt;&gt; '') AND (ResourceGrpID =@ResourceGrpID) 
                      
                      GROUP BY ResourceGrpID

UNION

SELECT     'Job Labor' as JobNum, SUM(LaborHrs) 'Hours'
                            FROM          JobInfo AS j
                            WHERE      (ClockInDate BETWEEN @StartDate AND @EndDate) AND (ResourceGrpID &lt;&gt; '') AND (ResourceGrpID =@ResourceGrpID)  GROUP BY ResourceGrpID
                       ">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="HiddenFieldJobHourStartDate" Name="StartDate" 
                                    PropertyName="Value" />
                                <asp:ControlParameter ControlID="HiddenFieldJobHourEndDate" Name="EndDate" 
                                    PropertyName="Value" />
                                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="" 
                                    Name="ResourceGrpID" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td valign="top">
                        <br />
                        <asp:Chart ID="ChartJobHours" runat="server" DataSourceID="SDSJobHours" 
                            Width="502px">
                            <Legends>
                                <asp:Legend AutoFitMinFontSize="10" BackColor="Transparent" 
                                    BackImageTransparentColor="Transparent" IsDockedInsideChartArea="False" 
                                    Name="LegendMain" TextWrapThreshold="50">
                                </asp:Legend>
                            </Legends>
                            <Series>
                                <asp:Series ChartType="Pie" IsValueShownAsLabel="True" IsXValueIndexed="True" 
                                    Label="#PERCENT" LabelForeColor="Transparent" Legend="LegendMain" 
                                    LegendText="#VALX:  #VALY hrs =  #PERCENT" Name="SeriesEmpHours" 
                                    XValueMember="JobNum" YValueMembers="Hours">
                                </asp:Series>
                            </Series>
                            <ChartAreas>
                                <asp:ChartArea AlignmentOrientation="All" BackImageAlignment="Right" 
                                    BackImageWrapMode="Scaled" Name="ChartArea1">
                                    <Area3DStyle Enable3D="True" />
                                </asp:ChartArea>
                            </ChartAreas>
                        </asp:Chart>
                    </td>
                </tr>
            </table>
            <br />
        </asp:View>  
    </asp:MultiView>
    
    
     

    <br />

    <asp:SqlDataSource ID="SDSEmpIDNameHourly" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
        
        
        
        
        
        
        SelectCommand="SELECT DISTINCT EmpID, EmpID + '  ' + EName AS EmpIDName, EName FROM JobInfo WHERE (EmpID IS NOT NULL) AND (LEFT (EmpID, 2) &lt;&gt; 'TP') ORDER BY EName"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SDSEmpIDNameSalaried" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
        
        
        
        
        
        
        SelectCommand="SELECT DISTINCT UserID AS EmpID, CAST(UserID AS varchar) + ' ' + FName + ' ' + LName AS EmpIDName, FName FROM Users WHERE (UserID &lt;&gt; 2156) AND (UserID &lt;&gt; 6526) AND (UserID &lt;&gt; 0) AND (Plant &lt;&gt; 'QRO') AND (Plant &lt;&gt; 'JRZ') AND (UserID &lt;&gt; 2003) AND (UserID &lt;&gt; 1997) AND (UserID &lt;&gt; 5544) AND (UserID &lt;&gt; 2024) AND (UserID &lt;&gt; 2595) AND (UserID &lt;&gt; 1112) AND (UserID &lt;&gt; 1111) AND (UserID &lt;&gt; 1113) ORDER BY FName"></asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SDS_Custom_Start_Salary" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
                                        
                                        
        
    
        
        SelectCommand="SELECT JobNum, JobDescription, Date, TaskType, Hours + CONVERT (Dec(12 , 2), Minutes / 60.00) AS Hours, Comments FROM EmployeeTimeRecord WHERE (Date BETWEEN @StartDate AND @EndDate) AND (UserID = @UserID) ORDER BY Date">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="StartDate" SessionField="StartDate" />
                                            <asp:SessionParameter DefaultValue="" Name="EndDate" SessionField="EndDate" />
                                            <asp:SessionParameter Name="UserID" SessionField="UserID" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsHoursPerJobs" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
        
        SelectCommand="SELECT JobNum, SUM(Hours + CONVERT (Dec(12 , 2), Minutes / 60.00)) AS 'Hours' FROM EmployeeTimeRecord WHERE (JobNum IS NOT NULL) AND (JobNum &lt;&gt; '') AND (Date BETWEEN @StartDate AND @EndDate) AND (UserID = @UID) AND (TaskType &lt;&gt; 'Vacation') GROUP BY JobNum ORDER BY JobNum">
        <SelectParameters>
            <asp:SessionParameter Name="StartDate" SessionField="StartDate" />
            <asp:SessionParameter Name="EndDate" SessionField="EndDate" />
            <asp:SessionParameter Name="UID" SessionField="UserID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sdsTotalVacationHours" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
        
        SelectCommand="SELECT JobNum, SUM(Hours + CONVERT (Dec(12 , 2), Minutes / 60.00)) AS 'Hours' FROM EmployeeTimeRecord WHERE (JobNum IS NOT NULL) AND (JobNum &lt;&gt; '') AND (Date BETWEEN @StartDate AND @EndDate) AND (UserID = @UID) AND (TaskType = 'Vacation') GROUP BY JobNum ORDER BY JobNum">
        <SelectParameters>
            <asp:SessionParameter Name="StartDate" SessionField="StartDate" />
            <asp:SessionParameter Name="EndDate" SessionField="EndDate" />
            <asp:SessionParameter Name="UID" SessionField="UserID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
                                    <asp:SqlDataSource ID="SDS_Custom_Start_Hourly" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
                                        
                                        
        
    
        
        
        
        
        SelectCommand="SELECT DISTINCT IndirectCode + '- Indirect Labor' AS JobNum, Description AS 'PartDescription', CLOCKINDATE, ClockinTime, ClockOutTime, LaborHrs FROM indirect WHERE (EmployeeNum = @EmpID) AND (CLOCKINDATE BETWEEN @StartDate AND @EndDate) AND (RTRIM(EmployeeNum) NOT LIKE '%[a-z]%') UNION SELECT DISTINCT JobNum, PartDescription, ClockInDate, ClockinTime, ClockOutTime, LaborHrs AS [Total Hours] FROM JobInfo WHERE (EmpID = @EmpID) AND (ClockInDate BETWEEN @StartDate AND @EndDate) AND (RTRIM(EmployeeNum) NOT LIKE '%[a-z]%') ORDER BY CLOCKINDATE">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="EmpID" SessionField="UserID" />
                                            <asp:SessionParameter Name="StartDate" SessionField="StartDate" />
                                            <asp:SessionParameter DefaultValue="" Name="EndDate" SessionField="EndDate" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
    <asp:HiddenField ID="HiddenFieldJobNum" runat="server" />
<asp:HiddenField ID="HiddenFieldEmpID" runat="server" />
    <asp:HiddenField ID="HiddenFieldStartDate" runat="server" />
    <asp:HiddenField ID="HiddenFieldEndDate" runat="server" />
    <asp:HiddenField ID="HiddenFieldJobHourStartDate" runat="server" />
    <asp:HiddenField ID="HiddenFieldJobHourEndDate" runat="server" />
    <br />

                       <asp:SqlDataSource ID="sdsEmpHoursSalaried" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
                           
                           
    SelectCommand="SELECT TaskType, SUM(Hours + Minutes / 60.00) AS Hours FROM EmployeeTimeRecord WHERE (UserID = @UserID) AND (Date BETWEEN @StartDate AND @EndDate) GROUP BY TaskType">
                           <SelectParameters>
                               <asp:SessionParameter Name="UserID" SessionField="UserID" />
                               <asp:SessionParameter Name="StartDate" SessionField="StartDate" />
                               <asp:SessionParameter Name="EndDate" SessionField="EndDate" />
                           </SelectParameters>
                       </asp:SqlDataSource>
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