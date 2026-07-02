<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ordersuccess.aspx.cs" Inherits="ordersuccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


      <main>

            <!-- breadcrumb-area -->
            
            <!-- breadcrumb-area-end -->

            <!-- ingredients-area -->
            <section class="ingredients-area pt-90 pb-90">
                <div class="container">
                    <div style="max-width:500px; margin:40px auto; padding:25px; background:#e8f5e9; border:2px solid #4CAF50; border-radius:10px; text-align:center; font-family:Arial, sans-serif; box-shadow:0 2px 10px rgba(0,0,0,0.1);">
    
    <div style="font-size:60px; color:#4CAF50;">✔</div>
    
    <h2 style="margin:10px 0; color:#2e7d32;">Order Placed Successfully!</h2>
    
    <p style="color:#555; font-size:16px; line-height:1.6;">
        Thank you for your purchase. Your order has been received successfully.
        We will process it shortly and send you an order confirmation.
    </p>
    
    <p style="margin-top:15px; font-size:15px;">
        <strong>Order ID:</strong> #<%=Request.QueryString["orderNo"]%>
    </p>
    
    <a href="index.aspx" style="display:inline-block; margin-top:20px; padding:12px 25px; background:#4CAF50; color:#fff; text-decoration:none; border-radius:5px; font-weight:bold;">
        Continue Shopping
    </a>

</div>
                    </div></section>

          </main>
</asp:Content>

