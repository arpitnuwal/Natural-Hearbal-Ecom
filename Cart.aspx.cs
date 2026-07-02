using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cart : System.Web.UI.Page
{
    public static decimal TotAmt = 0, Realprice = 0, totaldis = 0,deliverycharge=0;
    ClsConnection Cnn = new ClsConnection();
    public enum MessageType { Success, Error, Info, Warning };
    string filename;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UserInfofloraherbals"] != null)
        {
            HttpCookie userCookie = Request.Cookies["UserInfofloraherbals"];

            string userId = userCookie["UserID"];
            string userName = userCookie["UserName"];
            Session["UserId"] = userCookie["UserID"];
         
        }
        if (!IsPostBack)
        {
            list();
        }
    }

    public void list()
    {

        string Sql = @"
SELECT
    ((a.Price * b.Quantity) - (a.Discount * b.Quantity)) AS TotalAmount,
    b.ID,
    a.ProductID,
    a.ProductName,a.ProductLink,
    (
        SELECT TOP 1 ImagePath
        FROM ProductImages
        WHERE ProductID = b.ProductID
    ) AS Image,
    a.Price,
    a.Discount,
    b.Quantity
FROM Products a
INNER JOIN TrnCart b
    ON a.ProductID = b.ProductID";
        string Sql_Inner = "";
        if (Session["UserId"] != null)
        {
            Sql_Inner = " Where b.UserId=" + Session["UserId"] + "";
        }


        else
        {
            if (Request.Cookies["floraherbalscart"] != null)
            {
                if (Request.Cookies["floraherbalscart"].Value != null)
                {
                    Sql_Inner = " Where b.CartId=" + Request.Cookies["floraherbalscart"].Value + "";
                }
            }
        }


        if (Sql_Inner != "")
        {
            Sql = Sql + Sql_Inner;
            Cnn.Open();
            DataTable Dt = Cnn.FillTable(Sql, "Dt");
            lstwishlist.DataSource = Dt;
            lstwishlist.DataBind();





            if (lstwishlist.Items.Count == 0)
            {
                nodata.Visible = true;
                data.Visible = false;

            }
            else
            {
                nodata.Visible = false;
                data.Visible = true;
            }
        }

        Cnn.Open();
        TotAmt = 0; Realprice = 0; totaldis = 0;
        for (int i = 0; i < lstwishlist.Items.Count; i++)
        {
            Label lblprice = lstwishlist.Items[i].FindControl("LblTotalAmoun111t") as Label;

            Realprice += Convert.ToDecimal(lblprice.Text);

        }

        if (Convert.ToDecimal(Realprice) > 55)
        {
    deliverycharge = 6.99m;
        
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        LinkButton button = (LinkButton)sender;

        Cnn.Open();
        Cnn.ExecuteNonQuery("delete from  trncart  where id=" + button.CommandArgument + "");

        Cnn.Close();

        Response.Redirect("Cart.aspx");
    }

    protected void DDQuantity_SelectedIndexChanged(object sender, EventArgs e)
    {
        Cnn.Open();
        DropDownList DDQuantity = sender as DropDownList;
        Control item = DDQuantity.Parent.FindControl("id");
        Label lblid = ((Label)item.FindControl("id"));

        Cnn.ExecuteNonQuery("update trncart set Quantity=" + DDQuantity.SelectedValue + " where id=" + lblid.Text + "");

        Cnn.Close();

        Response.Redirect("Cart.aspx");

    }
}