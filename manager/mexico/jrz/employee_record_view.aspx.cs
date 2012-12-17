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
        LabelDateError.Text = "";
        

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
                    

                
                if (RadioButtonListEmpType.SelectedIndex == 0)
                {
                    //Response.Write(Session["StartDate"].ToString()+ " " + Session["EndDate"].ToString() + Session["UserID"].ToString());
                    gvEmployeeTime.Visible = true;
                    gvEmployeeHourly.Visible = false;
                    createPieChartSalaried();
                }
                else
                {
                    //Response.Write(Session["StartDate"].ToString() + " " + Session["EndDate"].ToString() + Session["UserID"].ToString());

                    gvEmployeeTime.Visible = false;
                    gvEmployeeHourly.Visible = true;
                    createPieChartHourly();
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
    //    clearTextFields();
    //    Session["StartDate"] = "";
    //    Session["EndDate"] = "";
    //    gvEmployeeTime.Visible = false;
    //    gvEmployeeHourly.Visible = false;



       
    //    if (RadioButtonListEmpType.SelectedIndex == 0)
    //    {
            

    //        DropDownListEmpIDName.DataSourceID = "SDSEmpIDNameSalaried";
    //        gvEmployeeTime.Visible = true;
    //        gvEmployeeHourly.Visible = false;
           
    //    }
    //    else
    //    {
    //        DropDownListEmpIDName.DataSourceID = "SDSEmpIDNameHourly";
            
    //        gvEmployeeTime.Visible = false;
    //        gvEmployeeHourly.Visible = true;      

            
    //    }
    //    DropDownListEmpIDName.AppendDataBoundItems = false;
    }

    protected void DropDownListEmpIDName_SelectedIndexChanged(object sender, EventArgs e)
    {
        LabelTotalHours.Text  = "";
        LabelErrors.Text = "";
        TextBoxEndDate.Text = "";
        TextBoxStartDate.Text = "";
        Session["StartDate"] = "";
        Session["EndDate"] = "";
        int UID = int.Parse(DropDownListEmpIDName.SelectedValue);
        Session["UserID"] = UID;
        
        
        
    }




    private void createPieChartSalaried()
    {
        try
        {
            ChartEmpHours.Series["SeriesEmpHours"].Points.Clear();

            int EmpID = (int)Session["UserID"];
            string StartDate = Session["StartDate"].ToString();
            string EndDate = Session["EndDate"].ToString();


            int RecLen = JobRecords.GetEmpHoursTotRecordMexico(EmpID, StartDate, EndDate);

            string[] tmpValuesX = JobRecords.GetEmpHoursMexico(EmpID, StartDate, EndDate)[0].Split(new char[] { ',' });
            string[] tmpValueY = JobRecords.GetEmpHoursMexico(EmpID, StartDate, EndDate)[1].Split(new char[] { ',' });
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

            
            ChartEmpHours.Series["SeriesEmpHours"].Points.DataBindXY(xValues, yValues);
            LabelTotalHours.Text = "Total Hours: " + string.Format("{0:0.00}", totalHours) + " hrs";


        }
        catch (NullReferenceException)
        {
            LabelErrors.Text = "No Data Found.";
        }

    }


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


            ChartEmpHours.Series["SeriesEmpHours"].Points.DataBindXY(xValues, yValues);
            LabelTotalHours.Text = "Total Hours: " + string.Format("{0:0.00}", totalHours) + " hrs";



        }
        catch (NullReferenceException)
        {

            double[] yValues = new double[1];
            string[] xValues = new string[1];

            yValues[0] = double.Parse(JobRecords.JobHoursForHourly(EmpID, StartDate, EndDate)[0]);
            xValues[0] = JobRecords.JobHoursForHourly(EmpID, StartDate, EndDate)[1];

            //Response.Write(xValues[0] + " " + yValues[0]);

            ChartEmpHours.Series["SeriesEmpHours"].Points.DataBindXY(xValues, yValues);
        }


    }


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
                exportPath = Server.MapPath("~/report/tempReport/SalaryLaborMexico.pdf"); //where file will be exported             
                crReportDocument.Load(Server.MapPath("~/report/SalaryLaborMexico.rpt"));
                crReportDocument.SetParameterValue("EmpID", ParameterEmpID);
                crReportDocument.SetParameterValue("StartDate", ParameterStartDate);
                crReportDocument.SetParameterValue("EndDate", ParameterEndDate);
                crReportDocument.ExportToDisk(ExportFormatType.PortableDocFormat, exportPath);

                Response.Redirect("~/report/tempReport/SalaryLaborMexico.pdf");
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
}
