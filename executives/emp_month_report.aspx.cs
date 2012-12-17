using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class executives_emp_month_report : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        try
        {
            string empname = Session["EmpName"].ToString();
            Master.SetLabel = empname;


        }
        catch (NullReferenceException)
        { }
    }
    protected void btnRunQuery_Click(object sender, EventArgs e)
    {
        //ExportDataSetToExcel();
    }

    protected void btnExportQuery_Click(object sender, EventArgs e)
    {
        JobTableAdapters.EmployeeTimeRecord1TableAdapter pmEmployeeTimeRecordTableAdapter = new JobTableAdapters.EmployeeTimeRecord1TableAdapter();
        Job.EmployeeTimeRecord1DataTable pmEmployeeTimeRecordDataTable;

        if (txtStartDate.Text != "" && txtEndDate.Text != "")
        {
            pmEmployeeTimeRecordDataTable = pmEmployeeTimeRecordTableAdapter.GetByStartEndDateOnly((string)txtStartDate.Text, (string)txtEndDate.Text);
            ExportDataSetToExcel(pmEmployeeTimeRecordDataTable, "EmployeeTimeRecordReport.xls");
        }
    }

    public void ExportDataSetToExcel(System.Data.DataTable table, string filename)
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


                //for (int i = 0; i < dg.Items.Count; i++)
                //{
                //    if (dg.Items[i].Cells[9].Text.IndexOf("-") == -1)
                //    {
                //        dg.Items[i].Cells[9].BackColor = System.Drawing.Color.Red;

                //    }

                //    if (decimal.Parse(dg.Items[i].Cells[6].Text) > decimal.Parse(dg.Items[i].Cells[4].Text))
                //    {
                //        dg.Items[i].Cells[6].BackColor = System.Drawing.Color.Red;

                //    }


                //}


                dg.RenderControl(htw);
                response.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }
    }
}