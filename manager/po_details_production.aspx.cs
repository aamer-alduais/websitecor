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
    protected decimal total_cost;
   

    protected void Page_Load(object sender, EventArgs e)
    {

       
        if (!IsPostBack)
        {
            try
            {
                string empname = Session["EmpName"].ToString();

                Master.SetLabel = empname;
                
                LabelProjectID.Text = Session["JobNum"].ToString();
                //LabelCustomerName.Text = Session["CustomerName"].ToString();
                HiddenFieldJobNum.Value = Session["JobNum"].ToString();
                //Response.Write(HiddenFieldJobNum.Value + " Hidden Value");
                Session["JobNum"] = "";
        
                
            }
            catch (System.NullReferenceException) { }
            //Response.Write(Session["JobNum"].ToString() +" Outer Block") ;
            //LabelProjectID.Text = Session["JobNum"].ToString();

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
    



  
    protected void ButtonChangeProjectIDSession_Click(object sender, EventArgs e)
    {
        string PID = TextBoxProjectID.Text;
        LabelProjectID.Text = PID;
        //LabelCustomerName.Text = JobRecords.GetCustomerName(PID);
        Session["JobNum"] = PID;
        
    }
    protected void gvPOMain_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            DataRowView cost = e.Row.DataItem as DataRowView;

            if (e.Row.RowType == DataControlRowType.Header)
            {
                total_cost = 0;
            }
            else if (e.Row.RowType == DataControlRowType.DataRow)
            {
                total_cost += (decimal)cost["POCost"];

            }
            else
            {
                //Label tCost = Page.FindControl("LabelTotalJobCost") as Label;



                LabelTotalRelCost.Text = "PO Cost: " + string.Format("{0:c}", total_cost);
                Session["Total_Job_Cost"] = LabelTotalRelCost.Text;


            }
        }
        catch (InvalidCastException) { }
    }

   
}





