using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JobTableAdapters;

public partial class po_details : System.Web.UI.Page
{
    protected decimal totalRelQty;

    protected void Page_Load(object sender, EventArgs e)
    {

       
        if (!IsPostBack)
        {
            try
            {
                string empname = Session["EmpName"].ToString();

                Master.SetLabel = empname;

                LabelProjectID.Text = Session["ProjectID"].ToString();
                LabelCustomerName.Text = Session["CustomerName"].ToString();
                getTotalRelExtCost(LabelProjectID.Text);
                
            }
            catch (System.NullReferenceException) { }

            

        }
        
    }



    protected void gvPOMain_SelectedIndexChanged(object sender, EventArgs e)
    {
        HiddenFieldPONum.Value = this.gvPOMain.SelectedRow.Cells[1].Text;
        HiddenFieldPOLine.Value = this.gvPOMain.SelectedRow.Cells[2].Text;
        HiddenFieldPORelNum.Value = this.gvPOMain.SelectedRow.Cells[3].Text;
        HiddenFieldReceivedQty.Value = this.gvPOMain.SelectedRow.Cells[9].Text;

        // Response.Write(" PO Num:" + HiddenFieldPONum.Value + " PO Line: " + HiddenFieldPOLine.Value + " PO Rel Num: " + HiddenFieldPORelNum.Value + " PO Slip: " +
        // HiddenFieldPackingSlip.Value +"<br />"+this.gvPOMain.SelectedRow.Cells[1].Text);
       


    }
    

    protected void getTotalRelExtCost(string PID)
    {
        
        try
        {
            POTableAdapter poAdapter = new POTableAdapter();


            // LabelTotalRelCost.Text = recAdapter.GetReleaseExtCost(PID);
            string value = poAdapter.GetRelQtyByPID(PID).ToString();
            decimal cost = decimal.Parse(value);

            LabelTotalRelCost.Text = "Total Rel Cost: " + string.Format("{0:c}", cost);
            Session["Total_PO_Cost"] = string.Format("{0:c}", cost);
        }
        catch (FormatException) 
        {
            Session["Total_PO_Cost"] = 0;
        }

    }


  
    protected void ButtonChangeProjectIDSession_Click(object sender, EventArgs e)
    {
        string PID = TextBoxProjectID.Text;
        LabelProjectID.Text = PID;
        LabelCustomerName.Text = JobRecords.GetCustomerName(PID);
        Session["ProjectID"] = PID;
        getTotalRelExtCost(PID);
    }
}





