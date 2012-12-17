using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security ;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security;
using System.Globalization;
using System.Threading;



public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    
    protected void LoginMain_Authenticate(object sender, AuthenticateEventArgs e)
    {
        string username = LoginMain.UserName;  // "minou.hussain"
        string password = LoginMain.Password;  // "AL1696eem";     
               
        if (Membership.ValidateUser(username,password))
        {
            
            TextInfo empname = CultureInfo.CurrentCulture.TextInfo;

            FormsAuthenticationTicket fat = new FormsAuthenticationTicket(
                                                1, username, DateTime.Now,DateTime.Now.AddMinutes(20), false,"",                                                FormsAuthentication.FormsCookiePath);
            Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, FormsAuthentication.Encrypt(fat)));
            Session["EmpName"]=((empname.ToTitleCase(username)).Replace("."," ")); //Converting name to Title Case
            Session["EmpRole"] = GetUserRole(username);
            Session["Username"] = username;
            Session["RoleID"] = GetRoleID(username);
            Session["UserPlant"] = GetUserPlant(username);

            UserSession.Instance.UserInfo.DisplayName = ((empname.ToTitleCase(username)).Replace(".", " ")); //Converting name to Title Case
            UserSession.Instance.UserInfo.UserName = username;
            UserSession.Instance.UserInfo.EmployeeRole = GetUserRole(username);
            UserSession.Instance.UserInfo.RoleID = GetRoleID(username);
            UserSession.Instance.UserInfo.UserPlant = GetUserPlant(username);

            FormsAuthentication.RedirectFromLoginPage(LoginMain.UserName, false);

        }
        
    }

    private string GetUserRole(string username)
    {
        return AppUsers.GetUserRole(username);
    }
    
    private string GetUserPlant(string username)
    {
        return AppUsers.GetUserPlant(username);
    }

    private int GetRoleID(string username)
    {
        return AppUsers.GetUserRoleID(username);
    }

   
}
