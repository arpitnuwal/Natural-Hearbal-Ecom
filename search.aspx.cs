using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class search : System.Web.UI.Page
{
  
    ClsConnection Cnn = new ClsConnection();
    public static string top1link = "", top2link = "", top3link = "";

    public static string m1subtitle = "", m1title = "", m1link = "";
    public static string m2subtitle = "", m2title = "", m2link = "";
    public static string m3subtitle = "", m3title = "", m3link = "";


    public static string d1subtitle = "", d1title = "", d1link = "", d1offertext = "";
    public static string d2subtitle = "", d2title = "", d2link = "", d2offertext = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadSliders(); 
        }
    }

    private void LoadSliders()
    {

        string cid = "", sid = "", bid = "", sort="", price = "",search="";


        if (Request.QueryString["search"] != "")
        {
            search = "and ProductName like '%" + Request.QueryString["search"] + "%'";
        }


        if (Request.QueryString["id"] != "0")
        {
            cid = "and CategoryID=" + Request.QueryString["id"] + "";
        }

       if (Request.QueryString["sid"] != "0")
        {
            sid = "and SubCategoryID=" + Request.QueryString["sid"] + "";
        }

       if (Request.QueryString["bid"] != "0")
       {
           bid = "and BrandID=" + Request.QueryString["bid"] + "";
       }
       if (Request.QueryString["sort"] == "0")
       {
           sort = "order by newid()";
       }
       else if (Request.QueryString["sort"] == "1")
       {
           sort = "order by newid()";
       }
       else if (Request.QueryString["sort"] == "2")
       {
           sort = "order by ProductID desc";
       }
       else if (Request.QueryString["sort"] == "3")
       {
           sort = "order by price asc";
       }
       else if (Request.QueryString["sort"] == "4")
       {
           sort = "order by price desc";
       }
       else if (Request.QueryString["sort"] == "5")
       {
           sort = "order by ProductName asc";
       }



       if (Request.QueryString["price"] == "0")
       {
           price = "";
       }
       else if (Request.QueryString["price"] == "1")
       {
           price = "and Price BETWEEN 0 AND 100";
       }
       else if (Request.QueryString["price"] == "2")
       {
           price = "and Price BETWEEN 101 AND 250";
       }
       else if (Request.QueryString["price"] == "3")
       {
           price = "and Price BETWEEN 251 AND 500";
       }
       else if (Request.QueryString["price"] == "4")
       {
           price = "and Price BETWEEN 501 AND 1000";
       }
       else if (Request.QueryString["price"] == "5")
       {
           price = "and Price BETWEEN 1001 AND 2000";
       }
       else if (Request.QueryString["price"] == "6")
       {
           price = "and Price BETWEEN 2001 AND 5000";
       }
       else if (Request.QueryString["price"] == "7")
       {
           price = "and Price BETWEEN 5000 AND 100000";
       }
       DataTable dtlstbestdeal = Cnn.FillTable("select ProductID,  SUBSTRING(ProductName, 1, 20) AS ProductName,ProductLink,Price,Discount ,(select top 1 imagepath from ProductImages where ProductID= Products.ProductID order by ProductID) as img1 from Products where 1=1  " + search + " " + cid + " " + sid + " " + bid + "  " + price + "   " + sort + "", "Detail");
        lstproduct2.DataSource = dtlstbestdeal;
        lstproduct2.DataBind();

        lblcount.Text = lstproduct2.Items.Count.ToString();

    }

    protected void lstbrand_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        if (e.Item.ItemType == ListViewItemType.DataItem)
        {
            DataRowView drv = (DataRowView)e.Item.DataItem;

            int categoryId = Convert.ToInt32(drv["CategoryID"]);

            ListView lstSub = (ListView)e.Item.FindControl("lstSubCategory");

            using (SqlConnection con = new SqlConnection(
                ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString))
            {
                SqlCommand cmd = new SqlCommand(
                    "SELECT SubCategoryID, SubCategoryName FROM SubCategories WHERE CategoryID=@CategoryID ORDER BY SubCategoryName",
                    con);

                cmd.Parameters.AddWithValue("@CategoryID", categoryId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                lstSub.DataSource = dt;
                lstSub.DataBind();
            }
        }
    }
}