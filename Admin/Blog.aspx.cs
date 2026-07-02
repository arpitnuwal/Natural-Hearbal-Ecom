using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;

public partial class Blog : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["AdminID"] == null)
            Response.Redirect("~/Admin/Login.aspx");

        if (!IsPostBack)
        {
            LoadBlogs();
        }
    }

    private void ResizeAndSaveImage(FileUpload fu, string path)
    {
        using (System.Drawing.Image original =
            System.Drawing.Image.FromStream(
                fu.PostedFile.InputStream))
        {
            Bitmap resized =
                new Bitmap(600, 400);

            using (Graphics g =
                Graphics.FromImage(resized))
            {
                g.CompositingQuality =
                    CompositingQuality.HighQuality;

                g.InterpolationMode =
                    InterpolationMode.HighQualityBicubic;

                g.SmoothingMode =
                    SmoothingMode.HighQuality;

                g.DrawImage(
                    original,
                    0,
                    0,
                    600,
                    400);
            }

            resized.Save(
                path,
                ImageFormat.Jpeg);

            resized.Dispose();
        }
    }

    private void LoadBlogs()
    {
        string query =
            "SELECT * FROM Blogs WHERE 1=1";

        if (!string.IsNullOrEmpty(txtSearch.Text))
            query +=
                " AND Title LIKE @Search";

        if (!string.IsNullOrEmpty(
            ddlStatus.SelectedValue))
            query +=
                " AND Status=@Status";

        query +=
            " ORDER BY BlogID DESC";

        SqlCommand cmd =
            new SqlCommand(query, con);

        if (!string.IsNullOrEmpty(
            txtSearch.Text))
            cmd.Parameters.AddWithValue(
                "@Search",
                "%" + txtSearch.Text.Trim() + "%");

        if (!string.IsNullOrEmpty(
            ddlStatus.SelectedValue))
            cmd.Parameters.AddWithValue(
                "@Status",
                ddlStatus.SelectedValue);

        SqlDataAdapter da =
            new SqlDataAdapter(cmd);

        DataTable dt =
            new DataTable();

        da.Fill(dt);

        rptBlogs.DataSource = dt;
        rptBlogs.DataBind();

        lblCount.Text =
            "Showing " +
            dt.Rows.Count +
            " Blog(s)";

        emptyState.Visible =
            (dt.Rows.Count == 0);
    }

    protected void btnSave_Click(
        object sender,
        EventArgs e)
    {
        string imageName = "";

        string folder =
            Server.MapPath(
                "~/Admin/Uploads/Blogs/");

        if (!Directory.Exists(folder))
            Directory.CreateDirectory(folder);

        if (fuBlogImage.HasFile)
        {
            imageName =
                Guid.NewGuid().ToString()
                + ".jpg";

            ResizeAndSaveImage(
                fuBlogImage,
                folder + imageName);
        }

        try
        {
            con.Open();

            if (string.IsNullOrEmpty(
                hfBlogID.Value))
            {
                SqlCommand cmd =
                    new SqlCommand(
                @"INSERT INTO Blogs
                (
                    Title,
                    ShortDescription,
                    Description,
                    BlogImage,
                    Status
                )
                VALUES
                (
                    @Title,
                    @ShortDesc,
                    @Desc,
                    @Image,
                    @Status
                )", con);

                cmd.Parameters.AddWithValue(
                    "@Title",
                    txtTitle.Text.Trim());

                cmd.Parameters.AddWithValue(
                    "@ShortDesc",
                    txtShortDescription.Text.Trim());

                cmd.Parameters.AddWithValue(
                    "@Desc",
                    txtDescription.Text.Trim());

                cmd.Parameters.AddWithValue(
                    "@Image",
                    imageName);

                cmd.Parameters.AddWithValue(
                    "@Status",
                    chkStatus.Checked);

                cmd.ExecuteNonQuery();
            }
            else
            {
                // Delete old image if new uploaded

                if (fuBlogImage.HasFile)
                {
                    SqlCommand oldCmd =
                        new SqlCommand(
                        "SELECT BlogImage FROM Blogs WHERE BlogID=@ID",
                        con);

                    oldCmd.Parameters.AddWithValue(
                        "@ID",
                        hfBlogID.Value);

                    string oldImg =
                        Convert.ToString(
                            oldCmd.ExecuteScalar());

                    if (!string.IsNullOrEmpty(
                        oldImg))
                    {
                        string oldPath =
                            Server.MapPath(
                            "~/Admin/Uploads/Blogs/"
                            + oldImg);

                        if (File.Exists(oldPath))
                            File.Delete(oldPath);
                    }
                }

                string query = "";

                if (fuBlogImage.HasFile)
                {
                    query =
                    @"UPDATE Blogs SET
                    Title=@Title,
                    ShortDescription=@ShortDesc,
                    Description=@Desc,
                    BlogImage=@Image,
                    Status=@Status
                    WHERE BlogID=@ID";
                }
                else
                {
                    query =
                    @"UPDATE Blogs SET
                    Title=@Title,
                    ShortDescription=@ShortDesc,
                    Description=@Desc,
                    Status=@Status
                    WHERE BlogID=@ID";
                }

                SqlCommand cmd =
                    new SqlCommand(
                        query,
                        con);

                cmd.Parameters.AddWithValue(
                    "@Title",
                    txtTitle.Text.Trim());

                cmd.Parameters.AddWithValue(
                    "@ShortDesc",
                    txtShortDescription.Text.Trim());

                cmd.Parameters.AddWithValue(
                    "@Desc",
                    txtDescription.Text.Trim());

                cmd.Parameters.AddWithValue(
                    "@Status",
                    chkStatus.Checked);

                cmd.Parameters.AddWithValue(
                    "@ID",
                    hfBlogID.Value);

                if (fuBlogImage.HasFile)
                {
                    cmd.Parameters.AddWithValue(
                        "@Image",
                        imageName);
                }

                cmd.ExecuteNonQuery();
            }
        }
        finally
        {
            if (con.State ==
                ConnectionState.Open)
                con.Close();
        }

        ClearForm();
        LoadBlogs();
    }
    protected void btnEdit_Click(
    object sender,
    EventArgs e)
    {
        LinkButton btn =
            (LinkButton)sender;

        int id =
            Convert.ToInt32(
                btn.CommandArgument);

        SqlCommand cmd =
            new SqlCommand(
            "SELECT * FROM Blogs WHERE BlogID=@ID",
            con);

        cmd.Parameters.AddWithValue(
            "@ID",
            id);

        try
        {
            con.Open();

            SqlDataReader dr =
                cmd.ExecuteReader();

            if (dr.Read())
            {
                hfBlogID.Value =
                    dr["BlogID"].ToString();

                txtTitle.Text =
                    dr["Title"].ToString();

                txtShortDescription.Text =
                    dr["ShortDescription"].ToString();

                txtDescription.Text =
                    dr["Description"].ToString();

                chkStatus.Checked =
                    Convert.ToBoolean(
                        dr["Status"]);

                string img =
                    dr["BlogImage"].ToString();

                if (!string.IsNullOrEmpty(img))
                {
                    existingImageWrap.Visible = true;

                    imgExisting.Src =
                        ResolveUrl(
                        "~/Admin/Uploads/Blogs/")
                        + img;
                }
                else
                {
                    existingImageWrap.Visible = false;
                }
            }

            dr.Close();
        }
        finally
        {
            if (con.State ==
                ConnectionState.Open)
                con.Close();
        }

        btnSave.Text =
            "Update Blog";
    }

    protected void btnDelete_Click(
        object sender,
        EventArgs e)
    {
        LinkButton btn =
            (LinkButton)sender;

        int id =
            Convert.ToInt32(
                btn.CommandArgument);

        try
        {
            SqlCommand cmdImg =
                new SqlCommand(
                "SELECT BlogImage FROM Blogs WHERE BlogID=@ID",
                con);

            cmdImg.Parameters.AddWithValue(
                "@ID",
                id);

            con.Open();

            string image =
                Convert.ToString(
                cmdImg.ExecuteScalar());

            con.Close();

            if (!string.IsNullOrEmpty(image))
            {
                string path =
                    Server.MapPath(
                    "~/Admin/Uploads/Blogs/"
                    + image);

                if (File.Exists(path))
                    File.Delete(path);
            }

            SqlCommand cmd =
                new SqlCommand(
                "DELETE FROM Blogs WHERE BlogID=@ID",
                con);

            cmd.Parameters.AddWithValue(
                "@ID",
                id);

            con.Open();

            cmd.ExecuteNonQuery();
        }
        finally
        {
            if (con.State ==
                ConnectionState.Open)
                con.Close();
        }

        ClearForm();

        LoadBlogs();
    }

    protected void txtSearch_TextChanged(
        object sender,
        EventArgs e)
    {
        LoadBlogs();
    }

    protected void ddlStatus_SelectedIndexChanged(
        object sender,
        EventArgs e)
    {
        LoadBlogs();
    }

    protected void btnReset_Click(
        object sender,
        EventArgs e)
    {
        ClearForm();

        Response.Redirect(
            "Blog.aspx");
    }

    private void ClearForm()
    {
        hfBlogID.Value = "";

        txtTitle.Text = "";

        txtShortDescription.Text = "";

        txtDescription.Text = "";

        chkStatus.Checked = true;

        existingImageWrap.Visible = false;

        imgExisting.Src = "";

        btnSave.Text = "Save Blog";
    }
}