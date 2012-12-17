using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JobTableAdapters;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
public partial class Default2 : System.Web.UI.Page
{
    
    protected string employeeName;
    protected decimal totSalHours = 0;
    protected decimal totHrsHours = 0;

    protected void Page_Init(object sender, EventArgs e)
    {
        try
        {
            string empname = Session["EmpName"].ToString();
            Master.SetLabel = empname;
            this.employeeName = empname;
            Session["StartDate"] = "";
            Session["EndDate"] = "";

        }
        catch (NullReferenceException) { }

    }

 





    
    protected void ButtonCustomDisplay_Click(object sender, EventArgs e)
    {

        int UID = int.Parse(DropDownListEmpIDName.SelectedValue);
        Session["UserID"] = UID;
        Session["VacationHours"] = "";
        LabelDateError.Text = "";
        lblJobsPerHour.Visible = true;

        

        DateTime sdate = DateTime.Parse(TextBoxStartDate.Text);
        DateTime edate = DateTime.Parse(TextBoxEndDate.Text);
        if (sdate > edate)
        {
            LabelDateError.Text = "Start Date cannot be less then End Date";
        }

        else
        {       string StartDate = sdate.ToString("yyyy-MM-dd");
                string EndDate = edate.ToString("yyyy-MM-dd");


                Session["StartDate"] = StartDate;
                Session["EndDate"] = EndDate;
                HiddenFieldStartDate.Value  = StartDate;
                HiddenFieldEndDate.Value = EndDate;

                //Response.Write(HiddenFieldStartDate.Value + " " + HiddenFieldEndDate.Value);
                    

                
                if (RadioButtonListEmpType.SelectedIndex == 0)  //if Salaried is selected
                {
                    //Response.Write(Session["StartDate"].ToString()+ " " + Session["EndDate"].ToString() + Session["UserID"].ToString());
                    gvEmployeeTime.Visible = true;
                    gvEmployeeHourly.Visible = false;
                    createPieChartSalaried();

                    try
                    {
                        string vacHrs = Session["VacationHours"].ToString();
                        if (vacHrs == "")
                        {
                            vacHrs = "0.00";
                        }

                        lblJobsPerHour.Text = "Total Hours Per Job," + "<br> Vacation Hours=" + vacHrs;
                    }
                    catch (NullReferenceException)
                    { }
                
                }
                else //if Hourly is selected
                {
                    //Response.Write(Session["StartDate"].ToString() + " " + Session["EndDate"].ToString() + Session["UserID"].ToString());

                    gvEmployeeTime.Visible = false;
                    gvEmployeeHourly.Visible = true;
                    //createPieChartHourly();
                }
            

        }

    }

    protected void clearTextFields()
    {
        LabelTotalHours.Text = "";
        TextBoxStartDate.Text = "";
        TextBoxEndDate.Text = "";
       

    }
    





    protected void RadioButtonListEmpType_SelectedIndexChanged(object sender, EventArgs e)
    {
        clearTextFields();
        Session["StartDate"] = "";
        Session["EndDate"] = "";
        Session["UserID"] = "";
        gvEmployeeTime.Visible = false;
        gvEmployeeHourly.Visible = false;
        



       
        if (RadioButtonListEmpType.SelectedIndex == 0)
        {
            

            DropDownListEmpIDName.DataSourceID = "SDSEmpIDNameSalaried";
            gvEmployeeTime.Visible = true;
            gvEmployeeHourly.Visible = false;
            PanelSalariedCharts.Visible = true;
            PanelHourlyCharts.Visible = false;
           
        }
        else
        {
            DropDownListEmpIDName.DataSourceID = "SDSEmpIDNameHourly";
            
            gvEmployeeTime.Visible = false;
            gvEmployeeHourly.Visible = true;
            PanelSalariedCharts.Visible = false;
            PanelHourlyCharts.Visible = true;

            
        }
        DropDownListEmpIDName.AppendDataBoundItems = false;
    }

