using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
          ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString);
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
            LoadSliders(); loadads(); LoadBlogs();
        }
    }

    private void LoadSliders()
    {
        string query = "SELECT * FROM Sliders WHERE 1=1";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        rptSliders.DataSource = dt;
        rptSliders.DataBind();



        DataTable dtlstbestdeal = Cnn.FillTable("select top 5 ProductID,  SUBSTRING(ProductName, 1, 20) AS ProductName,ProductLink,Price,Discount ,(select top 1 imagepath from ProductImages where ProductID= Products.ProductID order by ProductID) as img1 from Products order by newid()", "Detail");
        lstbestdeal.DataSource = dtlstbestdeal;
        lstbestdeal.DataBind();


        DataTable dtlstproduct2 = Cnn.FillTable("select top 10 ProductID,  SUBSTRING(ProductName, 1, 20) AS ProductName,ProductLink,Price,Discount ,(select top 1 imagepath from ProductImages where ProductID= Products.ProductID order by ProductID) as img1 from Products order by newid()", "Detail");
        lstproduct2.DataSource = dtlstproduct2;
        lstproduct2.DataBind();


        DataTable dtlstproduct3 = Cnn.FillTable("select top 10 ProductID,  SUBSTRING(ProductName, 1, 20) AS ProductName,ProductLink,Price,Discount ,(select top 1 imagepath from ProductImages where ProductID= Products.ProductID order by ProductID) as img1 from Products order by newid()", "Detail");
        lstproduct3.DataSource = dtlstproduct3;
        lstproduct3.DataBind();
    }


    private void LoadBlogs()
    {
        string query = "SELECT top 3 DAY(CreatedDate) AS DayOnly,DATENAME(MONTH, CreatedDate) AS MonthName,BlogID,Title,BlogImage FROM Blogs WHERE 1=1 ORDER BY newid()";




        SqlCommand cmd = new SqlCommand(query, con);



        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        rptBlogs.DataSource = dt;
        rptBlogs.DataBind();


    }

    public void loadads()
    {
        DataTable addt = Cnn.FillTable("select * from [Banner] order by bannerid asc", "Detail");


        top1link = addt.Rows[0]["LinkURL"].ToString();
        top2link = addt.Rows[1]["LinkURL"].ToString();
        top3link = addt.Rows[2]["LinkURL"].ToString();

        //
        m1subtitle = addt.Rows[3]["subtitle"].ToString();
        m1title = addt.Rows[3]["title"].ToString();
        m1link = addt.Rows[3]["LinkURL"].ToString();
    //

        m2subtitle = addt.Rows[4]["subtitle"].ToString();
        m2title = addt.Rows[4]["title"].ToString();
        m2link = addt.Rows[4]["LinkURL"].ToString();
        //
        m3subtitle = addt.Rows[5]["subtitle"].ToString();
        m3title = addt.Rows[5]["title"].ToString();
        m3link = addt.Rows[5]["LinkURL"].ToString();


        d1subtitle = addt.Rows[6]["subtitle"].ToString();
        d1title = addt.Rows[6]["title"].ToString();
        d1link = addt.Rows[6]["LinkURL"].ToString();
        d1offertext = addt.Rows[6]["offertext"].ToString();

        d2subtitle = addt.Rows[7]["subtitle"].ToString();
        d2title = addt.Rows[7]["title"].ToString();
        d2link = addt.Rows[7]["LinkURL"].ToString();
        d2offertext = addt.Rows[7]["offertext"].ToString();

    }
}