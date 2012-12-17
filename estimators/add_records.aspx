<%@ Page Language="C#" Title="Project Information Entry : Thermotech" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="add_records.aspx.cs" Inherits="main" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>


<asp:Content ContentPlaceHolderID ="head"   runat="server"  id="first">
    
    
    
    <style type="text/css">
        .style117
        {
            width: 93%;
            height: 303px;
        }
        .style128
        {
            background-color: #FFFF00;
        }
        .style146
    {
        width: 106px;
    }
        .style152
        {
            width: 100%;
        }
        .style155
        {
            width: 249px;
        }
        .style156
        {
            width: 322px;
        }
        .style158
        {
            margin-bottom: 0px;
        }
        .style161
    {
        width: 103%;
        height: 231px;
    }
        .style165
        {
            width: 81px;
        }
        .style166
        {
            width: 529px;
        }
        .style168
        {
            width: 133px;
        }
        .style169
        {
            width: 154px;
        }
        .style170
        {
            width: 8px;
        }
        .style173
        {
            width: 103px;
        }
        .style174
        {
            width: 196px;
        }
        .style175
        {
            width: 102px;
        }
        .style176
        {
            width: 170px;
            font-weight: bold;
        }
        .style177
        {
            width: 126px;
        }
        .style178
        {
            width: 95%;
            height: 231px;
        }
        .style183
        {
            width: 160px;
        }
        .style185
        {
            width: 143px;
            font-size: 10pt;
            font-weight: bold;
            background-color: #FFFF66;
        }
        .style187
        {
            font-size: small;
        }
        .style190
        {
            width: 143px;
        }
        .style191
        {
            font-size: 8pt;
        }
        .style192
        {
            width: 160px;
            background-color: #CCFF33;
        }
        .style193
        {
            width: 143px;
            font-size: 10pt;
            background-color: #CCFF33;
        }
        .style194
        {
            width: 160px;
            font-size: small;
            background-color: #FFFF66;
        }
        .style195
        {
            width: 143px;
            font-size: 10pt;
            background-color: #FFFF66;
        }
        .style196
        {
            width: 160px;
            font-size: small;
            background-color: #CCFF66;
        }
        .style197
        {
            width: 143px;
            font-size: 10pt;
            background-color: #CCFF66;
        }
        .style198
        {
            width: 160px;
            background-color: #FFFF66;
        }
        .style199
        {
            background-color: #99CCFF;
        }
        .style200
        {
            width: 143px;
            background-color: #99CCFF;
        }
        .newStyle1
        {
            border: 1px solid #000000;
        }
        .style201
        {
            font-size: small;
            background-color: #99CCFF;
        }
        .style202
        {
            width: 160px;
            background-color: #99CCFF;
        }
        .style203
        {
            width: 93%;
            height: 140px;
        }
        .style204
        {
            width: 93%;
            height: 127px;
        }
        </style>
</asp:Content>

