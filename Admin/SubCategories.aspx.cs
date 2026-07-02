using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;

public partial class Admin_SubCategories : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminID"] == null)
            Response.Redirect("~/Admin/Login.aspx");

        if (!IsPostBack)
        {
            ViewState["SortColumn"]    = "SubCategoryID";
            ViewState["SortDirection"] = "DESC";

            LoadCategoryDropdown();
            LoadFilterCategoryDropdown();
            LoadSubCategories();
        }
    }

    // ── DROP-DOWN LOADERS ───────────────────────────────────────────────────

    private void LoadCategoryDropdown()
    {
        SqlCommand cmd = new SqlCommand(
            "SELECT CategoryID, CategoryName FROM Categories WHERE Status=1 ORDER BY CategoryName", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        ddlCategory.DataSource     = dt;
        ddlCategory.DataTextField  = "CategoryName";
        ddlCategory.DataValueField = "CategoryID";
        ddlCategory.DataBind();
        ddlCategory.Items.Insert(0, new ListItem("-- Select Category --", ""));
    }

    private void LoadFilterCategoryDropdown()
    {
        SqlCommand cmd = new SqlCommand(
            "SELECT CategoryID, CategoryName FROM Categories ORDER BY CategoryName", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        ddlFilterCategory.DataSource     = dt;
        ddlFilterCategory.DataTextField  = "CategoryName";
        ddlFilterCategory.DataValueField = "CategoryID";
        ddlFilterCategory.DataBind();
        ddlFilterCategory.Items.Insert(0, new ListItem("All Categories", ""));
    }

    // ── LOAD GRID ───────────────────────────────────────────────────────────

    private void LoadSubCategories()
    {
        string query = @"
            SELECT sc.SubCategoryID, sc.SubCategoryName, sc.SubCategoryImage,
                   sc.Status, c.CategoryName
            FROM SubCategories sc
            INNER JOIN Categories c ON c.CategoryID = sc.CategoryID
            WHERE 1=1";

        if (!string.IsNullOrEmpty(txtSearch.Text))
            query += " AND sc.SubCategoryName LIKE @Search";

        if (!string.IsNullOrEmpty(ddlFilterStatus.SelectedValue))
            query += " AND sc.Status=@Status";

        if (!string.IsNullOrEmpty(ddlFilterCategory.SelectedValue))
            query += " AND sc.CategoryID=@CategoryID";

        query += " ORDER BY sc." + ViewState["SortColumn"] + " " + ViewState["SortDirection"];

        SqlCommand cmd = new SqlCommand(query, con);

        if (!string.IsNullOrEmpty(txtSearch.Text))
            cmd.Parameters.AddWithValue("@Search", "%" + txtSearch.Text.Trim() + "%");

        if (!string.IsNullOrEmpty(ddlFilterStatus.SelectedValue))
            cmd.Parameters.AddWithValue("@Status", ddlFilterStatus.SelectedValue);

        if (!string.IsNullOrEmpty(ddlFilterCategory.SelectedValue))
            cmd.Parameters.AddWithValue("@CategoryID", ddlFilterCategory.SelectedValue);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        rptSubCategories.DataSource = dt;
        rptSubCategories.DataBind();

        emptyState.Visible = (dt.Rows.Count == 0);
        lblCount.Text = "Showing " + dt.Rows.Count + " Sub-Categories";
    }

    // ── SAVE (INSERT / UPDATE) ──────────────────────────────────────────────

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid) return;

        string imageName = "";

        if (fuSubCategoryImage.HasFile)
        {
            string folder = Server.MapPath("~/Admin/Uploads/SubCategories/");
            if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);

            imageName = Guid.NewGuid().ToString() +
                        Path.GetExtension(fuSubCategoryImage.FileName);
            fuSubCategoryImage.SaveAs(folder + imageName);
        }

        try
        {
            con.Open();

            if (string.IsNullOrEmpty(hfSubCategoryID.Value))
            {
                // INSERT
                SqlCommand cmd = new SqlCommand(
                    @"INSERT INTO SubCategories
                        (CategoryID, SubCategoryName, SubCategoryImage, Status)
                      VALUES
                        (@CategoryID, @Name, @Image, @Status)", con);

                cmd.Parameters.AddWithValue("@CategoryID", ddlCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@Name",       txtSubCategoryName.Text.Trim());
                cmd.Parameters.AddWithValue("@Image",      imageName);
                cmd.Parameters.AddWithValue("@Status",     chkStatus.Checked);
                cmd.ExecuteNonQuery();
            }
            else
            {
                // UPDATE
                string query = fuSubCategoryImage.HasFile
                    ? @"UPDATE SubCategories
                        SET CategoryID=@CategoryID, SubCategoryName=@Name,
                            SubCategoryImage=@Image, Status=@Status
                        WHERE SubCategoryID=@ID"
                    : @"UPDATE SubCategories
                        SET CategoryID=@CategoryID, SubCategoryName=@Name,
                            Status=@Status
                        WHERE SubCategoryID=@ID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@CategoryID", ddlCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@Name",       txtSubCategoryName.Text.Trim());
                cmd.Parameters.AddWithValue("@Status",     chkStatus.Checked);
                cmd.Parameters.AddWithValue("@ID",         hfSubCategoryID.Value);

                if (fuSubCategoryImage.HasFile)
                    cmd.Parameters.AddWithValue("@Image", imageName);

                cmd.ExecuteNonQuery();
            }
        }
        finally
        {
            if (con.State == ConnectionState.Open) con.Close();
        }

        ClearForm();
        LoadSubCategories();
    }

    // ── EDIT ────────────────────────────────────────────────────────────────

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        int id = Convert.ToInt32(btn.CommandArgument);

        SqlCommand cmd = new SqlCommand(
            "SELECT * FROM SubCategories WHERE SubCategoryID=@ID", con);
        cmd.Parameters.AddWithValue("@ID", id);

        try
        {
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                hfSubCategoryID.Value     = dr["SubCategoryID"].ToString();
                txtSubCategoryName.Text   = dr["SubCategoryName"].ToString();
                chkStatus.Checked         = Convert.ToBoolean(dr["Status"]);

                // Set parent category
                string catId = dr["CategoryID"].ToString();
                dr.Close();
                con.Close();

                LoadCategoryDropdown();
                ListItem item = ddlCategory.Items.FindByValue(catId);
                if (item != null) item.Selected = true;

                btnSave.Text = "Update Sub-Category";
            }
            else { dr.Close(); }
        }
        finally
        {
            if (con.State == ConnectionState.Open) con.Close();
        }
    }

    // ── DELETE ──────────────────────────────────────────────────────────────

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        int id = Convert.ToInt32(btn.CommandArgument);

        try
        {
            // Fetch image name first
            SqlCommand cmdImg = new SqlCommand(
                "SELECT SubCategoryImage FROM SubCategories WHERE SubCategoryID=@ID", con);
            cmdImg.Parameters.AddWithValue("@ID", id);
            con.Open();
            string img = Convert.ToString(cmdImg.ExecuteScalar());
            con.Close();

            // Delete physical file
            if (!string.IsNullOrEmpty(img))
            {
                string path = Server.MapPath("~/Admin/Uploads/SubCategories/" + img);
                if (File.Exists(path)) File.Delete(path);
            }

            // Delete record
            SqlCommand cmd = new SqlCommand(
                "DELETE FROM SubCategories WHERE SubCategoryID=@ID", con);
            cmd.Parameters.AddWithValue("@ID", id);
            con.Open();
            cmd.ExecuteNonQuery();
        }
        finally
        {
            if (con.State == ConnectionState.Open) con.Close();
        }

        LoadSubCategories();
    }

    // ── RESET / CLEAR ───────────────────────────────────────────────────────

    protected void btnReset_Click(object sender, EventArgs e)
    {
        ClearForm();
    }

    private void ClearForm()
    {
        hfSubCategoryID.Value   = "";
        txtSubCategoryName.Text = "";
        chkStatus.Checked       = true;
        btnSave.Text            = "Save Sub-Category";
        existingImgWrap.Visible = false;
        LoadCategoryDropdown();
    }

    // ── FILTER / SEARCH ─────────────────────────────────────────────────────
protected void txtSearch_TextChanged(object sender, EventArgs e)
{
    LoadSubCategories();
}

protected void ddlFilterStatus_SelectedIndexChanged(object sender, EventArgs e)
{
    LoadSubCategories();
}

protected void ddlFilterCategory_SelectedIndexChanged(object sender, EventArgs e)
{
    LoadSubCategories();
}
}