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
            
            pageInitializer();
          
        }
    }

    private void tasksDropDownInitializer()
    {
        int RoleID = int.Parse(HiddenUserRoleID.Value);                
        if (RadioButtonListTaskType.SelectedIndex == 0)
        {

            DropDownListTaskType.DataSource = AppUsers.GenTasksManualEntry();
        }
        else
        {
            DropDownListTaskType.DataSource = AppUsers.JobTasks(RoleID);
        }

       
        DropDownListTaskType.DataTextField = "TaskName";
        DropDownListTaskType.DataValueField = "TaskName";
        DropDownListTaskType.DataBind();
    }


    private void pageInitializer()
    {


        TextBoxJobDescription.Text = AppUsers.textBoxIntializer(DropDownListJobNumber.SelectedValue);
    }


    protected void DropDownListJobNumber_SelectedIndexChanged(object sender, EventArgs e)
    {
        pageInitializer();
        //Response.Write(JobRecords.GetProjectID(DropDownListJobNumber.SelectedItem.Text));
        HiddenFieldProjectID.Value = JobRecords.GetProjectID(DropDownListJobNumber.SelectedItem.Text);
        //Response.Write(HiddenFieldProjectID.Value);
      
    }

    protected void RadioButtonListTaskType_SelectedIndexChanged(object sender, EventArgs e)
    {
        tasksDropDownInitializer();
    }
    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        
        
        string PID = HiddenFieldProjectID.Value;
        HiddenJobDescription.Value = TextBoxJobDescription.Text;
        
        DateTime dateOfWork = DateTime.Parse(TextBoxDate.Text);
        HiddenJobDate.Value = dateOfWork.ToString("yyyy-MM-dd");

        
            if ((bool)(Session["RecordInserted"]) == true)
            {
                try
                {
                    EmployeeTimeRecordTableAdapter etrAdapter = new EmployeeTimeRecordTableAdapter();
                    EmployeeTimeRecord_LogTableAdapter etrLogAdapter = new EmployeeTimeRecord_LogTableAdapter();

                    int UserID = int.Parse(HiddenEID.Value);
                    string RoleName = HiddenUserRole.Value;
                    string EmpName = Session["SalaryEmpName"].ToString();
                    string JobNum = DropDownListJobNumber.SelectedValue;
                    string JobDescription = HiddenJobDescription.Value;
                    string TaskType = DropDownListTaskType.SelectedValue;
                    string Date = HiddenJobDate.Value;
                    int Hours = Convert.ToInt32(TextBoxHours.Text);
                    int Minutes = Convert.ToInt32(TextBoxMinutes.Text);
                    string Comments = TextBoxComments.Text;

                    etrAdapter.InsertRecord(PID, UserID, EmpName, RoleName, JobNum, JobDescription, TaskType, Date, Hours, Minutes, Comments);
                    etrLogAdapter.Insert(PID, UserID, EmpName, JobNum, Date, this.User.Identity.Name);
                    
                    
                    Session["RecordInserted"] = false;
                    Response.Redirect("~/employee_menu.aspx");

                }
                catch (NullReferenceException)
                {
                    Response.Write("");
                }
            }
            else
            {
                LabelRecordError.Text = "Record is already submitted";
            }
            
        
       
    }
    protected void DropDownListEmpIDName_SelectedIndexChanged(object sender, EventArgs e)
    {
        int UserID = int.Parse(DropDownListEmpIDName.SelectedValue);
        HiddenUserRole.Value = AppUsers.GetUserRoleByID(UserID);
        HiddenUserRoleID.Value  = AppUsers.GetUserRoleIDByUserID(UserID).ToString();
        HiddenEID.Value = DropDownListEmpIDName.SelectedValue;
        String[] EmpName = DropDownListEmpIDName.SelectedItem.Text.Split(':');
        Session["SalaryEmpName"] = EmpName[1];
        LabelEmpName.Text = EmpName[1];
        tasksDropDownInitializer();
        //Response.Write(Session["SalaryEmpName"] + "    "+ HiddenUserRole.Value+ "    "+HiddenEID.Value);
    }
}
