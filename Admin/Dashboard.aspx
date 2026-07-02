<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master"
AutoEventWireup="true" CodeFile="Dashboard.aspx.cs"
Inherits="Admin_Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<main class="main-content">

<div class="page-header">
    <h1>
        Welcome,
        <asp:Literal ID="litAdminName" runat="server"></asp:Literal>
    </h1>

    <ul class="breadcrumb mt-1">
        <li><a href="#">Home</a></li>
        <li>Dashboard</li>
    </ul>
</div>
    <div class="row g-3">

    <!-- Total Categories -->
    <div class="col-md-3">
        <div class="panel" style="background:#0d6efd;color:#fff;">
            <div class="panel-body d-flex justify-content-between align-items-center">
                <div>
                    <h6>Total Categories</h6>
                    <h2>
                        <asp:Label ID="lblCategory" runat="server" Text="0"></asp:Label>
                    </h2>
                </div>
                <i class="bi bi-grid-fill" style="font-size:45px;"></i>
            </div>
        </div>
    </div>

    <!-- Total Sub Categories -->
    <div class="col-md-3">
        <div class="panel" style="background:#6f42c1;color:#fff;">
            <div class="panel-body d-flex justify-content-between align-items-center">
                <div>
                    <h6>Total Sub Categories</h6>
                    <h2>
                        <asp:Label ID="lblSubCategory" runat="server" Text="0"></asp:Label>
                    </h2>
                </div>
                <i class="bi bi-diagram-3-fill" style="font-size:45px;"></i>
            </div>
        </div>
    </div>

    <!-- Total Products -->
    <div class="col-md-3">
        <div class="panel" style="background:#198754;color:#fff;">
            <div class="panel-body d-flex justify-content-between align-items-center">
                <div>
                    <h6>Total Products</h6>
                    <h2>
                        <asp:Label ID="lblProduct" runat="server" Text="0"></asp:Label>
                    </h2>
                </div>
                <i class="bi bi-box-seam-fill" style="font-size:45px;"></i>
            </div>
        </div>
    </div>

    <!-- Total Brands -->
    <div class="col-md-3">
        <div class="panel" style="background:#dc3545;color:#fff;">
            <div class="panel-body d-flex justify-content-between align-items-center">
                <div>
                    <h6>Total Brands</h6>
                    <h2>
                        <asp:Label ID="lblBrand" runat="server" Text="0"></asp:Label>
                    </h2>
                </div>
                <i class="bi bi-award-fill" style="font-size:45px;"></i>
            </div>
        </div>
    </div>

</div>


   

