using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.IO;
using System.Web.UI.WebControls;

public partial class AddProducts : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCategoryDropdown();
            LoadBrandDropdown();

            if (Request.QueryString["id"] != null)
            {
                LoadProductForEdit(
                    Convert.ToInt32(
                    Request.QueryString["id"]));

                btnSave.Text = "Update Product";
            }
        }
    }

    // ── DROPDOWN LOADERS ────────────────────────────────────────────────────

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

        // Load sub-categories for the selected category (or empty)
        LoadSubCategoryDropdown(ddlCategory.SelectedValue);
    }

    private void LoadSubCategoryDropdown(string categoryId)
    {
        ddlSubCategory.Items.Clear();
        ddlSubCategory.Items.Add(new ListItem("-- Select Sub-Category --", ""));

        if (string.IsNullOrEmpty(categoryId)) return;

        SqlCommand cmd = new SqlCommand(
            "SELECT SubCategoryID, SubCategoryName FROM SubCategories WHERE CategoryID=@CID AND Status=1 ORDER BY SubCategoryName", con);
        cmd.Parameters.AddWithValue("@CID", categoryId);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        ddlSubCategory.DataSource     = dt;
        ddlSubCategory.DataTextField  = "SubCategoryName";
        ddlSubCategory.DataValueField = "SubCategoryID";
        ddlSubCategory.DataBind();
        ddlSubCategory.Items.Insert(0, new ListItem("-- Select Sub-Category --", ""));
    }

    private void LoadBrandDropdown()
    {
        SqlCommand cmd = new SqlCommand(
            "SELECT BrandID, BrandName FROM Brands WHERE Status=1 ORDER BY BrandName", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        ddlBrand.DataSource     = dt;
        ddlBrand.DataTextField  = "BrandName";
        ddlBrand.DataValueField = "BrandID";
        ddlBrand.DataBind();
        ddlBrand.Items.Insert(0, new ListItem("-- Select Brand --", ""));
    }

    // ── CATEGORY CHANGED (cascade sub-category) ─────────────────────────────

    protected void ddlCategory_Changed(object sender, EventArgs e)
    {
        LoadSubCategoryDropdown(ddlCategory.SelectedValue);
    }

    // ── LOAD PRODUCTS GRID ──────────────────────────────────────────────────



    // ── SAVE (INSERT / UPDATE) ──────────────────────────────────────────────

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid) return;

       
        if (string.IsNullOrEmpty(ddlCategory.SelectedValue))
        {
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "msg1",
                "alert('Please select Category');",
                true);
            return;
        }

        if (string.IsNullOrEmpty(ddlSubCategory.SelectedValue))
        {
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "msg2",
                "alert('Please select Sub Category');",
                true);
            return;
        }

        if (string.IsNullOrEmpty(ddlBrand.SelectedValue))
        {
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "msg3",
                "alert('Please select Brand');",
                true);
            return;
        }

        if (string.IsNullOrWhiteSpace(txtProductName.Text))
        {
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "msg4",
                "alert('Please enter Product Name');",
                true);
            return;
        }

        if (string.IsNullOrWhiteSpace(txtPrice.Text))
        {
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "msg5",
                "alert('Please enter Product Price');",
                true);
            return;
        }

        decimal price;

        if (!decimal.TryParse(txtPrice.Text.Trim(), out price))
        {
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "msg7",
                "alert('Please enter valid price (Example: 5, 5.3, 5.30, 100.55)');",
                true);
            return;
        }

        if (price < 0)
        {
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "msg8",
                "alert('Price cannot be negative');",
                true);
            return;
        }




        if (string.IsNullOrEmpty(hfProductID.Value) &&
       !fuImg1.HasFile &&
       !fuImg2.HasFile &&
       !fuImg3.HasFile &&
       !fuImg4.HasFile)
        {
            ClientScript.RegisterStartupScript(
                this.GetType(),
                "msg6",
                "alert('Please upload at least one product image');",
                true);

            return;
        }

        string folder = Server.MapPath("~/Admin/Uploads/Products/");
        if (!Directory.Exists(folder)) Directory.CreateDirectory(folder);

        // Collect the 4 file uploads
        FileUpload[] uploads = { fuImg1, fuImg2, fuImg3, fuImg4 };

        try
        {
            con.Open();

            if (string.IsNullOrEmpty(hfProductID.Value))
            {
                // ── INSERT PRODUCT ──
                SqlCommand cmd = new SqlCommand(
 @"INSERT INTO Products
(
    CategoryID,
    SubCategoryID,
    BrandID,
    ProductName,
    ProductLink,
    Price,
    ShortDescription,
    Description,
    Status,
Discount
)
VALUES
(
    @CatID,
    @SubCatID,
    @BrandID,
    @Name,
    @Link,
    @Price,
    @ShortDesc,
    @Desc,
    @Status,@Discount

);

SELECT SCOPE_IDENTITY();", con);

                cmd.Parameters.AddWithValue("@CatID", ddlCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@SubCatID", ddlSubCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@BrandID", ddlBrand.SelectedValue);
                cmd.Parameters.AddWithValue("@Name", txtProductName.Text.Trim());
                cmd.Parameters.AddWithValue("@Link", txtProductLink.Text.Trim());
                cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(txtPrice.Text.Trim()));
                cmd.Parameters.AddWithValue("@ShortDesc", txtShortDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@Desc", txtDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@Status", chkStatus.Checked);
                cmd.Parameters.AddWithValue("@Discount", Convert.ToDecimal(txtDiscount.Text.Trim()));

                int newId = Convert.ToInt32(cmd.ExecuteScalar());

                // Insert up to 4 images
                SaveImages(newId, uploads, folder, con);
            }
            else
            {
                int productId = Convert.ToInt32(hfProductID.Value);

                // ── UPDATE PRODUCT ──
                SqlCommand cmd = new SqlCommand(
                    @"UPDATE Products
                      SET CategoryID=@CatID, SubCategoryID=@SubCatID, BrandID=@BrandID,
                          ProductName=@Name, ProductLink=@Link, Price=@Price,
                          Description=@Desc, Status=@Status ,ShortDescription=@ShortDesc,Discount='"+txtDiscount.Text+"' WHERE ProductID=@ID", con);

                cmd.Parameters.AddWithValue("@CatID",    ddlCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@SubCatID", ddlSubCategory.SelectedValue);
                cmd.Parameters.AddWithValue(
      "@ShortDesc",
      txtShortDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@BrandID",  ddlBrand.SelectedValue);
                cmd.Parameters.AddWithValue("@Name",     txtProductName.Text.Trim());
                cmd.Parameters.AddWithValue("@Link",     txtProductLink.Text.Trim());
                cmd.Parameters.AddWithValue("@Price",    Convert.ToDecimal(txtPrice.Text.Trim()));
                cmd.Parameters.AddWithValue("@Desc",     txtDescription.Text.Trim());
                cmd.Parameters.AddWithValue("@Status",   chkStatus.Checked);
                cmd.Parameters.AddWithValue("@ID",       productId);
                cmd.ExecuteNonQuery();

                // Replace only uploaded slots
                UpdateImages(productId, uploads, folder, con);
            }
        }
        finally
        {
            if (con.State == ConnectionState.Open) con.Close();
        }

        ClearForm();
        Response.Redirect("Products.aspx");
    }


    /// <summary>Inserts image records for a newly created product (slots 1-4).</summary>
    private void SaveImages(int productId, FileUpload[] uploads, string folder, SqlConnection c)
    {
        for (int i = 0; i < uploads.Length; i++)
        {
            if (!uploads[i].HasFile) continue;

            string fileName = Guid.NewGuid().ToString() +
                              Path.GetExtension(uploads[i].FileName);
            uploads[i].SaveAs(folder + fileName);

            SqlCommand imgCmd = new SqlCommand(
                "INSERT INTO ProductImages (ProductID, ImagePath, SortOrder) VALUES (@PID, @Path, @Sort)", c);
            imgCmd.Parameters.AddWithValue("@PID",  productId);
            imgCmd.Parameters.AddWithValue("@Path", fileName);
            imgCmd.Parameters.AddWithValue("@Sort", i + 1);
            imgCmd.ExecuteNonQuery();
        }
    }

    /// <summary>Updates images for an edited product: replaces slot by SortOrder if new file uploaded.</summary>
    private void UpdateImages(int productId, FileUpload[] uploads, string folder, SqlConnection c)
    {
        for (int i = 0; i < uploads.Length; i++)
        {
            if (!uploads[i].HasFile) continue;

            int sortOrder = i + 1;

            // Get existing image for this slot
            SqlCommand getCmd = new SqlCommand(
                "SELECT ProductImageID, ImagePath FROM ProductImages WHERE ProductID=@PID AND SortOrder=@Sort", c);
            getCmd.Parameters.AddWithValue("@PID",  productId);
            getCmd.Parameters.AddWithValue("@Sort", sortOrder);
            SqlDataReader dr = getCmd.ExecuteReader();

            int    existingId   = 0;
            string existingPath = "";
            if (dr.Read()) { existingId = (int)dr["ProductImageID"]; existingPath = dr["ImagePath"].ToString(); }
            dr.Close();

            // Delete old file
            if (!string.IsNullOrEmpty(existingPath))
            {
                string fullPath = Server.MapPath("~/Admin/Uploads/Products/" + existingPath);
                if (File.Exists(fullPath)) File.Delete(fullPath);
            }

            // Save new file
            string newName = Guid.NewGuid().ToString() + Path.GetExtension(uploads[i].FileName);
            uploads[i].SaveAs(folder + newName);

            if (existingId > 0)
            {
                SqlCommand updCmd = new SqlCommand(
                    "UPDATE ProductImages SET ImagePath=@Path WHERE ProductImageID=@ID", c);
                updCmd.Parameters.AddWithValue("@Path", newName);
                updCmd.Parameters.AddWithValue("@ID",   existingId);
                updCmd.ExecuteNonQuery();
            }
            else
            {
                SqlCommand insCmd = new SqlCommand(
                    "INSERT INTO ProductImages (ProductID, ImagePath, SortOrder) VALUES (@PID, @Path, @Sort)", c);
                insCmd.Parameters.AddWithValue("@PID",  productId);
                insCmd.Parameters.AddWithValue("@Path", newName);
                insCmd.Parameters.AddWithValue("@Sort", sortOrder);
                insCmd.ExecuteNonQuery();
            }
        }
    }

    private void LoadProductForEdit(int id)
    {
        try
        {
            con.Open();

            SqlCommand cmd = new SqlCommand(
                "SELECT * FROM Products WHERE ProductID=@ID",
                con);

            cmd.Parameters.AddWithValue("@ID", id);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                hfProductID.Value = dr["ProductID"].ToString();
                txtProductName.Text = dr["ProductName"].ToString();
                txtProductLink.Text = dr["ProductLink"].ToString();
                txtPrice.Text = dr["Price"].ToString();
                txtDiscount.Text = dr["Discount"].ToString();
                txtShortDescription.Text = dr["ShortDescription"].ToString();
                txtDescription.Text = dr["Description"].ToString();
                chkStatus.Checked = Convert.ToBoolean(dr["Status"]);

                string catId = dr["CategoryID"].ToString();
                string subCatId = dr["SubCategoryID"].ToString();
                string brandId = dr["BrandID"].ToString();

                dr.Close();

                LoadCategoryDropdown();

                SetDropdown(ddlCategory, catId);

                LoadSubCategoryDropdown(catId);

                SetDropdown(ddlSubCategory, subCatId);

                LoadBrandDropdown();

                SetDropdown(ddlBrand, brandId);
            }
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }

        LoadExistingImages(id);
    }

    private void LoadExistingImages(int productId)
    {
        try
        {
            if (con.State == ConnectionState.Open)
                con.Close();

            con.Open();

            SqlCommand cmd = new SqlCommand(
                @"SELECT SortOrder, ImagePath
              FROM ProductImages
              WHERE ProductID=@PID
              ORDER BY SortOrder",
                con);

            cmd.Parameters.AddWithValue("@PID", productId);

            SqlDataReader dr = cmd.ExecuteReader();

            while (dr.Read())
            {
                int sortOrder =
                    Convert.ToInt32(dr["SortOrder"]);

                string img =
                    dr["ImagePath"].ToString();

                string path =
                    ResolveUrl("~/Admin/Uploads/Products/")
                    + img;

                switch (sortOrder)
                {
                    case 1:
                        existImg1Wrap.Visible = true;
                        existImg1.Src = path;
                        break;

                    case 2:
                        existImg2Wrap.Visible = true;
                        existImg2.Src = path;
                        break;

                    case 3:
                        existImg3Wrap.Visible = true;
                        existImg3.Src = path;
                        break;

                    case 4:
                        existImg4Wrap.Visible = true;
                        existImg4.Src = path;
                        break;
                }
            }

            dr.Close();
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
    }

    private void SetDropdown(DropDownList ddl, string value)
    {
        ddl.ClearSelection();

        ListItem item = ddl.Items.FindByValue(value);

        if (item != null)
            item.Selected = true;
    }
    // ── DELETE ──────────────────────────────────────────────────────────────



    // ── HELPER: first image for table thumbnail ──────────────────────────────



    // ── RESET / CLEAR ───────────────────────────────────────────────────────

    protected void btnReset_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/AddProducts.aspx");
    }

    private void ClearForm()
    {
        hfProductID.Value     = "";
        txtProductName.Text   = "";
        txtProductLink.Text   = "";
        txtPrice.Text         = "";
        txtDescription.Text   = "";
        txtShortDescription.Text = "";
        chkStatus.Checked     = true;
        btnSave.Text          = "Save Product";
        existImg1Wrap.Visible = existImg2Wrap.Visible =
        existImg3Wrap.Visible = existImg4Wrap.Visible = false;

        LoadCategoryDropdown();
        LoadBrandDropdown();
    }

    // ── FILTERS ─────────────────────────────────────────────────────────────





}