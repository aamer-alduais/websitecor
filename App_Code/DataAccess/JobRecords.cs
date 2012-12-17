using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

using JobTableAdapters;

public class JobRecords
{
   

//Return Operation Sequences and Description
    public static Job.OperSeqDataTable GetOperationSequences(string JobNum)
    {
        Job.OperSeqDataTable OperSeqTable;
        OperSeqTableAdapter OprSeqAdapter = new OperSeqTableAdapter();


        return OperSeqTable = OprSeqAdapter.GetDataByJobNum(JobNum);
    }
    
    //Return Job Standards - Prod Standard, SetupCrewSize, ProdCrewSize
    public static Job.JobStandardsDataTable GetOperationStandards(string JobNum, int OprSeq)
    {
        Job.JobStandardsDataTable JobStandardsDataTable;
        JobStandardsTableAdapter jsAdapter = new JobStandardsTableAdapter();


        return JobStandardsDataTable = jsAdapter.GetDataByOperSeqJobNum(JobNum, OprSeq);
    }

    //Get Customer Name
    public static string GetCustomerName(string PID)
    {
        CustomerTableAdapter cAdapter = new CustomerTableAdapter();

        return cAdapter.GetCustNameByPID(PID);
    }

    //Get Customer POs, Dates etc

    public static string[] GetCustomerInformation(string PID)
    { 
        string[] record = new string[6];

        CustomerTableAdapter cAdapater = new CustomerTableAdapter();
        Job.CustomerDataTable CustomerDataTable;

        CustomerDataTable = cAdapater.GetDataByProjectID(PID);

        foreach (Job.CustomerRow dataRows in CustomerDataTable)
        {
            record[0] = dataRows.PONUM.ToString();
            record[1] = dataRows.XPartNum.ToString();
            record[2] = dataRows.PartDescription.ToString();
            record[3] = dataRows.RevisionNum.ToString();
            record[4] = dataRows.TOOLDUEDATE.ToString();
            record[5] = dataRows.PPAPDUEDATE.ToString();

        }

        return record;
    }

    //Get Project ID based on JobNUm for TimeSheet
    public static string GetProjectID(string JobNum)
    {
        JobNumsTableAdapter jAdapter = new JobNumsTableAdapter();
        try
        {
            return jAdapter.GetProjectID(JobNum).ToString();
        }
        catch (NullReferenceException) { return ""; }
    }
    
   
//Return Array of All Hours on different Jobs by Project ID
    public static double[] GetTotalHours(string PID)
    {
        double[] Hours = new double[13];

        TotalHoursLaborTableAdapter thrsAdapter = new TotalHoursLaborTableAdapter();
        Job.TotalHoursLaborDataTable TotalHoursLaborDataTable;

        TotalHoursLaborDataTable = thrsAdapter.GetDataByPID(PID);

        foreach (Job.TotalHoursLaborRow dataRows in TotalHoursLaborDataTable)
            {
                Hours[0] = (double)dataRows.PM_Hours;
                Hours[1] = (double)dataRows.PM_Mins / 60.00;
                //if (Hours[1] > 60.00)
                //{
                //    Hours[1] = Hours[1] / 60.00;
                //}
                Hours[2] = (double)dataRows.TD_Hours;
                Hours[3] = (double)dataRows.TD_Mins / 60.00;
                //if (Hours[3] > 60.00)
                //{
                //    Hours[3] = Hours[3] / 60.00;
                //}
                Hours[4] = (double)dataRows.Total_TB_Hours;

                //this is for ISIR_QUAL_AUTO_PROC 
                Hours[5] = (double)dataRows.ISIR_QUAL_HRLY;
                Hours[6] = (double)dataRows.AQE_Hours;
                Hours[7] = (double)dataRows.AQE_Mins / 60.00;
                //if (Hours[7] > 60.00)
                //{
                //    Hours[7] = Hours[7] / 60.00;
                //}
                Hours[8] = (double)dataRows.Processing_Hours;
                Hours[9] = (double)dataRows.Processing_Mins / 60.00;
                //if (Hours[9] > 60.00)
                //{
                //    Hours[9] = Hours[9] / 60.00;
                //}
                //this is for Automation 
                Hours[10] = (double)dataRows.Auto_Hours_HRLY;
                Hours[11] = (double)dataRows.Auto_Hours_SLRY;
                Hours[12] = (double)dataRows.Auto_Mins_SLRY / 60.00;
                //if (Hours[12] > 60.00)
                //{
                //    Hours[12] = Hours[12] / 60.00;
                //}

            }
        return Hours;
    }


