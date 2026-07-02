using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class myprofile : System.Web.UI.Page
{
    ClsConnection Cnn = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UserInfofloraherbals"] != null)
        {
            HttpCookie userCookie = Request.Cookies["UserInfofloraherbals"];

            string userId = userCookie["UserID"];
            string userName = userCookie["UserName"];
            Session["UserId"] = userCookie["UserID"];
          
        }
        else
        {
            Response.Redirect("login.aspx");
        }
        if (!IsPostBack)
        {
            userinfo();
        }
    }

    public void userinfo()
    {
        DataTable addt = Cnn.FillTable("select * from [Register] where UserID=" + Session["UserId"] + "", "Detail");
        txtname.Text = addt.Rows[0]["FullName"].ToString();
        txtemail.Text = addt.Rows[0]["Email"].ToString();
        txtmobile.Text = addt.Rows[0]["Mobile"].ToString();
        txtaddress.Text = addt.Rows[0]["Address"].ToString();
        txtcity.Text = addt.Rows[0]["City"].ToString();
        txtstate.Text = addt.Rows[0]["State"].ToString();
        txtpincode.Text = addt.Rows[0]["Pincode"].ToString();
        txtcountry.Text = addt.Rows[0]["Country"].ToString();
        txtcompanyname.Text = addt.Rows[0]["companyname"].ToString();


    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(@"Data Source=mssql2019.adnshost.com,1633; Database=distacart; User id=distacart; password=Future@2575;Max Pool Size=50000");

        string sql = @"UPDATE Register SET
        FullName=@FullName,
        Email=@Email,
        Mobile=@Mobile,
        Address=@Address,
        City=@City,
        State=@State,
        Pincode=@Pincode,
        Country=@Country,
        companyname=@Company
        WHERE UserID=@UserID";

        SqlCommand cmd = new SqlCommand(sql, con);

        cmd.Parameters.AddWithValue("@FullName", txtname.Text.Trim());
        cmd.Parameters.AddWithValue("@Email", txtemail.Text.Trim());
        cmd.Parameters.AddWithValue("@Mobile", txtmobile.Text.Trim());
        cmd.Parameters.AddWithValue("@Address", txtaddress.Text.Trim());
        cmd.Parameters.AddWithValue("@City", txtcity.Text.Trim());
        cmd.Parameters.AddWithValue("@State", txtstate.Text.Trim());
        cmd.Parameters.AddWithValue("@Pincode", txtpincode.Text.Trim());
        cmd.Parameters.AddWithValue("@Country", txtcountry.Text.Trim());
        cmd.Parameters.AddWithValue("@Company", txtcompanyname.Text.Trim());
        cmd.Parameters.AddWithValue("@UserID", Session["UserId"]);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        ScriptManager.RegisterStartupScript(this, GetType(), "msg", "alert('Profile Updated Successfully');", true);
    }
}