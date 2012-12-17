using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;



public partial class executives_PMPartQuote : System.Web.UI.Page
{
    #region Constants
    public const int PARTS_PER_HOUR_INDEX = 11;
    public const int PARTS_PER_HOUR_QUOTED_INDEX = 12;

    #endregion Constants

    #region Initialization
    protected void Page_Load(object sender, EventArgs e)
    {

        /*
                JobTableAdapters.PMPartQuoteTableAdapter pmPartQuoteAdapter = new JobTableAdapters.PMPartQuoteTableAdapter();
                Job.PMPartQuoteDataTable pmPartQuoteTable;

                pmPartQuoteTable = pmPartQuoteAdapter.GetData();

                foreach (DataRow theRow in pmPartQuoteTable.Rows)
                {
                    lsPartNumber.Add((string)theRow["part"]);
                }
        */
        /*
                JobTableAdapters.PMPartQuoteTableAdapter pmPartQuoteAdapter = new JobTableAdapters.PMPartQuoteTableAdapter();
                Job.PMPartQuoteDataTable pmPartQuoteTable;
        
                pmPartQuoteTable = pmPartQuoteAdapter.GetData();

                foreach (DataRow theRow in pmPartQuoteTable.Rows)
                {
                    PartNumberListBox.Items.Add((string)theRow["part"]);
                }
        */

        // initialize controls
        if (!IsPostBack)
        {
            chkShowAllPartsDetails.Checked = true;
            chkShowSelectedPartDetails.Checked = false;
            ShowSelectedPartsDetailsControls(false);
        }
    }

    #endregion Initialization
  
    #region - Page Control Events -

    protected void txtPartNumber_TextChanged(object sender, EventArgs e)
    {
        string str = txtPartNumber.Text;

        int index = PartNumberListBox.Items.IndexOf(PartNumberListBox.Items.FindByText(str));
        this.PartNumberListBox.SelectedIndex = index;
    }
    
