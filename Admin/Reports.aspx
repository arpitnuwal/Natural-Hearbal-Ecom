<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <main class="main-content">

<div class="page-header d-flex justify-content-between align-items-center">

    <div>

        <h1>Sales Reports</h1>

        <ul class="breadcrumb mt-1">
            <li><a href="Dashboard.aspx">Home</a></li>
            <li>Reports</li>
        </ul>

    </div>

</div>


<div class="panel">

<div class="panel-header">

<div class="row w-100">

<div class="col-md-3">

<label><b>From Date</b></label>

<asp:TextBox
ID="txtFromDate"
runat="server"
TextMode="Date"
CssClass="form-control">
</asp:TextBox>

</div>


<div class="col-md-3">

<label><b>To Date</b></label>

<asp:TextBox
ID="txtToDate"
runat="server"
TextMode="Date"
CssClass="form-control">
</asp:TextBox>

</div>


<div class="col-md-6">

<label>&nbsp;</label>

<div>

<asp:Button
ID="btnSearch"
runat="server"
Text="Search"
CssClass="btn btn-primary"
OnClick="btnSearch_Click"/>

<asp:Button
ID="btnPrint"
runat="server"
Text="Print"
CssClass="btn btn-success"
OnClientClick="window.print();return false;"/>



</div>

</div>

</div>

</div>


<div class="panel-body">

<ul class="nav nav-tabs">

<li class="nav-item">

<a class="nav-link active"
data-bs-toggle="tab"
href="#Category">

<i class="bi bi-grid-fill"></i>

Category Report

</a>

</li>

<li class="nav-item">

<a class="nav-link"
data-bs-toggle="tab"
href="#SubCategory">

SubCategory

</a>

</li>

<li class="nav-item">

<a class="nav-link"
data-bs-toggle="tab"
href="#Brand">

Brand

</a>

</li>

<li class="nav-item">

<a class="nav-link"
data-bs-toggle="tab"
href="#Product">

Product

</a>

</li>

<li class="nav-item">

<a class="nav-link"
data-bs-toggle="tab"
href="#Customer">

Customer

</a>

</li>

<li class="nav-item">

<a class="nav-link"
data-bs-toggle="tab"
href="#City">

City

</a>

</li>

<li class="nav-item">

<a class="nav-link"
data-bs-toggle="tab"
href="#Order">

Orders

</a>

</li>

</ul>

<div class="tab-content mt-4">
    <div class="tab-pane fade show active" id="Category">

<div style="overflow:auto;">

<table class="custom-table">

<thead>

<tr>

<th>#</th>

<th>Category</th>

<th>Total Products</th>

<th>Qty Sold</th>

<th>Total Orders</th>

<th>Total Sales</th>

</tr>

</thead>

<tbody>

<asp:Repeater
ID="rptCategory"
runat="server">

<ItemTemplate>

<tr>

<td>

<%# Container.ItemIndex+1 %>

</td>

<td>

<b>

<%# Eval("CategoryName") %>

</b>

</td>

<td>

<%# Eval("Products") %>

</td>

<td>

<%# Eval("Qty") %>

</td>

<td>

<%# Eval("Orders") %>

</td>

<td>

<b style="color:green;">

₹ <%# Eval("Sales") %>

</b>

</td>

</tr>

</ItemTemplate>

<FooterTemplate>

<tr style="background:#f5f5f5;font-weight:bold;">

<td colspan="2">

Grand Total

</td>

<td>

<asp:Label
ID="lblProductTotal"
runat="server"/>

</td>

<td>

<asp:Label
ID="lblQtyTotal"
runat="server"/>

</td>

<td>

<asp:Label
ID="lblOrderTotal"
runat="server"/>

</td>

<td>

₹

<asp:Label
ID="lblSaleTotal"
runat="server"/>

</td>

</tr>

</FooterTemplate>

</asp:Repeater>

</tbody>

</table>

</div>

</div>
    </div>

</div>

</div>

<div class="tab-pane fade" id="SubCategory">

<div style="overflow:auto;">

<table class="custom-table">

<thead>

<tr>

<th>#</th>

<th>Category</th>

<th>Sub Category</th>

<th>Total Products</th>

<th>Qty Sold</th>

<th>Total Orders</th>

<th>Total Sales</th>

</tr>

</thead>

<tbody>

<asp:Repeater ID="rptSubCategory" runat="server">

<ItemTemplate>

<tr>

<td>
<%# Container.ItemIndex + 1 %>
</td>

<td>
<b><%# Eval("CategoryName") %></b>
</td>

<td>
<%# Eval("SubCategoryName") %>
</td>

<td>
<%# Eval("Products") %>
</td>

<td>
<%# Eval("Qty") %>
</td>

<td>
<%# Eval("Orders") %>
</td>

<td>
<b style="color:green;">
₹ <%# Eval("Sales") %>
</b>
</td>

</tr>

</ItemTemplate>

<FooterTemplate>

<tr style="background:#f8f9fa;font-weight:bold;">

