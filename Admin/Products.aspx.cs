using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;
using System.Collections.Generic;

public partial class Products : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminID"] == null)
        {
            Response.Redirect("~/Admin/Login.aspx");
        }

        if (!IsPostBack)
        {
            LoadProducts();
        }
    }

    private void LoadProducts()
    {
        string query = @"
        SELECT
            P.ProductID,
            P.ProductName,
            P.Price,
            P.Status,

            C.CategoryName,
            SC.SubCategoryName,
            B.BrandName

        FROM Products P

        LEFT JOIN Categories C
            ON P.CategoryID = C.CategoryID

        LEFT JOIN SubCategories SC
            ON P.SubCategoryID = SC.SubCategoryID

        LEFT JOIN Brands B
            ON P.BrandID = B.BrandID

        WHERE 1=1";

        if (!string.IsNullOrEmpty(txtSearch.Text))
        {
            query += " AND P.ProductName LIKE @Search";
        }

        if (!string.IsNullOrEmpty(ddlFilterStatus.SelectedValue))
        {
            query += " AND P.Status=@Status";
        }

        query += " ORDER BY P.ProductID DESC";

        SqlCommand cmd = new SqlCommand(query, con);

        if (!string.IsNullOrEmpty(txtSearch.Text))
        {
            cmd.Parameters.AddWithValue(
                "@Search",
                "%" + txtSearch.Text.Trim() + "%");
        }

        if (!string.IsNullOrEmpty(ddlFilterStatus.SelectedValue))
        {
            cmd.Parameters.AddWithValue(
                "@Status",
                ddlFilterStatus.SelectedValue);
        }

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();

        da.Fill(dt);

        rptProducts.DataSource = dt;
        rptProducts.DataBind();

        lblCount.Text =
            "Showing " + dt.Rows.Count + " Product(s)";

        emptyState.Visible = (dt.Rows.Count == 0);
    }

    public string GetFirstImage(object productId)
    {
        string image = "";

        try
        {
            SqlCommand cmd = new SqlCommand(@"
            SELECT TOP 1 ImagePath
            FROM ProductImages
            WHERE ProductID=@PID
            ORDER BY SortOrder", con);

            cmd.Parameters.AddWithValue("@PID", productId);

            con.Open();

            object result = cmd.ExecuteScalar();

            if (result != null)
            {
                image = result.ToString();
            }
        }
        catch
        {
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        if (string.IsNullOrEmpty(image))
        {
            return ResolveUrl("~/Admin/Uploads/no-image.png");
        }

        return ResolveUrl("~/Admin/Uploads/Products/" + image);
    }

    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        LoadProducts();
    }

    protected void ddlFilterStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadProducts();
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;

        Response.Redirect(
            "AddProducts.aspx?id=" +
            btn.CommandArgument);
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;

        int productId =
            Convert.ToInt32(btn.CommandArgument);

        try
        {
            SqlCommand imgCmd = new SqlCommand(
                "SELECT ImagePath FROM ProductImages WHERE ProductID=@ID",
                con);

            imgCmd.Parameters.AddWithValue("@ID", productId);

            con.Open();

            SqlDataReader dr = imgCmd.ExecuteReader();

            List<string> images = new List<string>();

            while (dr.Read())
            {
                images.Add(
                    dr["ImagePath"].ToString());
            }

            dr.Close();

            foreach (string img in images)
            {
                string path = Server.MapPath(
                    "~/Admin/Uploads/Products/" + img);

                if (File.Exists(path))
                {
                    File.Delete(path);
                }
            }

            SqlCommand delImg = new SqlCommand(
                "DELETE FROM ProductImages WHERE ProductID=@ID",
                con);

            delImg.Parameters.AddWithValue(
                "@ID",
                productId);

            delImg.ExecuteNonQuery();

            SqlCommand delProduct = new SqlCommand(
                "DELETE FROM Products WHERE ProductID=@ID",
                con);

            delProduct.Parameters.AddWithValue(
                "@ID",
                productId);

            delProduct.ExecuteNonQuery();
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        LoadProducts();
    }
}