using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class checkout : System.Web.UI.Page
{
    public static decimal TotAmt = 0, Realprice = 0, totaldis = 0, deliverycharge = 0,payorder=0;
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
            Response.Write("User ID: " + userId + "<br/>");
            Response.Write("User Name: " + userName);
        }
        else
        {
            Response.Redirect("login.aspx");
        }


        if (!IsPostBack)
        {
            list(); userinfo();
        }
    }
    public void userinfo()
    {
        DataTable addt = Cnn.FillTable("select * from [Register] where UserID=" + Session["UserId"] + "", "Detail");
        txtname.Text = addt.Rows[0]["FullName"].ToString();
        txtemail.Text = addt.Rows[0]["Email"].ToString();
        txtmobile.Text = addt.Rows[0]["Mobile"].ToString();
        txtaddress.Text = addt.Rows[0]["Address"].ToString();
        txtcity.Text = addt.Rows[0]["City"].ToString();
        txtstate.Text = addt.Rows[0]["State"].ToString();
        txtpincode.Text = addt.Rows[0]["Pincode"].ToString();
        txtcountry.Text = addt.Rows[0]["Country"].ToString();
        txtcompanyname.Text = addt.Rows[0]["companyname"].ToString();   
    
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



        if (Sql_Inner != "")
        {
            Sql = Sql + Sql_Inner;
            Cnn.Open();
            DataTable Dt = Cnn.FillTable(Sql, "Dt");
            lstwishlist.DataSource = Dt;
            lstwishlist.DataBind();
            

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

        payorder = Realprice + deliverycharge;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
      
        SqlConnection con = new SqlConnection(@"Data Source=mssql2019.adnshost.com,1633; Database=distacart; User id=distacart; password=Future@2575;Max Pool Size=50000");



        Cnn.Open();


        string sql = @"UPDATE [Register] SET     FullName='" + txtname.Text.Trim() + "',    Email='" + txtemail.Text.Trim() + "',    Mobile='" + txtmobile.Text.Trim() + "',    Address='" + txtaddress.Text.Trim() + "',    City='" + txtcity.Text.Trim() + "',    State='" + txtstate.Text.Trim() + "',    Pincode='" + txtpincode.Text.Trim() + "',    Country='" + txtcountry.Text.Trim() + "',    companyname='" + txtcompanyname.Text.Trim() + "'WHERE UserID=" + Session["UserId"];

Cnn.ExecuteNonQuery(sql);





        string ordermaxid = Cnn.ExecuteScalar("Select  IsNull(Max(orderid)+1,1) From [Orders]").ToString();
            //================= INSERT ORDER =====================
        Cnn.Close();
            string orderNo = "ORD" + DateTime.Now.ToString("yyyyMMddHHmmss");
            con.Open();
            SqlCommand cmdOrder = new SqlCommand(@"
    INSERT INTO Orders
    (
       orderid, OrderNo,UserID,CustomerName,MobileNo,Email,
        copmanyname,Address,City,State,Country,Pincode,
        SubTotal,ShippingCharge,DiscountAmount,TaxAmount,
        GrandTotal,PaymentMethod,PaymentStatus,
        OrderStatus,TransactionID,ordernote
    )
    OUTPUT INSERTED.OrderID
    VALUES
    (
       @orderid, @OrderNo,@UserID,@CustomerName,@MobileNo,@Email,
        @Company,@Address,@City,@State,@Country,@Pincode,
        @SubTotal,@Shipping,@Discount,@Tax,
        @GrandTotal,@PaymentMethod,@PaymentStatus,
        @OrderStatus,@TransactionID,@OrderNote
    )", con);
            cmdOrder.Parameters.AddWithValue("@orderid", ordermaxid);
            cmdOrder.Parameters.AddWithValue("@OrderNo", orderNo);
            cmdOrder.Parameters.AddWithValue("@UserID", Session["UserId"]);
            cmdOrder.Parameters.AddWithValue("@CustomerName", txtname.Text);
            cmdOrder.Parameters.AddWithValue("@MobileNo", txtmobile.Text);
            cmdOrder.Parameters.AddWithValue("@Email", txtemail.Text);
            cmdOrder.Parameters.AddWithValue("@Company", txtcompanyname.Text);
            cmdOrder.Parameters.AddWithValue("@Address", txtaddress.Text);
            cmdOrder.Parameters.AddWithValue("@City", txtcity.Text);
            cmdOrder.Parameters.AddWithValue("@State", txtstate.Text);
            cmdOrder.Parameters.AddWithValue("@Country", txtcountry.Text);
            cmdOrder.Parameters.AddWithValue("@Pincode", txtpincode.Text);

            cmdOrder.Parameters.AddWithValue("@SubTotal", Realprice);
            cmdOrder.Parameters.AddWithValue("@Shipping", deliverycharge);
            cmdOrder.Parameters.AddWithValue("@Discount", 0);
            cmdOrder.Parameters.AddWithValue("@Tax", 0);
            cmdOrder.Parameters.AddWithValue("@GrandTotal", payorder);

            cmdOrder.Parameters.AddWithValue("@PaymentMethod", "COD");
            cmdOrder.Parameters.AddWithValue("@PaymentStatus", "Pending");
            cmdOrder.Parameters.AddWithValue("@OrderStatus", "Pending");
            cmdOrder.Parameters.AddWithValue("@TransactionID", "");
            cmdOrder.Parameters.AddWithValue("@OrderNote", txtordernote.Text);



            cmdOrder.ExecuteNonQuery();

            //================= CART DATA =====================

            SqlCommand cmdCart = new SqlCommand(@"
    SELECT
        ((a.Price*b.Quantity)-(a.Discount*b.Quantity)) TotalAmount,
        a.ProductID,
        a.ProductName,
        a.Price,
        b.Quantity
    FROM Products a
    INNER JOIN TrnCart b
    ON a.ProductID=b.ProductID
    WHERE b.UserID=@UserID", con);

            cmdCart.Parameters.AddWithValue("@UserID", Session["UserId"]);

            SqlDataAdapter da = new SqlDataAdapter(cmdCart);
            DataTable dt = new DataTable();
            da.Fill(dt);


            //================= INSERT ORDER DETAILS =====================

            foreach (DataRow dr in dt.Rows)
            {
                SqlCommand cmdDetail = new SqlCommand(@"
        INSERT INTO OrderDetails
        (
            OrderID,
            ProductID,
            ProductName,
            Price,
            Qty
          
        )
        VALUES
        (
            @OrderID,
            @ProductID,
            @ProductName,
            @Price,
            @Qty
         
        )", con);

                cmdDetail.Parameters.AddWithValue("@OrderID", ordermaxid);
                cmdDetail.Parameters.AddWithValue("@ProductID", dr["ProductID"]);
                cmdDetail.Parameters.AddWithValue("@ProductName", dr["ProductName"]);
                cmdDetail.Parameters.AddWithValue("@Price", dr["Price"]);
                cmdDetail.Parameters.AddWithValue("@Qty", dr["Quantity"]);
              //  cmdDetail.Parameters.AddWithValue("@TotalPrice", dr["TotalAmount"]);

                cmdDetail.ExecuteNonQuery();
            }


            //================= EMPTY CART =====================

            SqlCommand cmdDelete = new SqlCommand(
                "DELETE FROM TrnCart WHERE UserID=@UserID",
                con);
            cmdDelete.Parameters.AddWithValue("@UserID", Session["UserId"]);
           cmdDelete.ExecuteNonQuery();


            

            Response.Write("Order Placed Successfully.");
      

        Cnn.Close();

        Response.Redirect("ordersuccess.aspx?orderid="+orderNo+"");
    }
}
