<%@ Page Language="C#" Title="Job Information : Thermotech" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="job_display_manager.aspx.cs" Inherits="job_display" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>

<asp:Content ContentPlaceHolderID ="head"   runat="server"  id="first">


    <link href="style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style111
        {
            height: 36px;
        }
        .style112
        {
            width: 333px;
        }
        .style113
        {
            width: 982px;
        }
        .style114
        {
            width: 97%;
        }
        .style115
        {
        height: 19px;
        width: 342px;
    }
        .style119
        {
            text-align: right;
            width: 588px;
        }
        .style116
        {
            font-size: large;
        }
        .newStyle1
        {
            background-color: #5D7B9D;
            color: #FFFFFF;
        }
    .style122
    {
        height: 19px;
    }
    .style123
    {
        height: 19px;
        width: 342px;
        text-align: right;
    }
        .style125
        {
            height: 29px;
            text-align: right;
        }
        .style126
        {
            text-align: right;
            width: 224px;
            padding-left: 10px;
            margin-left: 10px;
        }
        .style127
        {
            text-align: right;
            width: 58px;
            padding-left: 10px;
            margin-left: 10px;
        }
        .style128
        {
            text-align: right;
            width: 449px;
            padding-left: 10px;
            margin-left: 10px;
        }
        .style129
        {
            width: 4px;
        }
        .style130
        {
            height: 29px;
            width: 599px;
        }
        .style131
        {
            color: #808080;
        }
        .style132
        {
            height: 8px;
            width: 599px;
        }
        .style133
        {
            height: 8px;
            text-align: right;
        }
        .style134
        {
            height: 29px;
            width: 599px;
            font-size: medium;
        }
        .style136 a
        {
            background-color: #FFFF00;
            font-weight: bold;
        }
        .hyperlink a
        {
            background-color: #FFFF00;
        }
        a:hover
        {
            font-weight: bold;
            color: #FF0000;
        }
        
        {
            background-color: #FFFF00;
        }
        .style135
        {
            background-color: #5D7B9D;
            color: #FFFFFF;
            font-weight: bold;
        }
    .style136
    {
        font-size: large;
        font-weight: bold;
    }
    </style>
</asp:Content>

