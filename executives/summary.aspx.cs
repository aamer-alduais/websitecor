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
using System.Data;
using System.IO;
using JobTableAdapters;

public partial class manager_summary : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        Master.SetLabel = UserSession.Instance.UserInfo.DisplayName; // Session["EmpName"].ToString();
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

        if (IsPostBack && !string.IsNullOrEmpty(UserSession.Instance.ProjectInfo.ProjectId))
        {
            this.TextBoxSearch.Text = UserSession.Instance.ProjectInfo.ProjectId;
            UpdateProjectDetails(UserSession.Instance.ProjectInfo.ProjectId);
            UpdateQuoteNumberLinks(UserSession.Instance.ProjectInfo.ProjectId);
        }
    }


    #region   - NEW TOOL -  
    
    protected void gvProjectDetail_SelectedIndexChanged(object sender, EventArgs e)
    {
        clearTextBoxes(); 
 
        UserSession.Instance.ProjectInfo.ProjectId = this.gvProjectDetail.SelectedRow.Cells[1].Text; 
        UserSession.Instance.ProjectInfo.CustomerName = this.gvProjectDetail.SelectedRow.Cells[2].Text;
        UserSession.Instance.ProjectInfo.PossibleRevenue = double.Parse(this.gvProjectDetail.SelectedRow.Cells[3].Text);
        UserSession.Instance.ProjectInfo.RevenueToDate= double.Parse(this.gvProjectDetail.SelectedRow.Cells[4].Text);
        UserSession.Instance.ProjectInfo.ProjectCost = double.Parse(this.gvProjectDetail.SelectedRow.Cells[5].Text);
        
        // obsolete (user UserSession)
        //Session["ReportParameter"] = PID;

        // update selected project details.
        UpdateProjectDetails(UserSession.Instance.ProjectInfo.ProjectId);
        UpdateQuoteNumberLinks(UserSession.Instance.ProjectInfo.ProjectId);
      
    }

    private void UpdateQuoteNumberLinks(string projectId)
    {
        if (string.IsNullOrEmpty(projectId))
        {
            return;
        }

        string quoteNumber = "22781B";// ProjectTable.GetTTPartNumber(projectId);
 
        foreach (string quoteLink in ProjectTable.LookUpAvailableQuoteFiles(quoteNumber))
        {
            LinkButton link = new LinkButton() { Text = quoteLink };
            link.Click += link_Click;
            QuoteLinkPlaceHolder.Controls.Add(link);
            QuoteLinkPlaceHolder.Controls.Add(new Label() { Text = ",&nbsp;&nbsp;&nbsp;&nbsp;" });
        }
    }

    void link_Click(object sender, EventArgs e)
    {
        if (sender is LinkButton)
        {
            string quoteFile = ((LinkButton)sender).Text;
            FileHelper.CopyFileToResponseStream( Path.Combine(Settings.QuoteFolderPath, quoteFile) );
        }
       
    }

    private void UpdateProjectDetails(string projectId)
    {
        //For Project Bar Chart
        double TPR = UserSession.Instance.ProjectInfo.PossibleRevenue;// double.Parse(this.gvProjectDetail.SelectedRow.Cells[3].Text);
        double TRD = UserSession.Instance.ProjectInfo.RevenueToDate;// double.Parse(this.gvProjectDetail.SelectedRow.Cells[4].Text);
        double TPC = UserSession.Instance.ProjectInfo.ProjectCost;// double.Parse(this.gvProjectDetail.SelectedRow.Cells[5].Text);
        double Leftover = TPR - TRD;

        double[] yBarSeriesTPR = { TPR };
        double[] yBarSeriesTRD = { TRD };
        double[] yBarSeriesTPC = { TPC };
        string[] xBarValues = { "Tot. Possible Rev.", "Tot. Rev.To Date", "Tot. Proj Cost" };
        RevChartBar.Series["BarSeriesTPR"].Points.DataBindY(yBarSeriesTPR);
        RevChartBar.Series["BarSeriesTRD"].Points.DataBindY(yBarSeriesTRD);
        RevChartBar.Series["BarSeriesTPC"].Points.DataBindY(yBarSeriesTPC);

        if (TPR == TRD)
        {
            TPR = 0;
        }


        //For Project Cost Chart
        double[] yValues = { Leftover, TRD };
        //string[] xValues = { "Remaining Revenue", "Total Revenue To Date" };
        RevChart.Series["RevenueSeries"].Points.DataBindY(yValues);


        //For Hours Chart
        double[] THours = new double[6];
        //string[] xHoursName = {"Project Management","Tool Design","Tool Build","Automation","ISIR & Qualification","Total"};

        THours[0] = JobRecords.GetTotalHours(projectId)[0] + JobRecords.GetTotalHours(projectId)[1]; // FOR PM
        THours[1] = JobRecords.GetTotalHours(projectId)[2] + JobRecords.GetTotalHours(projectId)[3]; // FOR TOOL DESIGNER
        THours[2] = JobRecords.GetTotalHours(projectId)[4]; // FOR TOOL BUILD
        THours[3] = JobRecords.GetTotalHours(projectId)[10] + JobRecords.GetTotalHours(projectId)[11] + JobRecords.GetTotalHours(projectId)[12];// FOR Automation
        THours[4] = JobRecords.GetTotalHours(projectId)[5] + JobRecords.GetTotalHours(projectId)[6] + JobRecords.GetTotalHours(projectId)[7]
                    + JobRecords.GetTotalHours(projectId)[8] + JobRecords.GetTotalHours(projectId)[9];// FOR ISIR_QUAL_AUTO_PROC

        HoursChart.Series["HoursSeries"].Points.DataBindY(THours);
        THours[5] = THours[0] + THours[1] + THours[2] + THours[3] + THours[4];


        LabelPM.Text = String.Format("{0:0.00}", THours[0]) + " hrs : " + String.Format("{0:0%}", ((THours[0] / THours[5])));
        LabelTD.Text = String.Format("{0:0.00}", THours[1]) + " hrs : " + String.Format("{0:0%}", ((THours[1] / THours[5])));
        LabelTB.Text = String.Format("{0:0.00}", THours[2]) + " hrs : " + String.Format("{0:0%}", ((THours[2] / THours[5])));
        LabelAutomation.Text = String.Format("{0:0.00}", THours[3]) + " hrs : " + String.Format("{0:0%}", ((THours[3] / THours[5])));
        LabelISIR.Text = String.Format("{0:0.00}", THours[4]) + " hrs : " + String.Format("{0:0%}", ((THours[4] / THours[5])));
        LabelTotHours.Text = String.Format("{0:0.00}", THours[5]) + " hrs";



        try
        {
            double estimatedValue;
            double actualValue;
            decimal[] EstimatedHours = new decimal[6];

            EstimatedHours[0] = JobRecords.EstimatedHours(projectId)[0]; //Project managment hours
            EstimatedHours[1] = JobRecords.EstimatedHours(projectId)[1]; //Tool design
            EstimatedHours[2] = JobRecords.EstimatedHours(projectId)[2]; // Tool build
            EstimatedHours[3] = JobRecords.EstimatedHours(projectId)[3];//Automation
            EstimatedHours[4] = JobRecords.EstimatedHours(projectId)[4]; //ISIR_Qualification

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
                LabelTotHours.BackColor = System.Drawing.Color.Red;

                LabelTotHours.ForeColor = System.Drawing.Color.White;
                LabelAlert.Visible = true;
            }
            else
            {
                LabelTotHours.BackColor = System.Drawing.Color.Transparent;
                LabelTotHours.ForeColor = System.Drawing.Color.Maroon;
                LabelAlert.Visible = false;
            }
        }
        catch (DivideByZeroException) { }
    }

    protected void ButtonCrystalReport_Click(object sender, EventArgs e)
    {
        try
        {
            string ReportParameter = UserSession.Instance.ProjectInfo.ProjectId;// Session["ReportParameter"].ToString();
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

  

    protected void GotoJobDetail_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/executives/job_display.aspx");
    }
    protected void GotoPOInfo_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/executives/po_details.aspx");
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

    protected void ButtonCombinedLabor_Click(object sender, EventArgs e)
{
    try
    {
        LabelDateError.Text = "";
        

        DateTime sdate = DateTime.Parse(TextBoxStartDate.Text);
        DateTime edate = DateTime.Parse(TextBoxEndDate.Text);
        if (sdate > edate)
        {
            LabelDateError.Text = "Start Date cannot be less then End Date";
        }

        else
        {
            string StartDate = sdate.ToString("yyyy-MM-dd");
            string EndDate = edate.ToString("yyyy-MM-dd");
       
            //string ReportParameter = Session["ReportParameter"].ToString();
            string exportPath = Server.MapPath("~/report/tempReport/Combined_Labor.xls"); //where file will be exported
            ReportDocument crReportDocument = new ReportDocument();


            crReportDocument.Load(Server.MapPath("~/report/EmployeeHoursReport.rpt"));
            crReportDocument.SetParameterValue("StartDate", StartDate);
            crReportDocument.SetParameterValue("EndDate", EndDate);
       
            crReportDocument.ExportToDisk(ExportFormatType.Excel, exportPath);
            LabelDateError.Text = "";
            Response.Redirect("~/report/tempReport/Combined_Labor.xls");
        }

    }
    catch (NullReferenceException)
    { }
}

    protected void gvProjectDetail_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if (double.Parse(e.Row.Cells[5].Text) > double.Parse(e.Row.Cells[3].Text))
            {
                e.Row.Cells[5].Font.Bold = true;
                e.Row.Cells[5].ForeColor = System.Drawing.Color.White;
                e.Row.Cells[5].BackColor = System.Drawing.Color.Red;
            }
        }

    }

    #endregion - NEW TOOL -

    #region - PRODUCTION TOOL -
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

    protected void ButtonPOProduction_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/executives/po_details_production.aspx");
    }

    protected void RadioButtonListToolType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(RadioButtonListToolType.SelectedIndex ==0)
        {
            Session["SelectionState"] = 0;
        }
        else
        {
            Session["SelectionState"] = 1;
        }
    }
    
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

    protected void ButtonProductionCombinedSummary_Click(object sender, EventArgs e)
    {

        try
        {
            LabelDateErrorProduction.Text = "";
        

        DateTime sdate = DateTime.Parse(TextBoxStartDateProduction.Text);
        DateTime edate = DateTime.Parse(TextBoxEndDateProduction.Text);
        if (sdate > edate)
        {
            LabelDateErrorProduction.Text = "Start Date cannot be less then End Date";
        }

        else
        {
            string StartDate = sdate.ToString("yyyy-MM-dd");
            string EndDate = edate.ToString("yyyy-MM-dd");

            //string ReportParameter = Session["ReportParameter"].ToString();
            string exportPath = Server.MapPath("~/report/tempReport/Production_Combined_Labor.xls"); //where file will be exported
            ReportDocument crReportDocument = new ReportDocument();


            crReportDocument.Load(Server.MapPath("~/report/ProductionEmployeeHoursReport.rpt"));
            crReportDocument.SetParameterValue("StartDate", StartDate);
            crReportDocument.SetParameterValue("EndDate", EndDate);
            crReportDocument.ExportToDisk(ExportFormatType.Excel, exportPath);
            LabelDateErrorProduction.Text = "";
            Response.Redirect("~/report/tempReport/Production_Combined_Labor.xls");
        }

        }
        catch (NullReferenceException)
        { }
    }

    protected void btnProdToolsCost_Click(object sender, EventArgs e)
    {
        VarianceReportProdToolTableAdapter vProdRepAdapater = new VarianceReportProdToolTableAdapter();
        Job.VarianceReportProdToolDataTable dt;

        dt = vProdRepAdapater.GetData();

        ExportDataSetToExcel(dt, "VarianceReport.xls");
    }

    #endregion #region - PRODUCTION TOOL -
    
    protected void ButtonVarianceReportRetrieve_Click(object sender, EventArgs e)
    {

        VarianceReportTableAdapter vRepAdapter = new VarianceReportTableAdapter();
        Job.VarianceReportDataTable dt;


        if(RadioButtonListVarianceReportOptions.SelectedIndex==0)
        {
            dt = vRepAdapter.GetDataByStatus("Active");
        }
        else if (RadioButtonListVarianceReportOptions.SelectedIndex == 1)
        {
            dt = vRepAdapter.GetDataByStatus("InActive");
        }
        else 
        {
            dt = vRepAdapter.GetAllData();
        }

//MIF
        DataRow dr;

        dr = dt.NewVarianceReportRow();
        dr[0] = "";
        dr[4] = 0;
        dr[5] = 0;
        dr[6] = 0;
        dr[7] = 0;

        dt.Rows.Add(dr);

//MIF

        ExportDataSetToExcel(dt, "VarianceReport.xls");
        
        //string attachment = "attachment; filename=VarianceReport.xls";
        
        //Response.ClearContent();
        //Response.AddHeader("content-disposition", attachment);
        //Response.ContentType = "application/vnd.ms-excel";
        //Response.Charset = "";

        //Response.Write("<HTML>");
        ////Response.Write("<HEAD><STYLE>.HDR {font-weight:bold }</STYLE></HEAD>");

        //Response.Write("<BODY><TABLE>");

        //string tab = "";
        //foreach (DataColumn dc in dt.Columns)
        //{
        //    Response.Write("<TD><b>");
        //    Response.Write(tab + dc.ColumnName);
        //    tab = "\t";
        //    Response.Write("</b></TD>");
        //}

        //Response.Write("\n");

        //int i;

        //foreach (DataRow dr in dt.Rows)
        //{
        //    tab = "";
        //    for (i = 0; i < dt.Columns.Count; i++)
        //    {
        //        //Response.Write("<TR><TD>");
        //        Response.Write(tab + dr[i].ToString());
        //        tab = "\t";
        //        //Response.Write("</TD></TR>");
        //    }

        //    Response.Write("\n");
        //}
        //Response.Write("</TABLE></BODY></HTML>");
        //Response.End();
    }

    protected void ExportDataSetToExcel(System.Data.DataTable table, string filename)
    {
     
        System.Web.HttpResponse response = Page.Response;
        Response.Cache.SetExpires(DateTime.Now.AddSeconds(1));
        Response.Cache.SetCacheability(HttpCacheability.NoCache);

        // first let's clean up the response.object 
        Response.Clear();
        Response.ClearContent();
        Response.Charset = "";
        Response.ContentEncoding = System.Text.Encoding.Default;
        this.EnableViewState = false;

        // set the response mime type for excel 
        response.ContentType = "application/vnd.xls";
        response.ContentEncoding = System.Text.Encoding.Default;
        response.AddHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");

        // create a string writer 
        using (System.IO.StringWriter sw = new System.IO.StringWriter())
        {
            using (HtmlTextWriter htw = new HtmlTextWriter(sw))
            {

                htw.RenderBeginTag(HtmlTextWriterTag.Link);
                htw.RenderEndTag();


                // instantiate a datagrid 
                DataGrid dg = new DataGrid();
                dg.GridLines = GridLines.Both;
                dg.CaptionAlign = TableCaptionAlign.Left;
                dg.Font.Size = 10;
                dg.HeaderStyle.Font.Bold = true;
                dg.HeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#92D050");
                dg.BackColor = System.Drawing.Color.Transparent;
                dg.ItemStyle.Width = 100;
                dg.ItemStyle.Wrap = true;
                dg.DataSource = table;
                dg.DataBind();

                
                decimal TotalPossibleRev = 0;   //MIF
                decimal TotalRevToDate   = 0;   //MIF
                decimal TotalCost        = 0;   //MIF

                string strTotalPossibleRev;
                string strTotalRevToDate;
                string strTotalCost;
       
                if (RadioButtonListToolType.SelectedIndex != 1)
                {
                    for (int i = 0; i < dg.Items.Count; i++)
                    {
                        if (dg.Items[i].Cells[9].Text.IndexOf("-") == -1)
                        {
                            dg.Items[i].Cells[9].BackColor = System.Drawing.Color.Red;

                        }

                        if (decimal.Parse(dg.Items[i].Cells[6].Text) > decimal.Parse(dg.Items[i].Cells[4].Text))
                        {
                            dg.Items[i].Cells[6].BackColor = System.Drawing.Color.Red;

                        }
//MIF
                        if (decimal.Parse(dg.Items[i].Cells[7].Text) < -1)
                        {
                            dg.Items[i].Cells[7].BackColor = System.Drawing.Color.Pink;
                        }

                        TotalPossibleRev += decimal.Parse(dg.Items[i].Cells[4].Text);           //MIF
                        TotalRevToDate   += decimal.Parse(dg.Items[i].Cells[5].Text);           //MIF
                        TotalCost        += decimal.Parse(dg.Items[i].Cells[6].Text);           //MIF
//MIF
                        
                    }

//MIF
                    strTotalPossibleRev = String.Format("{0:C}", TotalPossibleRev);
                    strTotalRevToDate   = String.Format("{0:C}", TotalRevToDate);
                    strTotalCost        = String.Format("{0:C}", TotalCost);

                    //dg.Items[dg.Items.Count - 1].Cells[4].Text = TotalPossibleRev.ToString();
                    //dg.Items[dg.Items.Count - 1].Cells[5].Text = TotalRevToDate.ToString();
                    //dg.Items[dg.Items.Count - 1].Cells[6].Text = TotalCost.ToString();

                    dg.Items[dg.Items.Count - 1].Cells[4].Text = strTotalPossibleRev;
                    dg.Items[dg.Items.Count - 1].Cells[5].Text = strTotalRevToDate;
                    dg.Items[dg.Items.Count - 1].Cells[6].Text = strTotalCost;
                    dg.Items[dg.Items.Count - 1].Cells[7].Text = "";

//MIF
                }
                

                dg.RenderControl(htw);
                response.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }
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
}