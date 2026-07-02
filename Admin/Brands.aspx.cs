using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;

public partial class Admin_Brands : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminID"] == null)
            Response.Redirect("~/Admin/Login.aspx");

        if (!IsPostBack)
        {
            ViewState["SortColumn"]    = "BrandID";
            ViewState["SortDirection"] = "DESC";
            LoadBrands();
        }
    }

    private void LoadBrands()
    {
        string query = "SELECT * FROM Brands WHERE 1=1";

        if (!string.IsNullOrEmpty(txtSearch.Text))
            query += " AND BrandName LIKE @Search";

        if (!string.IsNullOrEmpty(ddlStatus.SelectedValue))
            query += " AND Status=@Status";

        query += " ORDER BY " + ViewState["SortColumn"] + " " + ViewState["SortDirection"];

        SqlCommand cmd = new SqlCommand(query, con);

        if (!string.IsNullOrEmpty(txtSearch.Text))
            cmd.Parameters.AddWithValue("@Search", "%" + txtSearch.Text.Trim() + "%");

        if (!string.IsNullOrEmpty(ddlStatus.SelectedValue))
            cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        rptBrands.DataSource = dt;
        rptBrands.DataBind();

        emptyState.Visible = (dt.Rows.Count == 0);
        lblCount.Text = "Showing " + dt.Rows.Count + " Brand(s)";
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid) return;

        string logoName = "";

        if (fuBrandLogo.HasFile)
        {
            string folder = Server.MapPath("~/Admin/Uploads/Brands/");
            if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);
            logoName = Guid.NewGuid().ToString() + Path.GetExtension(fuBrandLogo.FileName);
            fuBrandLogo.SaveAs(folder + logoName);
        }

        try
        {
            con.Open();

            if (string.IsNullOrEmpty(hfBrandID.Value))
            {
                SqlCommand cmd = new SqlCommand(
                    "INSERT INTO Brands (BrandName, BrandLogo, Status) VALUES (@Name, @Logo, @Status)", con);
                cmd.Parameters.AddWithValue("@Name",   txtBrandName.Text.Trim());
                cmd.Parameters.AddWithValue("@Logo",   logoName);
                cmd.Parameters.AddWithValue("@Status", chkStatus.Checked);
                cmd.ExecuteNonQuery();
            }
            else
            {
                string query = fuBrandLogo.HasFile
                    ? "UPDATE Brands SET BrandName=@Name, BrandLogo=@Logo, Status=@Status WHERE BrandID=@ID"
                    : "UPDATE Brands SET BrandName=@Name, Status=@Status WHERE BrandID=@ID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@Name",   txtBrandName.Text.Trim());
                cmd.Parameters.AddWithValue("@Status", chkStatus.Checked);
                cmd.Parameters.AddWithValue("@ID",     hfBrandID.Value);
                if (fuBrandLogo.HasFile)
                    cmd.Parameters.AddWithValue("@Logo", logoName);
                cmd.ExecuteNonQuery();
            }
        }
        finally
        {
            if (con.State == ConnectionState.Open) con.Close();
        }

        ClearForm();
        LoadBrands();
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        int id = Convert.ToInt32(btn.CommandArgument);

        SqlCommand cmd = new SqlCommand("SELECT * FROM Brands WHERE BrandID=@ID", con);
        cmd.Parameters.AddWithValue("@ID", id);

        try
        {
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                hfBrandID.Value     = dr["BrandID"].ToString();
                txtBrandName.Text   = dr["BrandName"].ToString();
                chkStatus.Checked   = Convert.ToBoolean(dr["Status"]);

                string logo = dr["BrandLogo"].ToString();
                if (!string.IsNullOrEmpty(logo))
                {
                    existingLogoWrap.Visible = true;
                    imgExistingLogo.Src =
                        ResolveUrl("~/Admin/Uploads/Brands/") + logo;
                }
            }
            dr.Close();
        }
        finally
        {
            if (con.State == ConnectionState.Open) con.Close();
        }

        btnSave.Text = "Update Brand";
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        int id = Convert.ToInt32(btn.CommandArgument);

        try
        {
            SqlCommand cmdImg = new SqlCommand(
                "SELECT BrandLogo FROM Brands WHERE BrandID=@ID", con);
            cmdImg.Parameters.AddWithValue("@ID", id);
            con.Open();
            string logo = Convert.ToString(cmdImg.ExecuteScalar());
            con.Close();

            if (!string.IsNullOrEmpty(logo))
            {
                string path = Server.MapPath("~/Admin/Uploads/Brands/" + logo);
                if (File.Exists(path)) File.Delete(path);
            }

            SqlCommand cmd = new SqlCommand(
                "DELETE FROM Brands WHERE BrandID=@ID", con);
            cmd.Parameters.AddWithValue("@ID", id);
            con.Open();
            cmd.ExecuteNonQuery();
        }
        finally
        {
            if (con.State == ConnectionState.Open) con.Close();
        }

        LoadBrands();
    }

 protected void btnReset_Click(object sender, EventArgs e)
{
    ClearForm();
}

    private void ClearForm()
    {
        hfBrandID.Value          = "";
        txtBrandName.Text        = "";
        chkStatus.Checked        = true;
        btnSave.Text             = "Save Brand";
        existingLogoWrap.Visible = false;
    }
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        LoadBrands();
    }

    protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadBrands();
    }
}