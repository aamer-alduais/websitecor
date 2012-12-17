<%@ Page Language="C#" Title="Project Information Review : Thermotech"MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="view_records.aspx.cs" Inherits="main" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>


<asp:Content ContentPlaceHolderID ="head"   runat="server"  id="first">
    
    
    
    <style type="text/css">
        .style117
        {
            width: 93%;
        }
        .style125
        {
            position: absolute;
            left: 752px;
            top: 535px;
            width: 458px;
            height: 180px;
            z-index: auto;
        }
        .style126
        {
            width: 106%;
        }
        .style128
        {
            width: 242px;
            height: 20px;
            background-color: #FFFF66;
            color: #000000;
            font-size: medium;
        }
        .style129
        {
            height: 20px;
            background-color: #FFFF66;
        }
        .style130
        {
            width: 1px;
        }
        .style131
        {
            width: 242px;
            height: 24px;
            background-color: #9999FF;
            color: #000000;
            font-size: medium;
        }
        .style132
        {
            height: 24px;
            background-color: #9999FF;
        }
        .style133
        {
            height: 20px;
            background-color: #99FF66;
        }
        .style134
        {
            width: 242px;
            height: 20px;
            background-color: #99FF66;
            color: #000000;
            font-size: medium;
        }
        .style135
        {
            font-size: medium;
        }
        .style136
        {
            height: 20px;
            background-color: #99FF66;
            width: 46px;
        }
        .style137
        {
            height: 20px;
            background-color: #FFFF66;
            width: 46px;
        }
        .style138
        {
            height: 24px;
            background-color: #9999FF;
            width: 46px;
        }
        .style139
        {
            width: 46px;
        }
        .style140
        {
            width: 242px;
        }
        .style141
        {
            height: 24px;
            background-color: #CCFFCC;
            margin-left: 40px;
        }
        .style142
        {
            height: 24px;
            background-color: #CCFFCC;
            width: 46px;
        }
        .style143
        {
            width: 242px;
            height: 24px;
            background-color: #CCFFCC;
            color: #000000;
            font-size: medium;
        }
        .style144
        {
            height: 24px;
            background-color: #000000;
        }
        .style145
        {
            height: 24px;
            background-color: #000000;
            width: 46px;
        }
        .style146
        {
            width: 242px;
            height: 24px;
            background-color: #000000;
            color: #FFFFFF;
            font-size: medium;
        }
        .style147
        {
            color: #FFFFFF;
        }
        </style>
</asp:Content>

