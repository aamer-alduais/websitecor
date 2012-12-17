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

public partial class password_change : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        try
        {
            string empname = Session["EmpName"].ToString();
            Master.SetLabel = empname;
            
        }
        catch (NullReferenceException) { }

    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ChangePasswordWizard_ContinueButtonClick(object sender, EventArgs e)
    {
        Response.Redirect("~/default.aspx");
    }
    protected void ChangePasswordWizard_CancelButtonClick(object sender, EventArgs e)
    {
        Response.Redirect("~/default.aspx");
    }
}
