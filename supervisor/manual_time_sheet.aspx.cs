using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using JobTableAdapters;

public partial class time_sheet : System.Web.UI.Page
{


    protected string EID;

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
        
        
        if (!IsPostBack)
        {

           

            
            Session["RecordInserted"] = true;
            //tasksDropDownInitializer();
            //pageInitializer();
          
        }
    }

    //private void tasksDropDownInitializer()
    //{
                
    //    if (RadioButtonListTaskType.SelectedIndex == 0)
    //    {

    //        DropDownListTaskType.DataSource = AppUsers.GenTasks();
    //    }
    //    else
    //    {
    //        DropDownListTaskType.DataSource = AppUsers.JobTasks();
    //    }

       
    //    DropDownListTaskType.DataTextField = "TaskName";
    //    DropDownListTaskType.DataValueField = "TaskName";
    //    DropDownListTaskType.DataBind();
    //}


    //private void pageInitializer()
    //{


    //    TextBoxJobDescription.Text = AppUsers.textBoxIntializer(DropDownListJobNumber.SelectedValue);
    //}


    protected void DropDownListJobNumber_SelectedIndexChanged(object sender, EventArgs e)
    {
        //pageInitializer();
        //Response.Write(JobRecords.GetProjectID(DropDownListJobNumber.SelectedItem.Text));
        HiddenFieldProjectID.Value = JobRecords.GetProjectID(DropDownListJobNumber.SelectedItem.Text);
        HiddenJobNum.Value = DropDownListJobNumber.SelectedItem.Text;
        //Response.Write(HiddenJobNum.Value + "" +HiddenFieldProjectID.Value );
        //Response.Write(HiddenFieldProjectID.Value);

    }

    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        
        
        string PID = HiddenFieldProjectID.Value;
        string EID = HiddenEID.Value;
        
        DateTime dateOfWork = DateTime.Parse(TextBoxDate.Text);
        HiddenJobDate.Value = dateOfWork.ToString("yyyy-MM-dd");

       
            if ((bool)(Session["RecordInserted"]) == true)
            {
                try
                {
                    JobLaborTableAdapter jAdapter = new JobLaborTableAdapter();
                    
                    string HourlyEmpName = Session["HourlyEmpName"].ToString();
                    string JobNum = HiddenJobNum.Value;
                    DateTime Date = DateTime.Parse(TextBoxDate.Text);
                    decimal ClockInTime = decimal.Parse(TextBoxClockInTime.Text);
                    decimal ClockOutTime = decimal.Parse(TextBoxClockOutTime.Text);

                    jAdapter.Insert(PID, JobNum, EID, Date, ClockInTime, ClockOutTime);
                    

                    
                    
                    Session["RecordInserted"] = false;
                    Response.Redirect("~/employee_menu.aspx");

                }
                catch (NullReferenceException)
                {
                    LabelRecordError.Text ="Record Entry Error: Record not submitted";
                }
            }
            else
            {
                LabelRecordError.Text = "Record is already submitted";
            }
            
        }


    protected void DropDownListEmpIDName_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        HiddenEID.Value  = DropDownListEmpIDName.SelectedValue;
        String[] EmpName = DropDownListEmpIDName.SelectedItem.Text.Split(':');
        Session["HourlyEmpName"] = EmpName[1];
        LabelEmpName.Text = EmpName[1];

        //Response.Write( Session["HourlyEmpName"].ToString());
        //Response.Write(HiddenEID.Value);
    
    
    }
   
}
   
