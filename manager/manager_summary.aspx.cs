using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Data.SqlClient;

public partial class manager_summary : System.Web.UI.Page
{
    //private ReportDocument report = new ReportDocument(); 

    protected void Page_Init(object sender, EventArgs e)
    {
        try
        {
            string empname = Session["EmpName"].ToString();
            Master.SetLabel = empname;

            //report.Load(Server.MapPath("~/report/TrackerProjSummary.rpt"));

  //          report.FileName = Server.MapPath("~/report/TrackerProjSummary.rpt");
        }
        catch (NullReferenceException)
        { }

       
    }
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (RadioButtonListToolType.SelectedIndex == 0)
        {
            NewToolPanel.Visible = true;
            ProductionToolsPanel.Visible = false;
        }
        else
        {
            ProductionToolsPanel.Visible = true;
            NewToolPanel.Visible = false;

        }
    }


        
    #region --New Tools Code--
    protected void gvProjectDetail_SelectedIndexChanged(object sender, EventArgs e)
    {
        clearTextBoxes(); 
        string PID = this.gvProjectDetail.SelectedRow.Cells[1].Text;
        string CustomerName = this.gvProjectDetail.SelectedRow.Cells[2].Text;

        
        Session["ProjectID"] = PID;
        Session["CustomerName"] = CustomerName;
        Session["ReportParameter"] = PID;

        //For Project Bar Chart
        //double TPR = double.Parse(this.gvProjectDetail.SelectedRow.Cells[3].Text);
        //double TRD = double.Parse(this.gvProjectDetail.SelectedRow.Cells[4].Text);
        //double TPC = double.Parse(this.gvProjectDetail.SelectedRow.Cells[5].Text);
        //double Leftover=TPR-TRD;

        //double[] yBarSeriesTPR = { TPR };
        //double[] yBarSeriesTRD = { TRD };
        //double[] yBarSeriesTPC = { TPC };
        //string[] xBarValues = { "Tot. Possible Rev.", "Tot. Rev.To Date", "Tot. Proj Cost" };
        //RevChartBar.Series["BarSeriesTPR"].Points.DataBindY(yBarSeriesTPR);
        //RevChartBar.Series["BarSeriesTRD"].Points.DataBindY(yBarSeriesTRD);
        //RevChartBar.Series["BarSeriesTPC"].Points.DataBindY(yBarSeriesTPC);   
        
        //if (TPR == TRD)
        //{
        //    TPR = 0;
        //}


        //For Project Cost Chart
        //double[] yValues = { Leftover, TRD };
        //string[] xValues = { "Remaining Revenue", "Total Revenue To Date" };
        //RevChart.Series["RevenueSeries"].Points.DataBindY(yValues);


        //For Hours Chart
        double[] THours = new double[6];
        //string[] xHoursName = {"Project Management","Tool Design","Tool Build","Automation","ISIR & Qualification","Total"};

        THours[0] = JobRecords.GetTotalHours(PID)[0] + JobRecords.GetTotalHours(PID)[1]; // FOR PM
        THours[1] = JobRecords.GetTotalHours(PID)[2] + JobRecords.GetTotalHours(PID)[3]; // FOR TOOL DESIGNER
        THours[2] = JobRecords.GetTotalHours(PID)[4]; // FOR TOOL BUILD
        THours[3] = JobRecords.GetTotalHours(PID)[10] + JobRecords.GetTotalHours(PID)[11] + JobRecords.GetTotalHours(PID)[12];// FOR Automation
        THours[4] = JobRecords.GetTotalHours(PID)[5] + JobRecords.GetTotalHours(PID)[6] + JobRecords.GetTotalHours(PID)[7]
                    + JobRecords.GetTotalHours(PID)[8] + JobRecords.GetTotalHours(PID)[9];// FOR ISIR_QUAL_AUTO_PROC
        
        HoursChart.Series["HoursSeries"].Points.DataBindY(THours);
        THours[5] = THours[0] + THours[1] + THours[2] + THours[3] + THours[4];


        LabelPM.Text = String.Format("{0:0.00}",THours[0]) + " hrs : "+  String.Format("{0:0%}", ((THours[0] / THours[5]) ));
        LabelTD.Text = String.Format("{0:0.00}",THours[1]) + " hrs : " + String.Format("{0:0%}", ((THours[1] / THours[5])));
        LabelTB.Text = String.Format("{0:0.00}",THours[2]) + " hrs : " + String.Format("{0:0%}", ((THours[2] / THours[5])));
        LabelAutomation.Text = String.Format("{0:0.00}",THours[3]) + " hrs : " + String.Format("{0:0%}", ((THours[3] / THours[5]) ));
        LabelISIR.Text = String.Format("{0:0.00}",THours[4]) + " hrs : " + String.Format("{0:0%}", ((THours[4] / THours[5]) ));
        LabelTotHours.Text = String.Format("{0:0.00}",THours[5]) + " hrs";


       
        try
        {
            double estimatedValue;
            double actualValue;
            decimal[] EstimatedHours = new decimal[6];

            EstimatedHours[0] = JobRecords.EstimatedHours(PID)[0]; //Project managment hours
            EstimatedHours[1] = JobRecords.EstimatedHours(PID)[1]; //Tool design
            EstimatedHours[2] = JobRecords.EstimatedHours(PID)[2]; // Tool build
            EstimatedHours[3] = JobRecords.EstimatedHours(PID)[3];//Automation
            EstimatedHours[4] = JobRecords.EstimatedHours(PID)[4]; //ISIR_Qualification

            EstimatedHoursChart.Series["EstimatedHoursSeries"].Points.DataBindY(EstimatedHours);
            EstimatedHours[5] = EstimatedHours[0] + EstimatedHours[1] + EstimatedHours[2] + EstimatedHours[3] + EstimatedHours[4];

            LabelPMEstimated.Text = String.Format("{0:0.00}", EstimatedHours[0]) + " hrs : " + String.Format("{0:0%}", ((EstimatedHours[0] / EstimatedHours[5])));
            LabelTDEstimated.Text = String.Format("{0:0.00}", EstimatedHours[1]) + " hrs : " + String.Format("{0:0%}", ((EstimatedHours[1] / EstimatedHours[5])));
            LabelTBEstimated.Text = String.Format("{0:0.00}", EstimatedHours[2]) + " hrs : " + String.Format("{0:0%}", ((EstimatedHours[2] / EstimatedHours[5])));
            LabelAutomationEstimated.Text = String.Format("{0:0.00}", EstimatedHours[3]) + " hrs : " + String.Format("{0:0%}", ((EstimatedHours[3] / EstimatedHours[5])));
            LabelISIREstimated.Text = String.Format("{0:0.00}", EstimatedHours[4]) + " hrs : " + String.Format("{0:0%}", ((EstimatedHours[4] / EstimatedHours[5])));
            LabelTotHoursEstimated.Text = String.Format("{0:0.00}", EstimatedHours[5]) + " hrs";

            actualValue = THours[5];
            estimatedValue = (double)EstimatedHours[5];

            if (actualValue > estimatedValue)
        {
            LabelTotHours.BackColor= System.Drawing.Color.Red;
           
            LabelTotHours.ForeColor = System.Drawing.Color.White;
            LabelAlert.Visible = true;
        }
            else { LabelTotHours.BackColor = System.Drawing.Color.Transparent; LabelTotHours.ForeColor = System.Drawing.Color.Maroon; LabelAlert.Visible = false; }
        }
        catch (DivideByZeroException) { }

       
        
        
    }

    

    protected void ButtonCrystalReport_Click(object sender, EventArgs e)
    {

        try
        {
            string ReportParameter = Session["ReportParameter"].ToString();
            string exportPath = Server.MapPath("~/report/tempReport/ProjectSummary.pdf"); //where file will be exported
            ReportDocument crReportDocument = new ReportDocument();

            if (this.gvProjectDetail.SelectedRow.Cells[1].Text == "NEXPLANAR")
            {
                crReportDocument.Load(Server.MapPath("~/report/NEXPLANAR_Summary.rpt"));
                //crReportDocument.SetParameterValue("P_PID", ReportParameter);
                crReportDocument.ExportToDisk(ExportFormatType.PortableDocFormat, exportPath);

                Response.Redirect("~/report/tempReport/ProjectSummary.pdf");

            }
            else
            {
                crReportDocument.Load(Server.MapPath("~/report/TrackerProjSummary.rpt"));
                crReportDocument.SetParameterValue("P_PID", ReportParameter);
                crReportDocument.ExportToDisk(ExportFormatType.PortableDocFormat, exportPath);

                Response.Redirect("~/report/tempReport/ProjectSummary.pdf");
            }
    
            
        }
        catch (NullReferenceException)
        { }
    }


    protected void gvProjectDetail_PageIndexChanged(object sender, EventArgs e)
    {
        clearTextBoxes(); 

    }

    private void clearTextBoxes()
    {
        LabelPM.Text = "";
        LabelTD.Text = "";
        LabelTB.Text = "";
        LabelAutomation.Text = "";
        LabelISIR.Text = "";
        LabelTotHours.Text = "";

        LabelPMEstimated.Text = "";
        LabelTDEstimated.Text = "";
        LabelTBEstimated.Text = "";
        LabelAutomationEstimated.Text = "";
        LabelISIREstimated.Text = "";
        LabelTotHoursEstimated.Text = "";
        LabelTotHours.BackColor = System.Drawing.Color.Transparent;
        LabelTotHours.ForeColor = System.Drawing.Color.Maroon;
        LabelAlert.Visible = false;
    }



    protected void GotoJobDetail_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/manager/job_display_manager.aspx");
    }
    protected void GotoPOInfo_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/manager/po_details_manager.aspx");
    }


    protected void ButtonCrystalReportProjectSummary_Click(object sender, EventArgs e)
    {
        try
        {
            //string ReportParameter = Session["ReportParameter"].ToString();
            string exportPath = Server.MapPath("~/report/tempReport/AllProjectSummary.pdf"); //where file will be exported
            ReportDocument crReportDocument = new ReportDocument();


            crReportDocument.Load(Server.MapPath("~/report/AllProjectSummary.rpt"));
            //crReportDocument.SetParameterValue("P_PID", ReportParameter);
            crReportDocument.ExportToDisk(ExportFormatType.PortableDocFormat, exportPath);

            Response.Redirect("~/report/tempReport/AllProjectSummary.pdf");


        }
        catch (NullReferenceException)
        { }
    }

    #endregion 

    #region -- Existing Tools Code --


    protected void gvProductionTool_SelectedIndexChanged(object sender, EventArgs e)
    {
        try
        {
            string PID = this.gvProductionTool.SelectedRow.Cells[1].Text;
            Session["JobNum"] = PID;
            Session["ReportParameterProduction"] = PID;
            //Response.Write(Session["JobNum"].ToString());

            //For Hours Chart
            double[] THours = new double[6];
            //string[] xHoursName = {"Project Management","Tool Design","Tool Build","Automation","ISIR & Qualification","Total"};

            THours[0] = JobRecords.GetProductionTotalHours(PID)[0] + JobRecords.GetProductionTotalHours(PID)[1]; // FOR PM
            THours[1] = JobRecords.GetProductionTotalHours(PID)[2] + JobRecords.GetProductionTotalHours(PID)[3]; // FOR TOOL DESIGNER
            THours[2] = JobRecords.GetProductionTotalHours(PID)[4]; // FOR TOOL BUILD
            THours[3] = JobRecords.GetProductionTotalHours(PID)[10] + JobRecords.GetProductionTotalHours(PID)[11] + JobRecords.GetProductionTotalHours(PID)[12];// FOR Automation
            THours[4] = JobRecords.GetProductionTotalHours(PID)[5] + JobRecords.GetProductionTotalHours(PID)[6] + JobRecords.GetProductionTotalHours(PID)[7]
                        + JobRecords.GetProductionTotalHours(PID)[8] + JobRecords.GetProductionTotalHours(PID)[9];// FOR ISIR_QUAL_AUTO_PROC

            ProductionHourChart.Series["ProductionHourSeries"].Points.DataBindY(THours);
            THours[5] = THours[0] + THours[1] + THours[2] + THours[3] + THours[4];


            LabelPMProduction.Text = String.Format("{0:0.00}", THours[0]) + " hrs : " + String.Format("{0:0%}", ((THours[0] / THours[5])));
            LabelTDProduction.Text = String.Format("{0:0.00}", THours[1]) + " hrs : " + String.Format("{0:0%}", ((THours[1] / THours[5])));
            LabelTBProduction.Text = String.Format("{0:0.00}", THours[2]) + " hrs : " + String.Format("{0:0%}", ((THours[2] / THours[5])));
            LabelAutomationProduction.Text = String.Format("{0:0.00}", THours[3]) + " hrs : " + String.Format("{0:0%}", ((THours[3] / THours[5])));
            LabelISIRProduction.Text = String.Format("{0:0.00}", THours[4]) + " hrs : " + String.Format("{0:0%}", ((THours[4] / THours[5])));
            LabelTotHoursProduction.Text = String.Format("{0:0.00}", THours[5]) + " hrs";
        }
        catch (FormatException) { }
    }

    protected void ButtonSearch_Click(object sender, EventArgs e)
    {

    }
    protected void ButtonPOProduction_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/manager/po_details_production.aspx");
    }

    protected void RadioButtonListToolType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonListToolType.SelectedIndex == 0)
        {
            Session["SelectionState"] = 0;
        }
        else
        {
            Session["SelectionState"] = 1;
        }
    }


    #endregion





    protected void ButtonProductionDisplayReport_Click(object sender, EventArgs e)
    {

        try
        {
            string ReportParameterProduction = Session["ReportParameterProduction"].ToString();
            string exportPath = Server.MapPath("~/report/tempReport/ProductionJobSummary.pdf"); //where file will be exported
            ReportDocument crReportDocument = new ReportDocument();


            crReportDocument.Load(Server.MapPath("~/report/ProductionJobSummary.rpt"));
            crReportDocument.SetParameterValue("P_PID", ReportParameterProduction);
            crReportDocument.ExportToDisk(ExportFormatType.PortableDocFormat, exportPath);

            Response.Redirect("~/report/tempReport/ProductionJobSummary.pdf");


        }
        catch (NullReferenceException)
        { }
        
        
    }
}