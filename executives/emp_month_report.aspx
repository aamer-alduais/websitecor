<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="emp_month_report.aspx.cs" Inherits="executives_emp_month_report" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentHolder" Runat="Server">
    <strong>Salaried Employee Monthly Report</strong><br />
<asp:Label runat="server" Text="lblStartDate">Start Date:</asp:Label> 
<asp:TextBox id="txtStartDate" runat="server"></asp:TextBox> &nbsp;&nbsp;
<asp:Label runat="server" Text="lblEndDate">End Date:</asp:Label> 
<asp:TextBox id="txtEndDate" runat="server"></asp:TextBox> &nbsp;&nbsp; 
    <asp:Button id ="btnRunQuery" runat="server" Text="Run Report"
        onclick="btnRunQuery_Click"></asp:Button>  
        &nbsp;&nbsp;
    <asp:Button ID="btnExportQuery" runat="server" Text="Export Report" 
        onclick="btnExportQuery_Click" />
    <br />
    <span style="color:Red;">
    Date Format
    <strong>(yyyy-mm-dd)</strong></span>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" DataSourceID="sdsEmpMonthReport" EnableModelValidation="True" 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="EmpName" HeaderText="EmpName" ReadOnly="True" 
                SortExpression="EmpName"></asp:BoundField>
            <asp:BoundField DataField="JobNum" HeaderText="JobNum" ReadOnly="True" 
                SortExpression="JobNum"></asp:BoundField>
            <asp:BoundField DataField="ProjectID" HeaderText="ProjectID" ReadOnly="True" 
                SortExpression="ProjectID"></asp:BoundField>
            <asp:BoundField DataField="Hours" HeaderText="Hours" ReadOnly="True" 
                SortExpression="Hours"></asp:BoundField>
            <asp:BoundField DataField="Date" HeaderText="Date" ReadOnly="True" 
                SortExpression="Date"></asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>
    <br />
<br />

    <asp:SqlDataSource ID="sdsEmpMonthReport" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
        SelectCommand="SELECT DISTINCT EmpName, JobNum, ProjectID, Hours + Minutes / 60.00 AS Hours, Date FROM EmployeeTimeRecord WHERE (Date BETWEEN @StartDate AND @EndDate) UNION SELECT DISTINCT EmpName, JobNum, ProjectID, Hours + Minutes / 60.00 AS Hours, Date FROM EpicorVantage.dbo.EmployeeTimeRecord AS EmployeeTimeRecord_1 WHERE (Date BETWEEN @StartDate AND @EndDate) ORDER BY EmpName">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtStartDate" Name="StartDate" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="txtEndDate" Name="EndDate" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