<asp:Content ContentPlaceHolderID ="MainContentHolder"  runat="server"  id="Content1">

        <table cellpadding="0" cellspacing="0" class="style203" >
            <tr>
                <td>
        <b><span class="style126">Project Entry Form<br />
                    </span>
                    <br />
                    Select Customer:</b><br />
        <asp:DropDownList ID="ddlCustJob" runat="server" 
            style="font-size: 10pt;   font-family: Verdana; background-color: #5D7B9D; color: #FFFFFF; text-transform: capitalize;" 
            AutoPostBack="True" Width="463px" 
            onselectedindexchanged="ddlCustJob_SelectedIndexChanged" 
                        DataSourceID="SDSDropDownMenuCustomer" DataTextField="ProjectIDCustomer" 
                        DataValueField="PROJECTID" AppendDataBoundItems="True" 
                        CausesValidation="True" ValidationGroup="CustDropDown">
                        <asp:ListItem Text = "-- SELECT --" Value =""></asp:ListItem>
        </asp:DropDownList>
                    
                    <asp:RequiredFieldValidator ID="rfvDDLCust" runat="server" ErrorMessage="*" 
                        ControlToValidate="ddlCustJob" ValidationGroup="CustDropDown"></asp:RequiredFieldValidator>
                    
                </td>
                <td valign="top">
                    <br />
                        <asp:Label ID="LabelRecordMessages" runat="server" ForeColor="Red" 
                        CssClass="style128"></asp:Label>
                    
                </td>
                <td>
                    </td>
                <td style="text-align: right" valign="bottom">
                    </td>
                <td>
                    </td>
                <td>
                    </td>
            </tr>
            <tr>
            
                <td colspan="6">
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
                                            <asp:BoundField DataField="Extended Price" HeaderText="EXT PRICE" 
                                                ReadOnly="True" SortExpression="Extended Price" />
                                            <asp:BoundField DataField="Remaining Amount" HeaderText="Remaining Amount" 
                                                ReadOnly="True" SortExpression="Remaining Amount" Visible="False" />
                                        </Columns>
                                        <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <EditRowStyle BackColor="#999999" />
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                    </asp:GridView>
                    </asp:Panel>
                    

                </td>
            </tr>
            </table>
        <p>
        <b>&nbsp;Estimated&nbsp; Cost: </b>
        </p>
        <table cellpadding="0" cellspacing="0" class="style204" >
            <tr>
                <td valign="top">

                    <table bgcolor="WhiteSmoke" class="style152">
                        <tr>
                            <td class="style165" valign="top">
                                &nbsp;</td>
                            <td class="style166" valign="top">
                                &nbsp;</td>
                            <td class="style175" valign="top">
                                &nbsp;</td>
                            <td valign="top">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style165" valign="top">
                        <b __designer:mapid="547">Customer&nbsp;
                        </b>
                            </td>
                            <td class="style166" valign="top">
                        <b __designer:mapid="547">
                        <asp:TextBox ID="TextBoxCustomer" runat="server" MaxLength="100" 
                            OnBlur="this.style.borderColor=''" OnFocus="this.style.borderColor='#c0c0c0'" 
                            ReadOnly="True" Width="500px"></asp:TextBox>
                        </b>
                            </td>
                            <td class="style175" valign="top">
                        <b __designer:mapid="54e">
                        PO 
                                Number</b></td>
                            <td valign="top">
                                <b __designer:mapid="54e">
                        <asp:TextBox ID="TextBoxPO" runat="server" MaxLength="100" 
                            OnBlur="this.style.borderColor=''" 
                            OnFocus="this.style.borderColor='#c0c0c0'"></asp:TextBox>
                                <br />
                        <asp:RequiredFieldValidator ID="rfvPO" runat="server" 
                            ControlToValidate="TextBoxPO" ErrorMessage="Required" ValidationGroup="Submit">Required</asp:RequiredFieldValidator>
                        </b>
                            </td>
                        </tr>
                    </table>
                    <table bgcolor="WhiteSmoke" class="style152">
                        <tr>
                            <td class="style168" valign="top">
                        <b __designer:mapid="557">Customer Part No.</b></td>
                            <td class="style169" valign="top">
                        <asp:TextBox ID="TextBoxPartNumber" runat="server"></asp:TextBox>
                        <b __designer:mapid="55a">
                                <br />
                        <asp:RequiredFieldValidator ID="rfvPartNum" runat="server" 
                            ControlToValidate="TextBoxPartNumber" ErrorMessage="Required" 
                                    ValidationGroup="Submit">Required</asp:RequiredFieldValidator>
                        </b>
                            </td>
                            <td class="style170" valign="top">
                                &nbsp;</td>
                            <td class="style146" valign="top">
                        <b __designer:mapid="574">
                        Part Name</b></td>
                            <td class="style174" valign="top">
                        <b __designer:mapid="576">
                        <asp:TextBox ID="TextBoxPartName" runat="server" MaxLength="100" 
                            OnBlur="this.style.borderColor=''" 
                            OnFocus="this.style.borderColor='#c0c0c0'"></asp:TextBox>
                                <br />
                        <asp:RequiredFieldValidator ID="rfvPartName" runat="server" 
                            ControlToValidate="TextBoxPartName" ErrorMessage="Required" 
                                    ValidationGroup="Submit">Required</asp:RequiredFieldValidator>
                        </b>
                            </td>
                            <td class="style173" valign="top">
                        <b __designer:mapid="58c">EC/Revision</b></td>
                            <td valign="top">
                        <b __designer:mapid="58e">
                        <asp:TextBox ID="TextBoxECRevision" runat="server" MaxLength="100" 
                            OnBlur="this.style.borderColor=''" 
                            OnFocus="this.style.borderColor='#c0c0c0'"></asp:TextBox>
                                <br />
                        <asp:RequiredFieldValidator ID="rfvECRevision" runat="server" 
                            ControlToValidate="TextBoxECRevision" ErrorMessage="Required" 
                                    ValidationGroup="Submit">Required</asp:RequiredFieldValidator>
                        </b>
                            </td>
                        </tr>
                        <tr>
                            <td class="style168" valign="top">
            <strong>Tool Due Date</strong></td>
                            <td class="style169" valign="top">
                        <asp:TextBox ID="TextBoxToolDueDate" runat="server"></asp:TextBox>
                                <br />
                        <b __designer:mapid="580">
                        <asp:RequiredFieldValidator ID="rfvToolDueDate" runat="server" 
                            ControlToValidate="TextBoxToolDueDate" ErrorMessage="Required" 
                                    ValidationGroup="Submit">Required</asp:RequiredFieldValidator>
                        </b>
                            </td>
                            <td class="style170" valign="top">
                                &nbsp;</td>
                            <td class="style146" valign="top">
            <strong>PPAP Due Date</strong></td>
                            <td class="style174" valign="top">
                        <asp:TextBox ID="TextBoxPPAPDueDate" runat="server" 
                            OnBlur="this.style.borderColor=''" 
                            OnFocus="this.style.borderColor='#c0c0c0'" style="margin-bottom: 0px"></asp:TextBox>
                        <b __designer:mapid="580">
                                <br />
                        <asp:RequiredFieldValidator ID="rfvDueDate" runat="server" 
                            ControlToValidate="TextBoxPPAPDueDate" ErrorMessage="Required" 
                                    ValidationGroup="Submit">Required</asp:RequiredFieldValidator>
                        </b>
                            </td>
                            <td class="style173" valign="top">
            <strong>Billing Amount</strong></td>
                            <td valign="top">
                        <asp:TextBox ID="TextBoxBillingAmount" runat="server" 
                                    ValidationGroup="CalculateTotalHours"></asp:TextBox>
                                <br />
                        <b __designer:mapid="580">
                        <asp:RequiredFieldValidator ID="rfvBillingAmount" runat="server" 
                            ControlToValidate="TextBoxBillingAmount" ErrorMessage="Required" 
                                    ValidationGroup="CalculateTotalHours" Display="Dynamic">Required</asp:RequiredFieldValidator>
                        &nbsp;<asp:RequiredFieldValidator ID="rfvBillingAmount0" runat="server" 
                            ControlToValidate="TextBoxBillingAmount" ErrorMessage="Required" 
                                    ValidationGroup="Submit" Display="Dynamic">Required</asp:RequiredFieldValidator>
                        </b>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            </table>
