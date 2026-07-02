<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="myorderlist.aspx.cs" Inherits="myorderlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:95%;max-width:1100px;margin:20px auto;font-family:Arial;background:#f5f5f5;padding:20px;">

    <h2 style="margin:0 0 20px;color:#333;">
        <i class="fa fa-shopping-bag"></i> My Orders
    </h2>

    <!-- Order Card -->

    <asp:ListView ID="lvOrders" runat="server">

    <LayoutTemplate>
        <div id="itemPlaceholder" runat="server"></div>
    </LayoutTemplate>

    <ItemTemplate>

        <div style="background:#fff;border:1px solid #ddd;border-radius:8px;padding:20px;margin-bottom:20px;box-shadow:0px 2px 8px rgba(0,0,0,.08);">

            <div style="display:flex;justify-content:space-between;border-bottom:1px solid #eee;padding-bottom:12px;flex-wrap:wrap;">

                <div style="margin-bottom:10px;">
                    <div style="font-size:14px;color:#888;">Order No</div>
                    <div style="font-size:18px;font-weight:bold;">
                        <%# Eval("OrderNo") %>
                    </div>
                </div>

                <div style="margin-bottom:10px;">
                    <div style="font-size:14px;color:#888;">Date</div>
                    <div>
                        <%# Convert.ToDateTime(Eval("OrderDate")).ToString("dd MMM yyyy") %>
                    </div>
                </div>

                <div style="margin-bottom:10px;">
                    <div style="font-size:14px;color:#888;">Amount</div>
                    <div style="color:#28a745;font-size:18px;">
                        ₹ <%# Eval("GrandTotal") %>
                    </div>
                </div>

                <div style="margin-bottom:10px;">
                    <div style="font-size:14px;color:#888;">Status</div>

                    <span style="background:#fff3cd;color:#856404;padding:6px 12px;border-radius:20px;">
                        <%# Eval("OrderStatus") %>
                    </span>

                </div>

            </div>

            <div style="display:flex;align-items:center;margin-top:20px;flex-wrap:wrap;">

            

                <div style="flex:1;min-width:300px;">

    <div style="font-size:18px;font-weight:bold;color:#333;">
        <%# Eval("CustomerName") %>
    </div>

    <div style="margin-top:8px;color:#666;">
        <i class="fa fa-phone"></i>
        <%# Eval("MobileNo") %>
    </div>

    <div style="margin-top:5px;color:#666;">
        <i class="fa fa-envelope"></i>
        <%# Eval("Email") %>
    </div>

    <div style="margin-top:5px;color:#666;">
        <i class="fa fa-building"></i>
        <%# Eval("copmanyname") %>
    </div>

    <div style="margin-top:8px;color:#666;line-height:22px;">
        <i class="fa fa-location-dot"></i>
        <%# Eval("Address") %><br />
        <%# Eval("City") %>, <%# Eval("State") %> - <%# Eval("Pincode") %><br />
        <%# Eval("Country") %>
    </div>

    <div style="margin-top:10px;color:#666;">
        <strong>Payment :</strong>
        <%# Eval("PaymentMethod") %>
    </div>

    <div style="margin-top:5px;color:#666;">
        <strong>Payment Status :</strong>
        <%# Eval("PaymentStatus") %>
    </div>

</div>

                <a href='OrderDetails.aspx?id=<%# Eval("OrderID") %>'
                    style="background:#007bff;color:#fff;padding:10px 20px;border-radius:5px;text-decoration:none;">
                    View Details
                </a>

            </div>

        </div>

    </ItemTemplate>

</asp:ListView>

</div>
</asp:Content>

