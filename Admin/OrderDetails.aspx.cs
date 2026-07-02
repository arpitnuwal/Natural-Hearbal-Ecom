using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrderDetails : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(@"Data Source=mssql2019.adnshost.com,1633; Database=distacart; User id=distacart; password=Future@2575;Max Pool Size=50000");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                LoadOrder();
                LoadProducts();
            }
        }
    }

    void LoadOrder()
    {
        SqlDataAdapter da = new SqlDataAdapter(
        @"SELECT * FROM Orders
          WHERE OrderID=@OrderID", con);

        da.SelectCommand.Parameters.AddWithValue("@OrderID", Request.QueryString["id"]);

        DataTable dt = new DataTable();
        da.Fill(dt);

        if (dt.Rows.Count > 0)
        {
            lblOrderNo.Text = dt.Rows[0]["OrderNo"].ToString();

            lblOrderDate.Text =
            Convert.ToDateTime(dt.Rows[0]["OrderDate"]).ToString("dd MMM yyyy");

            lblPaymentMethod.Text = dt.Rows[0]["PaymentMethod"].ToString();

            lblPaymentStatus.Text = dt.Rows[0]["PaymentStatus"].ToString();

            ddlStatus.SelectedValue = dt.Rows[0]["OrderStatus"].ToString();

            lblCustomer.Text = dt.Rows[0]["CustomerName"].ToString();

            lblMobile.Text = dt.Rows[0]["MobileNo"].ToString();

            lblEmail.Text = dt.Rows[0]["Email"].ToString();

            lblCompany.Text = dt.Rows[0]["copmanyname"].ToString();

            lblAddress.Text =
                dt.Rows[0]["Address"] + "<br/>" +
                dt.Rows[0]["City"] + ", " +
                dt.Rows[0]["State"] + " - " +
                dt.Rows[0]["Pincode"] + "<br/>" +
                dt.Rows[0]["Country"];

            lblSubTotal.Text = dt.Rows[0]["SubTotal"].ToString();

            lblShipping.Text = dt.Rows[0]["ShippingCharge"].ToString();

            lblGrandTotal.Text = dt.Rows[0]["GrandTotal"].ToString();
        }
    }

    void LoadProducts()
    {
        SqlDataAdapter da = new SqlDataAdapter(@"
        SELECT
            od.*,
            (
        SELECT TOP 1 ImagePath
        FROM ProductImages
        WHERE ProductID = od.ProductID
    ) AS Image
        FROM OrderDetails od
        INNER JOIN Products p
            ON od.ProductID=p.ProductID
        WHERE od.OrderID=@OrderID", con);

        da.SelectCommand.Parameters.AddWithValue("@OrderID", Request.QueryString["id"]);

        DataTable dt = new DataTable();
        da.Fill(dt);

        rptProducts.DataSource = dt;
        rptProducts.DataBind();
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand(
        "UPDATE Orders SET OrderStatus=@Status WHERE OrderID=@OrderID", con);

        cmd.Parameters.AddWithValue("@Status", ddlStatus.SelectedValue);
        cmd.Parameters.AddWithValue("@OrderID", Request.QueryString["id"]);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

        ScriptManager.RegisterStartupScript(this, GetType(),
            "msg",
            "alert('Order Status Updated Successfully');",
            true);

        LoadOrder();
    }
}