<table cellpadding="0" cellspacing="0" class="style117" id="table3" >
            <tr>
                <td>
     
            <table ID="table6" cellpadding="0" class="style152" bgcolor="WhiteSmoke">
                <tr>
                    <td class="style156" valign="top">
                        <br />
                        <table ID="table7" cellpadding="0" class="style178">
                            <tr>
                                <td class="style176" valign="top">
                                    US/CHINA Build Cost($)</td>
                                <td class="style155" valign="top">
                                    <asp:DropDownList ID="DropDownList_US_China" runat="server">
                                        <asp:ListItem>US</asp:ListItem>
                                        <asp:ListItem>China</asp:ListItem>
                                    </asp:DropDownList>
                                    <b>
                                    <asp:TextBox ID="TextBoxUSChinaCost" runat="server" CssClass="style1" 
                                        MaxLength="100" OnBlur="this.style.borderColor=''" 
                                        OnFocus="this.style.borderColor='#c0c0c0'" 
                                        ValidationGroup="CalculateTotalHours"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvProjectMtrlCost" runat="server" 
                                        ControlToValidate="TextBoxUSChinaCost" ErrorMessage="Required" 
                                        ValidationGroup="CalculateTotalHours" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    &nbsp;<asp:RequiredFieldValidator ID="rfvProjectMtrlCost0" runat="server" 
                                        ControlToValidate="TextBoxUSChinaCost" ErrorMessage="Required" 
                                        ValidationGroup="Submit" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    <br />
                                    </b>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style176" valign="top">
                                    CHINA Freight Cost($)</td>
                                <td class="style155" valign="top">
                                    <asp:DropDownList ID="DropDownList_China_Freight" runat="server">
                                        <asp:ListItem>Air</asp:ListItem>
                                        <asp:ListItem>Ocean</asp:ListItem>
                                    </asp:DropDownList>
                                    <b>
                                    <asp:TextBox ID="TextboxChinaFreightCost" runat="server" CssClass="style1" 
                                        MaxLength="100" OnBlur="this.style.borderColor=''" 
                                        OnFocus="this.style.borderColor='#c0c0c0'" 
                                        ValidationGroup="CalculateTotalHours"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvChinaFreightCost" runat="server" 
                                        ControlToValidate="TextboxChinaFreightCost" ErrorMessage="Required" 
                                        ValidationGroup="CalculateTotalHours" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    &nbsp;<asp:RequiredFieldValidator ID="rfvChinaFreightCost0" runat="server" 
                                        ControlToValidate="TextboxChinaFreightCost" ErrorMessage="Required" 
                                        ValidationGroup="Submit" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    <br />
                                    </b>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style176" valign="top">
                                    <b>Automation </b>
                                </td>
                                <td class="style155" valign="top">
                                    <b>
                                    <asp:TextBox ID="TextBoxAutomation" runat="server" MaxLength="100" 
                                        OnBlur="this.style.borderColor=''" 
                                        OnFocus="this.style.borderColor='#c0c0c0'" 
                                        ValidationGroup="CalculateTotalHours"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvAutomation" runat="server" 
                                        ControlToValidate="TextBoxAutomation" ErrorMessage="Required" 
                                        ValidationGroup="CalculateTotalHours" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    &nbsp;<asp:RequiredFieldValidator ID="rfvAutomation0" runat="server" 
                                        ControlToValidate="TextBoxAutomation" ErrorMessage="Required" 
                                        ValidationGroup="Submit" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    </b>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style176" valign="top">
                                    <b>Subcontract Cost ($)</b></td>
                                <td class="style155" valign="top">
                                    <b>
                                    <asp:TextBox ID="TextBoxSubcontractCost" runat="server" CssClass="style1" 
                                        MaxLength="100" OnBlur="this.style.borderColor=''" 
                                        OnFocus="this.style.borderColor='#c0c0c0'" 
                                        ValidationGroup="CalculateTotalHours"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvSubcontactCost" runat="server" 
                                        ControlToValidate="TextBoxSubcontractCost" ErrorMessage="Required" 
                                        ValidationGroup="CalculateTotalHours" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    &nbsp;<asp:RequiredFieldValidator ID="rfvSubcontactCost0" runat="server" 
                                        ControlToValidate="TextBoxSubcontractCost" ErrorMessage="Required" 
                                        ValidationGroup="Submit" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    </b>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style176" valign="top">
                                    <b>Est. Mtrl Cost ($)</b></td>
                                <td class="style155" valign="top">
                                    <b>
                                    <br />
                                    <asp:TextBox ID="TextBoxEstimatedMaterialCost" runat="server" CssClass="style1" 
                                        MaxLength="100" OnBlur="this.style.borderColor=''" 
                                        OnFocus="this.style.borderColor='#c0c0c0'" 
                                        ValidationGroup="CalculateTotalHours"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvEstimatedMtrlCost" runat="server" 
                                        ControlToValidate="TextBoxEstimatedMaterialCost" ErrorMessage="Required" 
                                        ValidationGroup="CalculateTotalHours" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    &nbsp;<asp:RequiredFieldValidator ID="rfvEstimatedMtrlCost0" runat="server" 
                                        ControlToValidate="TextBoxEstimatedMaterialCost" ErrorMessage="Required" 
                                        ValidationGroup="Submit" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    </b>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style176" valign="top">
                                    Project Transfer Cost($)</td>
                                <td class="style155" valign="top">
                                    <b>
                                    <asp:DropDownList ID="DropDownListProjectTransferCost" runat="server">
                                        <asp:ListItem>HOP</asp:ListItem>
                                        <asp:ListItem>QRO</asp:ListItem>
                                        <asp:ListItem>JRZ</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:TextBox ID="TextBoxTransferCost" runat="server" CssClass="style1" 
                                        MaxLength="100" OnBlur="this.style.borderColor=''" 
                                        OnFocus="this.style.borderColor='#c0c0c0'" 
                                        ValidationGroup="CalculateTotalHours"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvProjectTransferCost" runat="server" 
                                        ControlToValidate="TextBoxTransferCost" ErrorMessage="Required" 
                                        ValidationGroup="CalculateTotalHours" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    &nbsp;<asp:RequiredFieldValidator ID="rfvProjectTransferCost0" runat="server" 
                                        ControlToValidate="TextBoxTransferCost" ErrorMessage="Required" 
                                        ValidationGroup="Submit" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    </b>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="ButtonCalculate" runat="server" onclick="ButtonCalculate_Click" 
                            Text="-- Calculate --" ValidationGroup="CalculateTotalHours" />
                    </td>
                    <td valign="top">
                        <br />
                        <table ID="table8" cellpadding="0" class="style161">
                            <tr>
                                <td class="style177" valign="top">
                                    <b>NPL Hours</b></td>
                                <td class="style104">
                                    <b>
                                    <asp:TextBox ID="TextBoxNPL" runat="server" CssClass="style1" MaxLength="100" 
                                        OnBlur="this.style.borderColor=''" OnFocus="this.style.borderColor='#c0c0c0'"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvNPL" runat="server" 
                                        ControlToValidate="TextBoxNPL" ErrorMessage="Required" 
                                        ValidationGroup="EstimatedHours" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    &nbsp;<asp:RequiredFieldValidator ID="rfvNPL0" runat="server" 
                                        ControlToValidate="TextBoxNPL" ErrorMessage="Required" 
                                        ValidationGroup="Submit" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    </b>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style177" valign="top">
                                    <b>Project&nbsp; Design Hours</b></td>
                                <td class="style104">
                                    <b>
                                    <asp:TextBox ID="TextBoxProjectDesignHours" runat="server" MaxLength="100" 
                                        OnBlur="this.style.borderColor=''" OnFocus="this.style.borderColor='#c0c0c0'"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvDesignHours" runat="server" 
                                        ControlToValidate="TextBoxProjectDesignHours" ErrorMessage="Required" 
                                        ValidationGroup="EstimatedHours" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    &nbsp;<asp:RequiredFieldValidator ID="rfvDesignHours0" runat="server" 
                                        ControlToValidate="TextBoxProjectDesignHours" ErrorMessage="Required" 
                                        ValidationGroup="Submit" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    </b>
                                </td>
                                <td rowspan="5" valign="top">
                                    <table id="table9" cellpadding="0" class="newStyle1">
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td class="style193">
                                                <strong>Blng Amnt( <span class="style191">17%)</span></strong></td>
                                            <td class="style192" valign="top">
                                                <asp:Label ID="LabelBillingAmount" runat="server" CssClass="style187" 
                                                    Font-Bold="True"></asp:Label>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td class="style195">
                                                <strong>US/CHINA </strong>
                                            </td>
                                            <td class="style194" valign="top">
                                                <asp:Label ID="LabelUSChina" runat="server" CssClass="style187" 
                                                    Font-Bold="True"></asp:Label>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td class="style197">
                                                <strong>Freight Cost</strong></td>
                                            <td class="style196" valign="top">
                                                <asp:Label ID="LabelFreightCost" runat="server" CssClass="style187" 
                                                    Font-Bold="True"></asp:Label>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td class="style185">
                                                Subcontract Cost
                                            </td>
                                            <td class="style194" valign="top">
                                                <asp:Label ID="LabelSubcontractCost" runat="server" CssClass="style187" 
                                                    Font-Bold="True"></asp:Label>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td class="style197">
                                                <strong>Transfer Cost</strong></td>
                                            <td class="style196" valign="top">
                                                <asp:Label ID="LabelTransferCost" runat="server" CssClass="style187" 
                                                    Font-Bold="True"></asp:Label>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td class="style195">
                                                <strong>Transfer Cost</strong></td>
                                            <td class="style198" valign="top">
                                                <asp:Label ID="LabelMaterialCost" runat="server" CssClass="style187" 
                                                    Font-Bold="True"></asp:Label>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td class="style190">
                                                &nbsp;</td>
                                            <td class="style183" valign="top">
                                                &nbsp;</td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                            <td class="style200">
                                                <strong><span class="style199">Project Hours</span></strong></td>
                                            <td class="style202" valign="top">
                                                <span class="style199">
                                                <asp:Label ID="LabelTotalHoursCalculated" runat="server" CssClass="style201" 
                                                    Font-Bold="True"></asp:Label>
                                                </span>
                                            </td>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="style177" valign="top">
                                    <b>Inhouse&nbsp;Build Hours</b></td>
                                <td class="style104">
                                    <b>
                                    <asp:TextBox ID="TextBoxProjectBuildHours" runat="server" CssClass="style158" 
                                        MaxLength="100" OnBlur="this.style.borderColor=''" 
                                        OnFocus="this.style.borderColor='#c0c0c0'"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvBuildHours" runat="server" 
                                        ControlToValidate="TextBoxProjectBuildHours" ErrorMessage="Required" 
                                        ValidationGroup="EstimatedHours" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    &nbsp;<asp:RequiredFieldValidator ID="rfvBuildHours0" runat="server" 
                                        ControlToValidate="TextBoxProjectBuildHours" ErrorMessage="Required" 
                                        ValidationGroup="Submit" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    </b>
                                </td>
                            </tr>
                            <tr>
                                <td class="style177" valign="top">
                                    <b>ECN Hours</b></td>
                                <td class="style104">
                                    <b>
                                    <asp:TextBox ID="TextBoxECN" runat="server" CssClass="style1" MaxLength="100" 
                                        OnBlur="this.style.borderColor=''" OnFocus="this.style.borderColor='#c0c0c0'"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvECN" runat="server" 
                                        ControlToValidate="TextBoxECN" ErrorMessage="Required" 
                                        ValidationGroup="EstimatedHours" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    &nbsp;<asp:RequiredFieldValidator ID="rfvECN0" runat="server" 
                                        ControlToValidate="TextBoxECN" ErrorMessage="Required" 
                                        ValidationGroup="Submit" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    </b>
                                </td>
                            </tr>
                            <tr>
                                <td class="style177" valign="top">
                                    <b>Qualification Hours</b></td>
                                <td class="style104">
                                    <b>
                                    <asp:TextBox ID="TextBoxQualification" runat="server" CssClass="style1" 
                                        MaxLength="100" OnBlur="this.style.borderColor=''" 
                                        OnFocus="this.style.borderColor='#c0c0c0'"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvQualification" runat="server" 
                                        ControlToValidate="TextBoxQualification" ErrorMessage="Required" 
                                        ValidationGroup="EstimatedHours" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    &nbsp;<asp:RequiredFieldValidator ID="rfvQualification0" runat="server" 
                                        ControlToValidate="TextBoxQualification" ErrorMessage="Required" 
                                        ValidationGroup="Submit" Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    </b>
                                </td>
                            </tr>
                            <tr>
                                <td class="style177" valign="top">
                                    <b>ISIR Hours</b></td>
                                <td class="style104">
                                    <b>
                                    <asp:TextBox ID="TextBoxISIR" runat="server" CssClass="style1" MaxLength="100" 
                                        OnBlur="this.style.borderColor=''" OnFocus="this.style.borderColor='#c0c0c0'" 
                                        style="margin-bottom: 0px"></asp:TextBox>
                                    <br />
                                    <asp:RequiredFieldValidator ID="rfvISIR" runat="server" 
                                        ControlToValidate="TextBoxISIR" ErrorMessage="Required" Display="Dynamic" 
                                        ValidationGroup="EstimatedHours">Required</asp:RequiredFieldValidator>
                                    &nbsp;<asp:RequiredFieldValidator ID="rfvISIR0" runat="server" 
                                        ControlToValidate="TextBoxISIR" ErrorMessage="Required" Display="Dynamic" 
                                        ValidationGroup="Submit">Required</asp:RequiredFieldValidator>
                                    <br />
                                    </b>
                                    <asp:Button ID="ButtonAddProjectHours" runat="server" 
                                        onclick="ButtonAddProjectHours_Click" 
                                        Text="- Calculate Project Est. Hours -" 
                                        ValidationGroup="EstimatedHours" Height="26px" Width="209px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style177" valign="top">
                        <b>Project&nbsp; Est. Hours</b></td>
                                <td class="style104">
                        <b>
                        <asp:TextBox ID="TextBoxProjectEsimatedHours" runat="server" CssClass="style1" 
                            MaxLength="100" OnBlur="this.style.borderColor=''" 
                            OnFocus="this.style.borderColor='#c0c0c0'"></asp:TextBox>
                                    <br />
                        <asp:RequiredFieldValidator ID="rfvProjectEstimatedHours" runat="server" 
                            ControlToValidate="TextBoxProjectDesignHours" ErrorMessage="Required" 
                                        Display="Dynamic">Required</asp:RequiredFieldValidator>
                                    &nbsp;<asp:RequiredFieldValidator ID="rfvProjectEstimatedHours0" runat="server" 
                            ControlToValidate="TextBoxProjectDesignHours" ErrorMessage="Required" 
                                        Display="Dynamic" ValidationGroup="Submit">Required</asp:RequiredFieldValidator>
                                    <br />
                        </b>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td class="style156" valign="top">
                        &nbsp;</td>
                    <td valign="top">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style156" valign="top">
                        <b>
                        Project Description</b></td>
                    <td valign="top">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td valign="top" colspan="2">
                        <b>
                        <asp:TextBox ID="TextBoxDescription" runat="server" CssClass="style1" 
                            Height="73px" MaxLength="500" OnBlur="this.style.borderColor=''" 
                            OnFocus="this.style.borderColor='#c0c0c0'" TextMode="MultiLine" 
                            Width="700px"></asp:TextBox>
                        </b>
                    </td>
                </tr>
                <tr>
                    <td class="style156" valign="top">
                        &nbsp;</td>
                    <td valign="top">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style156" valign="top">
                        <b>
                        <asp:Button ID="ButtonSave" runat="server" Height="100px" 
                            onclick="ButtonSave_Click" style="height: 26px" Text="Save" Width="260px" 
                            ValidationGroup="Submit" />
                        </b>
                    </td>
                    <td valign="top">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style156" valign="top">
                    
                    <asp:HiddenField ID="HiddenFieldProjectID" runat="server" />
                    
                    <asp:SqlDataSource ID="SDSDropDownMenuCustomer" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
                        
                        
                            
                            SelectCommand="SELECT DISTINCT ISNULL(Project.PROJECTID + ': ' + Customer.Name, Project.PROJECTID) AS ProjectIDCustomer, Project.PROJECTID FROM Project LEFT JOIN Customer ON Project.PROJECTID = Customer.ProjectID"></asp:SqlDataSource>          
                    
                                    <asp:HiddenField ID="HiddenCustomerName" runat="server" />
                                    <asp:SqlDataSource ID="SDSProjectDesc" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:EpicorSQLServer %>" 
                                        
                                        
                            SelectCommand="SELECT DISTINCT P.PROJECTID, C.NAME, M.DESCRIPTION, M.ORDERNUM, M.ORDERLINE, M.BILLINGAMOUNT, M.DATE01, I.INVOICEDATE, I.INVOICENUM, I.INVOICELINE, CAST(ISNULL(I.EXTPRICE, 0) AS int) AS [Extended Price], CAST(ISNULL(M.BILLINGAMOUNT - I.EXTPRICE, 0) AS int) AS [Remaining Amount] FROM Project AS P INNER JOIN Customer AS C ON P.PROJECTID = C.PROJECTID LEFT OUTER JOIN Milestone AS M ON P.PROJECTID = M.PROJECTID LEFT OUTER JOIN InvoiceM AS I ON P.PROJECTID = I.PROJECTID AND M.INVOICENUM = I.INVOICENUM WHERE (P.PROJECTID = @PID) ORDER BY M.DATE01">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ddlCustJob" Name="PID" 
                                                PropertyName="SelectedValue" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    </td>
                    <td valign="top">
                        &nbsp;</td>
                </tr>
            </table>
        
                </td>
            </tr>
        </table>
      
           
        </b>
</asp:Content>