<asp:Content ContentPlaceHolderID ="MainContentHolder"  runat="server"  id="Content1">
        <table id="MainTable" cellpadding="0" cellspacing="0" class="style113">
            <tr>
                <td class="style134" valign="top">
                    <asp:HyperLink ID="HyperLinkGoBack" runat="server" CssClass="style136" 
                        NavigateUrl="~/manager/manager_summary.aspx" 
                        style="background-color: #FFFF00">&lt;&lt; Go to Project Summary Page</asp:HyperLink>
                </td>
                
                <td class="style125">
                    &nbsp;</td>
                
            </tr>
            <tr>
                <td class="style132" valign="top">
                </td>
                
                <td class="style133">
                </td>
                
            </tr>
            <tr>
                <td class="style130" valign="top">
                    &nbsp;</td>
                
                <td class="style125">
                    &nbsp;</td>
                
            </tr>
            <tr>
                <td class="style130" valign="top">
                    <strong>Project ID:&nbsp;
                    <asp:Label ID="LabelProjectID" runat="server" Font-Bold="True" 
                        Font-Size="Medium" Font-Underline="True"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Customer:&nbsp; <asp:Label ID="LabelCustomerName" 
                        runat="server" Font-Bold="True" Font-Size="Medium" Font-Underline="True"></asp:Label>
                    </strong>
                </td>
                
                <td class="style125">
                    <span class="style131"><font size="2">Select a different Project:</font></span><strong>
        <asp:TextBox ID="TextBoxProjectID" runat="server"></asp:TextBox>
                    <asp:Button ID="ButtonChangeProjectIDSession" runat="server" 
            Text="Submit" onclick="ButtonChangeProjectIDSession_Click" />
                    </strong>
                </td>
                
            </tr>
            </table>
        <table id="table4" cellpadding="0" cellspacing="0" class="style113">
            <tr>
                <td colspan="9">
                    <strong>
                    <br />
                    Job Information<asp:GridView ID="gvJobsDisplay" runat="server" AutoGenerateColumns="False" 
            CellPadding="4" DataSourceID="SDSJobs" 
            onselectedindexchanged="gvJobsDisplay_SelectedIndexChanged" Width="99%" 
                            onrowdatabound="gvJobsDisplay_RowDataBound" ForeColor="#333333" 
                        GridLines="None">
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:CommandField ButtonType="Button" ShowSelectButton="True" />
                            <asp:BoundField DataField="Job Num" HeaderText="Job Num" 
                                SortExpression="Job Num" />
                            <asp:BoundField DataField="Part Num" HeaderText="Part Num" 
                                SortExpression="Part Num" />
                            <asp:BoundField DataField="Part Description" HeaderText="Part Description" 
                                SortExpression="Part Description" />
                            <asp:BoundField DataField="Required Qty" HeaderText="Required Qty" 
                                SortExpression="Required Qty" />
                            <asp:BoundField DataField="Qty Completed" HeaderText="Qty Completed" 
                                SortExpression="Qty Completed" />
                            <asp:CheckBoxField DataField="Job Complete" HeaderText="Job Complete" 
                                SortExpression="Job Complete" />
                            <asp:BoundField DataField="Job Completion Date" 
                                HeaderText="Job Completion Date" SortExpression="Job Completion Date" 
                                DataFormatString="{0:d}" />
                            <asp:CheckBoxField DataField="Job Closed" HeaderText="Job Closed" 
                                SortExpression="Job Closed" />
                            <asp:BoundField DataField="Close Date" HeaderText="Close Date" 
                                SortExpression="Close Date" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="TLA Setup Hours" HeaderText="TLA Setup Hours" 
                                SortExpression="TLA Setup Hours" />
                            <asp:BoundField DataField="TLA Prod Hours" HeaderText="TLA Prod Hours" 
                                SortExpression="TLA Prod Hours" />
                            <asp:BoundField DataField="Cost" HeaderText="Cost" ReadOnly="True" 
                                SortExpression="Cost" />
                        </Columns>
            <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:GridView></strong></td>
            </tr>
            <tr>
                <td colspan="9">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="9">
                    <asp:Panel ID="JobGridPanel" runat="server" 
                        ScrollBars="Auto" Width="80%">
                        
                        </asp:Panel>
                    </td>
            </tr>
            <tr>
                <td class="style107">
                    &nbsp;</td>
                <td class="style107">
                    &nbsp;</td>
                <td class="style107">
                    &nbsp;</td>
                <td class="style126">
                    &nbsp;</td>
                <td class="style119">
                    &nbsp;</td>
                <td class="style127">
                    &nbsp;</td>
                <td class="style128">
                    <span lang="en-us"><span class="style116">Total Job Cost: </span>
                    <asp:Label ID="LabelTotalJobCost" runat="server" Font-Size="X-Large"></asp:Label>
                    </span>&nbsp;</td>
                <td class="style127">
                    &nbsp;</td>
                <td class="style129">
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <table id="table2" style="width:100%;">
            <tr>
                <td class="style122">
                    <span lang="en-us"><strong>
                    <br />
                    Operation Sequence                        
                    </strong>&nbsp; </span>
    
                </td>
                <td class="style115">
                    </td>
                <td class="style123">
                    </td>
                <td class="style115">
                    </td>
                <td class="style122">
                    <span lang="en-us">&nbsp;</span></td>
                <td class="style122" colspan="2">
                    </td>
                <td rowspan="2">
                    &nbsp;</td>
                <td rowspan="2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style112" valign="top">
        <asp:DropDownList ID="DropDownListOperationSequence" runat="server" 
            Width="311px" 
                        AutoPostBack="True" CssClass="style135">
        </asp:DropDownList>
    
                    <span lang="en-us">&nbsp;</span></td>
                <td class="style114" colspan="4">
                    <asp:DetailsView ID="DetailsViewJobStandards" runat="server" 
                        Height="50px" Width="231px" AutoGenerateRows="False" 
                        DataSourceID="SDSJobStandards" Font-Bold="True" CellPadding="4" 
                        ForeColor="#333333" GridLines="None">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#E9ECF1" Width="200px" Font-Bold="True" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <Fields>
                            <asp:BoundField DataField="Job Num" HeaderText="Job Num" 
                                SortExpression="Job Num" />
                            <asp:BoundField DataField="Operation Description" 
                                HeaderText="Operation Description" SortExpression="Operation Description" />
                            <asp:BoundField DataField="Prod Crew Size" HeaderText="Prod Crew Size" 
                                SortExpression="Prod Crew Size" />
                            <asp:BoundField DataField="Prod Standard" HeaderText="Prod Standard" 
                                SortExpression="Prod Standard" />
                            <asp:BoundField DataField="Setup Crew Size" HeaderText="Setup Crew Size" 
                                SortExpression="Setup Crew Size" />
                        </Fields>
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:DetailsView>
                    </td>
                <td>
        <asp:SqlDataSource ID="SDSJobs" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
            
            
            SelectCommand="SELECT DISTINCT JOBNUM AS [Job Num], PARTNUM AS [Part Num], PARTDESCRIPTION AS [Part Description], REQUIREDQTY AS [Required Qty], QTYCOMPLETED AS [Qty Completed], JOBCOMPLETE AS [Job Complete], JOBCOMPLETIONDATE AS [Job Completion Date], JOBCLOSED AS [Job Closed], CLOSEDDATE AS [Close Date], TLASETUPHOURS AS [TLA Setup Hours], 
