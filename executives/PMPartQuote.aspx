<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PMPartQuote.aspx.cs" Inherits="executives_PMPartQuote" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentHolder" Runat="Server">
    <p>
        <asp:Label ID="Label1" runat="server" Text="PM Part Quote" Font-Bold="True" Font-Size="Medium"></asp:Label>
    </p>
    
    <div>
        <!-- header -->
        <table>
            <tr>
                <td valign="top">
                    <!-- checkboxes -->
                    <asp:CheckBox AutoPostBack="true" ID="chkShowAllPartsDetails" runat="server" Text="Show All Parts" OnCheckedChanged="chkShowAllPartsDetails_CheckedChanged" />
                        <br />
                    <asp:CheckBox AutoPostBack="true" ID="chkShowSelectedPartDetails" runat="server" Text="Show Selected Part"  OnCheckedChanged="chkShowSelectedPartDetails_CheckedChanged" />
                        <br />
                </td>
                <td valign="top">
                    <!-- part number -->
                     <asp:Label ID="lblSelectPartNumber" runat="server" Text="Select Part Number" /><br />
                     <asp:ListBox ID="PartNumberListBox" runat="server" Width="212px" Height="92px" 
                                DataSourceID="PartNumberDataSource" DataTextField="Part" 
                                DataValueField="Part" AutoPostBack="True" 
                                onselectedindexchanged="PartNumberListBox_SelectedIndexChanged" />
                    <asp:SqlDataSource ID="PartNumberDataSource" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
                                SelectCommand="SELECT DISTINCT [Part] FROM [PMPartQuote] ORDER BY [Part]" />
       
                    <asp:ToolkitScriptManager ID="ScriptManager1" runat="server" />

                 
                </td>
                <td valign="top">
                        <asp:Label ID="lblEnterPartNumber" runat="server" Text="OR Enter Part Number" /><br />
                       <asp:TextBox ID="txtPartNumber" runat="server" AutoPostBack="True" 
                                Width="180px" ontextchanged="txtPartNumber_TextChanged"></asp:TextBox>
                    <asp:AutoCompleteExtender ID="txtPartNumber_AutoCompleteExtender" 
                                runat="server" DelimiterCharacters="" Enabled="True" 
                                ServiceMethod="GetCompletionList" ServicePath="" 
                                TargetControlID="txtPartNumber" UseContextKey="True" MinimumPrefixLength="1" />
                </td>
                <td valign="bottom">
                    <!-- buttons -->
                    <asp:Button ID="PMPartQuoteButton" runat="server" Text="Run PMPart Quote Report" Width="255px" onclick="PMPartQuoteButton_Click" />
                </td>
            </tr>
        </table>
    </div>
       
    <p>
        

    </p>
    <p>
        <asp:GridView ID="PartNumberGridView" runat="server" AutoGenerateColumns="False" 
            DataSourceID="PMPartQuoteDataSource1" CellPadding="4" AllowPaging="True" 
            BackColor="White" BorderColor="#3366CC" BorderStyle="None" 
            BorderWidth="1px" onrowdatabound="PartNumberGridView_RowDataBound">
            <Columns>
                <asp:BoundField DataField="Part" HeaderText="Part" SortExpression="Part" />
                <asp:BoundField DataField="Rev" HeaderText="Rev" SortExpression="Rev" />
                <asp:BoundField DataField="PartUnitPrice" HeaderText="Part Unit Price" 
                    SortExpression="PartUnitPrice" />
                <asp:BoundField DataField="CycleTime" HeaderText="Cycle Time" 
                    SortExpression="CycleTime" />
                <asp:BoundField DataField="CycleTime Actual" HeaderText="Cycle Time Actual" 
                    SortExpression="CycleTime Actual" />
                <asp:BoundField DataField="# Of Cavities" HeaderText="# Of Cavities" 
                    SortExpression="# Of Cavities" />
                <asp:BoundField DataField="PartWeight(Lbs)" HeaderText="Part Weight (Lbs)" 
                    SortExpression="PartWeight(Lbs)" />
                <asp:BoundField DataField="RunnerWeight(Lbs)" HeaderText="Runner Weight (Lbs)" 
                    SortExpression="RunnerWeight(Lbs)" Visible="False" />
                <asp:BoundField DataField="Lbs/Hr" HeaderText="Lbs/Hr" 
                    SortExpression="Lbs/Hr" Visible="False" />
                <asp:BoundField DataField="MaterialPart#" HeaderText="Material Part #" 
                    SortExpression="MaterialPart#" />
                <asp:BoundField DataField="Qty/Parent" HeaderText="Qty Parent" 
                    SortExpression="Qty/Parent" />
                <asp:BoundField DataField="StdMtlCost" HeaderText="Std Mtl Cost" 
                    SortExpression="StdMtlCost" />
                <asp:BoundField DataField="MaterialScrap" HeaderText="Material Scrap %" 
                    SortExpression="MaterialScrap" />
                <asp:BoundField DataField="MaterialScrap Type" HeaderText="MaterialScrap Type" 
                    SortExpression="MaterialScrap Type" Visible="False" />
                <asp:BoundField DataField="ProdScrap" HeaderText="Prod Scrap %" 
                    SortExpression="ProdScrap" />
                <asp:BoundField DataField="Prod Std" HeaderText="PPH" 
                    SortExpression="Prod Std" />
                <asp:BoundField DataField="PPH Quoted" HeaderText="PPH Quoted" 
                    SortExpression="PPH Quoted" />
                <asp:BoundField DataField="ProdScrap Type" HeaderText="ProdScrap Type" 
                    SortExpression="ProdScrap Type" Visible="False" />
                <asp:BoundField DataField="Str Format" HeaderText="Str Format" 
                    SortExpression="Str Format" Visible="False" />
                <asp:BoundField DataField="OptDtlDesc" HeaderText="Opt Dtl Desc" 
                    SortExpression="OptDtlDesc" />
                <asp:BoundField DataField="ResourceLaborRate" HeaderText="Resource Labor Rate" 
                    SortExpression="ResourceLaborRate" Visible="False" />
                <asp:BoundField DataField="ResourseBurdenRate" HeaderText="Resourse Burden Rate" 
                    SortExpression="ResourseBurdenRate" Visible="False" />
                <asp:BoundField DataField="MaxRegring%" HeaderText="Max Regring %" 
                    SortExpression="MaxRegring%" Visible="False" />
                <asp:BoundField DataField="RunnerToShot%" HeaderText="RunnerToShot%" 
                    SortExpression="RunnerToShot%" Visible="False" />
                <asp:BoundField DataField="ShotWeight(Lbs)" HeaderText="ShotWeight(Lbs)" 
                    SortExpression="ShotWeight(Lbs)" Visible="False" />
                <asp:BoundField DataField="SPH" HeaderText="SPH" SortExpression="SPH" Visible="False" />
                <asp:BoundField DataField="StartDate" HeaderText="StartDate" 
                    SortExpression="StartDate" Visible="False" />
                <asp:BoundField DataField="EndDate" HeaderText="EndDate" 
                    SortExpression="EndDate" Visible="False" />
                <asp:BoundField DataField="EstProdHours_Avg" HeaderText="EstProdHours_Avg" 
                    SortExpression="EstProdHours_Avg" Visible="False" />
                <asp:BoundField DataField="ActProdHours_Avg" HeaderText="ActProdHours_Avg" 
                    SortExpression="ActProdHours_Avg" Visible="False" />
                <asp:BoundField DataField="StdLabor_Avg" HeaderText="StdLabor_Avg" 
                    SortExpression="StdLabor_Avg" Visible="False" />
                <asp:BoundField DataField="ActLabCost_Avg" HeaderText="ActLabCost_Avg" 
                    SortExpression="ActLabCost_Avg" Visible="False" />
                <asp:BoundField DataField="EstProdHours_Sum" HeaderText="EstProdHours_Sum" 
                    SortExpression="EstProdHours_Sum" Visible="False" />
                <asp:BoundField DataField="ActProdHours_Sum" HeaderText="ActProdHours_Sum" 
                    SortExpression="ActProdHours_Sum" Visible="False" />
                <asp:BoundField DataField="StdLabor_Sum" HeaderText="StdLabor_Sum" 
                    SortExpression="StdLabor_Sum" Visible="False" />
                <asp:BoundField DataField="ActLabCost_Sum" HeaderText="ActLabCost_Sum" 
                    SortExpression="ActLabCost_Sum" Visible="False" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" VerticalAlign="Middle" 
                HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />

        </asp:GridView>
        <asp:SqlDataSource ID="PMPartQuoteDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
            SelectCommand="SELECT * FROM [PMPartQuote]  WHERE Part = @Part">

        <SelectParameters>
                <asp:ControlParameter ControlID="PartNumberListBox" Name="Part"
                    PropertyName ="SelectedValue" />
        </SelectParameters>


       </asp:SqlDataSource>
        <asp:SqlDataSource ID="PMPartQuoteDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
            SelectCommand="SELECT * FROM [PMPartQuote]">


       </asp:SqlDataSource>
    </p>
    <p>
    <div>
        <asp:GridView ID="PMPartQuoteAllGridView" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" CellPadding="4" 
            DataSourceID="PMPartQuoteAllDataSource1" BackColor="White" 
            BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" 
            onrowdatabound="PMPartQuoteAllGridView_RowDataBound">
            <Columns>
                <asp:BoundField DataField="Part" HeaderText="Part" SortExpression="Part" />
                <asp:BoundField DataField="Rev" HeaderText="Rev" SortExpression="Rev" />
                <asp:BoundField DataField="PartUnitPrice" HeaderText="Part Unit Price" 
                    SortExpression="PartUnitPrice" />
                <asp:BoundField DataField="CycleTime" HeaderText="Cycle Time" 
                    SortExpression="CycleTime" />
                <asp:BoundField DataField="CycleTime Actual" HeaderText="Cycle Time Actual" 
                    SortExpression="CycleTime Actual" />
                <asp:BoundField DataField="# Of Cavities" HeaderText="# Of Cavities" 
                    SortExpression="# Of Cavities" />
                <asp:BoundField DataField="PartWeight(Lbs)" HeaderText="Part Weight (Lbs)" 
                    SortExpression="PartWeight(Lbs)" />
                <asp:BoundField DataField="RunnerWeight(Lbs)" HeaderText="Runner Weight (Lbs)" 
                    SortExpression="RunnerWeight(Lbs)" Visible="False" />
                <asp:BoundField DataField="Lbs/Hr" HeaderText="Lbs/Hr" 
                    SortExpression="Lbs/Hr" Visible="False" />
                <asp:BoundField DataField="MaterialPart#" HeaderText="Material Part #" 
                    SortExpression="MaterialPart#" />
                <asp:BoundField DataField="Qty/Parent" HeaderText="Qty Parent" 
                    SortExpression="Qty/Parent" />
                <asp:BoundField DataField="StdMtlCost" HeaderText="Std Mtl Cost" 
                    SortExpression="StdMtlCost" />
                <asp:BoundField DataField="MaterialScrap" HeaderText="Material Scrap %" 
                    SortExpression="MaterialScrap" />
                <asp:BoundField DataField="MaterialScrap Type" HeaderText="Material Scrap Type" 
                    SortExpression="MaterialScrap Type" Visible="False" />
                <asp:BoundField DataField="ProdScrap" HeaderText="Prod Scrap %" 
                    SortExpression="ProdScrap" />
                <asp:BoundField DataField="Prod Std" HeaderText="PPH" 
                    SortExpression="Prod Std" />
                <asp:BoundField DataField="PPH Quoted" HeaderText="PPH Quoted" 
                    SortExpression="PPH Quoted" />
                <asp:BoundField DataField="ProdScrap Type" HeaderText="ProdScrap Type" 
                    SortExpression="ProdScrap Type" Visible="False" />
                <asp:BoundField DataField="Str Format" HeaderText="Str Format" 
                    SortExpression="Str Format" Visible="False" />
                <asp:BoundField DataField="OptDtlDesc" HeaderText="Opt Dtl Desc" 
                    SortExpression="OptDtlDesc" />
                <asp:BoundField DataField="ResourceLaborRate" HeaderText="Resource Labor Rate" 
                    SortExpression="ResourceLaborRate" Visible="False" />
                <asp:BoundField DataField="ResourseBurdenRate" HeaderText="Resourse Burden Rate" 
                    SortExpression="ResourseBurdenRate" Visible="False" />
                <asp:BoundField DataField="MaxRegring%" HeaderText="Max Regring %" 
                    SortExpression="MaxRegring%" Visible="False" />
                <asp:BoundField DataField="RunnerToShot%" HeaderText="RunnerToShot%" 
                    SortExpression="RunnerToShot%" Visible="False" />
                <asp:BoundField DataField="ShotWeight(Lbs)" HeaderText="ShotWeight(Lbs)" 
                    SortExpression="ShotWeight(Lbs)" Visible="False" />
                <asp:BoundField DataField="SPH" HeaderText="SPH" SortExpression="SPH" Visible="False"  />
                <asp:BoundField DataField="StartDate" HeaderText="StartDate" 
                    SortExpression="StartDate" Visible="False" />
                <asp:BoundField DataField="EndDate" HeaderText="EndDate" 
                    SortExpression="EndDate" Visible="False" />
                <asp:BoundField DataField="EstProdHours_Avg" HeaderText="EstProdHours_Avg" 
                    SortExpression="EstProdHours_Avg" Visible="False" />
                <asp:BoundField DataField="ActProdHours_Avg" HeaderText="ActProdHours_Avg" 
                    SortExpression="ActProdHours_Avg" Visible="False" />
                <asp:BoundField DataField="StdLabor_Avg" HeaderText="StdLabor_Avg" 
                    SortExpression="StdLabor_Avg" Visible="False" />
                <asp:BoundField DataField="ActLabCost_Avg" HeaderText="ActLabCost_Avg" 
                    SortExpression="ActLabCost_Avg" Visible="False" />
                <asp:BoundField DataField="EstProdHours_Sum" HeaderText="EstProdHours_Sum" 
                    SortExpression="EstProdHours_Sum" Visible="False" />
                <asp:BoundField DataField="ActProdHours_Sum" HeaderText="ActProdHours_Sum" 
                    SortExpression="ActProdHours_Sum" Visible="False" />
                <asp:BoundField DataField="StdLabor_Sum" HeaderText="StdLabor_Sum" 
                    SortExpression="StdLabor_Sum" Visible="False" />
                <asp:BoundField DataField="ActLabCost_Sum" HeaderText="ActLabCost_Sum" 
                    SortExpression="ActLabCost_Sum" Visible="False" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" VerticalAlign="Middle" 
                HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />

        </asp:GridView>
        </div>
        <asp:SqlDataSource ID="PMPartQuoteAllDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
            SelectCommand="SELECT * FROM [PMPartQuote] ORDER BY [Part]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="PMPartQuoteAllDataSource" runat="server" 
            ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
            SelectCommand="SELECT * FROM [PMPartQuote]"></asp:SqlDataSource>
        <br />
    </p>
</asp:Content>

