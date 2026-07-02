using System;
using System.Web.UI;

public partial class Admin_AdminMasterPage : System.Web.UI.MasterPage
{
    protected string CurrentPage = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        // Login page par redirect loop na bane
        string currentUrl = Request.Url.AbsolutePath.ToLower();

        if (Session["AdminID"] == null &&
            !currentUrl.Contains("login.aspx"))
        {
            Response.Redirect("~/Admin/Login.aspx");
            return;
        }

        CurrentPage = System.IO.Path
            .GetFileName(Request.Url.AbsolutePath)
            .ToLower();
    }

    protected string ActiveClass(string pageName)
    {
        return CurrentPage == pageName.ToLower()
            ? "nav-link-item active"
            : "nav-link-item";
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();

        Response.Redirect("~/Admin/Login.aspx");
    }
}