using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class verselect : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        try
        {

            Page.Title = "Select Tracker Version";


        }
        catch (NullReferenceException) { }



    }
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button_vOld_Redirect_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://gaia/tracker_archive");
    }
    protected void Button_Epicor9_Redirect_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/default.aspx");
    }
}
