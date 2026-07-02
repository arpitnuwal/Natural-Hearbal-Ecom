using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class categories : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewState["SortColumn"] = "CategoryID";
            ViewState["SortDirection"] = "DESC";

            LoadCategories();
        }
    }



    protected void btnSave_Click(object sender, EventArgs e)
    {
        string imageName = "";

        if (fuCategoryImage.HasFile)
        {
            string folderPath = Server.MapPath("~/Admin/Uploads/categoryimage/");

            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }

            imageName = Guid.NewGuid().ToString() +
                        Path.GetExtension(fuCategoryImage.FileName);

            fuCategoryImage.SaveAs(folderPath + imageName);
        }

        con.Open();

        if (string.IsNullOrEmpty(hfCategoryID.Value))
        {
            SqlCommand cmd = new SqlCommand(
                @"INSERT INTO Categories
                  (CategoryName, CategoryImage, Status)
                  VALUES
                  (@CategoryName, @CategoryImage, @Status)", con);

            cmd.Parameters.AddWithValue("@CategoryName",
                txtCategoryName.Text.Trim());

            cmd.Parameters.AddWithValue("@CategoryImage",
                imageName);

            cmd.Parameters.AddWithValue("@Status",
                chkStatus.Checked);

            cmd.ExecuteNonQuery();
        }
        else
        {
            string query;

            if (fuCategoryImage.HasFile)
            {
                query = @"UPDATE Categories
                          SET CategoryName=@CategoryName,
                              CategoryImage=@CategoryImage,
                              Status=@Status
                          WHERE CategoryID=@CategoryID";
            }
            else
            {
                query = @"UPDATE Categories
                          SET CategoryName=@CategoryName,
                              Status=@Status
                          WHERE CategoryID=@CategoryID";
            }

            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@CategoryName",
                txtCategoryName.Text.Trim());

            cmd.Parameters.AddWithValue("@Status",
                chkStatus.Checked);

            cmd.Parameters.AddWithValue("@CategoryID",
                hfCategoryID.Value);

            if (fuCategoryImage.HasFile)
            {
                cmd.Parameters.AddWithValue("@CategoryImage",
                    imageName);
            }

            cmd.ExecuteNonQuery();
        }

        con.Close();

        ClearForm();
        LoadCategories();
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;

        int id = Convert.ToInt32(btn.CommandArgument);

        SqlCommand cmd = new SqlCommand(
            "SELECT * FROM Categories WHERE CategoryID=@ID", con);

        cmd.Parameters.AddWithValue("@ID", id);

        con.Open();

        SqlDataReader dr = cmd.ExecuteReader();

        if (dr.Read())
        {
            hfCategoryID.Value =
                dr["CategoryID"].ToString();

            txtCategoryName.Text =
                dr["CategoryName"].ToString();

            chkStatus.Checked =
                Convert.ToBoolean(dr["Status"]);
        }
        btnSave.Text = "Update Category";
        dr.Close();
        con.Close();
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;

        int id = Convert.ToInt32(btn.CommandArgument);

        SqlCommand cmdImg = new SqlCommand(
            "SELECT CategoryImage FROM Categories WHERE CategoryID=@ID", con);

        cmdImg.Parameters.AddWithValue("@ID", id);

        con.Open();

        string img = Convert.ToString(cmdImg.ExecuteScalar());

        con.Close();

        if (!string.IsNullOrEmpty(img))
        {
            string path = Server.MapPath("~/Admin/Uploads/categoryimage/" + img);

            if (File.Exists(path))
            {
                File.Delete(path);
            }
        }

        SqlCommand cmd = new SqlCommand(
            "DELETE FROM Categories WHERE CategoryID=@ID", con);

        cmd.Parameters.AddWithValue("@ID", id);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        LoadCategories();
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        ClearForm();
    }

    private void ClearForm()
    {
        hfCategoryID.Value = "";
        txtCategoryName.Text = "";
        chkStatus.Checked = true;
        btnSave.Text = "Save Category";
    }

    private void LoadCategories()
    {
        string query = "SELECT * FROM Categories WHERE 1=1";

        if (!string.IsNullOrEmpty(txtSearch.Text))
        {
            query += " AND CategoryName LIKE @Search";
        }

        if (!string.IsNullOrEmpty(ddlStatus.SelectedValue))
        {
            query += " AND Status=@Status";
        }

        query += " ORDER BY " + ViewState["SortColumn"] + " " + ViewState["SortDirection"];

        SqlCommand cmd = new SqlCommand(query, con);

        if (!string.IsNullOrEmpty(txtSearch.Text))
        {
            cmd.Parameters.AddWithValue("@Search",
                "%" + txtSearch.Text.Trim() + "%");
        }

        if (!string.IsNullOrEmpty(ddlStatus.SelectedValue))
        {
            cmd.Parameters.AddWithValue("@Status",
                ddlStatus.SelectedValue);
        }

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();

        da.Fill(dt);

        rptCategories.DataSource = dt;
        rptCategories.DataBind();
        if (dt.Rows.Count == 0)
        {
            emptyState.Visible = true;
        }
        else
        {
            emptyState.Visible = false;
        }

        lblCount.Text =
            "Showing " + dt.Rows.Count + " Categories";
    }

 

    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        LoadCategories();
    }

    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadCategories();
    }
   

    protected void lnkSortName_Click(object sender, EventArgs e)
    {
        ViewState["SortColumn"] = "CategoryName";

        if (ViewState["SortDirection"].ToString() == "ASC")
        {
            ViewState["SortDirection"] = "DESC";
        }
        else
        {
            ViewState["SortDirection"] = "ASC";
        }

        LoadCategories();
    }

}