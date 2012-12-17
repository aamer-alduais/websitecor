<%@ Page Language="C#" Title="Employee Performance Review : Thermotech" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="update_record.aspx.cs" Inherits="Default2" %>
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
        .style145
        {
            width: 49px;
        }
        .style147
    {
        background-color: #FFFF00;
    }
    .DropDown
    {
            background-color: #5D7B9D;
            color: #FFFFFF;
            font-weight: bold;
        }
        .style148
    {
        height: 26px;
        text-align: left;
        width: 27px;
        font-size: medium;
    }
    .style149
    {
        width: 25px;
    }
    .style150
    {
        width: 27px;
    }
        </style>
    <link href="style.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ContentPlaceHolderID ="MainContentHolder"  runat="server"  id="Content1">
    <div id="empSummaryBack">
        <table class="style133">
            <tr>
                <td class="style148">
                    &nbsp;</td>
                <td class="style126">
                    <strong><span lang="en-us" class="style125">Updat</span><span class="style125">e 
                    Employee Time </span></strong></td>
                <td class="style127">
                    </td>
                <td class="style124">
                    </td>
            </tr>
            <tr>
                <td class="style148">
                    &nbsp;</td>
                <td class="style126">
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
                    <asp:Label ID="LabelErrors" runat="server" CssClass="style147"></asp:Label>
                </td>
                <td class="style127">
                    &nbsp;</td>
                <td class="style124">
                    &nbsp;</td>
            </tr>
            </table>
           <table class="style114">
               <tr>
                   <td class="style149" valign="top">
                                    &nbsp;</td>
                   <td class="style145" valign="top">
                                    <span lang="en-us" __designer:mapid="224"><strong __designer:mapid="225">
                                    Date</strong></span></td>
                   <td class="style142" valign="top">
                                    <asp:TextBox ID="TextBoxDate" runat="server"></asp:TextBox>
                                    <cc1:CalendarExtender ID="TextBoxDate_CalendarExtender" runat="server" 
                                        Enabled="True" TargetControlID="TextBoxDate">
                                    </cc1:CalendarExtender>
                                    <br />
                                    <asp:Label ID="LabelDateError" runat="server" CssClass="style147"></asp:Label>
                                    <br />
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
                   <td valign="top" class="style150">
                       &nbsp;</td>
                   <td valign="top">
    <asp:GridView ID="gvEmployeeTime" runat="server" CellPadding="4" Width="80%"
                    
                  EmptyDataText ="No Record Found." AutoGenerateColumns="False" 
                           DataSourceID="SDSEmployeeTime" DataKeyNames="id" ForeColor="#333333" GridLines="None" 
                    >
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        
        <Columns>
            <asp:CommandField ButtonType="Button" ShowDeleteButton="True" 
                ShowEditButton="True" />
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                ReadOnly="True" SortExpression="id" Visible="False" />
            <asp:TemplateField HeaderText="ProjectID" SortExpression="ProjectID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ProjectID") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ProjectID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="JobNum" SortExpression="JobNum">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("JobNum") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("JobNum") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="JobDescription" HeaderText="JobDescription" 
                SortExpression="JobDescription" />
            <asp:TemplateField HeaderText="TaskType" SortExpression="TaskType">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownListTaskType" runat="server" 
                        DataSourceID="SDSTasks" DataTextField="TaskName" 
                        DataValueField="TaskName" SelectedValue='<%# Bind("TaskType") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SDSTasks" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
                        
                        SelectCommand="SELECT GenTask.TaskName FROM GenTask CROSS JOIN JobTask UNION SELECT TaskName FROM JobTask AS JobTask_1 ORDER BY GenTask.TaskName">
                    </asp:SqlDataSource>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("TaskType") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Hours" HeaderText="Hours" SortExpression="Hours" />
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
                       <asp:SqlDataSource ID="SDSEmployeeTime" runat="server" 
                           ConflictDetection="CompareAllValues" 
                           ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
                           DeleteCommand="DELETE FROM [EmployeeTimeRecord] WHERE [id] = @original_id" 
                           OldValuesParameterFormatString="original_{0}" 
                           SelectCommand="SELECT id, ProjectID, JobNum, JobDescription, TaskType, Hours, Minutes, Comments FROM EmployeeTimeRecord WHERE (UserID = @UserID) AND (Date = @Date)" 
                           
                           UpdateCommand="UPDATE EmployeeTimeRecord SET ProjectID = @ProjectID, JobNum = @JobNum, JobDescription = @JobDescription, TaskType = @TaskType, Hours = @Hours, Minutes = @Minutes, Comments = @Comments WHERE (id = @original_id)">
                           <SelectParameters>
                               <asp:ControlParameter ControlID="DropDownListEmpIDName" Name="UserID" 
                                   PropertyName="SelectedValue" Type="Int32" />
                               <asp:ControlParameter ControlID="HiddenFieldDate" Name="Date" 
                                   PropertyName="Value" />
                           </SelectParameters>
                           <DeleteParameters>
                               <asp:ControlParameter ControlID="gvEmployeeTime" Name="original_id" 
                                   PropertyName="SelectedDataKey" />
                           </DeleteParameters>
                           <UpdateParameters>
                               <asp:Parameter Name="ProjectID" Type="String" />
                               <asp:Parameter Name="JobNum" Type="String" />
                               <asp:Parameter Name="JobDescription" Type="String" />
                               <asp:Parameter Name="TaskType" Type="String" />
                               <asp:Parameter Name="Hours" Type="Int32" />
                               <asp:Parameter Name="Minutes" Type="Int32" />
                               <asp:Parameter Name="Comments" Type="String" />
                               <asp:ControlParameter ControlID="gvEmployeeTime" Name="original_id" 
                                   PropertyName="SelectedDataKey" Type="Int32" />
                           </UpdateParameters>
                       </asp:SqlDataSource>
            &nbsp;
                       <br />
                   </td>
               </tr>
        </table>
           <br />
            
            
        
    
    </div>
    <br />

    <asp:ScriptManager ID="ScriptManagerAJAX" runat="server">
    </asp:ScriptManager>
    
        <asp:SqlDataSource ID="SDSEmpIDNameSalaried" runat="server" 
        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
        
        
        
        
        SelectCommand="SELECT DISTINCT UserID AS EmpID, CAST(UserID AS varchar) + ' ' + FName + ' ' + LName AS EmpIDName, FName FROM Users ORDER BY FName"></asp:SqlDataSource>
    <br />
    <asp:HiddenField ID="HiddenFieldJobNum" runat="server" />
<asp:HiddenField ID="HiddenFieldDate" runat="server" />
    <br />
<br />
    <br />
    </asp:Content>