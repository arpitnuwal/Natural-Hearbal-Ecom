using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    public static string carttotal="0", wishlisttotal = "0";
    ClsConnection Cnn = new ClsConnection();
    public enum MessageType { Success, Error, Info, Warning };
    string filename;
    public static string login = "";
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
            list();
        }

    }

    public void list()
    {

        string Sql = @" select count(*) from  TrnCart where 1=1";
        string Sql_Inner = "";
        if (Session["UserId"] != null)
        {
            Sql_Inner = " and UserId=" + Session["UserId"] + "";
        }


        else
        {
            if (Request.Cookies["floraherbalscart"] != null)
            {
                if (Request.Cookies["floraherbalscart"].Value != null)
                {
                    Sql_Inner = " and CartId=" + Request.Cookies["floraherbalscart"].Value + "";
                }
            }
        }


        if (Sql_Inner != "")
        {
            Sql = Sql + Sql_Inner;
            Cnn.Open();
            carttotal = Cnn.ExecuteScalar(Sql).ToString();

            if (Session["UserId"] != null)
            {
                Sql_Inner = " and UserId=" + Session["UserId"] + "";
                wishlisttotal = Cnn.ExecuteScalar("select count(*) from  wishlist where 1=1 and UserId=" + Session["UserId"] + "").ToString();
              string   unm = Cnn.ExecuteScalar("select FullName  from register where  UserId=" + Session["UserId"] + "").ToString();
              login = "    <li><a href='myaccount.aspx'>hi " + unm + "</a></li>";
            }
            Cnn.Open();





         
        }

      
       
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        
    }
    protected void Unnamed_ServerClick(object sender, EventArgs e)
    {
        Response.Redirect("search.aspx?id=0&&sid=0&&bid=0&&sort=0&&price=0&&search=" + txtsearch.Text + "");
    }
}
