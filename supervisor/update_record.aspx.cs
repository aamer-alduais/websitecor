using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JobTableAdapters;
public partial class Default2 : System.Web.UI.Page
{
    
    protected string employeeName;
    protected void Page_Init(object sender, EventArgs e)
    {
        try
        {
            string empname = Session["EmpName"].ToString();
            Master.SetLabel = empname;
            this.employeeName = empname;
            Session["RecordDate"] = "";
            

        }
        catch (NullReferenceException) { }

    }

 





    
    protected void ButtonCustomDisplay_Click(object sender, EventArgs e)
    {
        try
        {
            LabelDateError.Text = "";

            DateTime sdate = DateTime.Parse(TextBoxDate.Text);
            string RecordDate = sdate.ToString("yyyy-MM-dd");
            HiddenFieldDate.Value = RecordDate;

            //Response.Write(Session["UserID"]);
            //Response.Write("<br>" + RecordDate);

        }
        catch (System.FormatException)
        {
            LabelDateError.Text = "Please enter the date";
        }
       

    }

    protected void clearTextFields()
    {
       
        TextBoxDate.Text = "";
       
       

    }
    






    protected void DropDownListEmpIDName_SelectedIndexChanged(object sender, EventArgs e)
    {
    
        LabelErrors.Text = "";
        TextBoxDate.Text = "";

        Session["RecordDate"] = "";
       
        int UID = int.Parse(DropDownListEmpIDName.SelectedValue);
        Session["UserID"] = UID;

        Session["UserRoleID"] = AppUsers.GetUserRoleIDByUserID(UID);
       // Response.Write("UserID:" + Session["UserRoleID"]);

        
        
        
    }







    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["UserID"] = "";

        }
    }
    
}
