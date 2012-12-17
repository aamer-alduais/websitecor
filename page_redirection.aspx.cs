using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class page_redirection : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string plant = Session["UserPlant"].ToString();

        if (plant == "HOP")
        {
            Response.Redirect("~/time_sheet.aspx");
        }
        else if (plant == "QRO")
        {
            Response.Redirect("~/time_sheet_o.aspx");
        }
        else if (plant == "JRZ")
        {
            Response.Redirect("~/time_sheet_v.aspx");
        }
        else if (plant == "Manager-JRZ")
        {
            Response.Redirect("~/time_sheet_v.aspx");
        }
        else if (plant == "Manager-QRO")
        {
            Response.Redirect("~/time_sheet_o.aspx");
        }

        else
        { 
            Response.Redirect("~/time_sheet.aspx");
        }


    }
}
