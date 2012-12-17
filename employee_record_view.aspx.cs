using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JobTableAdapters;
public partial class Default2 : System.Web.UI.Page
{
    protected int total_Hours, whole_hrs = 0, total_Mins;
    protected decimal hour_frac;
    protected string employeeName;
    protected void Page_Init(object sender, EventArgs e)
    {
        try
        {
            string empname = Session["EmpName"].ToString();
            Master.SetLabel = empname;
            this.employeeName = empname;
        }
        catch (NullReferenceException) { }

    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {


            displayHideDateOptions();
        }
    }

    private void displayHideDateOptions()
    {
        if (RadioButtonListDailyWeeklyCustom.SelectedIndex == 0)
        {
            LabelStartDate.Text = "";
            LabelEndDate.Text = "";
            PanelDailyWeekly.Visible = true;
            PanelCustomDate.Visible = false;

        }

        else
        {
            PanelCustomDate.Visible = true;
            PanelDailyWeekly.Visible = false;
        }
    }




    protected void RadioButtonListDailyWeeklyCustom_SelectedIndexChanged(object sender, EventArgs e)
    {
        clearTextFields();
        displayHideDateOptions();
    }
    protected void ButtonCustomDisplay_Click(object sender, EventArgs e)
    {
        DateTime sdate = DateTime.Parse(TextBoxStartDate.Text);
        DateTime edate = DateTime.Parse(TextBoxEndDate.Text);
        string StartDate = sdate.ToString("yyyy-MM-dd");
        string EndDate = edate.ToString("yyyy-MM-dd");


        if (TextBoxJobNum.Text == "")
        {
            Session["StartDate"] = StartDate;
            Session["EndDate"] = EndDate;
            gvEmployeeTime.DataSourceID = "SDS_Custom_Start_End";

        }
        else
        {
            Session["StartDate"] = StartDate;
            Session["EndDate"] = EndDate;
            Session["JobNum"] = TextBoxJobNum.Text;
            gvEmployeeTime.DataSourceID = "SDS_Custom_Start_End_JobNum";
        }

    }

    protected void clearTextFields()
    {
        TextBoxDailyWeeklyDate.Text = "";
        TextBoxDailyWeeklyJobNum.Text = "";
        TextBoxStartDate.Text = "";
        TextBoxEndDate.Text = "";
        TextBoxJobNum.Text = "";

    }
    protected void ButtonDisplayDailyWeekly_Click(object sender, EventArgs e)
    {

        DateTime dOnly = DateTime.Parse(TextBoxDailyWeeklyDate.Text);
        string dateOnly = dOnly.ToString("yyyy-MM-dd");

        if (TextBoxDailyWeeklyJobNum.Text == "")
        {
            if (RadioButtonListDailyWeekly.SelectedIndex == 0)
            {
                Session["DateContainer"] = dateOnly;
                gvEmployeeTime.DataSourceID = "SDS_DateOnly";
            }
            else
            {
                Session["EndDateWeekly"] = dateOnly;
                LabelEndDate.Text = dateOnly + " ]";

                TimeSpan duration = new TimeSpan(-7, 0, 0, 0);
                DateTime weekly = dOnly.Add(duration);
                dateOnly = weekly.ToString("yyyy-MM-dd");
               
                Session["StartDateWeekly"] = dateOnly;
                LabelStartDate.Text ="[ " + dateOnly + " to ";
                gvEmployeeTime.DataSourceID = "SDS_Weekly";
            }

        }
        else
        {
            if (RadioButtonListDailyWeekly.SelectedIndex == 0)
            {
                Session["DateContainer"] = dateOnly;
                Session["JobNum"] = TextBoxDailyWeeklyJobNum.Text;
                gvEmployeeTime.DataSourceID = "SDS_Date_JobNum";
            }
            else
            {
                Session["EndDateWeekly"] = dateOnly;
                LabelEndDate.Text = dateOnly + " ]";
                TimeSpan duration = new TimeSpan(-7, 0, 0, 0);
                DateTime weekly = dOnly.Add(duration);
                dateOnly = weekly.ToString("yyyy-MM-dd");
                Session["JobNum"] = TextBoxDailyWeeklyJobNum.Text;
                Session["StartDateWeekly"] = dateOnly;
                LabelStartDate.Text = "[ " + dateOnly + " to ";
                gvEmployeeTime.DataSourceID = "SDS_Date_JobNumWeekly";
            }


        }
        //gvEmployeeTimeDetails();
    }
    protected void RadioButtonListDailyWeekly_SelectedIndexChanged(object sender, EventArgs e)
    {
        displayHideDateOptions();
    }
    protected void gvEmployeeTime_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        DataRowView hours = e.Row.DataItem as DataRowView;
        DataRowView mins = e.Row.DataItem as DataRowView;

        if (e.Row.RowType == DataControlRowType.Header)
        {
            total_Hours = 0;
            total_Mins = 0;
        }
        else if (e.Row.RowType == DataControlRowType.DataRow)
        {
            total_Hours += (int)hours["Hours"];
            total_Mins += (int)mins["Minutes"];
            double leftover=0;

            hour_frac = (decimal)(total_Mins / 60.00);

            if (hour_frac >= 1)
            {
                leftover = 0;
                whole_hrs = (int)Math.Floor(hour_frac);
                leftover = (double)(hour_frac - whole_hrs);

                //total_Mins = (int)Math.Ceiling(leftover * 60);
                total_Mins = (int)Math.Ceiling(leftover * 60);

            }


            total_Hours += whole_hrs;
            whole_hrs = 0;
            //total_Mins = (int)Math.Ceiling(leftover * 60);


        }
        else
        {

            //Label tHours = Page.FindControl("LabelHours") as Label;
            //Label tMins = Page.FindControl("LabelMins") as Label;
            //tHours.Text = total_Hours.ToString()+ " hrs";
            //tMins.Text = total_Mins.ToString()+" mins";


            LabelHours.Text = total_Hours.ToString() + " hrs";
            LabelMins.Text = total_Mins.ToString() + " mins";

        }
    }





}
