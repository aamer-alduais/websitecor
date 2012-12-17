using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.IO;
using OfficeOpenXml;
using OfficeOpenXml.ConditionalFormatting;
using OfficeOpenXml.Style;
using OfficeOpenXml.DataValidation;
using OfficeOpenXml.DataValidation.Contracts;

/// <summary>
/// Summary description for ExcelHelper
/// </summary>
public class ExcelHelperEPPlus
{
    public static void ExportPmPartQuoteReportToExcel(HttpResponse response, DataTable table)
    {
        ExcelPackage pck = new ExcelPackage();
        var ws = pck.Workbook.Worksheets.Add("PM Part Quote");
        int totalRows = table.Rows.Count+1;

        // apply styles
        using (var range = ws.Cells[1, 1, totalRows, table.Columns.Count])
        {
            range.Style.Font.SetFromFont(new Font("Arial", 10));
            range.LoadFromDataTable(table, true); // load from table
        }


        // autofit columns
        using (var range = ws.Cells[2, 1, table.Rows.Count, table.Columns.Count])
        {
            range.AutoFitColumns(5);
        }
    

        // first row (header) style
        ws.AddHeaderStyle(table.Columns.Count);

        // column style currency custom format
        ws.Column(3).Style.Numberformat.Format = "_($* #,##0.00000_);_($* (#,##0.00000);_($* \" - \"??_);_(@_)";
        ws.Column(9).Style.Numberformat.Format = "_($* #,##0.00000_);_($* (#,##0.00000);_($* \" - \"??_);_(@_)";

        // conditional formating
        // part unit price
        ws.AddConditionalBackgroudColor(new ExcelAddress("C2:C" + totalRows), "IF( AND(C2 <= I2 *1.6,C2 > I2 *1.5),1,0)", Color.Orange);
        ws.AddConditionalBackgroudColor(new ExcelAddress("C2:C" + totalRows), "IF(C2 <= I2 *1.5 ,1,0)", Color.Red);
        // cycle time
        ws.AddConditionalBackgroudColor(new ExcelAddress("E2:E" + totalRows), "IF(D2 > E2,1,0)", Color.Green);
        ws.AddConditionalBackgroudColor(new ExcelAddress("E2:E" + totalRows), "IF(D2 < E2,1,0)", Color.Red);



        // additional columns (Price Margin)
        using (var range = ws.Cells[1, 15, 1, 15])
        {
            range.Value = "Price Margin";
        }
        using (var range = ws.Cells[2, 15, totalRows, 15])
        {
            range.Formula = "IF(ISERROR((C2 - I2)/I2),\" - \",(C2 - I2)/I2)";
            range.Style.Numberformat.Format = "0.00%";
        }
        ws.AddConditionalBackgroudColor(new ExcelAddress("O2:O" + totalRows), "IF( AND(C2 <= I2 *1.6,C2 > I2 *1.5),1,0)", Color.Orange);
        ws.AddConditionalBackgroudColor(new ExcelAddress("O2:O" + totalRows), "IF(C2 <= I2 *1.5 ,1,0)", Color.Red);

        ws.Cells["A1:O1"].AutoFilter = true;

        // write to response
        pck.SaveAs(response.OutputStream);
        response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

        // NOTE: must enable content disposition on the server otherwise it will give error while generating sheet.
        //response.AddHeader("content-disposition", "attachment;  filename=Sample1.xlsx");

        response.Flush();
        response.End();
    }


    public static void LoadExcelFile(string filePath)
    {
        if (!File.Exists(filePath))
        {
            return; // show error?
        }

        FileInfo existingFile = new FileInfo(filePath);
        

        using ( ExcelPackage package = new ExcelPackage(existingFile))
        {
            ExcelWorksheet worksheet = package.Workbook.Worksheets[3];
            string name = (string) worksheet.Cells["N44"].Value;
            double value = Convert.ToDouble(package.Workbook.Worksheets[3].Cells["N45"].Value);
           

        } // the using statement automatically calls Dispose() which closes the package.


    }

    #region - Temp -
    public static void Test1(HttpResponse response)
    {
        ExcelPackage pck = new ExcelPackage();
        var ws = pck.Workbook.Worksheets.Add("Sample1");

        ws.Cells["A1"].Value = "Sample 1";
        ws.Cells["A1"].Style.Font.Bold = true;
        var shape = ws.Drawings.AddShape("Shape1", eShapeStyle.Rect);
        shape.SetPosition(50, 200);
        shape.SetSize(200, 100);
        shape.Text = "Sample 1 saves to the Response.OutputStream";


        pck.SaveAs(response.OutputStream);
        response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
        //response.AddHeader("content-disposition", "attachment;  filename=Sample1.xlsx");

        response.Flush();
        response.End();
    }
    #endregion - Temp -
}

public static class ExcelWorksheetExtensions
{
    /// <summary>
    /// Add conditional background color to the cells
    /// </summary>
    /// <param name="worksheet">The work sheet</param>
    /// <param name="address">The address range of the cells to add conditional color formating to.</param>
    /// <param name="formula">The formula</param>
    /// <param name="color">The background color</param>
    public static void AddConditionalBackgroudColor(this ExcelWorksheet worksheet , ExcelAddress address, string formula, Color color)
    {
        var condition4 = worksheet.ConditionalFormatting.AddExpression(address);
        condition4.Style.Fill.PatternType = OfficeOpenXml.Style.ExcelFillStyle.Solid;
        condition4.Style.Fill.BackgroundColor.Color =color;
        condition4.Formula = formula;
    }

    public static void AddHeaderStyle(this ExcelWorksheet worksheet, int columnCount)
    {
        worksheet.View.FreezePanes(2, 1);// freeze first row
        worksheet.Row(1).Style.Font.Bold = true;
        worksheet.Row(1).Style.TextRotation = 45;
        worksheet.Row(1).Style.Font.Color.SetColor(System.Drawing.Color.LightBlue);
        worksheet.Row(1).Style.Fill.PatternType = ExcelFillStyle.Solid;
        worksheet.Row(1).Style.Fill.BackgroundColor.SetColor(System.Drawing.Color.DarkBlue);
        worksheet.Row(1).Style.Border.BorderAround(ExcelBorderStyle.Thin, System.Drawing.Color.LightBlue);
        using (var range = worksheet.Cells[1, 1, 1, columnCount])
        {
            range.Style.Border.Left.Style = ExcelBorderStyle.Thin;
            range.Style.Border.Left.Color.SetColor(Color.LightBlue);
            range.Style.Border.Right.Style = ExcelBorderStyle.Thin;
            range.Style.Border.Right.Color.SetColor(Color.LightBlue);
        }
    }
}
