using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Master : System.Web.UI.MasterPage
{
    


    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Header.DataBind();    
    }

    public string SetLabel 
    {

        get
        {

            return LabelMasterEmpName.Text;

        }

        set
        {

            LabelMasterEmpName.Text = value;

        }



    }

   

   
}
