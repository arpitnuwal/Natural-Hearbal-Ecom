<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OrderDetails.aspx.cs" Inherits="OrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  <br /><br /><br />
    <asp:ListView ID="lvOrder" runat="server">

<ItemTemplate>

<div style="width:95%;max-width:1100px;margin:auto;font-family:Arial;">

<h2>
<i class="fa fa-file-invoice"></i> Order Details
</h2>

<div style="background:#fff;border:1px solid #ddd;border-radius:8px;padding:20px;">

<div style="display:flex;justify-content:space-between;flex-wrap:wrap;">

<div>
<b>Order No</b><br />
<%# Eval("OrderNo") %>
</div>

<div>
<b>Order Date</b><br />
<%# Convert.ToDateTime(Eval("OrderDate")).ToString("dd MMM yyyy") %>
</div>

<div>
<b>Status</b><br />

<span style="background:#d4edda;color:#155724;padding:5px 15px;border-radius:20px;">
<%# Eval("OrderStatus") %>
</span>

</div>

</div>

<hr />

<h3>Shipping Address</h3>

<b><%# Eval("CustomerName") %></b><br />

<%# Eval("MobileNo") %><br />

<%# Eval("Email") %><br />

<%# Eval("Address") %><br />

<%# Eval("City") %>,
<%# Eval("State") %> -
<%# Eval("Pincode") %><br />

<%# Eval("Country") %>

<hr />

<h3>Products</h3>

<asp:ListView ID="lvProducts" runat="server">

<LayoutTemplate>

<table style="width:100%;border-collapse:collapse;">

<tr style="background:#f8f8f8;">

<th style="padding:12px;border:1px solid #ddd;">Image</th>

<th style="padding:12px;border:1px solid #ddd;">Product</th>

<th style="padding:12px;border:1px solid #ddd;">Price</th>

<th style="padding:12px;border:1px solid #ddd;">Qty</th>

<th style="padding:12px;border:1px solid #ddd;">Total</th>

</tr>

<tr id="itemPlaceholder" runat="server"></tr>

</table>

</LayoutTemplate>

<ItemTemplate>

<tr>

<td style="border:1px solid #ddd;padding:10px;text-align:center;">

<img src='Admin/Uploads/Products/<%# Eval("Image") %>' width="70" />

</td>

<td style="border:1px solid #ddd;padding:10px;">

<%# Eval("ProductName") %>

</td>

<td style="border:1px solid #ddd;padding:10px;">

₹ <%# Eval("Price") %>

</td>

<td style="border:1px solid #ddd;padding:10px;">

<%# Eval("Qty") %>

</td>

<td style="border:1px solid #ddd;padding:10px;">

₹ <%# Convert.ToDecimal(Eval("Price")) * Convert.ToInt32(Eval("Qty")) %>

</td>

</tr>

</ItemTemplate>

</asp:ListView>

<div style="margin-top:20px;text-align:right;">

<h2 style="color:#28a745;">

Grand Total :
₹ <%# Eval("GrandTotal") %>

</h2>

</div>

</div>

</div>

</ItemTemplate>

</asp:ListView>
</asp:Content>

