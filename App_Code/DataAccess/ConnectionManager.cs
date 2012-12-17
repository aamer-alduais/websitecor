using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;


public class ConnectionManager
{
    

    public static SqlConnection GetEpicorDatabase()
    {

        string connectionString = ConfigurationManager.ConnectionStrings["EpicorSQLServer"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        connection.Open();
        return connection;

        
    }

    //ODBC Connection to SQL Server Database
    public static SqlConnection GetSQLDatabase() 
    {

        string connectionString = ConfigurationManager.ConnectionStrings["SQLServerDatabase"].ConnectionString;
        SqlConnection connection = new SqlConnection(connectionString);

        connection.Open();
        return connection;

        
    }
}
