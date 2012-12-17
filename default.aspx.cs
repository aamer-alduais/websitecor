using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _default : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
       try
           { Page.Title = Page.Title + Session["EmpName"].ToString()+"!"; 
           }
            catch (NullReferenceException) { }
        
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                string empname = Session["EmpName"].ToString();
                Master.SetLabel = empname;
                LabelGreeting.Text = empname;
                
                
            }
            catch (NullReferenceException) { }
        }
    }

    


    
}
