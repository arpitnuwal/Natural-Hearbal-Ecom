using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BannerManagement : System.Web.UI.Page
{
   SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadBanners();
        }
    }

    private void LoadBanners()
    {
        string query = @"SELECT *
                         FROM Banner
                         WHERE 1=1";

        if (!string.IsNullOrWhiteSpace(txtSearch.Text))
        {
            query += @" AND
                    (
                        Title LIKE @Search
                        OR Subtitle LIKE @Search
                        OR BannerSection LIKE @Search
                    )";
        }

        if (!string.IsNullOrWhiteSpace(ddlFilterStatus.SelectedValue))
        {
            query += " AND Status=@Status";
        }

        query += " ORDER BY BannerID DESC";

        SqlCommand cmd = new SqlCommand(query, con);

        if (!string.IsNullOrWhiteSpace(txtSearch.Text))
        {
            cmd.Parameters.AddWithValue("@Search",
                "%" + txtSearch.Text.Trim() + "%");
        }

        if (!string.IsNullOrWhiteSpace(ddlFilterStatus.SelectedValue))
        {
            cmd.Parameters.AddWithValue("@Status",
                ddlFilterStatus.SelectedValue);
        }

        SqlDataAdapter da = new SqlDataAdapter(cmd);

        DataTable dt = new DataTable();

        da.Fill(dt);

        gvBanners.DataSource = dt;
        gvBanners.DataBind();

        lblCount.Text = "Showing " +
                        dt.Rows.Count +
                        " Banner(s)";
    }

    private void ClearForm()
    {
        hfBannerID.Value = "";

        ddlBannerSection.SelectedIndex = 0;
        ddlBannerType.SelectedIndex = 0;

        txtSubtitle.Text = "";
        txtTitle.Text = "";
        txtOfferText.Text = "";
        txtLinkURL.Text = "";

        ddlStatus.SelectedValue = "Active";

        imgExisting.Visible = false;
        imgExisting.ImageUrl = "";

        btnSave.Text = "Save Banner";

        lblMessage.Text = "";

        ScriptManager.RegisterStartupScript(
            this,
            GetType(),
            "toggle",
            "toggleBannerFields();",
            true);
    }

    private bool ValidateBanner()
    {
        string section = ddlBannerSection.SelectedValue;

        if (string.IsNullOrEmpty(section))
        {
            lblMessage.ForeColor = Color.Red;
            lblMessage.Text = "Please select Banner Section.";
            return false;
        }

        if (section == "Top")
        {
            if (string.IsNullOrEmpty(ddlBannerType.SelectedValue))
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Banner Type is required.";
                return false;
            }

            if (string.IsNullOrWhiteSpace(txtLinkURL.Text))
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Link URL is required.";
                return false;
            }

            if (!fuBanner.HasFile &&
                string.IsNullOrEmpty(hfBannerID.Value))
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Banner Image is required.";
                return false;
            }
        }

        if (section == "Middle")
        {
            if (string.IsNullOrWhiteSpace(txtSubtitle.Text))
            {
              //  lblMessage.ForeColor = Color.Red;
              //  lblMessage.Text = "Subtitle is required.";
              //  return false;
            }

            if (string.IsNullOrWhiteSpace(txtTitle.Text))
            {
                //lblMessage.ForeColor = Color.Red;
                //lblMessage.Text = "Title is required.";
                //return false;
            }

            if (string.IsNullOrWhiteSpace(txtLinkURL.Text))
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Link URL is required.";
                return false;
            }

            if (!fuBanner.HasFile &&
                string.IsNullOrEmpty(hfBannerID.Value))
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Banner Image is required.";
                return false;
            }
        }

        if (section == "Bottom")
        {
            if (string.IsNullOrWhiteSpace(txtSubtitle.Text))
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Subtitle is required.";
                return false;
            }

            if (string.IsNullOrWhiteSpace(txtTitle.Text))
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Title is required.";
                return false;
            }

            if (string.IsNullOrWhiteSpace(txtOfferText.Text))
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Offer Text is required.";
                return false;
            }

            if (string.IsNullOrWhiteSpace(txtLinkURL.Text))
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Link URL is required.";
                return false;
            }

            if (!fuBanner.HasFile &&
                string.IsNullOrEmpty(hfBannerID.Value))
            {
                lblMessage.ForeColor = Color.Red;
                lblMessage.Text = "Banner Image is required.";
                return false;
            }
        }

        return true;
    }

    private void ResizeAndSaveImage(string sourcePath,
                                string destinationPath,
                                int width,
                                int height)
    {
        using (Bitmap originalImage = new Bitmap(sourcePath))
        {
            using (Bitmap resizedImage = new Bitmap(width, height))
            {
                using (Graphics g = Graphics.FromImage(resizedImage))
                {
                    g.InterpolationMode =
                        System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;

                    g.SmoothingMode =
                        System.Drawing.Drawing2D.SmoothingMode.HighQuality;

                    g.PixelOffsetMode =
                        System.Drawing.Drawing2D.PixelOffsetMode.HighQuality;

                    g.DrawImage(originalImage,
                        0,
                        0,
                        width,
                        height);
                }

                resizedImage.Save(destinationPath,
                    originalImage.RawFormat);
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!ValidateBanner())
            return;

       

        string folderPath =
            Server.MapPath("~/Admin/Uploads/Banners/");

        if (!Directory.Exists(folderPath))
        {
            Directory.CreateDirectory(folderPath);
        }

        con.Open();

        if (string.IsNullOrEmpty(hfBannerID.Value))
        {
            SqlCommand cmd = new SqlCommand(@"
            INSERT INTO Banner
            (
                BannerSection,
                BannerType,
                Subtitle,
                Title,
                OfferText,
                ImageName,
                LinkURL,
                Status,
                CreatedDate
            )
            VALUES
            (
                @BannerSection,
                @BannerType,
                @Subtitle,
                @Title,
                @OfferText,
                '',
                @LinkURL,
                @Status,
                GETDATE()
            );

            SELECT SCOPE_IDENTITY();
            ", con);

            cmd.Parameters.AddWithValue("@BannerSection",
                ddlBannerSection.SelectedValue);

            cmd.Parameters.AddWithValue("@BannerType",
                ddlBannerType.SelectedValue);

            cmd.Parameters.AddWithValue("@Subtitle",
                txtSubtitle.Text.Trim());

            cmd.Parameters.AddWithValue("@Title",
                txtTitle.Text.Trim());

            cmd.Parameters.AddWithValue("@OfferText",
                txtOfferText.Text.Trim());

            cmd.Parameters.AddWithValue("@LinkURL",
                txtLinkURL.Text.Trim());

            cmd.Parameters.AddWithValue("@Status",
                ddlStatus.SelectedValue);

            int bannerID =
                Convert.ToInt32(cmd.ExecuteScalar());

            string ext =
                Path.GetExtension(fuBanner.FileName);

            string imageName =
                bannerID + ext;

            string tempPath =
    folderPath + "temp_" + imageName;

            fuBanner.SaveAs(tempPath);

            int width = 0;
            int height = 0;

            if (ddlBannerSection.SelectedValue == "Top")
            {
                if (ddlBannerType.SelectedValue == "Small")
                {
                    width = 298;
                    height = 235;
                }
                else
                {
                    width = 298;
                    height = 490;
                }
            }
            else if (ddlBannerSection.SelectedValue == "Middle")
            {
                width = 425;
                height = 223;
            }
            else if (ddlBannerSection.SelectedValue == "Bottom")
            {
                width = 635;
                height = 301;
            }

            ResizeAndSaveImage(
                tempPath,
                folderPath + imageName,
                width,
                height);

            File.Delete(tempPath);

            SqlCommand updateImg =
                new SqlCommand(
                "UPDATE Banner SET ImageName=@ImageName WHERE BannerID=@BannerID",
                con);

            updateImg.Parameters.AddWithValue(
                "@ImageName",
                imageName);

            updateImg.Parameters.AddWithValue(
                "@BannerID",
                bannerID);

            updateImg.ExecuteNonQuery();

            lblMessage.ForeColor = Color.Green;
            lblMessage.Text = "Banner added successfully.";
        }
                else
        {
            int bannerID =
                Convert.ToInt32(hfBannerID.Value);

            string oldImage = "";

            SqlCommand getImg = new SqlCommand(
                "SELECT ImageName FROM Banner WHERE BannerID=@BannerID",
                con);

            getImg.Parameters.AddWithValue(
                "@BannerID",
                bannerID);

            oldImage = Convert.ToString(
                getImg.ExecuteScalar());

            string imageName = oldImage;

            if (fuBanner.HasFile)
            {
                string oldPath =
                    folderPath + oldImage;

                if (File.Exists(oldPath))
                {
                    File.Delete(oldPath);
                }

                string ext =".jpeg";

                imageName =
                    bannerID + ext;

                string tempPath =
     folderPath + "temp_" + imageName;

                fuBanner.SaveAs(tempPath);

                int width = 0;
                int height = 0;

                if (ddlBannerSection.SelectedValue == "Top")
                {
                    if (ddlBannerType.SelectedValue == "Small")
                    {
                        width = 298;
                        height = 235;
                    }
                    else
                    {
                        width = 298;
                        height = 490;
                    }
                }
                else if (ddlBannerSection.SelectedValue == "Middle")
                {
                    width = 425;
                    height = 223;
                }
                else if (ddlBannerSection.SelectedValue == "Bottom")
                {
                    width = 635;
                    height = 301;
                }

                ResizeAndSaveImage(
                    tempPath,
                    folderPath + imageName,
                    width,
                    height);

                File.Delete(tempPath);

            }

            SqlCommand cmd = new SqlCommand(@"
            UPDATE Banner
            SET
                BannerSection=@BannerSection,
                BannerType=@BannerType,
                Subtitle=@Subtitle,
                Title=@Title,
                OfferText=@OfferText,
                ImageName=@ImageName,
                LinkURL=@LinkURL,
                Status=@Status
            WHERE BannerID=@BannerID
            ", con);

            cmd.Parameters.AddWithValue(
                "@BannerSection",
                ddlBannerSection.SelectedValue);

            cmd.Parameters.AddWithValue(
                "@BannerType",
                ddlBannerType.SelectedValue);

            cmd.Parameters.AddWithValue(
                "@Subtitle",
                txtSubtitle.Text.Trim());

            cmd.Parameters.AddWithValue(
                "@Title",
                txtTitle.Text.Trim());

            cmd.Parameters.AddWithValue(
                "@OfferText",
                txtOfferText.Text.Trim());

            cmd.Parameters.AddWithValue(
                "@ImageName",
                imageName);

            cmd.Parameters.AddWithValue(
                "@LinkURL",
                txtLinkURL.Text.Trim());

            cmd.Parameters.AddWithValue(
                "@Status",
                ddlStatus.SelectedValue);

            cmd.Parameters.AddWithValue(
                "@BannerID",
                bannerID);

            cmd.ExecuteNonQuery();

            lblMessage.ForeColor = Color.Green;
            lblMessage.Text = "Banner updated successfully.";
        }

        con.Close();

        ClearForm();
        LoadBanners();
    }

    protected void btnEdit_Command(
        object sender,
        CommandEventArgs e)
    {
        int id =
            Convert.ToInt32(
                e.CommandArgument);

        SqlCommand cmd =
            new SqlCommand(
            "SELECT * FROM Banner WHERE BannerID=@ID",
            con);

        cmd.Parameters.AddWithValue(
            "@ID",
            id);

        con.Open();

        SqlDataReader dr =
            cmd.ExecuteReader();

        if (dr.Read())
        {
            hfBannerID.Value =
                dr["BannerID"].ToString();

            ddlBannerSection.SelectedValue =
                dr["BannerSection"].ToString();

            ddlBannerType.SelectedValue =
                dr["BannerType"].ToString();

            txtSubtitle.Text =
                dr["Subtitle"].ToString();

            txtTitle.Text =
                dr["Title"].ToString();

            txtOfferText.Text =
                dr["OfferText"].ToString();

            txtLinkURL.Text =
                dr["LinkURL"].ToString();

            ddlStatus.SelectedValue =
                dr["Status"].ToString();

            string img =
                dr["ImageName"].ToString();

            if (!string.IsNullOrEmpty(img))
            {
                imgExisting.Visible = true;

                imgExisting.ImageUrl =
                    "~/Admin/Uploads/Banners/" + img;
            }

            btnSave.Text =
                "Update Banner";
        }

        dr.Close();
        con.Close();

        ScriptManager.RegisterStartupScript(
            this,
            GetType(),
            "toggle",
            "toggleBannerFields();",
            true);
    }

    protected void btnDelete_Command(
        object sender,
        CommandEventArgs e)
    {
        int id =
            Convert.ToInt32(
                e.CommandArgument);

        string imageName = "";

        SqlCommand cmdImg =
            new SqlCommand(
            "SELECT ImageName FROM Banner WHERE BannerID=@ID",
            con);

        cmdImg.Parameters.AddWithValue(
            "@ID",
            id);

        con.Open();

        imageName =
            Convert.ToString(
                cmdImg.ExecuteScalar());

        con.Close();

        if (!string.IsNullOrEmpty(imageName))
        {
            string path =
                Server.MapPath(
                "~/Admin/Uploads/Banners/" +
                imageName);

            if (File.Exists(path))
            {
                File.Delete(path);
            }
        }

        SqlCommand cmd =
            new SqlCommand(
            "DELETE FROM Banner WHERE BannerID=@ID",
            con);

        cmd.Parameters.AddWithValue(
            "@ID",
            id);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        LoadBanners();
    }

    protected void btnSearch_Click(
        object sender,
        EventArgs e)
    {
        LoadBanners();
    }

    protected void btnCancel_Click(
        object sender,
        EventArgs e)
    {
        ClearForm();
    }
}
