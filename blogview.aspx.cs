using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;
public partial class blogview : System.Web.UI.Page
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
        string query = "SELECT Description,convert(varchar, CreatedDate, 107) as ndate,BlogID,Title,BlogImage FROM Blogs WHERE 1=1 and  BlogID =" + Request.QueryString["id"] + " ORDER BY BlogID DESC";
       

       

        SqlCommand cmd = new SqlCommand(query, con);

     

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        rptBlogs.DataSource = dt;
        rptBlogs.DataBind();


        Page.Title = dt.Rows[0]["Title"].ToString() + " -  floraherbals.com";
        Page.MetaKeywords = dt.Rows[0]["Title"].ToString() + " -  floraherbals.com";
        Page.MetaDescription = dt.Rows[0]["Title"].ToString() + " -  floraherbals.com";
      
    }
}