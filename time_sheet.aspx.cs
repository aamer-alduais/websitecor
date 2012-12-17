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

    protected string employeeName;


    protected void Page_Init(object sender, EventArgs e)
    {
        try
        {
            string empname = Session["EmpName"].ToString();
            Master.SetLabel = empname;
            this.employeeName = empname;
            LabelEmpName.Text = empname;
        }
        catch (NullReferenceException) { }



    }


    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {




            Session["RecordInserted"] = true;
            tasksDropDownInitializer();
            pageInitializer();

        }
    }

    private void tasksDropDownInitializer()
    {
        int RoleID = (int)Session["RoleID"];
        if (RadioButtonListTaskType.SelectedIndex == 0)
        {

            DropDownListTaskType.DataSource = AppUsers.GenTasks();
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
        string JobNum = DropDownListJobNumber.SelectedValue;
        //Response.Write(JobRecords.GetProjectID(JobNum));
        //Response.Write(JobRecords.GetProjectID(DropDownListJobNumber.SelectedItem.Text));
        
        
        HiddenFieldProjectID.Value = JobRecords.GetProjectID(DropDownListJobNumber.SelectedValue);
        //Response.Write(HiddenFieldProjectID.Value);
        //Response.Write(DropDownListJobNumber.SelectedValue.ToString());

    }

    protected void RadioButtonListTaskType_SelectedIndexChanged(object sender, EventArgs e)
    {
        tasksDropDownInitializer();
    }
    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        int UserID = AppUsers.GetUserID(Session["Username"].ToString());
        string RoleName = Session["EmpRole"].ToString();
        string PID = HiddenFieldProjectID.Value;
        HiddenJobDescription.Value = TextBoxJobDescription.Text;

        DateTime dateOfWork = DateTime.Parse(TextBoxDate.Text);
        HiddenJobDate.Value = dateOfWork.ToString("yyyy-MM-dd");

        DateTime currentDate = DateTime.Today;

        DateTime weekly = currentDate.Add(new TimeSpan(-7, 0, 0, 0));
        //Response.Write(weekly);

        if (dateOfWork == DateTime.Today || dateOfWork > weekly)
        {
            if ((bool)(Session["RecordInserted"]) == true)
            {
                try
                {
                    EmployeeTimeRecordTableAdapter etrAdapter = new EmployeeTimeRecordTableAdapter();
                    EmployeeTimeRecord_LogTableAdapter etrLogAdapter = new EmployeeTimeRecord_LogTableAdapter();
                    
                    string JobNum;
                    if (DropDownListJobNumber.Text == "--SELECT--" || DropDownListJobNumber.Text =="")
                    {
                        JobNum = "Non_Job";
                    }
                    else if (DropDownListJobNumber.Text == "--SELECT--" || DropDownListJobNumber.Text == "")
                    {
                        JobNum = "Non_Job";
                    }
                    else
                    {
                        JobNum = DropDownListJobNumber.SelectedValue;
                    }
                    string JobDescription = HiddenJobDescription.Value;
                    string TaskType = DropDownListTaskType.SelectedValue;
                    string Date = HiddenJobDate.Value;
                    int Hours = Convert.ToInt32(TextBoxHours.Text);
                    int Minutes = Convert.ToInt32(TextBoxMinutes.Text);
                    string Comments = TextBoxComments.Text;

                    etrAdapter.InsertRecord(PID, UserID, this.employeeName, RoleName, JobNum, JobDescription, TaskType, Date, Hours, Minutes, Comments);
                    etrLogAdapter.Insert (PID,UserID,this.employeeName,JobNum,Date,this.User.Identity.Name);
                    
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
        else
        {
            LabelRecordError.Text = "Only a week previous dates allowed from current date.";
        }
    }
}
