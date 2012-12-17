using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserSession
/// </summary>
public class UserSession
{
    #region - Singleton -
    private UserSession()
    {
        UserInfo = new UserInfo();
        ProjectInfo = new ProjectInfo();
    }

    public static UserSession Instance
    {
        get
        {
            if (HttpContext.Current.Session["UserSession"] == null)
            {
                HttpContext.Current.Session["UserSession"] = new UserSession();
            }
            return (UserSession) HttpContext.Current.Session["UserSession"];
        }
    }
    #endregion - Singleton -
    
    #region - Properties -

    public UserInfo UserInfo { get; set; }

    public ProjectInfo ProjectInfo { get; set; }

    #endregion - Properties -

}

public class UserInfo
{
    public string UserName{get;set;}
    public string DisplayName {get;set;}
    public string EmployeeRole {get;set;}
    public int RoleID {get;set;}
    public string UserPlant {get;set;}
}

public class ProjectInfo
{
    public string ProjectId { get; set; }
    public string CustomerName { get; set; }
    public double PossibleRevenue { get; set; }
    public double RevenueToDate { get; set; }
    public double ProjectCost { get; set; }

}

public class QuoteInfo
{
    public QuoteInfo(string quoteNumber)
    {

    }
}