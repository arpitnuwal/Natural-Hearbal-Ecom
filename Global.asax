<%@ Application Language="C#" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Globalization" %>
<%@ Import Namespace="System.Web.Routing" %>

<script RunAt="server">
    void Application_Start(object sender, EventArgs e)
    {
        RegisterRoutes(RouteTable.Routes);
    }

    static void RegisterRoutes(RouteCollection routes)
    {


        routes.MapPageRoute("view", "{productname}", "~/view.aspx");

   
 
        

    }


    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown
    }
    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs
    }

    void Session_Start(object sender, EventArgs e)
    {
       
        Application.Lock();
        ClsConnection Cnn = new ClsConnection();
        Cnn.Open();
    //    Cnn.ExecuteNonQuery("Update Counter set Count=Count+1");
        Cnn.Close();
        Application.UnLock();

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        //Session.Abandon();
    }

    #region
    public static string[] blackList = { "--", ";--", ";", "/*", "*/", "@@", "@","char","nchar","varchar","nvarchar",
                                       "alter","begin","cast","create","cursor","declare","delete","drop","end","exec","execute",
                                       "fetch","insert","kill","open","table","update","select",
                                       "sysobjects","syscolumns"};

    //The utility method that performs the blacklist comparisons
    //You can change the error handling, and error redirect location to whatever makes sense for your site.
    private void CheckInput(string parameter)
    {
        CompareInfo comparer = CultureInfo.InvariantCulture.CompareInfo;

        for (int i = 0; i < blackList.Length; i++)
        {
            if (comparer.IndexOf(parameter, blackList[i], CompareOptions.IgnoreCase) >= 0)
            {
                //
                //Handle the discovery of suspicious Sql characters here
                //
                //Current...Response.Redirect("~/Error.htm");  //generic error page on your site
            }
        }
    }
    #endregion

    void Application_BeginRequest(object sender, EventArgs e)
    {
        foreach (string key in Request.QueryString)
            CheckInput(Request.QueryString[key]);
        //foreach (string key in Request.Form)
        //CheckInput(Request.Form[key]);
        foreach (string key in Request.Cookies)
            CheckInput(Request.Cookies[key].Value);

        //****************************************************************************************//        
        //if (!Request.Url.Host.StartsWith("www", StringComparison.InvariantCultureIgnoreCase))
        //{
        //    Response.Clear();
        //    Response.AddHeader("Location", String.Format("{0}://{1}{2}", Request.Url.Scheme, "www." + Request.Url.Host, Request.Url.PathAndQuery));
        //    Response.StatusCode = 301;
        //    Response.End();
        //}
        //****************************************************************************************//
    }

    void Application_EndRequest(object sender, EventArgs e)
    {

    }
    
</script>