    //Return Array of All Hours on different Jobs by JobNum For Production Tools
    public static double[] GetProductionTotalHours(string PID)
    {
        double[] Hours = new double[13];

        TotalHoursLaborTableAdapter thrsAdapter = new TotalHoursLaborTableAdapter();
        Job.TotalHoursLaborDataTable TotalHoursLaborDataTable;

        TotalHoursLaborDataTable = thrsAdapter.GetDataByJobNum(PID);

        foreach (Job.TotalHoursLaborRow dataRows in TotalHoursLaborDataTable)
        {
            Hours[0] = (double)dataRows.PM_Hours;
            Hours[1] = (double)dataRows.PM_Mins / 60.00;
            //if (Hours[1] > 60.00)
            //{
            //    Hours[1] = Hours[1] / 60.00;
            //}
            Hours[2] = (double)dataRows.TD_Hours;
            Hours[3] = (double)dataRows.TD_Mins / 60.00;
            //if (Hours[3] > 60.00)
            //{
            //    Hours[3] = Hours[3] / 60.00;
            //}
            Hours[4] = (double)dataRows.Total_TB_Hours;

            //this is for ISIR_QUAL_AUTO_PROC 
            Hours[5] = (double)dataRows.ISIR_QUAL_HRLY;
            Hours[6] = (double)dataRows.AQE_Hours;
            Hours[7] = (double)dataRows.AQE_Mins / 60.00;
            //if (Hours[7] > 60.00)
            //{
            //    Hours[7] = Hours[7] / 60.00;
            //}
            Hours[8] = (double)dataRows.Processing_Hours;
            Hours[9] = (double)dataRows.Processing_Mins / 60.00;
            //if (Hours[9] > 60.00)
            //{
            //    Hours[9] = Hours[9] / 60.00;
            //}
            //this is for Automation 
            Hours[10] = (double)dataRows.Auto_Hours_HRLY;
            Hours[11] = (double)dataRows.Auto_Hours_SLRY;
            Hours[12] = (double)dataRows.Auto_Mins_SLRY / 60.00;
            //if (Hours[12] > 60.00)
            //{
            //    Hours[12] = Hours[12] / 60.00;
            //}

        }
        return Hours;
    }


    //Return the Number of Hours by Each Employee
    public static string[] GetEmpHours(int UID, string StartDate, string EndDate)
    {
        

        EmployeeHrsTableAdapter ehrsAdapter = new EmployeeHrsTableAdapter();
        Job.EmployeeHrsDataTable TotalHoursLaborDataTable;

        int RecLen = (int)ehrsAdapter.GetTotRecNum(UID,StartDate,EndDate);
        string[] Hours = new string[2];


        TotalHoursLaborDataTable = ehrsAdapter.GetData(UID, StartDate, EndDate);
        
        foreach (Job.EmployeeHrsRow dataRows in TotalHoursLaborDataTable)
        {
            Hours[0] += dataRows.TaskType + ",";
            Hours[1] += dataRows.Total_Hours + ",";
        }
        return Hours;
    }


    //Return the Number of Hours by Each Employee in  Mexico
    public static string[] GetEmpHoursMexico(int UID, string StartDate, string EndDate)
    {


        EmployeeHrsMexicoTableAdapter ehrsAdapter = new EmployeeHrsMexicoTableAdapter();
        Job.EmployeeHrsMexicoDataTable TotalHoursLaborDataTable;

        int RecLen = (int)ehrsAdapter.GetTotRecNum(UID, StartDate, EndDate);
        string[] Hours = new string[2];


        TotalHoursLaborDataTable = ehrsAdapter.GetData(UID, StartDate, EndDate);

        foreach (Job.EmployeeHrsMexicoRow dataRows in TotalHoursLaborDataTable)
        {
            Hours[0] += dataRows.TaskType + ",";
            Hours[1] += dataRows.Total_Hours + ",";
        }
        return Hours;
    }



    //Return the Row Count For Each Record for Employee Hours
    public static int GetEmpHoursTotRecord(int UID, string StartDate, string EndDate)
    {


        EmployeeHrsTableAdapter ehrsAdapter = new EmployeeHrsTableAdapter();

        return (int)ehrsAdapter.GetTotRecNum(UID, StartDate, EndDate);
        
    }

    //Return Total Vacation Hours of Employees for given period
    public static string GetEmpVacationHours(int UID, string StartDate, string EndDate)
    {


        EmployeeHrsTableAdapter ehrsAdapter = new EmployeeHrsTableAdapter();

        return ehrsAdapter.GetTotalVacationHoursPerPeriod(StartDate, EndDate, UID).ToString();

    }

//Return the Row Count For Each Record for Employee Hours For Mexico
    public static int GetEmpHoursTotRecordMexico(int UID, string StartDate, string EndDate)
    {


        EmployeeHrsMexicoTableAdapter ehrsAdapter = new EmployeeHrsMexicoTableAdapter();

        return (int)ehrsAdapter.GetTotRecNum(UID, StartDate, EndDate);

    }

//Return the Number of Hours by Each Employee
    public static decimal GetEmpTotalHours(string JobNum, string EmpName)
    {


        EmployeeHrsTableAdapter ehrsAdapter = new EmployeeHrsTableAdapter();

        return (decimal)ehrsAdapter.GetTotalHoursByJobNumEmpName(JobNum, EmpName);
         
        
    }

