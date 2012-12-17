using System;
using System.Data;
using System.Web.UI;
using System.Data.SqlClient;

using JobTableAdapters;
using System.Web.UI.WebControls;


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
                PanelBillingLaborMaterial.Visible = false;

            }
            catch (NullReferenceException) { }

        }
    }


    protected void DetailsViewEstimatedCost_ItemUpdated(Object sender, System.Web.UI.WebControls.DetailsViewUpdatedEventArgs e)
    {
        gvJobDetails.DataBind();
        ddlCustJob.DataBind();
    }

    protected void gvJobDetails_SelectedIndexChanged(object sender, EventArgs e)
    {
        DetailsViewEstimatedCost.ChangeMode(DetailsViewMode.ReadOnly);
    }

    protected void gvJobDetails_Sorted(object sender, EventArgs e)
    {
        DetailsViewEstimatedCost.ChangeMode(DetailsViewMode.ReadOnly);
    }

    protected void CustDropDown_SelectedIndexChanged(object sender, EventArgs e)
    {
        DetailsViewEstimatedCost.ChangeMode(DetailsViewMode.ReadOnly);
    }

    protected void gvJobDetails_PageIndexChanged(object sender, EventArgs e)
    {
        DetailsViewEstimatedCost.ChangeMode(DetailsViewMode.ReadOnly);
    }



    protected void ddlCustJob_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            LabelBillingCost.Text = "";
            LabelJobLabor.Text = "";
            LabelMaterialCost.Text = "";
            LabelSubcontractCost.Text = "";
            LabelTransferCost.Text = "";
            LabelSellingPricePerJobLabor.Text = "";
            LabelUSChinaCost.Text = "";
            LabelFreightCost.Text = "";

            string PID = ddlCustJob.SelectedValue;

            // Response.Write(PID);

            double BillingCost = (JobRecords.GetBillingLaborMaterialCost(PID)[0]) * (0.83);
            double EstimatedHours = JobRecords.GetBillingLaborMaterialCost(PID)[1];
            double EstimatedMaterialCost = JobRecords.GetBillingLaborMaterialCost(PID)[2];
            double SubcontractCost = JobRecords.GetBillingLaborMaterialCost(PID)[3];
            double TransferCost = JobRecords.GetBillingLaborMaterialCost(PID)[4];
            double USChinaCost = JobRecords.GetBillingLaborMaterialCost(PID)[5];
            double FrieghtCost = JobRecords.GetBillingLaborMaterialCost(PID)[6];
            double total;

            if (BillingCost == 0 && EstimatedHours == 0 && EstimatedMaterialCost == 0 && SubcontractCost == 0 && TransferCost == 0 && FrieghtCost == 0)
            {
                PanelBillingLaborMaterial.Visible = false;
            }
            else
            {

                PanelBillingLaborMaterial.Visible = true;
                LabelBillingCost.Text = string.Format("{0:C}", BillingCost);
                LabelJobLabor.Text = string.Format("{0:0.00}", EstimatedHours) + " hrs";
                LabelMaterialCost.Text = string.Format("{0:C}", EstimatedMaterialCost);
                LabelSubcontractCost.Text = string.Format("{0:C}", SubcontractCost);
                LabelTransferCost.Text = string.Format("{0:C}", TransferCost);
                LabelUSChinaCost.Text = string.Format("{0:C}", USChinaCost);
                LabelFreightCost.Text = string.Format("{0:C}", FrieghtCost);
                total = (BillingCost - (EstimatedMaterialCost + SubcontractCost + TransferCost + USChinaCost + FrieghtCost)) / EstimatedHours;
                LabelSellingPricePerJobLabor.Text = string.Format("{0:0.00}", total);
            }


        }
        catch (FormatException) { }
    }
}


