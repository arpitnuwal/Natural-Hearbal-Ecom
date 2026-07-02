using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;

public partial class Testimonials : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminID"] == null)
            Response.Redirect("~/Admin/Login.aspx");

        if (!IsPostBack)
        {
            LoadTestimonials();
        }
    }

    private void LoadTestimonials()
    {
        string query = "SELECT * FROM Testimonials WHERE 1=1";

        if (!string.IsNullOrEmpty(txtSearch.Text))
            query += " AND CustomerName LIKE @Search";

        if (!string.IsNullOrEmpty(ddlStatus.SelectedValue))
            query += " AND Status=@Status";

        query += " ORDER BY TestimonialID DESC";

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

        rptTestimonials.DataSource = dt;
        rptTestimonials.DataBind();

        lblCount.Text =
            "Showing " + dt.Rows.Count + " Testimonial(s)";

        emptyState.Visible = (dt.Rows.Count == 0);
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string imageName = "";

        if (fuCustomerImage.HasFile)
        {
            string folder =
                Server.MapPath("~/Admin/Uploads/Testimonials/");

            if (!Directory.Exists(folder))
                Directory.CreateDirectory(folder);

            imageName =
                Guid.NewGuid().ToString() +
                Path.GetExtension(fuCustomerImage.FileName);

            fuCustomerImage.SaveAs(
                Path.Combine(folder, imageName));
        }

        try
        {
            con.Open();

            if (string.IsNullOrEmpty(hfTestimonialID.Value))
            {
                SqlCommand cmd = new SqlCommand(
                @"INSERT INTO Testimonials
                (
                    CustomerName,
                    Designation,
                    ReviewText,
                    CustomerImage,
                    Rating,
                    Status
                )
                VALUES
                (
                    @CustomerName,
                    @Designation,
                    @ReviewText,
                    @CustomerImage,
                    @Rating,
                    @Status
                )", con);

                cmd.Parameters.AddWithValue("@CustomerName",
                    txtCustomerName.Text.Trim());

                cmd.Parameters.AddWithValue("@Designation",
                    txtDesignation.Text.Trim());

                cmd.Parameters.AddWithValue("@ReviewText",
                    txtReviewText.Text.Trim());

                cmd.Parameters.AddWithValue("@CustomerImage",
                    imageName);

                cmd.Parameters.AddWithValue("@Rating",
                    ddlRating.SelectedValue);

                cmd.Parameters.AddWithValue("@Status",
                    chkStatus.Checked);

                cmd.ExecuteNonQuery();
            }
            else
            {
                string query;

                if (fuCustomerImage.HasFile)
                {
                    query =
                    @"UPDATE Testimonials SET
                        CustomerName=@CustomerName,
                        Designation=@Designation,
                        ReviewText=@ReviewText,
                        CustomerImage=@CustomerImage,
                        Rating=@Rating,
                        Status=@Status
                      WHERE TestimonialID=@ID";
                }
                else
                {
                    query =
                    @"UPDATE Testimonials SET
                        CustomerName=@CustomerName,
                        Designation=@Designation,
                        ReviewText=@ReviewText,
                        Rating=@Rating,
                        Status=@Status
                      WHERE TestimonialID=@ID";
                }

                SqlCommand cmd =
                    new SqlCommand(query, con);

                cmd.Parameters.AddWithValue("@CustomerName",
                    txtCustomerName.Text.Trim());

                cmd.Parameters.AddWithValue("@Designation",
                    txtDesignation.Text.Trim());

                cmd.Parameters.AddWithValue("@ReviewText",
                    txtReviewText.Text.Trim());

                cmd.Parameters.AddWithValue("@Rating",
                    ddlRating.SelectedValue);

                cmd.Parameters.AddWithValue("@Status",
                    chkStatus.Checked);

                cmd.Parameters.AddWithValue("@ID",
                    hfTestimonialID.Value);

                if (fuCustomerImage.HasFile)
                {
                    cmd.Parameters.AddWithValue(
                        "@CustomerImage",
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
        LoadTestimonials();
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        LinkButton btn =
            (LinkButton)sender;

        int id =
            Convert.ToInt32(btn.CommandArgument);

        SqlCommand cmd =
            new SqlCommand(
            "SELECT * FROM Testimonials WHERE TestimonialID=@ID",
            con);

        cmd.Parameters.AddWithValue("@ID", id);

        try
        {
            con.Open();

            SqlDataReader dr =
                cmd.ExecuteReader();

            if (dr.Read())
            {
                hfTestimonialID.Value =
                    dr["TestimonialID"].ToString();

                txtCustomerName.Text =
                    dr["CustomerName"].ToString();

                txtDesignation.Text =
                    dr["Designation"].ToString();

                txtReviewText.Text =
                    dr["ReviewText"].ToString();

                ddlRating.SelectedValue =
                    dr["Rating"].ToString();

                chkStatus.Checked =
                    Convert.ToBoolean(dr["Status"]);

                string img =
                    dr["CustomerImage"].ToString();

                if (!string.IsNullOrEmpty(img))
                {
                    existingImageWrap.Visible = true;

                    imgExisting.Src =
                        ResolveUrl(
                        "~/Admin/Uploads/Testimonials/")
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

        btnSave.Text = "Update Testimonial";
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
                "SELECT CustomerImage FROM Testimonials WHERE TestimonialID=@ID",
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
                    "~/Admin/Uploads/Testimonials/"
                    + image);

                if (File.Exists(path))
                    File.Delete(path);
            }

            SqlCommand cmd =
                new SqlCommand(
                "DELETE FROM Testimonials WHERE TestimonialID=@ID",
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

        LoadTestimonials();
    }

    protected void txtSearch_TextChanged(
        object sender,
        EventArgs e)
    {
        LoadTestimonials();
    }

    protected void ddlStatus_SelectedIndexChanged(
        object sender,
        EventArgs e)
    {
        LoadTestimonials();
    }

    protected void btnReset_Click(
        object sender,
        EventArgs e)
    {
        ClearForm();
    }

    private void ClearForm()
    {
        hfTestimonialID.Value = "";

        txtCustomerName.Text = "";
        txtDesignation.Text = "";
        txtReviewText.Text = "";

        ddlRating.SelectedValue = "5";

        chkStatus.Checked = true;

        existingImageWrap.Visible = false;

        btnSave.Text = "Save Testimonial";
    }
}