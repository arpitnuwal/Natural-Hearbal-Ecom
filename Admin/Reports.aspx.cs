using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reports : System.Web.UI.Page
{
    ClsConnection Cnn = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtFromDate.Text = DateTime.Now.AddMonths(-1).ToString("yyyy-MM-dd");
            txtToDate.Text = DateTime.Now.ToString("yyyy-MM-dd");

            LoadReports();
        }
    }

 

    private void LoadReports()
    {
        Cnn.Open();
        BindCategory();
        BindSubCategory();
        BindBrand();
        BindProduct();
        BindCustomer();
        BindCity();
        Cnn.Close();
    }

    private void BindCategory()
    {
        string sql = @"

SELECT

c.CategoryName,

COUNT(DISTINCT p.ProductID) Products,

ISNULL(SUM(od.Qty),0) Qty,

COUNT(DISTINCT o.OrderID) Orders,

ISNULL(SUM(od.TotalPrice),0) Sales

FROM Categories c

LEFT JOIN Products p
ON c.CategoryID=p.CategoryID

LEFT JOIN OrderDetails od
ON p.ProductID=od.ProductID

LEFT JOIN Orders o
ON od.OrderID=o.OrderID

WHERE

CAST(o.OrderDate AS DATE)

BETWEEN '" + txtFromDate.Text + @"'

AND '" + txtToDate.Text + @"'

GROUP BY c.CategoryName

ORDER BY c.CategoryName";

        DataTable dt = Cnn.FillTable(sql, "Category");

        rptCategory.DataSource = dt;
        rptCategory.DataBind();


        decimal Sale = 0;
        int Qty = 0;
        int Products = 0;
        int Orders = 0;

        foreach (DataRow dr in dt.Rows)
        {
            Sale += Convert.ToDecimal(dr["Sales"]);
            Qty += Convert.ToInt32(dr["Qty"]);
            Products += Convert.ToInt32(dr["Products"]);
            Orders += Convert.ToInt32(dr["Orders"]);
        }

        Label lbl1 = (Label)rptCategory.Controls[rptCategory.Controls.Count - 1].FindControl("lblProductTotal");
        Label lbl2 = (Label)rptCategory.Controls[rptCategory.Controls.Count - 1].FindControl("lblQtyTotal");
        Label lbl3 = (Label)rptCategory.Controls[rptCategory.Controls.Count - 1].FindControl("lblOrderTotal");
        Label lbl4 = (Label)rptCategory.Controls[rptCategory.Controls.Count - 1].FindControl("lblSaleTotal");

        if (lbl1 != null)
        {
            lbl1.Text = Products.ToString();
            lbl2.Text = Qty.ToString();
            lbl3.Text = Orders.ToString();
            lbl4.Text = Sale.ToString("0.00");
        }
    }
    private void BindSubCategory()
    {
        string sql = @"

SELECT

c.CategoryName,
s.SubCategoryName,

COUNT(DISTINCT p.ProductID) Products,

ISNULL(SUM(od.Qty),0) Qty,

COUNT(DISTINCT o.OrderID) Orders,

ISNULL(SUM(od.TotalPrice),0) Sales

FROM SubCategories s

INNER JOIN Categories c
ON s.CategoryID=c.CategoryID

LEFT JOIN Products p
ON s.SubCategoryID=p.SubCategoryID

LEFT JOIN OrderDetails od
ON p.ProductID=od.ProductID

LEFT JOIN Orders o
ON od.OrderID=o.OrderID

WHERE CAST(o.OrderDate AS DATE)

BETWEEN '" + txtFromDate.Text + @"'

AND '" + txtToDate.Text + @"'

GROUP BY

c.CategoryName,
s.SubCategoryName

ORDER BY
c.CategoryName,
s.SubCategoryName";

        DataTable dt = Cnn.FillTable(sql, "SubCategory");

        rptSubCategory.DataSource = dt;
        rptSubCategory.DataBind();
    }

    private void BindBrand()
    {
        string sql = @"

SELECT

b.BrandID,
b.BrandName,
b.BrandLogo,

COUNT(DISTINCT p.ProductID) Products,

ISNULL(SUM(od.Qty),0) Qty,

COUNT(DISTINCT o.OrderID) Orders,

ISNULL(SUM(od.TotalPrice),0) Sales

FROM Brands b

LEFT JOIN Products p
ON b.BrandID=p.BrandID

LEFT JOIN OrderDetails od
ON p.ProductID=od.ProductID

LEFT JOIN Orders o
ON od.OrderID=o.OrderID

WHERE CAST(o.OrderDate AS DATE)

BETWEEN '" + txtFromDate.Text + @"'

AND '" + txtToDate.Text + @"'

GROUP BY

b.BrandID,
b.BrandName,
b.BrandLogo

ORDER BY
b.BrandName";

        DataTable dt = Cnn.FillTable(sql, "Brand");

        rptBrand.DataSource = dt;
        rptBrand.DataBind();
    }

    private void BindProduct()
    {
        string sql = @"

SELECT

p.ProductID,
p.ProductName,
p.ProductLink,
c.CategoryName,
s.SubCategoryName,
b.BrandName,
p.Price,

ISNULL(SUM(od.Qty),0) Qty,

COUNT(DISTINCT o.OrderID) Orders,

ISNULL(SUM(od.TotalPrice),0) Sales

FROM Products p

LEFT JOIN Categories c
ON p.CategoryID=c.CategoryID

LEFT JOIN SubCategories s
ON p.SubCategoryID=s.SubCategoryID

LEFT JOIN Brands b
ON p.BrandID=b.BrandID

LEFT JOIN OrderDetails od
ON p.ProductID=od.ProductID

LEFT JOIN Orders o
ON od.OrderID=o.OrderID

WHERE CAST(o.OrderDate AS DATE)

BETWEEN '" + txtFromDate.Text + @"'

AND '" + txtToDate.Text + @"'

GROUP BY

p.ProductID,
p.ProductName,
p.ProductLink,
c.CategoryName,
s.SubCategoryName,
b.BrandName,
p.Price

ORDER BY p.ProductName";

        DataTable dt = Cnn.FillTable(sql, "Product");

        rptProduct.DataSource = dt;
        rptProduct.DataBind();
    }
    private void BindCustomer()
    {
        string sql = @"

SELECT

CustomerName,
MobileNo,
Email,
City,
Address,

COUNT(OrderID) Orders,

ISNULL(SUM(GrandTotal),0) Amount,

SUM(
CASE
WHEN PaymentStatus='Pending'
THEN GrandTotal
ELSE 0
END
) Pending

FROM Orders

WHERE CAST(OrderDate AS DATE)

BETWEEN '" + txtFromDate.Text + @"'

AND '" + txtToDate.Text + @"'

GROUP BY

CustomerName,
MobileNo,
Email,
City,
Address

ORDER BY CustomerName";

        DataTable dt = Cnn.FillTable(sql, "Customer");

        rptCustomer.DataSource = dt;
        rptCustomer.DataBind();
    }

    private void BindCity()
    {
        string sql = @"

SELECT

City,

COUNT(DISTINCT CustomerName) Customers,

COUNT(OrderID) Orders,

ISNULL(SUM(GrandTotal),0) Sales

FROM Orders

WHERE CAST(OrderDate AS DATE)

BETWEEN '" + txtFromDate.Text + @"'

AND '" + txtToDate.Text + @"'

GROUP BY City

ORDER BY City";

        DataTable dt = Cnn.FillTable(sql, "City");

        dt.Columns.Add("Qty");

        foreach (DataRow dr in dt.Rows)
        {
            string city = dr["City"].ToString();

            object qty = Cnn.ExecuteScalar(@"

SELECT ISNULL(SUM(od.Qty),0)

FROM OrderDetails od

INNER JOIN Orders o

ON od.OrderID=o.OrderID

WHERE o.City='" + city + @"'

AND CAST(o.OrderDate AS DATE)

BETWEEN '" + txtFromDate.Text + @"'

AND '" + txtToDate.Text + "'");

            dr["Qty"] = qty;
        }

        rptCity.DataSource = dt;
        rptCity.DataBind();
    }

    protected void btnExcel_Click(object sender, EventArgs e)
    {
        Response.Clear();

        Response.Buffer = true;

        Response.AddHeader("content-disposition",
        "attachment;filename=SalesReport.xls");

        Response.Charset = "";

        Response.ContentType = "application/vnd.ms-excel";

        System.IO.StringWriter sw = new System.IO.StringWriter();

        HtmlTextWriter hw = new HtmlTextWriter(sw);

        Response.Output.Write(sw.ToString());

        Response.Flush();

        Response.End();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        LoadReports();
    }

    public decimal GetTotal(DataTable dt, string Column)
    {
        decimal Total = 0;

        foreach (DataRow dr in dt.Rows)
        {
            Total += Convert.ToDecimal(dr[Column]);
        }

        return Total;
    }
}