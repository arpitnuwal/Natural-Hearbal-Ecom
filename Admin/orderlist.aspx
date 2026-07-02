<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="orderlist.aspx.cs" Inherits="orderlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <main class="main-content">

     <div class="page-header d-flex flex-wrap align-items-start justify-content-between gap-3">
        <div>
            <h1>Order Management</h1>
            <ul class="breadcrumb mt-1">
                <li><a href="#">Home</a></li>
                <li><a href="#">Dashboard</a></li>
                <li>Order</li>
            </ul>
        </div>
    </div>
<div class="search-filter-bar" style="display:flex;flex-wrap:wrap;gap:10px;align-items:end;">

    <!-- Order No -->
    <div>
        <label>Order No</label>
        <asp:TextBox ID="txtOrderNo"
            runat="server"
            CssClass="form-control"
            placeholder="Order No"></asp:TextBox>
    </div>

    <!-- Customer Name -->
    <div>
        <label>Customer Name</label>
        <asp:TextBox ID="txtCustomer"
            runat="server"
            CssClass="form-control"
            placeholder="Customer Name"></asp:TextBox>
    </div>

    <!-- From Date -->
    <div>
        <label>From Date</label>
        <asp:TextBox ID="txtFromDate"
            runat="server"
            CssClass="form-control"
            TextMode="Date"></asp:TextBox>
    </div>

    <!-- To Date -->
    <div>
        <label>To Date</label>
        <asp:TextBox ID="txtToDate"
            runat="server"
            CssClass="form-control"
            TextMode="Date"></asp:TextBox>
    </div>

    <!-- Order Status -->
    <div>
        <label>Order Status</label>
        <asp:DropDownList ID="DropDownList1"
            runat="server"
            CssClass="form-select">

            <asp:ListItem Value="">All</asp:ListItem>
            <asp:ListItem>Pending</asp:ListItem>
            <asp:ListItem>Processing</asp:ListItem>
            <asp:ListItem>Shipped</asp:ListItem>
            <asp:ListItem>Delivered</asp:ListItem>
            <asp:ListItem>Cancelled</asp:ListItem>

        </asp:DropDownList>
    </div>

    <!-- Search -->
    <div>
        <asp:Button ID="btnSearch"
            runat="server"
            Text="Search"
            CssClass="btn btn-primary"
            OnClick="btnSearch_Click" />
    </div>

    <!-- Reset -->
    <div>
        <asp:Button ID="btnReset"
            runat="server"
            Text="Reset"
            CssClass="btn btn-secondary"
            OnClick="btnReset_Click" />
    </div>

</div>

    <div class="row g-3">

    

        <div class="col-12 col-lg-12">

    <div class="panel">

        <div class="panel-header">

            <h5>
                <i class="bi bi-table text-primary"></i>
                All Orders
            </h5>

            <div class="search-filter-bar">

                <div class="search-box">
                    <i class="bi bi-search"></i>

                    <asp:TextBox ID="txtSearch"
                        runat="server"
                        CssClass="form-control"
                   
                        placeholder="Search testimonials...">
                    </asp:TextBox>

                </div>

                <asp:DropDownList ID="ddlStatus"
                    runat="server"
                    CssClass="filter-select"
                  >

                    <asp:ListItem Text="All Status" Value="" />
                    <asp:ListItem Text="Active" Value="1" />
                    <asp:ListItem Text="Inactive" Value="0" />

                </asp:DropDownList>

            </div>

        </div>

        <div style="overflow-x:auto;">

            <table class="custom-table">

                <thead>
    <tr>
        <th>#</th>
        <th>Order No.</th>
        <th>Customer</th>
        <th>Mobile</th>
        <th>Grand Total</th>
        <th>Payment</th>
        <th>Order Status</th>
        <th>Payment Status</th>
        <th>Order Date</th>
        <th style="text-align:center;">Action</th>
    </tr>
</thead>

                <tbody>

<asp:Repeater ID="rptOrders" runat="server">

<ItemTemplate>

<tr>

    <td>
        <%# Container.ItemIndex + 1 %>
    </td>

    <td>
        <strong style="color:#0d6efd;">
            <%# Eval("OrderNo") %>
        </strong>
    </td>

    <td>

        <strong>
            <%# Eval("CustomerName") %>
        </strong>

        <br />

        <small class="text-muted">
            <%# Eval("City") %>, <%# Eval("State") %>
        </small>

    </td>

    <td>
        <%# Eval("MobileNo") %>
    </td>

    <td>

        <strong style="color:#28a745;">
            ₹ <%# Eval("GrandTotal") %>
        </strong>

    </td>

    <td>

        <span class="badge bg-info">
            <%# Eval("PaymentMethod") %>
        </span>

    </td>

    <td>

        <span class='<%#
            Eval("OrderStatus").ToString()=="Delivered"
            ? "badge bg-success"
            : Eval("OrderStatus").ToString()=="Cancelled"
            ? "badge bg-danger"
            : "badge bg-warning text-dark"
            %>'>

            <%# Eval("OrderStatus") %>

        </span>

    </td>

    <td>

        <span class='<%#
            Eval("PaymentStatus").ToString()=="Paid"
            ? "badge bg-success"
            : "badge bg-secondary"
            %>'>

            <%# Eval("PaymentStatus") %>

        </span>

    </td>

    <td>

        <%# Convert.ToDateTime(Eval("OrderDate")).ToString("dd MMM yyyy") %>

    </td>

    <td style="text-align:center;">

        <a href='OrderDetails.aspx?id=<%# Eval("OrderID") %>'
            class="btn btn-sm btn-primary">

            <i class="bi bi-eye"></i>

        </a>

    </td>

</tr>

</ItemTemplate>

</asp:Repeater>

</tbody>

            </table>

            <div id="emptyState"
                runat="server"
                visible="false"
                class="empty-state">

                <i class="bi bi-inbox"></i>
                <p>No Order found.</p>

            </div>

        </div>

        <div style="padding:12px 16px;display:flex;align-items:center;justify-content:space-between;border-top:1px solid var(--border);flex-wrap:wrap;gap:8px;">

            <asp:Label ID="lblCount"
                runat="server"
                Text="0 "
                Style="font-size:.8rem;color:var(--text-muted);" />

        </div>

    </div>

</div>


        </div>
         </main>
</asp:Content>