    protected void DropDownListEmpIDName_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["VacationHours"] = "";
        LabelTotalHours.Text  = "";
        lblJobsPerHour.Text = "";
        LabelErrors.Text = "";
        TextBoxEndDate.Text = "";
        TextBoxStartDate.Text = "";
        Session["StartDate"] = "";
        Session["EndDate"] = "";
        //int UID = int.Parse(DropDownListEmpIDName.SelectedValue);
        //Session["UserID"] = UID;



    }



    #region  --Code not been used anymore --
    private void createPieChartSalaried()
    {
        try
        {
            

            int EmpID = (int)Session["UserID"];
            string StartDate = Session["StartDate"].ToString();
            string EndDate = Session["EndDate"].ToString();
            string TotalVacationHours = JobRecords.GetEmpVacationHours(EmpID, StartDate, EndDate).ToString();
            Session["VacationHours"] = TotalVacationHours;

            

            int RecLen = JobRecords.GetEmpHoursTotRecord(EmpID, StartDate, EndDate);

            string[] tmpValuesX = JobRecords.GetEmpHours(EmpID, StartDate, EndDate)[0].Split(new char[] { ',' });
            string[] tmpValueY = JobRecords.GetEmpHours(EmpID, StartDate, EndDate)[1].Split(new char[] { ',' });
            decimal[] yValues = new decimal[RecLen];
            string[] xValues = new string[RecLen];

            for (int i = 0; i < RecLen; i++)
            {
                yValues[i] = decimal.Parse(tmpValueY[i]);
            }

            for (int i = 0; i < RecLen; i++)
            {
                xValues[i] = tmpValuesX[i];
            }

            decimal totalHours=0;

            for (int i = 0; i < yValues.Length; i++)
            {
                totalHours += yValues[i];
            }

            

            LabelTotalHours.Text = "Total Hours: " + string.Format("{0:0.00}", totalHours) + " hrs";


        }
        catch (NullReferenceException)
        {
            LabelErrors.Text = "No Data Found.";
        }

    }
    #endregion


    private void createPieChartHourly()
    {
        string EmpID = Session["UserID"].ToString();
        string StartDate = Session["StartDate"].ToString();
        string EndDate = Session["EndDate"].ToString();

        
        try
        {
            string[] tmpXValues = JobRecords.GetIndirectHoursForHourly(EmpID, StartDate, EndDate)[1].Split(',');
            string[] tmpYValues = JobRecords.GetIndirectHoursForHourly(EmpID, StartDate, EndDate)[0].Split(',');
            decimal[] yTmpValues = new decimal[tmpYValues.Length];
            string[] xTmpValues = new string[tmpXValues.Length];

            decimal[] yValues = new decimal[tmpYValues.Length];
            string[] xValues = new string[tmpXValues.Length];

            //Converting String To Decimal
            for (int i = 0; i < tmpYValues.Length - 1; i++)
            {
                yTmpValues[i] = decimal.Parse(tmpYValues[i]);
            }


            //Assigning Description to xValues Array
            for (int i = 0; i < tmpYValues.Length - 1; i++)
            {
                xTmpValues[i] = tmpXValues[i];
            }


            //Assigning JobHours and Description values at 0 index 
            yValues[0] = decimal.Parse(JobRecords.JobHoursForHourly(EmpID, StartDate, EndDate)[0]);
            xValues[0] = JobRecords.JobHoursForHourly(EmpID, StartDate, EndDate)[1];

            for (int i = 1; i < tmpYValues.Length; i++)
            {

                yValues[i] = yTmpValues[i - 1];
                xValues[i] = xTmpValues[i - 1];

            }
            decimal totalHours = 0;

            for (int i = 0; i < yValues.Length; i++)
            {
                totalHours += yValues[i];
            }
            //Response.Write(tmpXValues.Length + " " + tmpYValues.Length);



            LabelTotalHours.Text = "Total Hours: " + string.Format("{0:0.00}", totalHours) + " hrs";



        }
        catch (NullReferenceException)
        {

            double[] yValues = new double[1];
            string[] xValues = new string[1];

            yValues[0] = double.Parse(JobRecords.JobHoursForHourly(EmpID, StartDate, EndDate)[0]);
            xValues[0] = JobRecords.JobHoursForHourly(EmpID, StartDate, EndDate)[1];

            //Response.Write(xValues[0] + " " + yValues[0]);

            
        }


    }

    //private void createPieChartforJobHours()
    //{
    //    //string EmpID = Session["UserID"].ToString();
    //    string StartDate = Session["StartDateJobHours"].ToString();
    //    string EndDate = Session["EndDateJobHours"].ToString();


    //    try
    //    {
    //        string[] tmpXValues = JobRecords.GetJobHours(StartDate, EndDate)[1].Split(',');
    //        string[] tmpYValues = JobRecords.GetJobHours(StartDate, EndDate)[0].Split(',');
    //        decimal[] yTmpValues = new decimal[tmpYValues.Length];
    //        string[] xTmpValues = new string[tmpXValues.Length];

    //        decimal[] yValues = new decimal[tmpYValues.Length];
    //        string[] xValues = new string[tmpXValues.Length];

    //        //Converting String To Decimal
    //        for (int i = 0; i < tmpYValues.Length - 1; i++)
    //        {
    //            yTmpValues[i] = decimal.Parse(tmpYValues[i]);
    //        }


    //        //Assigning Description to xValues Array
    //        for (int i = 0; i < tmpYValues.Length - 1; i++)
    //        {
    //            xTmpValues[i] = tmpXValues[i];
    //        }


    //        //Assigning JobHours and Description values at 0 index 
    //        yValues[0] = decimal.Parse(JobRecords.JobHoursForHourly(EmpID, StartDate, EndDate)[0]);
    //        xValues[0] = JobRecords.JobHoursForHourly(EmpID, StartDate, EndDate)[1];

    //        for (int i = 1; i < tmpYValues.Length; i++)
    //        {

    //            yValues[i] = yTmpValues[i - 1];
    //            xValues[i] = xTmpValues[i - 1];

    //        }
    //        decimal totalHours = 0;

    //        for (int i = 0; i < yValues.Length; i++)
    //        {
    //            totalHours += yValues[i];
    //        }
    //        //Response.Write(tmpXValues.Length + " " + tmpYValues.Length);


    //        ChartEmpHours.Series["SeriesEmpHours"].Points.DataBindXY(xValues, yValues);
    //        LabelTotalHours.Text = "Total Hours: " + string.Format("{0:0.00}", totalHours) + " hrs";



    //    }
    //    catch (NullReferenceException)
    //    {

    //        double[] yValues = new double[1];
    //        string[] xValues = new string[1];

    //        yValues[0] = double.Parse(JobRecords.JobHoursForHourly(EmpID, StartDate, EndDate)[0]);
    //        xValues[0] = JobRecords.JobHoursForHourly(EmpID, StartDate, EndDate)[1];

    //        //Response.Write(xValues[0] + " " + yValues[0]);

    //        ChartEmpHours.Series["SeriesEmpHours"].Points.DataBindXY(xValues, yValues);
    //    }


    //}


    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ButtonCrystalReport_Click(object sender, EventArgs e)
    {
        
    

        try
        {
            int ParameterEmpID = (int)Session["UserID"];
            string StartDate = HiddenFieldStartDate.Value;
            string EndDate = HiddenFieldEndDate.Value;

            DateTime ParameterStartDate = DateTime.Parse(StartDate);
            DateTime ParameterEndDate = DateTime.Parse(EndDate);
            string exportPath;
            
            ReportDocument crReportDocument = new ReportDocument();
            
            if (RadioButtonListEmpType.SelectedIndex == 0)
            {
                exportPath = Server.MapPath("~/report/tempReport/SalaryLabor.pdf"); //where file will be exported             
                crReportDocument.Load(Server.MapPath("~/report/SalaryLabor.rpt"));
                crReportDocument.SetParameterValue("EmpID", ParameterEmpID);
                crReportDocument.SetParameterValue("StartDate", ParameterStartDate);
                crReportDocument.SetParameterValue("EndDate", ParameterEndDate);
                crReportDocument.ExportToDisk(ExportFormatType.PortableDocFormat, exportPath);

                Response.Redirect("~/report/tempReport/SalaryLabor.pdf");
            }
            else
            {
                exportPath = Server.MapPath("~/report/tempReport/HourlyLabor.pdf"); //where file will be exported             
                crReportDocument.Load(Server.MapPath("~/report/HourlyLabor.rpt"));
                crReportDocument.SetParameterValue("EmpID", ParameterEmpID);
                crReportDocument.SetParameterValue("StartDate", ParameterStartDate);
                crReportDocument.SetParameterValue("EndDate", ParameterEndDate);
                crReportDocument.ExportToDisk(ExportFormatType.PortableDocFormat, exportPath);

                Response.Redirect("~/report/tempReport/HourlyLabor.pdf");
            }
            
            

           

    
            
        }
        catch (NullReferenceException)
        { }
    
    }
    protected void ButtonToggleView_Click(object sender, EventArgs e)
    {

        switch (MultiViewEmployeeHours.ActiveViewIndex)
        {
            case 0:
                MultiViewEmployeeHours.ActiveViewIndex = 1;
                ButtonToggleView.Text = "Employee Hours";
                break;
            case 1:
                MultiViewEmployeeHours.ActiveViewIndex = 0;
                ButtonToggleView.Text = "Hours by Jobs";
                break;
        }
        
    }

    protected void ButtonCustomDisplayJobHours_Click(object sender, EventArgs e)
    {
        LabelDateErrorJobHours.Text = "";
        

        DateTime sdate = DateTime.Parse(TextBoxStartDateJobHours.Text);
        DateTime edate = DateTime.Parse(TextBoxEndDateJobHours.Text);
        if (sdate > edate)
        {
            LabelDateErrorJobHours.Text = "Start Date cannot be less then End Date";
        }

        else
        {
            string StartDateJobHours = sdate.ToString("yyyy-MM-dd");
            string EndDateJobHours = edate.ToString("yyyy-MM-dd");


            Session["StartDateJobHours"] = StartDateJobHours;
            Session["EndDateJobHours"] = EndDateJobHours;
            HiddenFieldJobHourStartDate.Value = StartDateJobHours;
            HiddenFieldJobHourEndDate.Value = EndDateJobHours;
        }

    }

    protected void gvEmployeeTime_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            totSalHours = totSalHours + decimal.Parse(e.Row.Cells[4].Text);
        }
        
        LabelTotalHours.Text = "Total Hours: " + string.Format("{0:0.00}", totSalHours) + " hrs";

        if (totSalHours != 0)
        {
            LabelErrors.Text = "";
        }
    }
    protected void gvEmployeeHourly_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            totHrsHours = totHrsHours + decimal.Parse(e.Row.Cells[5].Text);
        }

        lblHourlyTotal.Text = "Total Hours: " + string.Format("{0:0.00}", totHrsHours) + " hrs";

        if (totHrsHours != 0)
        {
            LabelErrors.Text = "";
        }
    }
}
