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
            Response.Redirect("~/manager/employee_record_view.aspx");
        }
        else if (plant == "QRO")
        {
            Response.Redirect("~/manager/mexico/qro/employee_record_view.aspx");
        }
        else if (plant == "ALL")
        {
            Response.Redirect("~/manager/manager_control.aspx");
        }
        else if (plant == "Manager-QRO" || plant == "Manager-JRZ")
        {
            Response.Redirect("~/manager/manager_control.aspx");
        } 
        else
        {
            Response.Redirect("~/manager/mexico/jrz/employee_record_view.aspx");
        }

    }
}
