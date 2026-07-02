<%@ Page Title="Cart - floraherbals.com" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <main>

            <!-- breadcrumb-area -->
            <div class="breadcrumb-area breadcrumb-bg-two">
                <div class="container custom-container">
                    <div class="row">
                        <div class="col-12">
                            <div class="breadcrumb-content">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.aspx">Home</a></li>
                                    
                                        <li class="breadcrumb-item active" aria-current="page">Cart</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- breadcrumb-area-end -->

            <!-- cart-area -->
            <div class="cart-area pt-90 pb-90">
                <div class="container" runat="server" id="data">
                    <div class="row justify-content-center">
                        <div class="col-xl-7">
                            <div class="cart-wrapper">
                                 <div class="table-responsive">
                            <table class="table">
                                 <tr>
                                  
                                    <th>Images</th>
                                    <th >Product Name</th>
                                    <th >Price</th>
                                    <th  >Discount</th>
                                
                                    <th>Subtotal</th>
                                    <th>Remove</th>
                                </tr>

                                <tbody>
<asp:ListView ID="lstwishlist" runat="server">
    <ItemTemplate>
        <tr><asp:Label ID="productid" runat="server" Visible="false" Text='<%# Eval("productid") %>'></asp:Label>
              <asp:Label ID="lblquantity" runat="server" Visible="false" Text='<%# Eval("quantity") %>'></asp:Label>

                                       
                                        <td class="cart-product-image" >
                                            <a href="<%# Eval("ProductLink") %>"><img src="Admin/Uploads/Products/<%# Eval("image") %>" alt="#" style="height:60px"></a>
                                        </td>
                                        <td class="cart-product-info">
                                            <h6><a href="<%# Eval("ProductLink") %>"><%# Eval("productname") %> <br /> (  <%# Eval("Quantity") %> Qty)</a></h6>
                                        </td>
                                        <td class="cart-product-price"  > $<asp:Label ID="lblprice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>/-</td>
                                        <td class="cart-product-stock" > $<asp:Label ID="lbdiscount" runat="server" Text='<%# Eval("discount") %>'></asp:Label></td>

           
                

                                        <td class="cart-product-add-cart">
                                              $<asp:Label ID="LblTotalAmoun111t" runat="server" Text='<%# Eval("totalamount") %>'></asp:Label>/-
                                        </td>
             <td class="cart-product-remove">   
                                             <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CommandArgument='<%# Eval("id") %>'>x</asp:LinkButton>

                                            </td>
                                    </tr>
    </ItemTemplate>
</asp:ListView>
                                    
                                  
                                </tbody>
                            </table>

                                     
                        </div>
                            
                        </div>

                            <div class="shop-cart-bottom" style="visibility:hidden">
                                <div class="cart-coupon">
                                    <form action="#">
                                        <input type="text" placeholder="Enter Coupon Code...">
                                        <button class="btn">Apply Coupon</button>
                                    </form>
                                </div>
                                <div class="continue-shopping">
                                    <a href="shop.html" class="btn">update Cart</a>
                                </div>
                            </div>
                    </div>

                        <div class="col-xl-5 col-lg-12">
                            <div class="shop-cart-total">
                                <h3 class="title">Cart Totals</h3>
                                <div class="shop-cart-widget">
                                    <form action="#">
                                        <ul>
                                            <li class="sub-total"><span>Subtotal</span> $ <%=Realprice %>/-</li>
                                            <li>
                                                <span>Shipping Charge</span>
                                                <div class="shop-check-wrap">
                                                   
                                                  
                                                       
                                                         $<%=deliverycharge %>/-
                                                   
                                                </div>
                                            </li>
                                            <li class="cart-total-amount"><span>Total Price</span> <span class="amount">$ <%=Convert.ToDecimal(Realprice)+Convert.ToDecimal(deliverycharge) %>/-</span></li>
                                        </ul>
                                        <a href="checkout.aspx" class="btn">PROCEED TO CHECKOUT</a>
                                    </form>
                                </div>
                            </div>
                        </div>
                </div>
                    </div>
                 <div class="row" runat="server" id="nodata"
    style="border:2px dashed #ffcc29; padding:50px 20px; margin:0px 0; border-radius:15px; background:#fffdf5; text-align:center;">

    <div class="col-12">
        <div style="font-size:60px; margin-bottom:15px;">🛒</div>

        <h2 style="font-size:30px; font-weight:600; color:#333; margin-bottom:10px;">
            Your Cart is Empty
        </h2>

        <p style="font-size:16px; color:#777; margin-bottom:25px;">
            Looks like you haven't added any products to your cart yet.
        </p>

        <a href="index.aspx"
            style="display:inline-block;
                   background:#ffcc29;
                   color:#000;
                   padding:12px 30px;
                   border-radius:30px;
                   text-decoration:none;
                   font-size:16px;
                   font-weight:600;
                   transition:0.3s;">
            Explore Products
        </a>
    </div>

</div><br />
            </div>
            <!-- cart-area-end -->

        </main>
</asp:Content>