<br />


    <div class="row g-3">

    <!-- Today's Orders -->
    <div class="col-md-3">
        <div class="panel" style="background:#0d6efd;color:#fff;">
            <div class="panel-body d-flex justify-content-between align-items-center">
                <div>
                    <h6>Today's Orders</h6>
                    <h2><asp:Label ID="lblTodayOrders" runat="server" Text="0" /></h2>
                </div>
                <i class="bi bi-bag-check-fill" style="font-size:45px;"></i>
            </div>
        </div>
    </div>

    <!-- Today's Sales -->
    <div class="col-md-3">
        <div class="panel" style="background:#198754;color:#fff;">
            <div class="panel-body d-flex justify-content-between align-items-center">
                <div>
                    <h6>Today's Sales</h6>
                    <h2>₹ <asp:Label ID="lblTodaySales" runat="server" Text="0" /></h2>
                </div>
                <i class="bi bi-currency-rupee" style="font-size:45px;"></i>
            </div>
        </div>
    </div>

    <!-- Total Orders -->
    <div class="col-md-3">
        <div class="panel" style="background:#6f42c1;color:#fff;">
            <div class="panel-body d-flex justify-content-between align-items-center">
                <div>
                    <h6>Total Orders</h6>
                    <h2><asp:Label ID="lblTotalOrders" runat="server" Text="0" /></h2>
                </div>
                <i class="bi bi-cart-fill" style="font-size:45px;"></i>
            </div>
        </div>
    </div>

    <!-- Total Revenue -->
    <div class="col-md-3">
        <div class="panel" style="background:#20c997;color:#fff;">
            <div class="panel-body d-flex justify-content-between align-items-center">
                <div>
                    <h6>Total Revenue</h6>
                    <h2>₹ <asp:Label ID="lblTotalRevenue" runat="server" Text="0" /></h2>
                </div>
                <i class="bi bi-wallet2" style="font-size:45px;"></i>
            </div>
        </div>
    </div>

    <!-- Pending -->
    <div class="col-md-3">
        <div class="panel" style="background:#ffc107;">
            <div class="panel-body d-flex justify-content-between align-items-center">
                <div>
                    <h6>Pending Orders</h6>
                    <h2><asp:Label ID="lblPending" runat="server" Text="0" /></h2>
                </div>
                <i class="bi bi-hourglass-split" style="font-size:45px;"></i>
            </div>
        </div>
    </div>

    <!-- Processing -->
    <div class="col-md-3">
        <div class="panel" style="background:#fd7e14;color:#fff;">
            <div class="panel-body d-flex justify-content-between align-items-center">
                <div>
                    <h6>Processing</h6>
                    <h2><asp:Label ID="lblProcessing" runat="server" Text="0" /></h2>
                </div>
                <i class="bi bi-arrow-repeat" style="font-size:45px;"></i>
            </div>
        </div>
    </div>

    <!-- Delivered -->
    <div class="col-md-3">
        <div class="panel" style="background:#198754;color:#fff;">
            <div class="panel-body d-flex justify-content-between align-items-center">
                <div>
                    <h6>Delivered</h6>
                    <h2><asp:Label ID="lblDelivered" runat="server" Text="0" /></h2>
                </div>
                <i class="bi bi-check-circle-fill" style="font-size:45px;"></i>
            </div>
        </div>
    </div>

    <!-- Cancelled -->
    <div class="col-md-3">
        <div class="panel" style="background:#dc3545;color:#fff;">
            <div class="panel-body d-flex justify-content-between align-items-center">
                <div>
                    <h6>Cancelled</h6>
                    <h2><asp:Label ID="lblCancelled" runat="server" Text="0" /></h2>
                </div>
                <i class="bi bi-x-circle-fill" style="font-size:45px;"></i>
            </div>
        </div>
    </div>

    <!-- COD -->
    <div class="col-md-3">
        <div class="panel">
            <div class="panel-body d-flex justify-content-between align-items-center">
                <div>
                    <h6>COD Orders</h6>
                    <h2><asp:Label ID="lblCOD" runat="server" Text="0" /></h2>
                </div>
                <i class="bi bi-cash-stack text-success" style="font-size:45px;"></i>
            </div>
        </div>
    </div>

    <!-- Online -->
    <div class="col-md-3">
        <div class="panel">
            <div class="panel-body d-flex justify-content-between align-items-center">
                <div>
                    <h6>Online Orders</h6>
                    <h2><asp:Label ID="lblOnline" runat="server" Text="0" /></h2>
                </div>
                <i class="bi bi-credit-card-fill text-primary" style="font-size:45px;"></i>
            </div>
        </div>
    </div>

    <!-- Paid -->
    <div class="col-md-3">
        <div class="panel">
            <div class="panel-body d-flex justify-content-between align-items-center">
                <div>
                    <h6>Paid Orders</h6>
                    <h2><asp:Label ID="lblPaid" runat="server" Text="0" /></h2>
                </div>
                <i class="bi bi-check2-square text-success" style="font-size:45px;"></i>
            </div>
        </div>
    </div>

    <!-- Pending Payment -->
    <div class="col-md-3">
        <div class="panel">
            <div class="panel-body d-flex justify-content-between align-items-center">
                <div>
                    <h6>Pending Payment</h6>
                    <h2><asp:Label ID="lblPendingPayment" runat="server" Text="0" /></h2>
                </div>
                <i class="bi bi-clock-history text-warning" style="font-size:45px;"></i>
            </div>
        </div>
    </div>

    <!-- Month Orders -->
    <div class="col-md-3">
        <div class="panel">
            <div class="panel-body d-flex justify-content-between align-items-center">
                <div>
                    <h6>This Month Orders</h6>
                    <h2><asp:Label ID="lblMonthOrders" runat="server" Text="0" /></h2>
                </div>
                <i class="bi bi-calendar3 text-info" style="font-size:45px;"></i>
            </div>
        </div>
    </div>

    <!-- Month Sales -->
    <div class="col-md-3">
        <div class="panel">
            <div class="panel-body d-flex justify-content-between align-items-center">
                <div>
                    <h6>This Month Sales</h6>
                    <h2>₹ <asp:Label ID="lblMonthSales" runat="server" Text="0" /></h2>
                </div>
                <i class="bi bi-graph-up-arrow text-success" style="font-size:45px;"></i>
            </div>
        </div>
    </div>

    <!-- Average Order -->
    <div class="col-md-3">
        <div class="panel">
            <div class="panel-body d-flex justify-content-between align-items-center">
                <div>
                    <h6>Avg. Order Value</h6>
                    <h2>₹ <asp:Label ID="lblAverage" runat="server" Text="0" /></h2>
                </div>
                <i class="bi bi-bar-chart-fill text-primary" style="font-size:45px;"></i>
            </div>
        </div>
    </div>

    <!-- Customers -->
    <div class="col-md-3">
        <div class="panel">
            <div class="panel-body d-flex justify-content-between align-items-center">
                <div>
                    <h6>Total Customers</h6>
                    <h2><asp:Label ID="lblCustomers" runat="server" Text="0" /></h2>
                </div>
                <i class="bi bi-people-fill text-danger" style="font-size:45px;"></i>
            </div>
        </div>
    </div>

</div>
</main>

</asp:Content>
