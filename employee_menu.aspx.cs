using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employee_menu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string empname = Session["EmpName"].ToString();
            Master.SetLabel = empname;
        }
        catch (NullReferenceException)
        { }
        
    }
}
