using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;
public partial class Blogs : System.Web.UI.Page
{
   
    SqlConnection con = new SqlConnection(
         ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            LoadBlogs();
        }
    }

    private void LoadBlogs()
    {
        string query = "SELECT DAY(CreatedDate) AS DayOnly,DATENAME(MONTH, CreatedDate) AS MonthName,BlogID,Title,BlogImage FROM Blogs WHERE 1=1 ORDER BY BlogID DESC";
       

       

        SqlCommand cmd = new SqlCommand(query, con);

     

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        rptBlogs.DataSource = dt;
        rptBlogs.DataBind();

      
    }
}