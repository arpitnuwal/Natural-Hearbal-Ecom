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
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadOrder();
        }
    }

    void LoadOrder()
    {
        SqlConnection con = new SqlConnection(@"Data Source=mssql2019.adnshost.com,1633; Database=distacart; User id=distacart; password=Future@2575;Max Pool Size=50000");

        string orderid = Request.QueryString["id"];

        //Order

        SqlDataAdapter da = new SqlDataAdapter(
        "select * from Orders where OrderID=@OrderID", con);

        da.SelectCommand.Parameters.AddWithValue("@OrderID", orderid);

        DataTable dt = new DataTable();

        da.Fill(dt);

        lvOrder.DataSource = dt;

        lvOrder.DataBind();


        //Products

        ListView lvProducts =
        (ListView)lvOrder.Items[0].FindControl("lvProducts");

        SqlDataAdapter da2 = new SqlDataAdapter(@"
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

        da2.SelectCommand.Parameters.AddWithValue("@OrderID", orderid);

        DataTable dt2 = new DataTable();

        da2.Fill(dt2);

        lvProducts.DataSource = dt2;

        lvProducts.DataBind();
    }
}