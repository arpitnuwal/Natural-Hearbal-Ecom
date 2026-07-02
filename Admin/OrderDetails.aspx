<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="OrderDetails.aspx.cs" Inherits="OrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <main class="main-content">

<div class="page-header d-flex justify-content-between align-items-center">

    <div>

        <h1>Order Details</h1>

        <ul class="breadcrumb mt-1">
            <li><a href="Dashboard.aspx">Home</a></li>
            <li><a href="Orders.aspx">Orders</a></li>
            <li>Order Details</li>
        </ul>

    </div>

</div>

        <div style="text-align:right;margin-top:20px;">

    <input type="button"
        value="🖨 Print Invoice"
        onclick="PrintDiv();"
        class="btn btn-success" />

</div>
<div class="row g-3" id="printArea">
    
<!-- Order Information -->
    
<div class="col-lg-6"  >

<div class="panel">

<div class="panel-header">
<h5><i class="bi bi-receipt"></i> Order Information</h5>
</div>

<div class="panel-body">

<table class="table">

<tr>
<td><b>Order No</b></td>
<td><asp:Label ID="lblOrderNo" runat="server" /></td>
</tr>

<tr>
<td><b>Order Date</b></td>
<td><asp:Label ID="lblOrderDate" runat="server" /></td>
</tr>

<tr>
<td><b>Payment Method</b></td>
<td><asp:Label ID="lblPaymentMethod" runat="server" /></td>
</tr>

<tr>
<td><b>Payment Status</b></td>
<td>
<span class="badge bg-success">
<asp:Label ID="lblPaymentStatus" runat="server" />
</span>
</td>
</tr>

<tr>
<td><b>Order Status</b></td>
<td>

<asp:DropDownList ID="ddlStatus"
runat="server"
CssClass="form-select">

<asp:ListItem>Pending</asp:ListItem>
<asp:ListItem>Processing</asp:ListItem>
<asp:ListItem>Shipped</asp:ListItem>
<asp:ListItem>Delivered</asp:ListItem>
<asp:ListItem>Cancelled</asp:ListItem>

</asp:DropDownList>

</td>
</tr>

</table>

</div>

</div>

</div>


<!-- Customer -->

<div class="col-lg-6">

<div class="panel">

<div class="panel-header">
<h5><i class="bi bi-person"></i> Customer Information</h5>
</div>

<div class="panel-body">

<p><b>Name :</b>
<asp:Label ID="lblCustomer" runat="server" />
</p>

<p><b>Mobile :</b>
<asp:Label ID="lblMobile" runat="server" />
</p>

<p><b>Email :</b>
<asp:Label ID="lblEmail" runat="server" />
</p>

<p><b>Company :</b>
<asp:Label ID="lblCompany" runat="server" />
</p>

<p><b>Address :</b><br />

<asp:Label ID="lblAddress" runat="server" />

</p>

</div>

</div>

</div>



<!-- Products -->

<div class="col-12">

<div class="panel">

<div class="panel-header">

<h5>

<i class="bi bi-cart"></i>

Ordered Products

</h5>

</div>

<div style="overflow-x:auto;">

<table class="custom-table">

<thead>

<tr>

<th>Image</th>

<th>Product</th>

<th>Price</th>

<th>Qty</th>

<th>Total</th>

</tr>

</thead>

<tbody>

<asp:Repeater ID="rptProducts" runat="server">

<ItemTemplate>

<tr>

<td>
    <img src="Uploads/Products/<%# Eval("image") %>" width="60"
style="border-radius:8px;" />


</td>

<td>

<b><%# Eval("ProductName") %></b>

</td>

<td>

₹ <%# Eval("Price") %>

</td>

<td>

<%# Eval("Qty") %>

</td>

<td>

₹ <%# Convert.ToDecimal(Eval("Price"))*Convert.ToInt32(Eval("Qty")) %>

</td>

</tr>

</ItemTemplate>

</asp:Repeater>

</tbody>

</table>

</div>

<div style="padding:20px;text-align:right;">

<h4>

Sub Total :
₹ <asp:Label ID="lblSubTotal" runat="server" />

</h4>

<h4>

Shipping :
₹ <asp:Label ID="lblShipping" runat="server" />

</h4>

<h3 style="color:green;">

Grand Total :
₹ <asp:Label ID="lblGrandTotal" runat="server" />

</h3>

<asp:Button ID="btnUpdate"
runat="server"
Text="Update Order Status"
CssClass="btn btn-primary"
OnClick="btnUpdate_Click"/>

</div>

</div>

</div>

</div>
   
</main>


    <script type="text/javascript">
        function PrintDiv() {

            var divContents = document.getElementById("printArea").innerHTML;

            var printWindow = window.open('', '', 'height=700,width=1000');

            printWindow.document.write('<html><head><title>Invoice</title>');

            printWindow.document.write('<style>');
            printWindow.document.write('body{font-family:Arial;padding:20px;}');
            printWindow.document.write('table{width:100%;border-collapse:collapse;}');
            printWindow.document.write('table,th,td{border:1px solid #000;}');
            printWindow.document.write('th,td{padding:8px;text-align:left;}');
            printWindow.document.write('</style>');

            printWindow.document.write('</head><body>');

            printWindow.document.write(divContents);

            printWindow.document.write('</body></html>');

            printWindow.document.close();

            printWindow.focus();

            printWindow.print();

            printWindow.close();
        }
</script>
</asp:Content>