<td colspan="3">
Grand Total
</td>

<td>
<asp:Label ID="lblSubProductTotal" runat="server"></asp:Label>
</td>

<td>
<asp:Label ID="lblSubQtyTotal" runat="server"></asp:Label>
</td>

<td>
<asp:Label ID="lblSubOrderTotal" runat="server"></asp:Label>
</td>

<td>
₹ <asp:Label ID="lblSubSalesTotal" runat="server"></asp:Label>
</td>

</tr>

</FooterTemplate>

</asp:Repeater>

</tbody>

</table>

</div>

</div>

        <div class="tab-pane fade" id="Brand">

<div style="overflow:auto;">

<table class="custom-table">

<thead>

<tr>

<th>#</th>

<th>Brand</th>

<th>Total Products</th>

<th>Qty Sold</th>

<th>Total Orders</th>

<th>Total Sales</th>

</tr>

</thead>

<tbody>

<asp:Repeater ID="rptBrand" runat="server">

<ItemTemplate>

<tr>

<td>
<%# Container.ItemIndex + 1 %>
</td>

<td>

<div style="display:flex;align-items:center;gap:10px;">



<b>
<%# Eval("BrandName") %>
</b>

</div>

</td>

<td>
<%# Eval("Products") %>
</td>

<td>
<%# Eval("Qty") %>
</td>

<td>
<%# Eval("Orders") %>
</td>

<td>

<b style="color:#198754;">

₹ <%# Eval("Sales") %>

</b>

</td>

</tr>

</ItemTemplate>

<FooterTemplate>

<tr style="background:#f8f9fa;font-weight:bold;">

<td colspan="2">

Grand Total

</td>

<td>

<asp:Label ID="lblBrandProductTotal" runat="server"></asp:Label>

</td>

<td>

<asp:Label ID="lblBrandQtyTotal" runat="server"></asp:Label>

</td>

<td>

<asp:Label ID="lblBrandOrderTotal" runat="server"></asp:Label>

</td>

<td>

₹ <asp:Label ID="lblBrandSalesTotal" runat="server"></asp:Label>

</td>

</tr>

</FooterTemplate>

</asp:Repeater>

</tbody>

</table>

</div>

</div>
        <div class="tab-pane fade" id="Product">

<div style="overflow:auto;">

<table class="custom-table">

<thead>

<tr>

<th>#</th>
<th>Product</th>
<th>Category</th>
<th>SubCategory</th>
<th>Brand</th>
<th>Price</th>
<th>Qty Sold</th>
<th>Total Orders</th>
<th>Total Sales</th>

</tr>

</thead>

<tbody>

<asp:Repeater ID="rptProduct" runat="server">

<ItemTemplate>

<tr>

<td>
<%# Container.ItemIndex+1 %>
</td>

<td>

<div style="font-weight:600;">
<%# Eval("ProductName") %>
</div>

<small style="color:#888;">
<%# Eval("ProductLink") %>
</small>

</td>

<td>
<%# Eval("CategoryName") %>
</td>

<td>
<%# Eval("SubCategoryName") %>
</td>

<td>
<%# Eval("BrandName") %>
</td>

<td>

₹ <%# Eval("Price") %>

</td>

<td>

<%# Eval("Qty") %>

</td>

<td>

<%# Eval("Orders") %>

</td>

<td>

<span style="font-weight:bold;color:#198754;">

₹ <%# Eval("Sales") %>

</span>

</td>

</tr>

</ItemTemplate>

<FooterTemplate>

<tr style="background:#f8f9fa;font-weight:bold;">

<td colspan="5">

Grand Total

</td>

<td>

-

</td>

<td>

<asp:Label ID="lblProductQty" runat="server"></asp:Label>

</td>

<td>

<asp:Label ID="lblProductOrders" runat="server"></asp:Label>

</td>

<td>

₹ <asp:Label ID="lblProductSales" runat="server"></asp:Label>

</td>

</tr>

</FooterTemplate>

</asp:Repeater>

</tbody>

</table>

</div>

</div>

        <div class="tab-pane fade" id="Customer">

<div style="overflow:auto;">

<table class="custom-table">

<thead>

<tr>

<th>#</th>

<th>Customer</th>

<th>Mobile</th>

<th>Email</th>

<th>City</th>

<th>Total Orders</th>

<th>Total Amount</th>

<th>Payment Pending</th>

</tr>

</thead>

<tbody>

<asp:Repeater ID="rptCustomer" runat="server">

<ItemTemplate>

<tr>

<td>

<%# Container.ItemIndex+1 %>

</td>

<td>

<div style="font-weight:bold;">

<%# Eval("CustomerName") %>

</div>

<small style="color:#666;">

<%# Eval("Address") %>

</small>

</td>

<td>

<%# Eval("MobileNo") %>

</td>

<td>

<%# Eval("Email") %>

</td>

<td>

<%# Eval("City") %>

</td>

<td>

<%# Eval("Orders") %>

</td>

<td>

