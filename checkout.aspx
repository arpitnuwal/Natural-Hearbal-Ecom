<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="checkout" %>

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
                                
                                        <li class="breadcrumb-item active" aria-current="page">Checkout</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- breadcrumb-area-end -->

            <!-- checkout-area -->
            <div class="checkout-area pt-90 pb-90">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-7">
                           
                            <div class="checkout-form-wrap">
                                <div>
                                    
                                    <div class="building-info-wrap">
                                        <h5 class="title">Billing Information</h5>
                                        <div class="row">
                                              <div class="col-md-12">
                                            <asp:TextBox ID="txtname" runat="server" placeholder="Full Name *" required="required"></asp:TextBox>
                                                  </div>
                                            <div class="col-md-6">
                                           <asp:TextBox ID="txtemail" runat="server" placeholder="Email Id *" required="required"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6">
                                         <asp:TextBox ID="txtmobile" runat="server" placeholder="Mobile No. *" required="required"></asp:TextBox>
                                            </div>

                                             <div class="col-md-12">
                                            <asp:TextBox ID="txtcompanyname" runat="server" placeholder="Company Name ( optional )"></asp:TextBox>
                                                  </div>

                                            

                                                 <div class="col-md-12">
                                            <asp:TextBox ID="txtaddress" runat="server" placeholder="Street Address *" required="required"></asp:TextBox>
                                                  </div>
                                        </div>



                                     
                                        <div class="row">
                                            <div class="col-md-6">
                                               <asp:TextBox ID="txtcountry" runat="server" placeholder="Country / Region *" required="required"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6">
                                                <asp:TextBox ID="txtstate" runat="server" placeholder="State*" required="required"></asp:TextBox>
                                            </div>
                                            <div class="col-md-6">
                                                  <asp:TextBox ID="txtpincode" runat="server" placeholder="Postal zip*" required="required"> </asp:TextBox>
                                             
                                            </div>
                                            <div class="col-md-6">
                                              <asp:TextBox ID="txtcity" runat="server" placeholder="Town/City*" required="required"></asp:TextBox>
                                             
                                            </div>
                                        </div>
                                      <asp:TextBox ID="txtordernote" runat="server" TextMode="MultiLine" Rows="4" placeholder="Order You Have Notes ( Optional )"></asp:TextBox>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-5">
                            <div class="shop-cart-total order-summary-wrap">
                                <h3 class="title">Order Summary</h3>


                                <asp:ListView ID="lstwishlist" runat="server">
    <ItemTemplate>

                                <div class="os-products-item">
                                    <div class="thumb">
                                        <a  href="<%# Eval("ProductLink") %>"><img src="Admin/Uploads/Products/<%# Eval("image") %>" alt=""></a>
                                    </div>
                                    <div class="content">
                                        <h6 class="title"><a  href="<%# Eval("ProductLink") %>"><%# Eval("productname") %></a></h6>
                                        <span class="price">$<%# Eval("totalamount") %>/-</span>
                                    </div>
                               <%--     <div class="remove">x</div>--%>
                                </div>
        <asp:Label ID="LblTotalAmoun111t" runat="server" Text='<%# Eval("totalamount") %>' Visible="false"></asp:Label>
          </ItemTemplate>
</asp:ListView>

                                <div class="shop-cart-widget">
    <div>
        <ul style="list-style:none; padding:0; margin:0;">

            <li style="display:flex; justify-content:space-between; align-items:center; padding:10px 0; border-bottom:1px solid #eee;">
                <span><strong>Subtotal</strong></span>
                <span>$ <%=Realprice %>/-</span>
            </li>

            <li style="display:flex; justify-content:space-between; align-items:center; padding:10px 0; border-bottom:1px solid #eee;">
                <span><strong>Shipping</strong></span>
                <span>$<%=deliverycharge %>/-</span>
            </li>

            <li style="display:flex; justify-content:space-between; align-items:center; padding:12px 0; font-size:18px; font-weight:bold;">
                <span>Total Price</span>
                <span>$<%=payorder %>/-</span>
            </li>

        </ul>

        <div class="payment-method-info" style="margin-top:20px;">

            <div style="display:flex; align-items:center; justify-content:space-between; margin-bottom:10px;">
                <div>
<asp:RadioButton ID="rd1" runat="server" Text="Cash on delivery" GroupName="pay"></asp:RadioButton>
           
                </div>
            </div>

            <div style="display:flex; align-items:center; justify-content:space-between;">
                <div>
                 <asp:RadioButton ID="rd2" runat="server" Text="Online" GroupName="pay"></asp:RadioButton>
                </div>

                <div>
                    <img src="img/images/card.png" alt="" style="max-width:120px;">
                </div>
            </div>

        </div>

        <div style="margin-top:20px;">
            <p style="font-size:14px; color:#666;">
                The purpose Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.
            </p>

            <div>
                <input type="checkbox" id="customCheck7" />
                <label for="customCheck7">
                    I agree to the website terms and conditions
                </label>
            </div>
        </div>

<asp:Button ID="Button1" runat="server" Text=" Place Order" OnClick="Button1_Click" style="display:block; width:100%; text-align:center; background:#ff6a00; color:#fff; text-decoration:none; padding:12px; border-radius:5px; margin-top:20px;"></asp:Button>

      

    </div>
</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- checkout-area-end -->

        </main>
</asp:Content>

