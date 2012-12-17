using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.IO;
using NPOI.HSSF.UserModel;
using NPOI.HSSF.Util;


/// <summary>
/// Summary description for ExcelHelperNPOI
/// </summary>
public class ExcelHelperNPOI
{
    public static void LoadExcelFile(string filePath)
    {
        if (!File.Exists(filePath))
        {
            return; // show error?
        }

        using(FileStream fs = File.Open(filePath,FileMode.Open,FileAccess.Read) )
        {
            HSSFWorkbook workbook = new HSSFWorkbook(fs, true);
            HSSFSheet worksheet = (HSSFSheet) workbook.GetSheet("Quote Entry");

            var name = worksheet.GetRow(43).Cells[13].StringCellValue;
            var val = worksheet.GetRow(44).Cells[13].NumericCellValue;

            
        }



    }
}