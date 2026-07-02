using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class myorderlist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UserInfofloraherbals"] != null)
        {
            HttpCookie userCookie = Request.Cookies["UserInfofloraherbals"];

            string userId = userCookie["UserID"];
            string userName = userCookie["UserName"];
            Session["UserId"] = userCookie["UserID"];

        }
        if (!IsPostBack)
        {
            BindOrders();
        }
    }

    private void BindOrders()
    {
        SqlConnection con = new SqlConnection(@"Data Source=mssql2019.adnshost.com,1633; Database=distacart; User id=distacart; password=Future@2575;Max Pool Size=50000");

        SqlDataAdapter da = new SqlDataAdapter(
            "SELECT * FROM Orders WHERE UserID=@UserID ORDER BY OrderID DESC", con);

        da.SelectCommand.Parameters.AddWithValue("@UserID", Session["UserId"]);

        DataTable dt = new DataTable();
        da.Fill(dt);

        lvOrders.DataSource = dt;
        lvOrders.DataBind();
    }
}