    protected void PartNumberListBox_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtPartNumber.Text = PartNumberListBox.SelectedValue;
    }
    
    protected void PMPartQuoteButton_Click(object sender, EventArgs e)
    {
 
        JobTableAdapters.PMPartQuoteTableAdapter pmPartQuoteAdapter = new JobTableAdapters.PMPartQuoteTableAdapter();
        Job.PMPartQuoteDataTable pmPartQuoteTable;

        pmPartQuoteTable = pmPartQuoteAdapter.GetData();
        /*
                DataRow dr1 = pmPartQuoteTable.NewPMPartQuoteRow();
                pmPartQuoteTable.Rows.Add(dr1);
 
                DataRow dr = pmPartQuoteTable.NewRow();
                pmPartQuoteTable.Rows.Add(dr);

        */

        RemoveExtraColumns(pmPartQuoteTable, new string[] { 
            "RunnerWeight(Lbs)",
            "ResourceLaborRate",
            "ResourseBurdenRate",
            "SPH",
            "StdLabor_Avg",
            "StdLabor_Sum",
            "ActProdHours_Avg",
            "ActProdHours_Sum",
            "EstProdHours_Sum",
            "EstProdHours_Avg",
            "ActLabCost_Avg",
            "ActLabCost_Sum",
            "MaxRegring%",
            "Qty/Parent",
            "StartDate",
            "EndDate"
        });

        //ExportDataSetToExcel(pmPartQuoteTable, "PMPartQuoteReport.xls");
 
        //testing
        this.EnableViewState = false;
        ExcelHelperEPPlus.ExportPmPartQuoteReportToExcel(Page.Response, pmPartQuoteTable);

        //ExcelHelperNPOI.LoadExcelFile(@"c:\temp\23276D.xls"); //Server.MapPath(@"~\ExcelFiles\23276D.xlsx"));
    }

    protected void chkShowSelectedPartDetails_CheckedChanged(object sender, EventArgs e)
    {
        ShowSelectedPartsDetailsControls(chkShowSelectedPartDetails.Checked);
    }     

    protected void chkShowAllPartsDetails_CheckedChanged(object sender, EventArgs e)
    {
        PMPartQuoteAllGridView.Visible = chkShowAllPartsDetails.Checked;
    }

    protected void PMPartQuoteAllGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            ChangeCellColorforRowDataBound(e.Row);
        }
    }

    protected void PartNumberGridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            ChangeCellColorforRowDataBound(e.Row);
        }
    }
    #endregion - Page Control Events -

    #region - Private Methods -

    [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
    public static string[] GetCompletionList(string prefixText, int count, string contextKey)
    {
        List<string> lsPartNumber = new List<string>();

        JobTableAdapters.PMPartQuoteTableAdapter pmPartQuoteAdapter = new JobTableAdapters.PMPartQuoteTableAdapter();
        Job.PMPartQuoteDataTable pmPartQuoteTable;

        pmPartQuoteTable = pmPartQuoteAdapter.GetPartNumber();

        foreach (DataRow theRow in pmPartQuoteTable.Rows)
        {
            lsPartNumber.Add((string)theRow["part"]);
        }

        // Return matching movies
        return (from m in lsPartNumber where m.StartsWith(prefixText, StringComparison.CurrentCultureIgnoreCase) select m).Take(count).ToArray();


        //        return default(string[]);
    }

    /// <summary>
    /// Remove Extra columns
    /// </summary>
    /// <param name="table">Data table</param>
    /// <param name="columnNames">column names of the columns to be removed.</param>
    private void RemoveExtraColumns(System.Data.DataTable table, string[] columnNames)
    {
        foreach (string columnName in columnNames)
        {
            table.Columns.Remove(columnName);
        }
    }


    /// <summary>
    /// Change Cell Color for the row
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="row"></param>
    private void ChangeCellColorforRowDataBound(GridViewRow row)
    {
        // unit price
        if ( double.Parse(row.Cells[2].Text) <=double.Parse(row.Cells[11].Text)* 1.6)
        {
            row.Cells[2].Font.Bold = true;
            row.Cells[2].ForeColor = System.Drawing.Color.White;
            row.Cells[2].BackColor = System.Drawing.Color.Orange;
            row.Cells[2].ToolTip = "within 160% of " + row.Cells[11].Text;
        }
        if ( double.Parse(row.Cells[2].Text) <= double.Parse(row.Cells[11].Text) * 1.5)
        {
            row.Cells[2].Font.Bold = true;
            row.Cells[2].ForeColor = System.Drawing.Color.White;
            row.Cells[2].BackColor = System.Drawing.Color.Red;
            row.Cells[2].ToolTip = "within 150% of " + row.Cells[11].Text;
        }

        // cycle time
        if (double.Parse(row.Cells[3].Text) > double.Parse(row.Cells[4].Text))
        {
            row.Cells[4].Font.Bold = true;
            row.Cells[4].ForeColor = System.Drawing.Color.White;
            row.Cells[4].BackColor = System.Drawing.Color.Green;
        }

        if (double.Parse(row.Cells[3].Text) < double.Parse(row.Cells[4].Text))
        {
            row.Cells[4].Font.Bold = true;
            row.Cells[4].ForeColor = System.Drawing.Color.White;
            row.Cells[4].BackColor = System.Drawing.Color.Red;
        }


        // PPH vs PPH Quoted
        //if (double.Parse(row.Cells[15].Text) > double.Parse(row.Cells[16].Text))
        //{
        //    row.Cells[15].Font.Bold = true;
        //    row.Cells[15].ForeColor = System.Drawing.Color.White;
        //    row.Cells[15].BackColor = System.Drawing.Color.Green;
        //}

        //if (double.Parse(row.Cells[15].Text) < double.Parse(row.Cells[16].Text))
        //{
        //    row.Cells[15].Font.Bold = true;
        //    row.Cells[15].ForeColor = System.Drawing.Color.White;
        //    row.Cells[15].BackColor = System.Drawing.Color.Red;
        //}
    }

    /// <summary>
    /// Change Cell Color for the row
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="row"></param>
    private void FormatCells(GridViewRow row)
    {
        row.Cells[0].Width = 55;

        // unit price
        if (double.Parse(row.Cells[2].Text) <= double.Parse(row.Cells[8].Text) * 1.6)
        {
            row.Cells[2].Font.Bold = true;
            row.Cells[2].ForeColor = System.Drawing.Color.White;
            row.Cells[2].BackColor = System.Drawing.Color.Orange;
            row.Cells[2].ToolTip = "within 160% of " + row.Cells[11].Text;
        }
        if (double.Parse(row.Cells[2].Text) <= double.Parse(row.Cells[8].Text) * 1.5)
        {
            row.Cells[2].Font.Bold = true;
            row.Cells[2].ForeColor = System.Drawing.Color.White;
            row.Cells[2].BackColor = System.Drawing.Color.Red;
            row.Cells[2].ToolTip = "within 150% of " + row.Cells[11].Text;
        }

        // cycle time
        if (double.Parse(row.Cells[3].Text) > double.Parse(row.Cells[4].Text))
        {
            row.Cells[4].Font.Bold = true;
            row.Cells[4].ForeColor = System.Drawing.Color.White;
            row.Cells[4].BackColor = System.Drawing.Color.Green;
        }

        if (double.Parse(row.Cells[3].Text) < double.Parse(row.Cells[4].Text))
        {
            row.Cells[4].Font.Bold = true;
            row.Cells[4].ForeColor = System.Drawing.Color.White;
            row.Cells[4].BackColor = System.Drawing.Color.Red;
        }


        // PPH vs PPH Quoted
        //if (double.Parse(row.Cells[11].Text) > double.Parse(row.Cells[12].Text))
        //{
        //    row.Cells[11].Font.Bold = true;
        //    row.Cells[11].ForeColor = System.Drawing.Color.White;
        //    row.Cells[11].BackColor = System.Drawing.Color.Green;
        //}

        //if (double.Parse(row.Cells[11].Text) < double.Parse(row.Cells[12].Text))
        //{
        //    row.Cells[11].Font.Bold = true;
        //    row.Cells[11].ForeColor = System.Drawing.Color.White;
        //    row.Cells[11].BackColor = System.Drawing.Color.Red;
        //}
    }


    /// <summary>
    /// Export the data table to excel file response stream.
    /// </summary>
    /// <param name="table">The data table to export.</param>
    /// <param name="filename">The file name associated with the response stream.</param>
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
                GridView dg = new GridView();
                dg.GridLines = GridLines.Both;
                dg.CaptionAlign = TableCaptionAlign.Left;
                dg.Font.Size = 10;
                dg.HeaderStyle.Font.Bold = true;
                dg.HeaderStyle.BackColor = System.Drawing.ColorTranslator.FromHtml("#92D050");
                dg.BackColor = System.Drawing.Color.Transparent;
                //dg.ItemStyle.Width = 100;
                //dg.ItemStyle.Wrap = true;
                dg.DataSource = table;
                dg.DataBind();
                for (int i = 0; i < dg.Rows.Count; i++)
                {
                    FormatCells(dg.Rows[i]);
                }
                dg.RenderControl(htw);
                response.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }
    }


    /// <summary>
    /// Show or hide the selected parts details related controls
    /// </summary>
    /// <param name="show">Flag indicating if the controls should show or not.</param>
    private void ShowSelectedPartsDetailsControls(bool show)
    {
        PartNumberGridView.Visible = chkShowSelectedPartDetails.Checked;
        PartNumberListBox.Visible = chkShowSelectedPartDetails.Checked;
        txtPartNumber.Visible = chkShowSelectedPartDetails.Checked;
        lblEnterPartNumber.Visible = chkShowSelectedPartDetails.Checked;
        lblSelectPartNumber.Visible = chkShowSelectedPartDetails.Checked;
    }
  
    #endregion - Private Methods -

 
}