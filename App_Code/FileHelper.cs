using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

/// <summary>
/// Summary description for FileHelper
/// </summary>
public static class FileHelper
{
	public static void CopyFileToResponseStream(string filepath)
    {
        if (File.Exists(filepath))
        {
            string fileName = Path.GetFileName(filepath);
            HttpContext.Current.Response.AddHeader("content-disposition", "attachment;filename=" + fileName);
            HttpContext.Current.Response.AddHeader("Content-Length", new FileInfo(filepath).Length.ToString());
            //HttpContext.Current.Response.ContentType = "application/vnd.xls";
            HttpContext.Current.Response.Charset = "";
            HttpContext.Current.Response.TransmitFile(filepath);
        }
        {
            HttpContext.Current.Response.Write("File doesn't exist");
        }
    }
}