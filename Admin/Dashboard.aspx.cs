using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Dashboard : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString);
    ClsConnection Cnn = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        // Session guard
        if (Session["AdminID"] == null)
            Response.Redirect("~/Admin/Login.aspx");

        if (!IsPostBack)
        {
            litAdminName.Text = Session["AdminName"].ToString() ?? "Admin";
            LoadDashboard();
           
        }
    }

    

 

    /// <summary>Returns Bootstrap badge class based on order status string.</summary>
    public string GetStatusClass(string status)
    {
        switch (status.ToLower())
        {
            case "pending": return "badge bg-warning text-dark";
            case "confirmed": return "badge bg-info text-dark";
            case "shipped": return "badge bg-primary";
            case "delivered": return "badge bg-success";
            case "cancelled": return "badge bg-danger";
            default: return "badge bg-secondary";
        }
    }


    private void LoadDashboard()
    {
        Cnn.Open();
        lblTodayOrders.Text = Cnn.ExecuteScalar(@"SELECT COUNT(*) FROM Orders
        WHERE CAST(OrderDate AS DATE)=CAST(GETDATE() AS DATE)").ToString();

        lblTodaySales.Text = Cnn.ExecuteScalar(@"SELECT ISNULL(SUM(GrandTotal),0)
        FROM Orders
        WHERE CAST(OrderDate AS DATE)=CAST(GETDATE() AS DATE)").ToString();

        lblTotalOrders.Text = Cnn.ExecuteScalar("SELECT COUNT(*) FROM Orders").ToString();

        lblTotalRevenue.Text = Cnn.ExecuteScalar(@"SELECT ISNULL(SUM(GrandTotal),0)
        FROM Orders").ToString();

        lblPending.Text = Cnn.ExecuteScalar(@"SELECT COUNT(*) FROM Orders
        WHERE OrderStatus='Pending'").ToString();

        lblProcessing.Text = Cnn.ExecuteScalar(@"SELECT COUNT(*) FROM Orders
        WHERE OrderStatus='Processing'").ToString();

        lblDelivered.Text = Cnn.ExecuteScalar(@"SELECT COUNT(*) FROM Orders
        WHERE OrderStatus='Delivered'").ToString();

        lblCancelled.Text = Cnn.ExecuteScalar(@"SELECT COUNT(*) FROM Orders
        WHERE OrderStatus='Cancelled'").ToString();

        lblCOD.Text = Cnn.ExecuteScalar(@"SELECT COUNT(*) FROM Orders
        WHERE PaymentMethod='COD'").ToString();

        lblOnline.Text = Cnn.ExecuteScalar(@"SELECT COUNT(*) FROM Orders
        WHERE PaymentMethod<>'COD'").ToString();

        lblPaid.Text = Cnn.ExecuteScalar(@"SELECT COUNT(*) FROM Orders
        WHERE PaymentStatus='Paid'").ToString();

        lblPendingPayment.Text = Cnn.ExecuteScalar(@"SELECT COUNT(*) FROM Orders
        WHERE PaymentStatus='Pending'").ToString();

        lblMonthOrders.Text = Cnn.ExecuteScalar(@"SELECT COUNT(*) FROM Orders
        WHERE MONTH(OrderDate)=MONTH(GETDATE())
        AND YEAR(OrderDate)=YEAR(GETDATE())").ToString();

        lblMonthSales.Text = Cnn.ExecuteScalar(@"SELECT ISNULL(SUM(GrandTotal),0)
        FROM Orders
        WHERE MONTH(OrderDate)=MONTH(GETDATE())
        AND YEAR(OrderDate)=YEAR(GETDATE())").ToString();

        lblCustomers.Text = Cnn.ExecuteScalar(@"SELECT COUNT(DISTINCT UserID)
        FROM Orders").ToString();

        decimal totalSale = Convert.ToDecimal(Cnn.ExecuteScalar(@"SELECT ISNULL(SUM(GrandTotal),0)
        FROM Orders"));

        int totalOrder = Convert.ToInt32(Cnn.ExecuteScalar(@"SELECT COUNT(*)
        FROM Orders"));



        lblCategory.Text = Cnn.ExecuteScalar("SELECT COUNT(*) FROM Categories").ToString();

        lblSubCategory.Text = Cnn.ExecuteScalar("SELECT COUNT(*) FROM SubCategories ").ToString();

        lblProduct.Text = Cnn.ExecuteScalar("SELECT COUNT(*) FROM Products").ToString();

        lblBrand.Text = Cnn.ExecuteScalar("SELECT COUNT(*) FROM Brands").ToString();
        Cnn.Close();
        if (totalOrder > 0)
            lblAverage.Text = (totalSale / totalOrder).ToString("0.00");
        else
            lblAverage.Text = "0";
    }
}