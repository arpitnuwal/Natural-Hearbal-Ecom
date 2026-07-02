using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;

public partial class Slider : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminID"] == null)
            Response.Redirect("~/Admin/Login.aspx");

        if (!IsPostBack)
        {
            LoadSliders();
        }
    }

    private void LoadSliders()
    {
        string query = "SELECT * FROM Sliders WHERE 1=1";

        if (!string.IsNullOrEmpty(txtSearch.Text))
            query += " AND Title1 LIKE @Search";

        if (!string.IsNullOrEmpty(ddlStatus.SelectedValue))
            query += " AND Status=@Status";

        query += " ORDER BY SliderID DESC";

        SqlCommand cmd = new SqlCommand(query, con);

        if (!string.IsNullOrEmpty(txtSearch.Text))
            cmd.Parameters.AddWithValue("@Search",
                "%" + txtSearch.Text.Trim() + "%");

        if (!string.IsNullOrEmpty(ddlStatus.SelectedValue))
            cmd.Parameters.AddWithValue("@Status",
                ddlStatus.SelectedValue);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        rptSliders.DataSource = dt;
        rptSliders.DataBind();

        lblCount.Text =
            "Showing " + dt.Rows.Count + " Slider(s)";

        emptyState.Visible = (dt.Rows.Count == 0);
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string imageName = "";

        if (fuSliderImage.HasFile)
        {
            string folder =
                Server.MapPath("~/Admin/Uploads/Sliders/");

            if (!Directory.Exists(folder))
                Directory.CreateDirectory(folder);

            imageName =
                Guid.NewGuid().ToString() +
                Path.GetExtension(fuSliderImage.FileName);

            fuSliderImage.SaveAs(
                Path.Combine(folder, imageName));
        }

        try
        {
            con.Open();

            if (string.IsNullOrEmpty(hfSliderID.Value))
            {
                SqlCommand cmd = new SqlCommand(
                @"INSERT INTO Sliders
                (
                    Title1,
                    Title2,
                    SliderImage,
                    SliderLink,
                    Status
                )
                VALUES
                (
                    @Title1,
                    @Title2,
                    @SliderImage,
                    @SliderLink,
                    @Status
                )", con);

                cmd.Parameters.AddWithValue("@Title1",
                    txtTitle1.Text.Trim());

                cmd.Parameters.AddWithValue("@Title2",
                    txtTitle2.Text.Trim());

                cmd.Parameters.AddWithValue("@SliderImage",
                    imageName);

                cmd.Parameters.AddWithValue("@SliderLink",
                    txtSliderLink.Text.Trim());

                cmd.Parameters.AddWithValue("@Status",
                    chkStatus.Checked);

                cmd.ExecuteNonQuery();
            }
            else
            {
                string query;

                if (fuSliderImage.HasFile)
                {
                    query =
                    @"UPDATE Sliders SET
                        Title1=@Title1,
                        Title2=@Title2,
                        SliderImage=@SliderImage,
                        SliderLink=@SliderLink,
                        Status=@Status
                      WHERE SliderID=@ID";
                }
                else
                {
                    query =
                    @"UPDATE Sliders SET
                        Title1=@Title1,
                        Title2=@Title2,
                        SliderLink=@SliderLink,
                        Status=@Status
                      WHERE SliderID=@ID";
                }

                SqlCommand cmd =
                    new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@Title1",
                    txtTitle1.Text.Trim());

                cmd.Parameters.AddWithValue("@Title2",
                    txtTitle2.Text.Trim());

                cmd.Parameters.AddWithValue("@SliderLink",
                    txtSliderLink.Text.Trim());

                cmd.Parameters.AddWithValue("@Status",
                    chkStatus.Checked);

                cmd.Parameters.AddWithValue("@ID",
                    hfSliderID.Value);

                if (fuSliderImage.HasFile)
                {
                    cmd.Parameters.AddWithValue(
                        "@SliderImage",
                        imageName);
                }

                cmd.ExecuteNonQuery();
            }
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        ClearForm();
        LoadSliders();
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        LinkButton btn =
            (LinkButton)sender;

        int id =
            Convert.ToInt32(btn.CommandArgument);

        SqlCommand cmd =
            new SqlCommand(
            "SELECT * FROM Sliders WHERE SliderID=@ID",
            con);

        cmd.Parameters.AddWithValue("@ID", id);

        try
        {
            con.Open();

            SqlDataReader dr =
                cmd.ExecuteReader();

            if (dr.Read())
            {
                hfSliderID.Value =
                    dr["SliderID"].ToString();

                txtTitle1.Text =
                    dr["Title1"].ToString();

                txtTitle2.Text =
                    dr["Title2"].ToString();

                txtSliderLink.Text =
                    dr["SliderLink"].ToString();

                chkStatus.Checked =
                    Convert.ToBoolean(dr["Status"]);

                string img =
                    dr["SliderImage"].ToString();

                if (!string.IsNullOrEmpty(img))
                {
                    existingImageWrap.Visible = true;

                    imgExisting.Src =
                        ResolveUrl(
                        "~/Admin/Uploads/Sliders/")
                        + img;
                }
            }

            dr.Close();
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        btnSave.Text = "Update Slider";
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        LinkButton btn =
            (LinkButton)sender;

        int id =
            Convert.ToInt32(btn.CommandArgument);

        try
        {
            SqlCommand cmdImg =
                new SqlCommand(
                "SELECT SliderImage FROM Sliders WHERE SliderID=@ID",
                con);

            cmdImg.Parameters.AddWithValue("@ID", id);

            con.Open();

            string image =
                Convert.ToString(
                cmdImg.ExecuteScalar());

            con.Close();

            if (!string.IsNullOrEmpty(image))
            {
                string path =
                    Server.MapPath(
                    "~/Admin/Uploads/Sliders/"
                    + image);

                if (File.Exists(path))
                    File.Delete(path);
            }

            SqlCommand cmd =
                new SqlCommand(
                "DELETE FROM Sliders WHERE SliderID=@ID",
                con);

            cmd.Parameters.AddWithValue("@ID", id);

            con.Open();
            cmd.ExecuteNonQuery();
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        LoadSliders();
    }

    protected void txtSearch_TextChanged(
        object sender,
        EventArgs e)
    {
        LoadSliders();
    }

    protected void ddlStatus_SelectedIndexChanged(
        object sender,
        EventArgs e)
    {
        LoadSliders();
    }

    protected void btnReset_Click(
        object sender,
        EventArgs e)
    {
        ClearForm();
    }

    private void ClearForm()
    {
        hfSliderID.Value = "";

        txtTitle1.Text = "";
        txtTitle2.Text = "";
        txtSliderLink.Text = "";

        chkStatus.Checked = true;

        existingImageWrap.Visible = false;

        btnSave.Text = "Save Slider";
    }
}