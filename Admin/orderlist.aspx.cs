using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class orderlist : System.Web.UI.Page
{
    ClsConnection Cnn = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        BindOrders();
    }
    private void BindOrders()
    {
        string sql = @"SELECT *
                   FROM Orders
                   WHERE 1=1 ";

        if (txtOrderNo.Text.Trim() != "")
            sql += " AND OrderNo LIKE '%" + txtOrderNo.Text.Trim() + "%'";

        if (txtCustomer.Text.Trim() != "")
            sql += " AND CustomerName LIKE '%" + txtCustomer.Text.Trim() + "%'";

        if (ddlStatus.SelectedValue != "")
            sql += " AND OrderStatus='" + ddlStatus.SelectedValue + "'";

        if (txtFromDate.Text != "")
            sql += " AND CAST(OrderDate AS DATE)>='" + txtFromDate.Text + "'";

        if (txtToDate.Text != "")
            sql += " AND CAST(OrderDate AS DATE)<='" + txtToDate.Text + "'";

        sql += " ORDER BY OrderID DESC";

        DataTable dt = Cnn.FillTable(sql, "Orders");

        rptOrders.DataSource = dt;
        rptOrders.DataBind();

        lblCount.Text = dt.Rows.Count + " Orders";
        emptyState.Visible = dt.Rows.Count == 0;
    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        txtOrderNo.Text = "";
        txtCustomer.Text = "";
        txtFromDate.Text = "";
        txtToDate.Text = "";
        ddlStatus.SelectedIndex = 0;

        BindOrders();
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindOrders();
    }
}