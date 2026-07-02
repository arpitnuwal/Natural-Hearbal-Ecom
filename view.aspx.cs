using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class view : System.Web.UI.Page
{
    ClsConnection Cnn = new ClsConnection();
    public static int price = 0, discount = 0, netamount = 0, tdiscount = 0;
    public static string metaimg1 = "", metaimg2 = "", metaimg3 = "", metaimg4 = "", outofstock = " In stock";
    public static string img1 = "hidden", img2 = "hidden", img3 = "hidden", img4 = "hidden", img5 = "hidden", img6 = "hidden", variant = "", cartcolor = "0", cartvariant = "-1";
    public static string ShortDescription="",categoryname = "", sizeid = "", productname = "", colorname = "", qty = "", brand = "", Description = "", sale = "", active = "", visit = "", categoryid = "", shortDescription = "";
    public static string pid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Page.RouteData.Values["productname"] == null)
        {
            Response.Redirect("index.aspx");
        }
      
        if (this.Page.RouteData.Values["productname"] == null)
        {
            Response.Redirect("index.aspx");
        }
        string route = this.Page.RouteData.Values["productname"].ToString();
        Cnn.Open();
        pid = Cnn.ExecuteScalar("select ProductID  from products where ProductLink='" + route + "'").ToString();
        Cnn.Close();

        list();

        if (Request.Cookies["UserInfofloraherbals"] != null)
        {
            HttpCookie userCookie = Request.Cookies["UserInfofloraherbals"];

            string userId = userCookie["UserID"];
            string userName = userCookie["UserName"];
            Session["UserId"] = userCookie["UserID"];
          
        }
    }


    public void list()
    {
        Cnn.Open();
        DataTable Dtt = Cnn.FillTable("select* from Products  where productid=" + pid + "", "Detail");
        categoryid = Dtt.Rows[0]["categoryid"].ToString();
        categoryname = Cnn.ExecuteScalar("select CategoryName from Categories where CategoryID=" + categoryid + "").ToString();
        brand = Cnn.ExecuteScalar("select BrandName from brands where BrandID=" + Dtt.Rows[0]["BrandID"].ToString() + "").ToString();
        productname = Dtt.Rows[0]["productname"].ToString();

        ShortDescription = Dtt.Rows[0]["ShortDescription"].ToString();
        price = Convert.ToInt32(Dtt.Rows[0]["price"]);
        discount = Convert.ToInt32(Dtt.Rows[0]["discount"]);
        discountdiv.Visible = false;
        if (Convert.ToInt32(Dtt.Rows[0]["discount"]) > 0)
        {
            discountdiv.Visible = true;
        }

        string MetaTitle = Dtt.Rows[0]["MetaTitle"].ToString();
        string MetaKeywords = Dtt.Rows[0]["MetaKeywords"].ToString();
        string MetaDescription = Dtt.Rows[0]["MetaDescription"].ToString();

        qty = "10";

        int Quantity = Convert.ToInt32(qty);
        if (Quantity > 10)
        {
            for (int i = 1; i <= 10; i++)
            {
                DDQuantity.Items.Add(Convert.ToString(i));
            }
        }
        else
        {
            for (int i = 1; i <= Quantity; i++)
            {
                DDQuantity.Items.Add(Convert.ToString(i));
            }

        }
        outofstock = "In stock";
        if (Quantity == 0)
        {
            outofstock = "Out Of Stock";
        }


        DataTable addt = Cnn.FillTable("select * from [ProductImages] where ProductID=" + pid + "", "Detail");

        img2 = "hidden"; img3 = "hidden"; img4 = "hidden"; img5 = "hidden"; img6 = "hidden";
        if (addt.Rows.Count > 0)
            img1 = addt.Rows[0]["ImagePath"].ToString();

        if (addt.Rows.Count > 1)
            img2 = addt.Rows[1]["ImagePath"].ToString();

        if (addt.Rows.Count > 2)
            img3 = addt.Rows[2]["ImagePath"].ToString();

        if (addt.Rows.Count > 3)
            img4 = addt.Rows[3]["ImagePath"].ToString();

        if (addt.Rows.Count > 4)
            img5 = addt.Rows[4]["ImagePath"].ToString();

        if (addt.Rows.Count > 5)
            img6 = addt.Rows[5]["ImagePath"].ToString();


        //



        var img11 = "<meta property=\"og:image\" content=\"https://www.floraherbals.com/img/product/" + img1 + "\"  style=\"height:600px;width:600px\"/>";
        var img22 = "<meta property=\"og:image\" content=\"https://www.floraherbals.com/img/product/" + img2 + "\"   style=\"height:600px;width:600px\"/>";
        var img33 = "<meta property=\"og:image\" content=\"https://www.floraherbals.com/img/product/" + img3 + "\"  style=\"height:600px;width:600px\"/>";
        var img44 = "<meta property=\"og:image\" content=\"https://www.floraherbals.com/img/product/" + img4 + "\"  style=\"height:600px;width:600px\"/>";
        var img55 = "<meta property=\"og:image\" content=\"https://www.floraherbals.com/img/product/" + img5 + "\"  style=\"height:600px;width:600px\"/>";
        var img66 = "<meta property=\"og:image\" content=\"https://www.floraherbals.com/img/product/" + img6 + "\"  style=\"height:600px;width:600px\"/>";


        var titlet = "<meta property=\"og:title\" content=\"" + MetaTitle + "/>";
        var desc = "<meta property=\"og:description\" content=\"" + MetaDescription + "/>";
        //  litMeta.Text =  titlet + desc+img11+img22+img33+img44+img55+img66;

        string newsid = "78", image = "", heading = productname;
        //
        //new
        string url = "https://www.floraherbals.com/viewproduct.aspx?id=" + pid;

        Page.MetaKeywords = MetaKeywords.ToString();
        Page.MetaDescription = MetaDescription;



        var ogtitle = "<meta property=\"og:title\" content=\"" + MetaTitle + "\"/>";
        var ogdescription = "<meta property=\"og:description\" content=\"" + MetaDescription + "\"/>";
        var ogurl = "<meta property=\"og:url\" content=\"" + url + "\"/>";
        var ogimage = "<meta property=\"og:image\" content=\"https://www.floraherbals.com/img/product/" + img1 + "\"   style=\"height:1000px;width:1920px\"/>";



        Literal1.Text = img11 + img22 + img33 + img44 + img55 + img66;



        litMeta.Text = ogtitle + ogdescription + ogurl;

        //




        Description = MetaDescription;

        Page.Title = MetaTitle + "- floraherbals.com";

        string Tags = MetaTitle + "- floraherbals.com";
        var title = "<meta property=\"og:title\" content=\"" + Tags + "\"/>";

        litMeta.Text = title + metaimg1 + metaimg2 + metaimg3 + metaimg4;


 





        Cnn.Close();


        DataTable dtlstproduct2 = Cnn.FillTable("select top 10 ProductID,  SUBSTRING(ProductName, 1, 20) AS ProductName,ProductLink,Price,Discount ,(select top 1 imagepath from ProductImages where ProductID= Products.ProductID order by ProductID) as img1 from Products order by newid()", "Detail");
        lstbestdeal.DataSource = dtlstproduct2;
        lstbestdeal.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Cnn.Open();
        int ID = Convert.ToInt32(Cnn.ExecuteScalar("Select  IsNull(Max(id)+1,1) From [TrnCart]"));


        if (Session["userid"] == null)
        {
            if (Request.Cookies["floraherbalscart"] == null || Request.Cookies["floraherbalscart"].Value == "")
            {
                string trncartid = Cnn.ExecuteScalar("Select  IsNull(Max(CartId)+1,1) From [TrnCart]").ToString();
                Response.Cookies["floraherbalscart"].Value = trncartid;
                Request.Cookies["floraherbalscart"].Expires = DateTime.Now.AddDays(30);
                Cnn.ExecuteNonQuery("insert into trncart (Id,CartId,UserId,ProductId,Quantity,Size,Color,ActiveStatus,RTS) values (" + ID + "," + trncartid + ",0," + pid + "," + DDQuantity.SelectedValue + "," + cartvariant + "," + cartcolor + ",1,GetDate())");
                //  Response.Write("<script LANGUAGE='JavaScript' >alert('Item Added In Cart')</script>");
                Response.Redirect("Cart.aspx");
            }
            else
            {

                if (IsRecordAlreadyExist() == false)
                {
                    Request.Cookies["floraherbalscart"].Expires = DateTime.Now.AddDays(30);
                    Cnn.ExecuteNonQuery("insert into trncart (Id,CartId,UserId,ProductId,Quantity,Size,Color,ActiveStatus,RTS) values (" + ID + "," + Request.Cookies["floraherbalscart"].Value + ",0," + pid + "," + DDQuantity.SelectedValue + "," + cartvariant + "," + cartcolor + ",1,GetDate())");
                    // Response.Write("<script LANGUAGE='JavaScript' >alert('Item Added In Cart')</script>");
                    Response.Redirect("Cart.aspx");
                }
                else
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Item Already In Cart')</script>");
                }
            }
        }
        else
        {
            if (Request.Cookies["floraherbalscart"] == null || Request.Cookies["floraherbalscart"].Value == "")
            {
                string trncartid = Cnn.ExecuteScalar("Select  IsNull(Max(CartId)+1,1) From [TrnCart]").ToString();
                Response.Cookies["floraherbalscart"].Value = trncartid;
                Request.Cookies["floraherbalscart"].Expires = DateTime.Now.AddDays(30);
                Cnn.ExecuteNonQuery("insert into trncart (Id,CartId,UserId,ProductId,Quantity,Size,Color,ActiveStatus,RTS) values (" + ID + "," + trncartid + "," + Session["userid"] + "," + pid + "," + DDQuantity.SelectedValue + "," + cartvariant + "," + cartcolor + ",1,GetDate())");
                //  Response.Write("<script LANGUAGE='JavaScript' >alert('Item Added In Cart')</script>");
                Response.Redirect("Cart.aspx");
            }
            else
            {

                if (IsRecordAlreadyExist() == false)
                {
                    Request.Cookies["floraherbalscart"].Expires = DateTime.Now.AddDays(30);
                    Cnn.ExecuteNonQuery("insert into trncart (Id,CartId,UserId,ProductId,Quantity,Size,Color,ActiveStatus,RTS) values (" + ID + "," + Request.Cookies["floraherbalscart"].Value + "," + Session["userid"] + "," + pid + "," + DDQuantity.SelectedValue + "," + cartvariant + "," + cartcolor + ",1,GetDate())");
                    // Response.Write("<script LANGUAGE='JavaScript' >alert('Item Added In Cart')</script>");
                    Response.Redirect("Cart.aspx");
                }
                else
                {
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Item Already In Cart')</script>");
                }
            }

        }

        Cnn.Close();
    }


    private bool IsRecordAlreadyExist()
    {
        try
        {
            Cnn.Open();
            String Sql = "Select Count(*) From TrnCart Where ProductID='" + pid + "' And Id='" + Request.Cookies["floraherbalscart"].Value + "'";
            int Count = Convert.ToInt32(Cnn.ExecuteScalar(Sql).ToString());

            if (Count > 0)
                return true;

            else
                return false;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        if (Session["userid"] == null)
        {
            lblshow.Text = "Please Login first..."; return;
        }
        Cnn.Open();
        string trncartid = Cnn.ExecuteScalar("Select  IsNull(Max(CartId)+1,1) From [wishlist]").ToString();
        Cnn.ExecuteNonQuery("insert into wishlist (Id,CartId,UserId,ProductId,RTS) values (" + trncartid + "," + trncartid + "," + Session["userid"] + "," + pid + ",GetDate())");
        Cnn.Close();
        Response.Redirect("wishlist.aspx");
    }
}