<asp:Content ContentPlaceHolderID ="MainContentHolder"  runat="server"  id="Content1">

        <table cellpadding="0" cellspacing="0" class="style117" >
            <tr>
                <td>
        <b><span class="style126">Project Review<br />
                    <br />
                    </span>Select Customer:</b><br />
        <asp:DropDownList ID="ddlCustJob" runat="server" 
            style="font-size: 10pt;   font-family: Verdana; background-color: #5D7B9D; color: #FFFFFF; text-transform: capitalize;" 
            AutoPostBack="True" Width="463px" 
                        DataSourceID="SDSDropDownMenuCustomer" DataTextField="ProjectIDCustomer" 
                        DataValueField="PROJECTID" AppendDataBoundItems="True" 
                        CausesValidation="True" ValidationGroup="CustDropDown" 
                        onselectedindexchanged="ddlCustJob_SelectedIndexChanged">
                        <asp:ListItem Text = "-- SELECT --" Value =""></asp:ListItem>
        </asp:DropDownList>
                    <asp:SqlDataSource ID="SDSDropDownMenuCustomer" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
                        
                        
                        SelectCommand="SELECT DISTINCT Project.PROJECTID + ': ' + Customer.Name AS ProjectIDCustomer, Project.PROJECTID FROM Project INNER JOIN Customer ON Project.PROJECTID = Customer.ProjectID"></asp:SqlDataSource>          
                    
                    <asp:HiddenField ID="HiddenFieldProjectID" runat="server" />
                    
                    <asp:RequiredFieldValidator ID="rfvDDLCust" runat="server" ErrorMessage="*" 
                        ControlToValidate="ddlCustJob" ValidationGroup="CustDropDown"></asp:RequiredFieldValidator>
                    
                </td>
                <td valign="top" colspan="2">
                    <br />
                    
                </td>
                <td>
                    &nbsp;</td>
                <td style="text-align: right" valign="bottom">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="7">
                    </td>
            </tr>
            <tr>
            
                <td colspan="7">
                    <asp:Panel ID="PanelGridView" runat="server" Width ="100%">
                    
                                    <b>Project Infomation:</b>
                                    <asp:GridView ID="gvJobDetails" runat="server" CellPadding="4" 
                                        Width="99%" AutoGenerateColumns="False" DataSourceID="SDSProjectDesc" 
                                        ForeColor="#333333" GridLines="None">
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <Columns>
                                            <asp:BoundField DataField="PROJECTID" HeaderText="PROJECTID" 
                                                SortExpression="PROJECTID" />
                                            <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                                            <asp:BoundField DataField="DESCRIPTION" HeaderText="DESCRIPTION" 
                                                SortExpression="DESCRIPTION" />
                                            <asp:BoundField DataField="ORDERNUM" HeaderText="ORDERNUM" 
                                                SortExpression="ORDERNUM" />
                                            <asp:BoundField DataField="ORDERLINE" HeaderText="ORDERLINE" 
                                                SortExpression="ORDERLINE" />
                                            <asp:BoundField DataField="BILLINGAMOUNT" HeaderText="BILLINGAMOUNT" 
                                                SortExpression="BILLINGAMOUNT" />
                                            <asp:BoundField DataField="DATE01" HeaderText="DUE DATE" 
                                                SortExpression="DATE01" DataFormatString="{0:MM/dd/yyyy}" />
                                            <asp:BoundField DataField="INVOICEDATE" HeaderText="INVOICEDATE" 
                                                SortExpression="INVOICEDATE" DataFormatString="{0:MM/dd/yyyy}" />
                                            <asp:BoundField DataField="INVOICENUM" HeaderText="INVOICENUM" 
                                                SortExpression="INVOICENUM" />
                                            <asp:BoundField DataField="INVOICELINE" HeaderText="INVOICELINE" 
                                                SortExpression="INVOICELINE" />
                                            <asp:BoundField DataField="Extended Price" HeaderText="Extended Price" 
                                                ReadOnly="True" SortExpression="Extended Price" />
                                            <asp:BoundField DataField="Remaining Amount" HeaderText="Remaining Amount" 
                                                ReadOnly="True" SortExpression="Remaining Amount" />
                                        </Columns>
                                        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#999999" />
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SDSProjectDesc" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
                                        SelectCommand="SELECT DISTINCT P.PROJECTID, C.NAME, M.DESCRIPTION, M.ORDERNUM, M.ORDERLINE, M.BILLINGAMOUNT, M.DATE01, I.INVOICEDATE, I.INVOICENUM, I.INVOICELINE, CAST(ISNULL(I.EXTPRICE, 0) AS int) AS [Extended Price], CAST(ISNULL(M.BILLINGAMOUNT - I.EXTPRICE, 0) AS int) AS [Remaining Amount] FROM Project AS P INNER JOIN Customer AS C ON P.PROJECTID = C.PROJECTID LEFT OUTER JOIN Milestone AS M ON P.PROJECTID = M.PROJECTID LEFT OUTER JOIN InvoiceM AS I ON P.PROJECTID = I.PROJECTID AND M.INVOICENUM = I.INVOICENUM WHERE (P.PROJECTID = @PID) ORDER BY M.DATE01">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlCustJob" Name="PID" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                    </asp:Panel>
                    

                </td>
            </tr>
            <tr>
                <td colspan="7">

                    <br />
        <b>Estimated&nbsp; Cost:</b></td>
            </tr>
            <tr>
                <td colspan="2" class="style130">
     
                    <asp:DetailsView ID="DetailsViewEstimatedCost" runat="server" Height="50px" 
                        Width="475px" AutoGenerateRows="False" DataSourceID="SDSEstimatedCost" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" 
                        DataKeyNames="ProjectID" Font-Bold="True">
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
                        <PagerStyle BackColor="#284775" ForeColor="White" 
                            HorizontalAlign="Center" />
                        <Fields>
                            <asp:BoundField DataField="ProjectID" HeaderText="ProjectID" 
                                SortExpression="ProjectID" Visible="False" />
                            <asp:BoundField DataField="CustomerName" HeaderText="CustomerName" 
                                SortExpression="CustomerName" Visible="False" />
                            <asp:BoundField DataField="PO" HeaderText="PO" 
                                SortExpression="PO" />
                            <asp:BoundField DataField="PartNumber" HeaderText="Customer Part Number" 
                                SortExpression="PartNumber" />
                            <asp:BoundField DataField="PartName" HeaderText="Part Name" 
                                SortExpression="PartName" />
                            <asp:BoundField DataField="ECRevision" HeaderText="EC/Revision" 
                                SortExpression="ECRevision" />
                            <asp:BoundField DataField="ToolDueDate" HeaderText="Tool Due Date" 
                                SortExpression="ToolDueDate" />
                            <asp:BoundField DataField="PPAPdueDate" HeaderText="PPAP Due Date" 
                                SortExpression="PPAPdueDate" />
                            <asp:BoundField DataField="BillingAmount" HeaderText="Billing Amount" 
                                SortExpression="BillingAmount" />
                            <asp:BoundField DataField="USChinaCost" HeaderText="US China Cost" 
                                SortExpression="USChinaCost" />
                            <asp:BoundField DataField="FreightCost" HeaderText="Freight Cost" 
                                SortExpression="FreightCost" />
                            <asp:BoundField DataField="Automation" HeaderText="Automation Cost" 
                                SortExpression="Automation" />
                            <asp:BoundField DataField="SubcontractHours" 
                                HeaderText="Subcontract Cost" SortExpression="SubcontractHours" />
                            <asp:BoundField DataField="EstimatedMaterialCost" 
                                HeaderText="Estimated Material Cost" SortExpression="EstimatedMaterialCost" />
                            <asp:BoundField DataField="ProjectTransferCost" HeaderText="Project Transfer Cost" 
                                SortExpression="ProjectTransferCost" />
                            <asp:BoundField DataField="NPL" HeaderText="NPL Hours" 
                                SortExpression="NPL" />
                            <asp:BoundField DataField="DesignHours" HeaderText="Project Design Hours" 
                                SortExpression="DesignHours" />
                            <asp:BoundField DataField="BuildHours" HeaderText="Inhouse Build Hours" 
                                SortExpression="BuildHours" />
                            <asp:BoundField DataField="ECN" HeaderText="ECN Hours" SortExpression="ECN" />
                            <asp:BoundField DataField="Qualification" HeaderText="Qualification Hours" 
                                SortExpression="Qualification" />
                            <asp:BoundField DataField="ISIR" HeaderText="ISIR Hours" 
                                SortExpression="ISIR" />
                            <asp:BoundField DataField="EstimatedHours" 
                                HeaderText="Estimated Hours" SortExpression="EstimatedHours" />
                            <asp:BoundField DataField="Description" HeaderText="Description" 
                                SortExpression="Description" />
                            <asp:CommandField ButtonType="Button" EditText="-- Update/Edit Record --" 
                                ShowEditButton="True" />
                        </Fields>
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:DetailsView>
                    <div class="style125">
                                                    <asp:Panel ID="PanelBillingLaborMaterial" runat="server" Width="441px" 
                                                        Visible="False">

                        <table id="table2" cellpadding="0" class="style126">
                            <tr>
                                <td class="style134" valign="top">
                                    <strong>Billing Amount - 17% </strong>
                                </td>
                                <td class="style136" valign="top">
                                    <strong><span class="style135">= </span> </strong>
                                    <span class="style135"></span>
                                </td>
                                <td class="style133" valign="top">
                                    <strong>
                                    <asp:Label ID="LabelBillingCost" runat="server" Font-Bold="True" 
                                        Font-Overline="False" Font-Size="Medium"></asp:Label>
                                    </span></strong>
                                </td>
                                </span>
                            </tr>
                            <tr>
                                <td class="style131">
                                    <strong>Material Cost</strong></td>
                                <td class="style138">
                                    <span class="style135"><strong>=</strong></span></td>
                                <td class="style132">
                                    <strong>
                                    <asp:Label ID="LabelMaterialCost" runat="server" Font-Bold="True" 
                                        Font-Size="Medium"></asp:Label>
                                    </span></strong>
                                </td>
                                </span>
                            </tr>
                            <tr>
                                <td class="style143">
                                    <strong>Subcontract Cost</strong></td>
                                <td class="style142">
                                    <span class="style135"><strong>=</strong></span></td>
                                <td class="style141">
                                    <strong>
                                    <asp:Label ID="LabelSubcontractCost" runat="server" Font-Bold="True" 
                                        Font-Size="Medium"></asp:Label>
                                    </span></strong>
                                </td>
                            </tr>
                            <tr>
                                <td class="style131">
                                    <strong>Transfer Cost</strong></td>
                                <td class="style138">
                                    <span class="style135"><strong>=</strong></span></td>
                                <td class="style132">
                                    <strong>
                                    <asp:Label ID="LabelTransferCost" runat="server" Font-Bold="True" 
                                        Font-Size="Medium"></asp:Label>
                                    </span></strong>
                                </td>
                            </tr>
                            <tr>
                                <td class="style143">
                                    <strong>US/China Cost</strong></td>
                                <td class="style142">
                                    <span class="style135"><strong>=</strong></span></td>
                                <td class="style141">
                                    <strong>
                                    <asp:Label ID="LabelUSChinaCost" runat="server" Font-Bold="True" 
                                        Font-Size="Medium"></asp:Label>
                                    </span></strong>
                                </td>
                            </tr>
                            <tr>
                                <td class="style131">
                                    <strong>Freight Cost</strong></td>
                                <td class="style138">
                                    <span class="style135"><strong>=</strong></span></td>
                                <td class="style132">
                                    <strong>
                                    <asp:Label ID="LabelFreightCost" runat="server" Font-Bold="True" 
                                        Font-Size="Medium"></asp:Label>
                                    </span></strong>
                                </td>
                            </tr>
                            <tr>
                                <td class="style128">
                                    <strong>Job Labor&nbsp; </strong>
                                </td>
                                <td class="style137">
                                    <span class="style135"><strong>=</strong></span></td>
                                <td class="style129">
                                    <strong>
                                    <asp:Label ID="LabelJobLabor" runat="server" Font-Bold="True" 
                                        Font-Size="Medium"></asp:Label>
                                    </span></strong>
                                </td>
                            </tr>
                            <tr>
                                <td class="style140">
                                    &nbsp;</td>
                                <td class="style139">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
 
                            <tr>
                                <td class="style146">
                                    <strong>Selling Price/Job Labor</strong></td>
                                <td class="style145">
                                    <span class="style147"><span class="style135"><strong>=</strong></span></span></td>
                                <td class="style144">
                                    <strong>
                                    <asp:Label ID="LabelSellingPricePerJobLabor" runat="server" Font-Bold="True" 
                                        Font-Size="Medium" ForeColor="White"></asp:Label>
                                    </span></strong></span>
                                </td>
                            </tr>
                            <tr>
                                <td class="style140">
                                    &nbsp;</td>
                                <td class="style139">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
 
                        </table>
                        </asp:Panel>
                    </div>
                    <asp:SqlDataSource ID="SDSEstimatedCost" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
                        
                        SelectCommand="SELECT ProjectID, CustomerName, PO, PartNumber, ToolDueDate, BillingAmount, PartName, ECRevision, DesignHours, BuildHours, Automation, EstimatedHours, SubcontractHours, EstimatedMaterialCost, ISIR, ECN, NPL, Qualification, Description, USChinaCost, ProjectTransferCost, PPAPdueDate, FreightCost FROM DisplayProject WHERE (ProjectID = @ProjectID)" 
                        
                        
                        
                        
                        UpdateCommand="UPDATE DisplayProject SET PO = @PO, PartNumber = @PartNumber, PartName = @PartName, ECRevision = @ECRevision, DesignHours = @DesignHours, BuildHours = @BuildHours, Automation = @Automation, EstimatedHours = @EstimatedHours, SubcontractHours = @SubcontractHours, EstimatedMaterialCost = @EstimatedMaterialCost, ISIR = @ISIR, ECN = @ECN, NPL = @NPL, Qualification = @Qualification, Description = @Description, USChinaCost = @USChinaCost, ProjectTransferCost = @ProjectTransferCost, PPAPdueDate = @PPAPdueDate, ToolDueDate = @ToolDueDate, BillingAmount = @BillingAmount, FreightCost = @FreightCost WHERE (ProjectID = @ProjectID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlCustJob" Name="ProjectID" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                        
                        <UpdateParameters>
                            <asp:Parameter Name="PO" />
                            <asp:Parameter Name="PartNumber" />
                            <asp:Parameter Name="PartName" />
                            <asp:Parameter Name="ECRevision" />
                            <asp:Parameter Name="DesignHours" />
                            <asp:Parameter Name="BuildHours" />
                            <asp:Parameter Name="Automation" />
                            <asp:Parameter Name="EstimatedHours" />
                            <asp:Parameter Name="SubcontractHours" />
                            <asp:Parameter Name="EstimatedMaterialCost" />
                            <asp:Parameter Name="ISIR" />
                            <asp:Parameter Name="ECN" />
                            <asp:Parameter Name="NPL" />
                            <asp:Parameter Name="Qualification" />
                            <asp:Parameter Name="Description" />
                            <asp:Parameter Name="USChinaCost" />
                            <asp:Parameter Name="ProjectTransferCost" />
                            <asp:Parameter Name="PPAPdueDate" />
                            <asp:Parameter Name="ToolDueDate" />
                            <asp:Parameter Name="BillingAmount" />
                            <asp:Parameter Name="FreightCost" />
                            <asp:Parameter Name="ProjectID" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    &nbsp;</td>
                <td colspan="2">
     
                    &nbsp;</td>
                <td colspan="3">
     
                    &nbsp;</td>
            </tr>
        </table>
      
            <br />
        <br />
        
        
        <br />
        <br />
        <br />
        <b>
        <br />
        </b>
</asp:Content>

