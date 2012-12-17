using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;

using JobTableAdapters;

public class AppUsers
{
    //Textbox Description return
    public static string textBoxIntializer(string JobNum)
    {
        try
        {
            string result = "";

            JobInfoTableAdapter jiAdapter = new JobInfoTableAdapter();
            Job.JobInfoDataTable InfoDataTable;

            InfoDataTable = jiAdapter.GetJobDescriptionByJobNum(JobNum);

            foreach (Job.JobInfoRow dataRow in InfoDataTable)
            {
                result = dataRow.PARTDESCRIPTION;
            }
            return result;
        }
        catch(SqlException) {
            return "Error Connecting Database";
        }
    }

    

    //Return General Tasks List
    public static Job.GenTaskDataTable GenTasks()
    {
        GenTaskTableAdapter GenTaskAdapter = new GenTaskTableAdapter();
        Job.GenTaskDataTable GenTaskDataTable;
        return GenTaskDataTable = GenTaskAdapter.GetData();     
     }

    //Return Maintenance Tasks List
    public static Job.MaintenanceTaskDataTable MaintenanceTasks()
    {
        MaintenanceTaskTableAdapter MaintenanceTaskAdapter = new MaintenanceTaskTableAdapter();
        Job.MaintenanceTaskDataTable MaintenanceTaskDataTable;
        return MaintenanceTaskDataTable = MaintenanceTaskAdapter.GetData();
    }
    
    //Return General Tasks List
    public static Job.GenTaskDataTable GenTasksManualEntry()
    {
        GenTaskTableAdapter GenTaskAdapter = new GenTaskTableAdapter();
        Job.GenTaskDataTable GenTaskDataTable;
        return GenTaskDataTable = GenTaskAdapter.GetDataForManualEntry();
    }
    //Return Job Tasks List
    public static Job.JobTaskDataTable JobTasks(int RoleID)
    {
        JobTaskTableAdapter JobTaskAdapter = new JobTaskTableAdapter();
        Job.JobTaskDataTable JobTaskDataTable;
        return JobTaskDataTable = JobTaskAdapter.GetData(RoleID); ///1 has to be changed to proper logic based on user roles
    }

    //This is for mexico plant
    public static Job.JobTaskDataTable JobTasks()
    {
        JobTaskTableAdapter JobTaskAdapter = new JobTaskTableAdapter();
        Job.JobTaskDataTable JobTaskDataTable;
        return JobTaskDataTable = JobTaskAdapter.GetDataForMexico(); ///1 has to be changed to proper logic based on user roles
    }
/*
    //Return Employee Job Summary -Overloaded Method by StartDate, EndDate, EmpName FOR CUSTOM DATE
    public static Job.EmployeeTimeRecordDataTable EmployeeTimeRecords(string StartDate, string EndDate, string EmpName)
    {
        Job.EmployeeTimeRecordDataTable EmployeeDataTable;
        EmployeeTimeRecordTableAdapter EmployeeTimeAdapater = new EmployeeTimeRecordTableAdapter();

        return EmployeeDataTable = EmployeeTimeAdapater.GetByStartEndDate(StartDate, EndDate, EmpName);
    }
    
    //Return Employee Job Summary - Overloaded Method by StartDate, EndDate, EmpName, JobNumber FOR CUSTOM DATE
    public static Job.EmployeeTimeRecordDataTable EmployeeTimeRecords(string StartDate, string EndDate, string EmpName,string JobNum)
    {
        Job.EmployeeTimeRecordDataTable EmployeeDataTable;
        EmployeeTimeRecordTableAdapter EmployeeTimeAdapater = new EmployeeTimeRecordTableAdapter();

        return EmployeeDataTable = EmployeeTimeAdapater.GetByStartEndJob(StartDate, EndDate, EmpName,JobNum);
    }

    //Return Employee Job Summary - Overloaded Method by StartDate, EndDate, EmpName, JobNumber FOR DAILY WEEKLY
    public static Job.EmployeeTimeRecordDataTable EmployeeTimeRecordsDateOnly(string Date,string EmpName, string JobNum)
    {
        Job.EmployeeTimeRecordDataTable EmployeeDataTable;
        EmployeeTimeRecordTableAdapter EmployeeTimeAdapater = new EmployeeTimeRecordTableAdapter();

        return EmployeeDataTable = EmployeeTimeAdapater.GetDataByDateJob(Date, EmpName, JobNum);
    }

    //Return Employee Job Summary - Overloaded Method by Date, EmpName FOR DAILY WEEKLY
    public static Job.EmployeeTimeRecordDataTable EmployeeTimeRecordsDateOnly(string Date, string EmpName)
    {
        
        Job.EmployeeTimeRecordDataTable EmployeeDataTable;
        EmployeeTimeRecordTableAdapter EmployeeTimeAdapater = new EmployeeTimeRecordTableAdapter();

        
        EmployeeDataTable = EmployeeTimeAdapater.GetByDateOnly(Date, EmpName);
        return EmployeeDataTable;
    }

*/
    //Retrun Employee Login Name

    public static string GetUserName(string login)
    {
        
        UsersTableAdapter userAdapter = new UsersTableAdapter();
        return login = userAdapter.GetUserName(login);
    }


    //Retrun Employee Password

    public static string GetUserPassword(string password)
    {

        UsersTableAdapter userAdapter = new UsersTableAdapter();
        return password = userAdapter.GetPassword(password);
    }

     //Retrun Employee Role Name
    public static string GetUserRole(string login)
    {
        try
        {
            string role;
            UsersTableAdapter userAdapter = new UsersTableAdapter();
            return role = userAdapter.GetUserRole(login).ToString();
        }
        catch (InvalidOperationException)
        { 
            return  "";
        }
    }

    //Get User Role By Employeer/UserID
    public static string GetUserRoleByID(int UserID)
    {
        try
        {
            string role;
            UsersTableAdapter userAdapter = new UsersTableAdapter();
            return role = userAdapter.GetUserRoleByUserID(UserID).ToString();
        }
        catch (InvalidOperationException)
        {
            return "";
        }
    }
    
    //Get User Plant by Login
    public static string GetUserPlant(string login)
    {
        try
        {
            string plant;
            UsersTableAdapter userAdapter = new UsersTableAdapter();
            return plant = userAdapter.GetUserPlant(login).ToString();
        }
        catch (InvalidOperationException)
        {
            return "";
        }
    }

    //Retrun Employee Role ID
    public static int GetUserRoleID(string login)
    {
        try
        {
            int roleID;
            UsersTableAdapter userAdapter = new UsersTableAdapter();
            return roleID = (int)userAdapter.GetRoleID(login);
        }
        catch (InvalidOperationException)
        {
            return 0;
        }
    }

    //Return Employee Role ID with User ID as input
    public static int GetUserRoleIDByUserID(int UID)
    {
        try
        {
            int roleID;
            UsersTableAdapter userAdapter = new UsersTableAdapter();
            return roleID = (int)userAdapter.GetRoleIDbyUserID(UID);
        }
        catch (InvalidOperationException)
        {
            return 0;
        }
    }

    //Get User ID based on username for TimeSheet
    public static int GetUserID(string username)
    {
        UsersTableAdapter uAdapter = new UsersTableAdapter();

        return (int)uAdapter.GetUserIDByLoginName(username);

    }

    //Give User Name based on User ID FOR Employee Summary
    public static string GetEmpName(int UID)
    {
        EmployeeTimeRecordTableAdapter etrAdapater = new EmployeeTimeRecordTableAdapter();

        return etrAdapater.GetEmpNameByUserID(UID);
    }
}