 public static decimal GetEmpTotalHoursForHourly(string EID,string JobNum)
    {


        EmployeeHrsTableAdapter ehrsAdapter = new EmployeeHrsTableAdapter();

        
        return (decimal)ehrsAdapter.GetHourlyEmpHours(EID, JobNum);

        
    }

 //Return the Number of Hours by Each Hourly Employee 
 public static string[] GetIndirectHoursForHourly(string EID, string StartDate, string EndDate)
 {
     string[] Hours = new string[2];
     
     IndirectHoursTableAdapter ihAdapter = new IndirectHoursTableAdapter();
     Job.IndirectHoursDataTable IndirectHoursDataTable;
     
     
     IndirectHoursDataTable = ihAdapter.GetHourlyIndirectHours(EID, StartDate, EndDate);

     foreach (Job.IndirectHoursRow dataRows in IndirectHoursDataTable)
     {
         Hours[0] += dataRows.TotHours.ToString() + ",";
         Hours[1] += dataRows.Description.ToString() + ",";
     }

     return Hours;
 }

 //Return the Number of Hours by Each Job during specific dates
 //public static decimal[] GetJobHours(string StartDate, string EndDate)
 //{
 //    decimal[] Hours = new decimal[1];

 //    CombinedLaborTableAdapter ctAdapter = new CombinedLaborTableAdapter ();
 //    Job.CombinedLaborDataTable CombinedHoursDataTable;


 //    CombinedHoursDataTable = ctAdapter.GetDataByJobHours(StartDate, EndDate);

 //    foreach (Job.CombinedLaborRow dataRows in CombinedHoursDataTable)
 //    {
 //        Hours[0] += dataRows.LABORHRS;
         
 //    }

 //    return Hours;
 //}

 
    public static int GetEmpHoursDataCount(string EID, string StartDate, string EndDate)
 { 
     IndirectHoursCountTableAdapter idcAdapater = new IndirectHoursCountTableAdapter();
     int RecHourlyLen = (int)idcAdapater.GetCountHourlyHours(EID, StartDate, EndDate);
     return RecHourlyLen;
 }



 public static string[] JobHoursForHourly(string EID, string StartDate, string EndDate)
 {
     string[] HoursHourly = new string[2];

     HourlyHoursTableAdapter hAdapter = new HourlyHoursTableAdapter();




        HoursHourly[0] += hAdapter.GetHourlyHoursID(EID, StartDate, EndDate);
        HoursHourly[1] += "JobNum";
    
     return HoursHourly;
    
 }

//Get Estimated Hours into Array
 public static decimal[] EstimatedHours(string PID)
 {
     decimal[] EstimatedHours = new decimal[5];
     
    EstimatedHoursTableAdapter esAdapter = new EstimatedHoursTableAdapter();
    Job.EstimatedHoursDataTable EstimatedHoursDataTable;
    EstimatedHoursDataTable = esAdapter.GetDataByProjectID(PID);


    foreach (Job.EstimatedHoursRow dataRow in EstimatedHoursDataTable)
    {
        EstimatedHours[0] = dataRow.Project_Management;
        EstimatedHours[1] = dataRow.Tool_Design;
        EstimatedHours[2] = dataRow.Tool_Build;
        EstimatedHours[3] = dataRow.Automation;
        EstimatedHours[4] = dataRow.ISIR_Qual;
    }


    return EstimatedHours;
    
 }

//Return Billing/MaterialCost/Estimated hours
 public static double[] GetBillingLaborMaterialCost(string PID)
 {
     double[] values = new double[7];

     DisplayProjectTableAdapter dpAdapter = new DisplayProjectTableAdapter();
     Job.DisplayProjectDataTable DisplayProjectDataTable;

     DisplayProjectDataTable = dpAdapter.GetDataByProjectID(PID);

     foreach (Job.DisplayProjectRow dataRow in DisplayProjectDataTable)
     {
         string[] TransferCost = dataRow.ProjectTransferCost.Split('(');
         string[] USChina =dataRow.USChinaCost.Split('(');
         string[] FreightCost = dataRow.FreightCost.Split('(');

         values[0] = double.Parse(dataRow.BillingAmount);
         values[1] = double.Parse(dataRow.EstimatedHours);
         values[2] = double.Parse(dataRow.EstimatedMaterialCost);
         values[3] = double.Parse(dataRow.SubcontractHours);
         values[4] = double.Parse(TransferCost[0]);
         values[5] = double.Parse(USChina[0]);
         values[6] = double.Parse(FreightCost[0]);
     }

     return values;

 }

}
