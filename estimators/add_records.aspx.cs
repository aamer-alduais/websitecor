using System;
using System.Data;
using System.Web.UI;
using System.Data.SqlClient;

using JobTableAdapters;


public partial class main : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                string empname = Session["EmpName"].ToString();
                Master.SetLabel = empname;
            }
            catch (NullReferenceException) { }

        }
    }

    private void PopulateCustomerInfo()
    {
        clearTextBoxes();
        try
        {
            string[] CustName = ddlCustJob.SelectedItem.Text.Split(':');
            TextBoxCustomer.Text = CustName[1];
            HiddenCustomerName.Value = CustName[1];

            TextBoxPO.Text = JobRecords.GetCustomerInformation(ddlCustJob.SelectedValue)[0];
            TextBoxPartNumber.Text = JobRecords.GetCustomerInformation(ddlCustJob.SelectedValue)[1];
            TextBoxPartName.Text = JobRecords.GetCustomerInformation(ddlCustJob.SelectedValue)[2];
            TextBoxECRevision.Text = JobRecords.GetCustomerInformation(ddlCustJob.SelectedValue)[3];
            TextBoxToolDueDate.Text = JobRecords.GetCustomerInformation(ddlCustJob.SelectedValue)[4];
            TextBoxPPAPDueDate.Text = JobRecords.GetCustomerInformation(ddlCustJob.SelectedValue)[5];
        }
        catch (IndexOutOfRangeException)
        {
            displayError();
        }
    }

    private void displayError()
    {
        LabelRecordMessages.Text = "Select Customer before saving from Drop Down Menu.";
    }

    protected void ButtonSave_Click(object sender, EventArgs e)
    {

        DisplayProjectTableAdapter sAdapter = new DisplayProjectTableAdapter();

        string PID = HiddenFieldProjectID.Value;

        PopulateCustomerInfo();
        string CustName = TextBoxCustomer.Text;
        if (CustName != "-- SELECT --" && CustName !="")
        {

           
            string returnedPID = sAdapter.CheckProductID(PID);

            if (returnedPID == null)
            {
                
                string ProjectID = ddlCustJob.SelectedValue;
                string CustomerName = HiddenCustomerName.Value;
                string PO = TextBoxPO.Text;
                string PartNumber = TextBoxPartNumber.Text;
                string ToolDueDate = TextBoxToolDueDate.Text;
                string PartName = TextBoxPartName.Text;
                string ECRevision = TextBoxECRevision.Text;
                string DesignHours = TextBoxProjectDesignHours.Text;
                string BuildHours = TextBoxProjectBuildHours.Text;
                string Automation = TextBoxAutomation.Text;
                string EstimatedHours = TextBoxProjectEsimatedHours.Text;
                string SubcontractHours = TextBoxSubcontractCost.Text;
                string EstimatedMaterialCost = TextBoxEstimatedMaterialCost.Text;
                string ProjecTransferCost = TextBoxTransferCost.Text + " (" + DropDownListProjectTransferCost.SelectedItem.Text + ")";
                string USChinaCost = TextBoxUSChinaCost.Text + " (" + DropDownList_US_China.SelectedItem.Text + ")";
                string ISIR = TextBoxISIR.Text;
                string ECN = TextBoxECN.Text;
                string NPL = TextBoxNPL.Text;
                string Qualification = TextBoxQualification.Text;
                string PPAPDueDate = TextBoxPPAPDueDate.Text;
                string BillingAmount = TextBoxBillingAmount.Text;
                string Description = TextBoxDescription.Text;
                string FreightCost = TextboxChinaFreightCost.Text +" (" + DropDownList_China_Freight.SelectedItem.Text +")"  ;


                sAdapter.Insert(ProjectID, CustomerName, PO, PartNumber, ToolDueDate, PartName, ECRevision, DesignHours, BuildHours,
                    Automation, EstimatedHours, SubcontractHours, EstimatedMaterialCost, ISIR, ECN, NPL, Qualification, Description, USChinaCost, ProjecTransferCost, PPAPDueDate, BillingAmount, FreightCost);
                LabelRecordMessages.Text = "Record - <b>" + PID + "</b> submitted successfully.";
                PopulateCustomerInfo();
            

            }
            else
            {

                LabelRecordMessages.Text = "Record with <b>" + PID + "</b> already exist.";
                PopulateCustomerInfo();


            }
        }
        else
        {
            displayError();
        }




    }


    protected void ddlCustJob_SelectedIndexChanged(object sender, EventArgs e)
    {
        HiddenFieldProjectID.Value = ddlCustJob.SelectedValue.ToString();
        LabelRecordMessages.Text = "";
        clearTextBoxes();
        PopulateCustomerInfo();
    }
    protected void clearTextBoxes()
    {
        TextBoxCustomer.Text = "";
        TextBoxPO.Text = "";
        TextBoxPartName.Text = "";
        TextBoxPPAPDueDate.Text = "";
        TextBoxPartName.Text = "";
        TextBoxPartNumber.Text = "";
        TextBoxECRevision.Text = "";
        TextBoxProjectDesignHours.Text = "";
        TextBoxProjectBuildHours.Text = "";
        TextBoxAutomation.Text = "";
        TextBoxProjectEsimatedHours.Text = "";
        TextBoxSubcontractCost.Text = "";
        TextBoxEstimatedMaterialCost.Text = "";
        TextBoxUSChinaCost.Text = "";

        TextBoxISIR.Text = "";
        TextBoxECN.Text = "";
        TextBoxNPL.Text = "";
        TextBoxQualification.Text = "";
        TextBoxDescription.Text = "";
    }



    protected void ButtonAddProjectHours_Click(object sender, EventArgs e)
    {
        int NPLHours = int.Parse(TextBoxNPL.Text);
        int ProjDesignHours = int.Parse(TextBoxProjectDesignHours.Text);
        int InhouseBuildHours = int.Parse(TextBoxProjectBuildHours.Text);
        int ECNHours = int.Parse(TextBoxECN.Text);
        int QualHours = int.Parse(TextBoxQualification.Text);
        int ISIRHours = int.Parse(TextBoxISIR.Text);

        int result;

        result = NPLHours + ProjDesignHours + InhouseBuildHours + ECNHours + QualHours + ISIRHours;

        TextBoxProjectEsimatedHours.Text = result.ToString();
    }
    protected void ButtonCalculate_Click(object sender, EventArgs e)
    {
        double ActualBillingAmount  = int.Parse(TextBoxBillingAmount.Text); 
        double BillingAmount = int.Parse(TextBoxBillingAmount.Text) * 0.17;
        double USChinaBuild = int.Parse(TextBoxUSChinaCost.Text);
        double SubContractCost = int.Parse(TextBoxSubcontractCost.Text);
        double TransferCost = int.Parse(TextBoxTransferCost.Text);
        double FreightCost = int.Parse(TextboxChinaFreightCost.Text);
        double MaterialCost = int.Parse(TextBoxEstimatedMaterialCost.Text);


        LabelBillingAmount.Text = BillingAmount.ToString();
        LabelUSChina.Text = USChinaBuild.ToString();
        LabelSubcontractCost.Text = SubContractCost.ToString();
        LabelTransferCost.Text = TransferCost.ToString();
        LabelFreightCost.Text = FreightCost.ToString();
        LabelMaterialCost.Text = MaterialCost.ToString();

        LabelTotalHoursCalculated.Text = string.Format("{0:0.00}",(ActualBillingAmount - (BillingAmount + USChinaBuild + SubContractCost + TransferCost + FreightCost + MaterialCost))/70);
        TextBoxProjectEsimatedHours.Text = LabelTotalHoursCalculated.Text;
    }
}
