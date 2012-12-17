<%@ Page Title="Project Summary : Thermotech" Language="C#"  MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="manager_summary.aspx.cs" Inherits="manager_summary" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        #RevChart
        {
            border: 1px solid #C0C0C0;
            
        }
        #RevChart0
        {
            background-color: #F8F8F8;
            border: 1px solid #C0C0C0;
            width: 30%;
        }
        #RevChart1
        {
            
            width: 80%;
        }
       
        .style127
        {
            width: 100%;
        }
        .style130
        {
            width: 367px;
            height: 470px;
        }
        .style136
        {
            width: 100%;
            height: 469px;
        }
        .style137
        {
            width: 10px;
        }
        .style138
        {
            width: 158px;
            color: #000000;
            font-size: small;
        }
        .style139
        {
            color: #FFFFFF;
        }
        .style140
        {
            font-size: xx-small;
        }
        .style141
        {
            width: 158px;
            color: #FFFFFF;
            font-size: small;
        }
        .style143
        {
            height: 470px;
            width: 394px;
        }
        .style144
        {
            text-align: left;
        }
        .style145
        {
            font-size: large;
            text-decoration: underline;
        }
        .style146
        {
            text-align: left;
            font-size: large;
            text-decoration: underline;
        }
        .bottomChart
        {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentHolder" Runat="Server">


               <asp:RadioButtonList ID="RadioButtonListToolType" runat="server" 
                   AutoPostBack="True" CssClass="style122" 
                   onselectedindexchanged="RadioButtonListToolType_SelectedIndexChanged" 
                   RepeatDirection="Horizontal">
                   <asp:ListItem Selected="True">New Tools</asp:ListItem>
                   <asp:ListItem>Production Tool</asp:ListItem>
               </asp:RadioButtonList>
               <asp:Panel ID="ProductionToolsPanel" runat="server">
                   <strong>
                   <br />
                   ProjectID: </strong>
               <asp:TextBox ID="TextBoxProductionSearch" runat="server"></asp:TextBox>
<asp:Button ID="ButtonProductionSearch" runat="server" Text="Search" />

                   <asp:GridView ID="gvProductionTool" runat="server" AllowPaging="True" 
                       AutoGenerateColumns="False" CellPadding="4" DataSourceID="SDSProductionTool" 
                       ForeColor="#333333" GridLines="None" 
                       onselectedindexchanged="gvProductionTool_SelectedIndexChanged" Width="100%">
                       <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                       <Columns>
                           <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                           <asp:BoundField DataField="JobNum" HeaderText="JobNum" SortExpression="JobNum">
                           <HeaderStyle HorizontalAlign="Left" />
                           </asp:BoundField>
                           <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name">
                           <HeaderStyle HorizontalAlign="Left" />
                           </asp:BoundField>
                           <asp:BoundField DataField="Project Cost" DataFormatString="{0:0.00}" 
                               HeaderText="Project Cost" ReadOnly="True" SortExpression="Project Cost">
                           <HeaderStyle HorizontalAlign="Left" />
                           </asp:BoundField>
                           <asp:BoundField DataField="Plant" HeaderText="Plant" SortExpression="Plant">
                           <HeaderStyle HorizontalAlign="Left" />
                           </asp:BoundField>
                       </Columns>
                       <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                       <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                       <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                       <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                       <EditRowStyle BackColor="#999999" />
                       <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                   </asp:GridView>
                   <table ID="table4" cellpadding="0" class="style147">
                       <tr>
                           <td>
                               &nbsp;</td>
                       </tr>
                       <tr>
                           <td>
                               &nbsp;</td>
                       </tr>
                       <tr>
                           <td>
                               &nbsp;<asp:Button ID="ButtonPOProduction" runat="server" 
                                   onclick="ButtonPOProduction_Click" Text="PO Details" Width="150px" />
                               &nbsp;&nbsp;
                               <asp:Button ID="ButtonProductionDisplayReport" runat="server" 
                                   Text="Display Report" Width="150px" 
                                   onclick="ButtonProductionDisplayReport_Click" />
                               &nbsp;<asp:HiddenField ID="HiddenFieldProductionNum" runat="server" />
                           </td>
                       </tr>
                       <tr>
                           <td>
                               &nbsp;</td>
                       </tr>
                       <tr>
                           <td ID="RevChart2" align="center" class="style130">
                               <div class="style146">
                               </div>
                               <table ID="table5" cellpadding="0" class="style127">
                                   <tr class="style140">
                                       <td class="style137">
                                           &nbsp;</td>
                                       <td bgcolor="#3782EE" class="style141">
                                           <strong>Project Management</strong></td>
                                       <td class="style144">
                                           <asp:Label ID="LabelPMProduction" runat="server" Font-Bold="True" 
                                               Font-Size="Small"></asp:Label>
                                       </td>
                                   </tr>
                                   <tr class="style140">
                                       <td class="style137">
                                           &nbsp;</td>
                                       <td bgcolor="#FCAC37" class="style138">
                                           <strong>Tool Design</strong></td>
                                       <td class="style144">
                                           <asp:Label ID="LabelTDProduction" runat="server" Font-Bold="True" 
                                               Font-Size="Small"></asp:Label>
                                       </td>
                                   </tr>
                                   <tr class="style140">
                                       <td class="style137">
                                           &nbsp;</td>
                                       <td bgcolor="#DC3607" class="style141">
                                           <strong>Tool Room</strong></td>
                                       <td class="style144">
                                           <asp:Label ID="LabelTBProduction" runat="server" Font-Bold="True" 
                                               Font-Size="Small"></asp:Label>
                                       </td>
                                   </tr>
                                   <tr class="style140">
                                       <td class="style137">
                                           &nbsp;</td>
                                       <td bgcolor="#035988" class="style141">
                                           <strong>Automation</strong></td>
                                       <td class="style144">
                                           <asp:Label ID="LabelAutomationProduction" runat="server" Font-Bold="True" 
                                               Font-Overline="False" Font-Size="Small"></asp:Label>
                                       </td>
                                   </tr>
                                   <tr class="style140">
                                       <td class="style137">
                                           &nbsp;</td>
                                       <td bgcolor="#B8B8B8" class="style138">
                                           <strong>ISIR &amp; Qualification</strong></td>
                                       <td class="style144">
                                           <asp:Label ID="LabelISIRProduction" runat="server" Font-Bold="True" 
                                               Font-Size="Small"></asp:Label>
                                       </td>
                                   </tr>
                                   <tr class="style140">
                                       <td class="style137">
                                           &nbsp;</td>
                                       <td class="style138">
                                           &nbsp;</td>
                                       <td class="style144">
                                           &nbsp;</td>
                                   </tr>
                                   <tr class="style140">
                                       <td class="style137">
                                           &nbsp;</td>
                                       <td bgcolor="Black" class="style138">
                                           <strong><span class="style139">Total Project Hours</span></strong></td>
                                       <td class="style144" valign="top">
                                           <asp:Label ID="LabelTotHoursProduction" runat="server" Font-Bold="True" 
                                               Font-Size="Small"></asp:Label>
                                       </td>
                                   </tr>
                               </table>
                               <br />
                               <asp:Chart ID="ProductionHourChart" runat="server">
                                   <Series>
                                       <asp:Series ChartArea="ChartAreaMain" ChartType="Pie" 
                                           Name="ProductionHourSeries">
                                       </asp:Series>
                                   </Series>
                                   <ChartAreas>
                                       <asp:ChartArea Name="ChartAreaMain">
                                           <Area3DStyle Enable3D="True" />
                                       </asp:ChartArea>
                                   </ChartAreas>
                               </asp:Chart>
                           </td>
                       </tr>
                   </table>
&nbsp;
               <asp:SqlDataSource ID="SDSProductionTool" runat="server" 
                   ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
                   
                       
                       
                       SelectCommand="SELECT DISTINCT Main.JobNum, Customer.Name, (ISNULL(PM.PMHours, 0) + ISNULL(TD.TDHours, 0) + ISNULL(TB.Total_TB_Hours, 0) + ISNULL(SAuto.Total_Auto_Hours, 0) + ISNULL(ISIR.THI, 0) + ISNULL(HAuto.THH, 0) + ISNULL(Salaried_AQE.AQE_Hours, 0) + ISNULL(Processing.Processing_Hours, 0)) * 70.00 AS [Project Cost], Main.Plant FROM ProductionInfo AS Main LEFT OUTER JOIN Customer ON Main.PartNum = Customer.PartNum LEFT OUTER JOIN (SELECT DISTINCT JobNum, SUM(Hours + Minutes / 60.00) AS PMHours FROM EmployeeTimeRecord WHERE (RoleName = 'Project Manager') GROUP BY JobNum) AS PM ON Main.JobNum = PM.JobNum LEFT OUTER JOIN (SELECT DISTINCT JobNum, SUM(Hours + Minutes / 60.00) AS TDHours FROM EmployeeTimeRecord AS EmployeeTimeRecord_3 WHERE (RoleName = 'Tool Designer') GROUP BY JobNum) AS TD ON Main.JobNum = TD.JobNum LEFT OUTER JOIN (SELECT JobNum, ISNULL(SUM(LaborHrs), 0) AS Total_TB_Hours FROM JobLabor WHERE (ResourceGrpID = 'TLROOM') AND (EmployeeNum &lt;&gt; '1122') GROUP BY JobNum) AS TB ON Main.JobNum = TB.JobNum LEFT OUTER JOIN (SELECT DISTINCT JobNum, SUM(LaborHrs) AS THH FROM JobLabor AS j WHERE (ResourceGrpID = 'AUTO') AND (EmployeeNum &lt;&gt; '1122') GROUP BY JobNum) AS HAuto ON Main.JobNum = HAuto.JobNum LEFT OUTER JOIN (SELECT DISTINCT JobNum, SUM(Hours) + SUM(Minutes / 60.00) AS Total_Auto_Hours FROM EmployeeTimeRecord AS e WHERE (RoleName = 'Automation') GROUP BY JobNum) AS SAuto ON Main.JobNum = SAuto.JobNum LEFT OUTER JOIN (SELECT DISTINCT JobNum, ISNULL(SUM(LaborHrs), 0) AS THI FROM JobLabor AS j WHERE (ResourceGrpID = 'ISIR') AND (EmployeeNum &lt;&gt; '1122') GROUP BY JobNum) AS ISIR ON Main.JobNum = ISIR.JobNum LEFT OUTER JOIN (SELECT DISTINCT JobNum, ISNULL(SUM(LaborHrs), 0) AS THQ FROM JobLabor AS j WHERE (ResourceGrpID = 'QUAL') AND (EmployeeNum &lt;&gt; '1122') GROUP BY JobNum) AS Qual ON Main.JobNum = Qual.JobNum LEFT OUTER JOIN (SELECT DISTINCT JobNum, ISNULL(SUM(Hours), 0) + ISNULL(SUM(Minutes / 60.00), 0) AS AQE_Hours FROM EmployeeTimeRecord AS EmployeeTimeRecord_2 WHERE (RoleName = 'AQE') GROUP BY JobNum) AS Salaried_AQE ON Main.JobNum = Salaried_AQE.JobNum LEFT OUTER JOIN (SELECT DISTINCT JobNum, ISNULL(SUM(Hours), 0) + ISNULL(SUM(Minutes / 60.00), 0) AS Processing_Hours FROM EmployeeTimeRecord AS EmployeeTimeRecord_1 WHERE (RoleName = 'Processing') GROUP BY JobNum) AS Processing ON Main.JobNum = Processing.JobNum" 
                       FilterExpression="[JobNum] LIKE '%{0}%' ">
                   <FilterParameters>
                       <asp:ControlParameter ControlID="TextBoxProductionSearch" Name="Main.JobNum" 
                           PropertyName="Text" />
                   </FilterParameters>
               </asp:SqlDataSource>
               </asp:Panel>

<asp:Panel ID="NewToolPanel" runat="server">
         
           <div>
               <strong>
               <br />
               ProjectID:
               </strong>
               <asp:TextBox ID="TextBoxSearch" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="ButtonSearch" runat="server" 
                   Text="Search" />
&nbsp;
               <asp:GridView ID="gvProjectDetail" runat="server" AutoGenerateColumns="False" 
                   DataSourceID="SDS_ProjectDisplay" AllowPaging="True" 
                   CellPadding="4" 
                   onselectedindexchanged="gvProjectDetail_SelectedIndexChanged" Width="100%" 
                   onpageindexchanged="gvProjectDetail_PageIndexChanged" ForeColor="#333333" 
                   GridLines="None">
                   <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                   <Columns>
                       <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                       <asp:BoundField DataField="Project ID" HeaderText="Project ID" 
                           SortExpression="Project ID" />
                       <asp:BoundField DataField="Customer" HeaderText="Customer" 
                           SortExpression="Customer" />
                       <asp:BoundField DataField="Possible Revenue" HeaderText="Possible Revenue" 
                           SortExpression="Possible Revenue" />
                       <asp:BoundField DataField="Project Cost" HeaderText="Project Cost" 
                           ReadOnly="True" SortExpression="Project Cost" />
                   </Columns>
                   <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                   <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                   <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                   <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                       HorizontalAlign="Left" />
                   <EditRowStyle BackColor="#999999" />
                   <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
               </asp:GridView>
               <br />
               <asp:Button ID="GotoJobDetail" runat="server" onclick="GotoJobDetail_Click" 
                   Text="Job Details" Width="150px" />
&nbsp;&nbsp;<asp:Button ID="GotoPOInfo" runat="server" onclick="GotoPOInfo_Click" 
                   Text="PO Details" Width="150px" />
               &nbsp;&nbsp;<asp:Button ID="ButtonCrystalReport" runat="server" OnClick="ButtonCrystalReport_Click"
                   Text="Display Project Report" Width="150px" />&nbsp;&nbsp;<asp:Button 
                   ID="ButtonCrystalReportProjectSummary" runat="server"
                   Text="Display Project Summary" Width="160px" 
                   onclick="ButtonCrystalReportProjectSummary_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <asp:Label ID="LabelAlert" runat="server" BackColor="Red" Font-Bold="True" 
                   Font-Size="Medium" ForeColor="White" 
                   Text="Actual Hours has exceeded Estimated Hours for this Project" 
                   Visible="False"></asp:Label>
               <br />
           </div>
    <table class="style136">
        <tr>
            <td align="center" class="style143" id="RevChart">
                                <div class="style144">
                                    <span class="style145">Estimated Project Hours</span></div>
                                <table id="table3" cellpadding="0" class="style127">
                                    <tr class="style140">
                                        <td class="style137">
                                            &nbsp;</td>
                                        <td bgcolor="#3782EE" class="style141" valign="top">
                                            <strong>Project Management</strong></td>
                                        <td class="style144">
                                            <asp:Label ID="LabelPMEstimated" runat="server" Font-Bold="True" 
                                                Font-Size="Small"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr class="style140">
                                        <td class="style137">
                                            &nbsp;</td>
                                        <td bgcolor="#FCAC37" class="style138">
                                            <strong>Tool Design</strong></td>
                                        <td class="style144">
                                            <asp:Label ID="LabelTDEstimated" runat="server" Font-Bold="True" 
                                                Font-Size="Small"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr class="style140">
                                        <td class="style137">
                                            &nbsp;</td>
                                        <td bgcolor="#DC3607" class="style141">
                                            <strong>Tool Build</strong></td>
                                        <td class="style144">
                                            <asp:Label ID="LabelTBEstimated" runat="server" Font-Bold="True" 
                                                Font-Size="Small"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr class="style140">
                                        <td class="style137">
                                            &nbsp;</td>
                                        <td bgcolor="#035988" class="style141">
                                            <strong>Automation</strong></td>
                                        <td class="style144">
                                            <asp:Label ID="LabelAutomationEstimated" runat="server" Font-Bold="True" 
                                                Font-Overline="False" Font-Size="Small"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr class="style140">
                                        <td class="style137">
                                            &nbsp;</td>
                                        <td bgcolor="#B8B8B8" class="style138">
                                            <strong>ISIR &amp; Qualification</strong></td>
                                        <td class="style144">
                                            <asp:Label ID="LabelISIREstimated" runat="server" Font-Bold="True" 
                                                Font-Size="Small"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr class="style140">
                                        <td class="style137">
                                            &nbsp;</td>
                                        <td class="style138">
                                            &nbsp;</td>
                                        <td class="style144">
                                            &nbsp;</td>
                                    </tr>
                                    <tr class="style140">
                                        <td class="style137">
                                            &nbsp;</td>
                                        <td bgcolor="Black" class="style138">
                                            <strong><span class="style139">Total Project Hours</span></strong></td>
                                        <td class="style144">
                                            <asp:Label ID="LabelTotHoursEstimated" runat="server" Font-Bold="True" 
                                                Font-Size="Small"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                &nbsp;
                <br />
                <asp:Chart ID="EstimatedHoursChart" runat="server">
                    <Series>
                        <asp:Series ChartType="Pie" Name="EstimatedHoursSeries">
                        </asp:Series>
                    </Series>
                    <ChartAreas>
                        <asp:ChartArea Name="ChartArea1">
                            <Area3DStyle Enable3D="True" />
                        </asp:ChartArea>
                    </ChartAreas>
                </asp:Chart>
            </td>
            <td align="center" class="style130" id="RevChart">
                           
                                <div class="style146">
                                    Actual Project Hours<br />
                                </div>
                           
                                <table id="table2" cellpadding="0" class="style127">
                                    <tr class="style140">
                                        <td class="style137">
                                            &nbsp;</td>
                                        <td bgcolor="#3782EE" class="style141">
                                            <strong>Project Management</strong></td>
                                        <td class="style144">
                                            <asp:Label ID="LabelPM" runat="server" Font-Bold="True" Font-Size="Small"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr class="style140">
                                        <td class="style137">
                                            &nbsp;</td>
                                        <td bgcolor="#FCAC37" class="style138">
                                            <strong>Tool Design</strong></td>
                                        <td class="style144">
                                            <asp:Label ID="LabelTD" runat="server" Font-Bold="True" Font-Size="Small"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr class="style140">
                                        <td class="style137">
                                            &nbsp;</td>
                                        <td bgcolor="#DC3607" class="style141">
                                            <strong>Tool Build</strong></td>
                                        <td class="style144">
                                            <asp:Label ID="LabelTB" runat="server" Font-Bold="True" Font-Size="Small"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr class="style140">
                                        <td class="style137">
                                            &nbsp;</td>
                                        <td bgcolor="#035988" class="style141">
                                            <strong>Automation</strong></td>
                                        <td class="style144">
                                            <asp:Label ID="LabelAutomation" runat="server" Font-Bold="True" 
                                                Font-Overline="False" Font-Size="Small"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr class="style140">
                                        <td class="style137">
                                            &nbsp;</td>
                                        <td bgcolor="#B8B8B8" class="style138">
                                            <strong>ISIR &amp; Qualification</strong></td>
                                        <td class="style144">
                                            <asp:Label ID="LabelISIR" runat="server" Font-Bold="True" Font-Size="Small"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr class="style140">
                                        <td class="style137">
                                            &nbsp;</td>
                                        <td class="style138">
                                            &nbsp;</td>
                                        <td class="style144">
                                            &nbsp;</td>
                                    </tr>
                                    <tr class="style140">
                                        <td class="style137">
                                            &nbsp;</td>
                                        <td bgcolor="Black" class="style138">
                                            <strong><span class="style139">Total Project Hours</span></strong></td>
                                        <td valign="top" class="style144">
                                            <asp:Label ID="LabelTotHours" runat="server" Font-Bold="True" Font-Size="Small"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:Chart ID="HoursChart" runat="server">
                                    <Series>
                                        <asp:Series ChartType="Pie" Name="HoursSeries" LabelBorderDashStyle="Dot" 
                                            LabelForeColor="White" IsVisibleInLegend="False">
                                            <SmartLabelStyle AllowOutsidePlotArea="Yes" CalloutBackColor="White" 
                                                CalloutLineAnchorCapStyle="Round" CalloutLineColor="White" 
                                                CalloutLineDashStyle="Dot" CalloutStyle="None" Enabled="False" />
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                            <Area3DStyle Enable3D="True" />
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>

               
             
               </td>
        </tr>
        </table>
         </asp:Panel>
           <br />
    <asp:SqlDataSource ID="SDS_ProjectDisplay" runat="server" 
    ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
    
               
               
               
               
               
               
               
               
    
               SelectCommand="SELECT DISTINCT Main.[Project ID], Customer.NAME AS Customer, DisplayProject.BillingAmount AS [Possible Revenue], (ISNULL(CAST(DisplayProject.BillingAmount AS Dec(12 , 2)), 0)*0.17 + (((((((ISNULL(PM.PMHours, 0.00) * 70.00 + ISNULL(TD.TDHours, 0.00) * 70.00) + ISNULL(TB.Total_TB_Hours, 0.00) * 70.00) + ISNULL(HAuto.THH, 0.00) * 70.00) + ISNULL(SAuto.Total_Auto_Hours, 0.00) * 70.00) + ISNULL(ISIR.THI, 0.00) * 70.00) + ISNULL(Qual.THQ, 0.00) * 70.00) + ISNULL(Salaried_AQE.AQE_Hours, 0.00) * 70.00)) + ISNULL(Processing.Processing_Hours, 0.00) * 70.00 + ISNULL(JobCost.JobCosting, 0.00) + ISNULL(POCost.PCost, 0.00) AS [Project Cost] FROM (SELECT DISTINCT M.PROJECTID AS [Project ID], ISNULL(MS.TotPosRev, 0) AS [Total Possible Rev.], ISNULL(I_1.ExtPrice, 0) AS [Total Rev. Todate] FROM Milestone AS M INNER JOIN (SELECT PROJECTID, SUM(EXTPRICE) AS ExtPrice FROM InvoiceM AS I GROUP BY PROJECTID) AS I_1 ON M.PROJECTID = I_1.PROJECTID INNER JOIN (SELECT PROJECTID, SUM(BILLINGAMOUNT) AS TotPosRev FROM Milestone AS M GROUP BY PROJECTID) AS MS ON M.PROJECTID = MS.PROJECTID) AS Main LEFT OUTER JOIN DisplayProject ON Main.[Project ID] = DisplayProject.ProjectID LEFT OUTER JOIN Customer ON Main.[Project ID] = Customer.PROJECTID LEFT OUTER JOIN (SELECT DISTINCT ProjectID, SUM(Hours + Minutes / 60.00) AS PMHours FROM EmployeeTimeRecord WHERE (RoleName = 'Project Manager') GROUP BY ProjectID) AS PM ON Main.[Project ID] = PM.ProjectID LEFT OUTER JOIN (SELECT DISTINCT ProjectID, SUM(Hours + Minutes / 60.00) AS TDHours FROM EmployeeTimeRecord AS EmployeeTimeRecord_3 WHERE (RoleName = 'Tool Designer') GROUP BY ProjectID) AS TD ON Main.[Project ID] = TD.ProjectID LEFT OUTER JOIN (SELECT PROJECTID, ISNULL(SUM(LABORHRS), 0) AS Total_TB_Hours FROM JobLabor WHERE (RESOURCEGRPID = 'TLROOM') AND (EMPLOYEENUM &lt;&gt; '1122') GROUP BY PROJECTID) AS TB ON Main.[Project ID] = TB.PROJECTID LEFT OUTER JOIN (SELECT DISTINCT PROJECTID, SUM(LABORHRS) AS THH FROM JobLabor AS j WHERE (RESOURCEGRPID = 'AUTO') AND (EMPLOYEENUM &lt;&gt; '1122') GROUP BY PROJECTID) AS HAuto ON Main.[Project ID] = HAuto.PROJECTID LEFT OUTER JOIN (SELECT DISTINCT ProjectID, SUM(Hours) + SUM(Minutes / 60.00) AS Total_Auto_Hours FROM EmployeeTimeRecord AS e WHERE (RoleName = 'Automation') GROUP BY ProjectID) AS SAuto ON Main.[Project ID] = SAuto.ProjectID LEFT OUTER JOIN (SELECT DISTINCT PROJECTID, ISNULL(SUM(LABORHRS), 0) AS THI FROM JobLabor AS j WHERE (RESOURCEGRPID = 'ISIR') AND (EMPLOYEENUM &lt;&gt; '1122') GROUP BY PROJECTID) AS ISIR ON Main.[Project ID] = ISIR.PROJECTID LEFT OUTER JOIN (SELECT DISTINCT PROJECTID, ISNULL(SUM(LABORHRS), 0) AS THQ FROM JobLabor AS j WHERE (RESOURCEGRPID = 'QUAL') AND (EMPLOYEENUM &lt;&gt; '1122') GROUP BY PROJECTID) AS Qual ON Main.[Project ID] = Qual.PROJECTID LEFT OUTER JOIN (SELECT DISTINCT ProjectID, ISNULL(SUM(Hours), 0) + ISNULL(SUM(Minutes / 60.00), 0) AS AQE_Hours FROM EmployeeTimeRecord AS EmployeeTimeRecord_2 WHERE (RoleName = 'AQE') GROUP BY ProjectID) AS Salaried_AQE ON Main.[Project ID] = Salaried_AQE.ProjectID LEFT OUTER JOIN (SELECT DISTINCT ProjectID, ISNULL(SUM(Hours), 0) + ISNULL(SUM(Minutes / 60.00), 0) AS Processing_Hours FROM EmployeeTimeRecord AS EmployeeTimeRecord_1 WHERE (RoleName = 'Processing') GROUP BY ProjectID) AS Processing ON Main.[Project ID] = Processing.ProjectID LEFT OUTER JOIN (SELECT PROJECTID, SUM(Cost) AS JobCosting FROM (SELECT DISTINCT PROJECTID, CASE WHEN JOBNUM LIKE 'N%' THEN 0 ELSE TLALABORCOST + TLAMATERIALCOST + TLASUBCONTRACTCOST + TLABURDENCOST END AS Cost FROM Jobs) AS JCost GROUP BY PROJECTID) AS JobCost ON Main.[Project ID] = JobCost.PROJECTID LEFT OUTER JOIN (SELECT PROJECTID, SUM(POCost) AS PCost FROM (SELECT DISTINCT PROJECTID, PONUM, POLINE, PORELNUM, SUM(EXTCOST) AS POCost FROM POInfo AS PInv GROUP BY PROJECTID, PONUM, POLINE, PORELNUM) AS PCost GROUP BY PROJECTID) AS POCost ON Main.[Project ID] = POCost.PROJECTID" 
               FilterExpression="[Project ID] LIKE '%{0}%' ">
        <FilterParameters>
            <asp:ControlParameter ControlID="TextBoxSearch" Name="ProjectID" 
                PropertyName="Text" />
        </FilterParameters>
           </asp:SqlDataSource>
<br />
&nbsp;

</asp:Content>