<span style="color:#198754;font-weight:bold;">

₹ <%# Eval("Amount") %>

</span>

</td>

<td>

<span class='<%#
Eval("Pending").ToString()=="0"
? "badge bg-success"
: "badge bg-danger"
%>'>

₹ <%# Eval("Pending") %>

</span>

</td>

</tr>

</ItemTemplate>

<FooterTemplate>

<tr style="background:#f8f9fa;font-weight:bold;">

<td colspan="5">

Grand Total

</td>

<td>

<asp:Label ID="lblCustomerOrders" runat="server"></asp:Label>

</td>

<td>

₹ <asp:Label ID="lblCustomerAmount" runat="server"></asp:Label>

</td>

<td>

₹ <asp:Label ID="lblCustomerPending" runat="server"></asp:Label>

</td>

</tr>

</FooterTemplate>

</asp:Repeater>

</tbody>

</table>

</div>

</div>
        <div class="tab-pane fade" id="City">

<div style="overflow:auto;">

<table class="custom-table">

<thead>

<tr>

<th>#</th>
<th>City</th>
<th>Total Customers</th>
<th>Total Orders</th>
<th>Qty Sold</th>
<th>Total Sales</th>

</tr>

</thead>

<tbody>

<asp:Repeater ID="rptCity" runat="server">

<ItemTemplate>

<tr>

<td>
<%# Container.ItemIndex + 1 %>
</td>

<td>

<b style="color:#0d6efd;">
<%# Eval("City") %>
</b>

</td>

<td>

<%# Eval("Customers") %>

</td>

<td>

<%# Eval("Orders") %>

</td>

<td>

<%# Eval("Qty") %>

</td>

<td>

<span style="font-weight:bold;color:#198754;">

₹ <%# Eval("Sales") %>

</span>

</td>

</tr>

</ItemTemplate>

<FooterTemplate>

<tr style="background:#f8f9fa;font-weight:bold;">

<td colspan="2">

Grand Total

</td>

<td>

<asp:Label ID="lblCityCustomers" runat="server"></asp:Label>

</td>

<td>

<asp:Label ID="lblCityOrders" runat="server"></asp:Label>

</td>

<td>

<asp:Label ID="lblCityQty" runat="server"></asp:Label>

</td>

<td>

₹ <asp:Label ID="lblCitySales" runat="server"></asp:Label>

</td>

</tr>

</FooterTemplate>

</asp:Repeater>

</tbody>

</table>

</div>

</div>
        <div class="tab-pane fade" id="Order">

<div style="overflow:auto;">

<table class="custom-table">

<thead>

<tr>

<th>#</th>
<th>Order No</th>
<th>Customer</th>
<th>City</th>
<th>Payment</th>
<th>Payment Status</th>
<th>Order Status</th>
<th>Amount</th>
<th>Date</th>
<th>View</th>

</tr>

</thead>

<tbody>

<asp:Repeater ID="rptOrder" runat="server">

<ItemTemplate>

<tr>

<td>

<%# Container.ItemIndex+1 %>

</td>

<td>

<b style="color:#0d6efd;">

<%# Eval("OrderNo") %>

</b>

</td>

<td>

<div style="font-weight:bold;">

<%# Eval("CustomerName") %>

</div>

<small style="color:#777;">

<%# Eval("MobileNo") %>

</small>

</td>

<td>

<%# Eval("City") %>

</td>

<td>

<span class="badge bg-primary">

<%# Eval("PaymentMethod") %>

</span>

</td>

<td>

<span class='<%#
Eval("PaymentStatus").ToString()=="Paid"
? "badge bg-success"
: "badge bg-warning text-dark"
%>'>

<%# Eval("PaymentStatus") %>

</span>

</td>

<td>

<span class='<%#
Eval("OrderStatus").ToString()=="Delivered"
? "badge bg-success"
: Eval("OrderStatus").ToString()=="Cancelled"
? "badge bg-danger"
: "badge bg-info"
%>'>

<%# Eval("OrderStatus") %>

</span>

</td>

<td>

<span style="font-weight:bold;color:#198754;">

₹ <%# Eval("GrandTotal") %>

</span>

</td>

<td>

<%# Convert.ToDateTime(Eval("OrderDate")).ToString("dd MMM yyyy") %>

</td>

<td>

<a href='OrderDetails.aspx?id=<%# Eval("OrderID") %>'
class="btn btn-sm btn-primary">

<i class="bi bi-eye"></i>

</a>

</td>

</tr>

</ItemTemplate>

<FooterTemplate>

<tr style="background:#f8f9fa;font-weight:bold;">

<td colspan="7">

Grand Total

</td>

<td>

₹ <asp:Label ID="lblOrderSales" runat="server"></asp:Label>

</td>

<td>

<asp:Label ID="lblTotalOrders" runat="server"></asp:Label>

</td>

<td>

&nbsp;

</td>

</tr>

</FooterTemplate>

</asp:Repeater>

</tbody>

</table>

</div>

</div>
</main>
</asp:Content>