TLAPRODHOURS AS [TLA Prod Hours],
CASE 
 
	WHEN JOBNUM LIKE 'N%' THEN
	0
	ELSE
	TLALABORCOST + TLAMATERIALCOST + TLASUBCONTRACTCOST + TLABURDENCOST
END
 AS Cost FROM Jobs WHERE (PROJECTID = @PID)
">
            <SelectParameters>
                <asp:SessionParameter Name="PID" SessionField="ProjectID" />
            </SelectParameters>
        </asp:SqlDataSource>
    
                    <asp:SqlDataSource ID="SDSJobStandards" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" SelectCommand="SELECT DISTINCT 
                      js.JOBNUM AS [Job Num], jl.OPDESC AS [Operation Description], js.PRODCREWSIZE AS [Prod Crew Size], js.PRODSTANDARD AS [Prod Standard], 
                      js.SETUPCREWSIZE AS [Setup Crew Size]
FROM         JobStandards AS js INNER JOIN
                      JobLabor AS jl ON js.JOBNUM = jl.JOBNUM AND js.OPRSEQ = jl.OPRSEQ
WHERE     (js.JOBNUM = @JobNum) AND (js.OPRSEQ = @OprSeq);  
">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="HiddenFieldJobNum" Name="JobNum" 
                                PropertyName="Value" />
                            <asp:ControlParameter ControlID="DropDownListOperationSequence" Name="OprSeq" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:HiddenField ID="HiddenFieldJobNum" runat="server" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <table id="table3" style="width:100%;">
            <tr>
                <td class="style111" colspan="3">
                    <span lang="en-us"><strong>
                    Labor Detail                        
                    </strong>&nbsp; </span>
    
                </td>
                <td rowspan="2">
                    &nbsp;</td>
                <td rowspan="2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td valign="top">
                    <asp:GridView ID="gvEmployeeHours" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" DataSourceID="SDSLaborDetail" AllowPaging="True" 
                        ForeColor="#333333" GridLines="None" 
                        onrowdatabound="gvEmployeeHours_RowDataBound">
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="Employee ID" HeaderText="Employee ID" 
                                SortExpression="Employee ID" />
                            <asp:BoundField DataField="Employee Name" HeaderText="Employee Name" 
                                SortExpression="Employee Name" />
                            <asp:BoundField DataField="Clock In Date" DataFormatString="{0:M/d/yyyy}" 
                                HeaderText="Clock In Date" SortExpression="Clock In Date" />
                            <asp:BoundField DataField="Clock In Time" HeaderText="Clock In Time" 
                                SortExpression="Clock In Time" />
                            <asp:BoundField DataField="Clock Out Time" HeaderText="Clock Out Time" 
                                SortExpression="Clock Out Time" />
                            <asp:BoundField DataField="Labor Hours" HeaderText="Labor Hours" 
                                SortExpression="Labor Hours" DataFormatString="{0:0.00}" />
                            <asp:BoundField DataField="Resource Grp ID" HeaderText="Resource Grp ID" 
                                SortExpression="Resource Grp ID" />
                        </Columns>
                        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
                </td>
                <td>
                    <asp:SqlDataSource ID="SDSLaborDetail" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
                        
                        
                        
                        
                        
                        SelectCommand="SELECT DISTINCT Employees.EMPID AS [Employee ID], Employees.ENAME AS [Employee Name], CAST(JobLabor.CLOCKINDATE AS Date) AS [Clock In Date], JobLabor.CLOCKINTIME AS [Clock In Time], JobLabor.CLOCKOUTTIME AS [Clock Out Time], JobLabor.LABORHRS AS [Labor Hours], JobLabor.RESOURCEGRPID AS [Resource Grp ID] FROM JobLabor INNER JOIN Employees ON JobLabor.EMPLOYEENUM = Employees.EMPID INNER JOIN JobStandards ON JobLabor.OPRSEQ = JobStandards.OPRSEQ AND JobLabor.JOBNUM = JobStandards.JOBNUM WHERE (JobLabor.OPRSEQ = @OprSeq) AND (JobLabor.JOBNUM = @JobNum) AND (Employees.EMPID &lt;&gt; '1122')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownListOperationSequence" Name="OprSeq" 
                                PropertyName="SelectedValue" />
                            <asp:ControlParameter ControlID="HiddenFieldJobNum" Name="JobNum" 
                                PropertyName="Value" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
    
  
    <p>
        <span class="style116"><strong>Total Labor Hours:</strong></span>
        <asp:Label ID="LabelTotalHours" runat="server" CssClass="style136"></asp:Label>
    &nbsp;<span class="style116"><strong>hrs</strong></span></p>
</asp:Content>