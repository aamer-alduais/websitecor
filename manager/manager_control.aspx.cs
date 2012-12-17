using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class manager_manager_control : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                string empname = Session["EmpName"].ToString();
                Master.SetLabel = empname;               
            }
            catch (NullReferenceException) { }
        }

        string plant = Session["UserPlant"].ToString();
        if (plant == "Manager-QRO" || plant == "Manager-JRZ")
        {
            ButtonRedirectHOP.Visible = false;
        }
        else
        {
            ButtonRedirectHOP.Visible = true;
        }
    }
    protected void ButtonRedirectHOP_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/manager/employee_record_view.aspx");
    }
    protected void ButtonRedirectJRZ_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/manager/mexico/jrz/employee_record_view.aspx");
    }
    protected void ButtonRedirectQRO_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/manager/mexico/qro/employee_record_view.aspx");
    }
}
