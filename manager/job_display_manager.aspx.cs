using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class job_display : System.Web.UI.Page
{
    protected string selectedIndex;
    protected decimal total_cost, total_hours;
    
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            try
            {
                LabelProjectID.Text = Session["ProjectID"].ToString();
                LabelCustomerName.Text = Session["CustomerName"].ToString();
            }
            catch (NullReferenceException) { }
            try
            {
                string empname = Session["EmpName"].ToString();
                Master.SetLabel = empname;
                updatePanelHeight();
            }
            catch(NullReferenceException) {}
        }

    }

    private void updatePanelHeight()
    {
        JobGridPanel.Height = gvJobsDisplay.Height;
    }


    protected void gvJobsDisplay_SelectedIndexChanged(object sender, EventArgs e)
    {
        //LabelJobNum.Text =  this.gvJobsDisplay.SelectedRow.Cells[1].Text;
        selectedIndex = this.gvJobsDisplay.SelectedRow.Cells[1].Text;
        generateDDLOperationSequence(selectedIndex);
        HiddenFieldJobNum.Value = selectedIndex;
    }

    private void generateDDLOperationSequence(string JobNum)
    {
        DropDownListOperationSequence.DataSource = JobRecords.GetOperationSequences(JobNum);

        DropDownListOperationSequence.DataTextField = "Operation";
        DropDownListOperationSequence.DataValueField = "OprSeq";
        DropDownListOperationSequence.DataBind();

        
    }




    protected void gvJobsDisplay_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        DataRowView cost = e.Row.DataItem as DataRowView;

        if (e.Row.RowType == DataControlRowType.Header)
        {
            total_cost = 0;
        }
        else if (e.Row.RowType == DataControlRowType.DataRow)
        {
            total_cost += (decimal)cost["Cost"];

        }
        else
        {
            //Label tCost = Page.FindControl("LabelTotalJobCost") as Label;

            

            LabelTotalJobCost.Text = string.Format("{0:c}",total_cost);
            Session["Total_Job_Cost"] = LabelTotalJobCost.Text;


        }
    }


    protected void ButtonChangeProjectIDSession_Click(object sender, EventArgs e)
    {
        string PID = TextBoxProjectID.Text;
        LabelProjectID.Text = PID;
        LabelCustomerName.Text = JobRecords.GetCustomerName(PID);
        Session["ProjectID"] = PID;
    }
    protected void gvEmployeeHours_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        DataRowView hours = e.Row.DataItem as DataRowView;

        if (e.Row.RowType == DataControlRowType.Header)
        {
            total_hours = 0;
        }
        else if (e.Row.RowType == DataControlRowType.DataRow)
        {
            total_hours += (decimal)hours["Labor Hours"];

        }
        else
        {
            //Label tCost = Page.FindControl("LabelTotalJobCost") as Label;



            LabelTotalHours.Text = string.Format("{0:0.00}", total_hours);
            //Session["Total_Job_Cost"] = LabelTotalJobCost.Text;


        }
    }
}
