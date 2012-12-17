using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.IO;

using JobTableAdapters;

public class ProjectTable
{
    //Get Project by Id
    public static Job.ProjectDataTable GetProjectById(string projectId)
    {
        ProjectTableAdapter adapter = new ProjectTableAdapter();
        return adapter.GetProjectBy(projectId);
    }

    public static string GetTTPartQuoteNumber(string projectId)
    {
         Job.ProjectDataTable table = GetProjectById(projectId);
         if(table.Rows.Count > 0 )
         {
             return ((Job.ProjectRow)table.Rows[0]).TTQouteNumber;
         }
         return "";
    }

    public static string GetTTPartNumber(string projectId)
    {
        Job.ProjectDataTable table = GetProjectById(projectId);
        if (table.Rows.Count > 0 &&   ((Job.ProjectRow)table.Rows[0]).TTPartNumber != null )
        {
            return ((Job.ProjectRow)table.Rows[0]).TTPartNumber;
        }
        return "";
    }

    public static List<string> LookUpAvailableQuoteFiles(string sQuoteNumber)
    {
        return LookUpAvailableQuoteFiles(new QuoteNumber(sQuoteNumber));
    }

    public static List<string> LookUpAvailableQuoteFiles(QuoteNumber quoteNumber)
    {
        List<string> list = new List<string>();
        if (!string.IsNullOrEmpty(quoteNumber.Number))
        {
            DirectoryInfo directory = new DirectoryInfo(Settings.QuoteFolderPath);
            if (directory.Exists)
            {
                foreach (FileInfo file in directory.GetFiles("*" + quoteNumber.Number + "*.xls"))
                {
                    list.Add(file.Name);
                }
            }
        }
        return list;

    }
}
