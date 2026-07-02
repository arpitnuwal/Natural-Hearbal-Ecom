using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LogOut : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        try
        {
            if (Request.Cookies["UserInfofloraherbals"] != null)
            {
                HttpCookie userCookie = new HttpCookie("UserInfofloraherbals");
                userCookie.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(userCookie);
            }

            Session.Clear();
            Session.Abandon();

          
            Response.Redirect("Index.aspx");
        }



        catch (Exception ex)
        {
            throw ex;
        }
    }
}