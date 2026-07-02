<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="view.aspx.cs" Inherits="view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
    <asp:Literal ID="litMeta" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <main>

            <!-- breadcrumb-area -->
            <div class="breadcrumb-area breadcrumb-bg-two">
                <div class="container custom-container">
                    <div class="row">
                        <div class="col-12">
                            <div class="breadcrumb-content">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                        <li class="breadcrumb-item"><a href="shop.html">Shop</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Shop Details</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- breadcrumb-area-end -->

            <!-- shop-details-area -->
            <section class="shop-details-area pt-90 pb-90">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-7">
                            <div class="shop-details-flex-wrap">
                                <div class="shop-details-nav-wrap">
                                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                                        <li class="nav-item" role="presentation">
                                            <a class="nav-link active" id="item-one-tab" data-toggle="tab" href="#item-one" role="tab" aria-controls="item-one" aria-selected="true">
                                                
<img src="Admin/Uploads/Products/<%=img1 %>" />
                                            </a>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <a class="nav-link" id="item-two-tab" data-toggle="tab" href="#item-two" role="tab" aria-controls="item-two" aria-selected="false"><img src="Admin/Uploads/Products/<%=img2 %>"  style="visibility: <%=img2 %>"/></a>
                                        </li>
                                        <li class="nav-item" role="presentation">
                                            <a class="nav-link" id="item-three-tab" data-toggle="tab" href="#item-three" role="tab" aria-controls="item-three" aria-selected="false"><img src="Admin/Uploads/Products/<%=img3%>"  style="visibility: <%=img2 %>"/></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="shop-details-img-wrap">
                                    <div class="tab-content" id="myTabContent">
                                        <div class="tab-pane fade show active" id="item-one" role="tabpanel" aria-labelledby="item-one-tab">
                                            <div class="shop-details-img">
                                                <img src="Admin/Uploads/Products/<%=img1 %>" />
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="item-two" role="tabpanel" aria-labelledby="item-two-tab">
                                            <div class="shop-details-img">
                                           <img src="Admin/Uploads/Products/<%=img2 %>" />
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="item-three" role="tabpanel" aria-labelledby="item-three-tab">
                                            <div class="shop-details-img">
                                               <img src="Admin/Uploads/Products/<%=img3 %>" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-5">
                            <div class="shop-details-content">
                                <h4 class="title"><%=productname %></h4>
                                <div class="shop-details-meta">
                                    <ul>
                                        <li>Baands : <a href="shop.html"><%=brand %></a></li>
                                      
                                        <li>ID : <span><%=pid %></span></li>
                                    </ul>
                                </div>
                                <div class="shop-details-price">
                                    <h2 class="price"><span style="color:#2e4c17"> $<%=Convert.ToInt16(price)-Convert.ToInt16(discount) %>/- </span><strike style="font-size:18px"> $<%=price %>/- </strike>&nbsp;&nbsp;&nbsp; <span style="font-size: 18px" runat="server" id="discountdiv">$<%=discount %> Off</span></h2>
                                    <h5 class="stock-status">- IN Stock</h5>
                                </div>
                                <p><%=ShortDescription %></p>
                                <div class="shop-details-list">
                                    <ul>
                                        <li>Category : <span><%=categoryname %></span></li>
                                        <li>SKU : <span><%=pid %></span></li>
                                    
                                    </ul>
                                </div>
                                <div class="shop-perched-info">



                                    <div class="sd-cart-wrap">
                                      <asp:DropDownList ID="DDQuantity" runat="server" style="padding:5px;width:67px"></asp:DropDownList>
                                    </div>
<asp:Button ID="Button1" runat="server" Text="add to cart" class="btn" OnClick="Button1_Click" ></asp:Button>
                      <asp:Label ID="lblshow" runat="server" ForeColor="Red"></asp:Label>           
                                </div>
                                <div class="shop-details-bottom">
                                    <h5 class="title">
                                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"><i class="far fa-heart"></i> Add To Wishlist</asp:LinkButton>
                                        

                                    </h5>
                                    <ul>
                                        <li>
                                            <span>Tag : </span>
                                            <a href="#">ICE Cream</a>
                                        </li>
                                      
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="product-desc-wrap">
                                <ul class="nav nav-tabs" id="myTabTwo" role="tablist">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="details-tab" data-toggle="tab" href="#details" role="tab"
                                            aria-controls="details" aria-selected="true">Product Details</a>
                                    </li>
                                  <%--  <li class="nav-item">
                                        <a class="nav-link" id="val-tab" data-toggle="tab" href="#val" role="tab" aria-controls="val"
                                            aria-selected="false">Viewers Also Like</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="review-tab" data-toggle="tab" href="#review" role="tab"
                                            aria-controls="review" aria-selected="false">Product Reviews</a>
                                    </li>--%>
                                </ul>
                                <div class="tab-content" id="myTabContentTwo">
                                    <div class="tab-pane fade show active" id="details" role="tabpanel" aria-labelledby="details-tab">
                                        <div class="product-desc-content">
                                            <h4 class="title">Product Details</h4>
                                            <div class="row">
                                               
                                                <div class="col-xl-12 col-md-12">
                                                    <%=Description   %>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="val" role="tabpanel" aria-labelledby="val-tab">
                                        <div class="product-desc-content">
                                            <h4 class="title">Product Details</h4>
                                            <div class="row">
                                                <div class="col-xl-3 col-md-5">
                                                    <div class="product-desc-img">
                                                        <img src="img/product/desc_img.jpg" alt="">
                                                    </div>
                                                </div>
                                                <div class="col-xl-9 col-md-7">
                                                    <h5 class="small-title">100% Natural Vitamin</h5>
                                                    <p>Cramond Leopard & Pythong Print Anorak Jacket In Beige but also the leap into electronic typesetting, remaining Lorem
                                                    Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy
                                                    text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                                    <ul class="product-desc-list">
                                                        <li>65% poly, 35% rayon</li>
                                                        <li>Hand wash cold</li>
                                                        <li>Partially lined</li>
                                                        <li>Hidden front button closure with keyhole accents</li>
                                                        <li>Button cuff sleeves</li>
                                                        <li>Lightweight semi-sheer fabrication</li>
                                                        <li>Made in USA</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="review" role="tabpanel" aria-labelledby="review-tab">
                                        <div class="product-desc-content">
                                            <h4 class="title">Product Details</h4>
                                            <div class="row">
                                                <div class="col-xl-3 col-md-5">
                                                    <div class="product-desc-img">
                                                        <img src="img/product/desc_img.jpg" alt="">
                                                    </div>
                                                </div>
                                                <div class="col-xl-9 col-md-7">
                                                    <h5 class="small-title">100% Natural Vitamin</h5>
                                                    <p>Cramond Leopard & Pythong Print Anorak Jacket In Beige but also the leap into electronic typesetting, remaining Lorem
                                                    Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy
                                                    text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
                                                    <ul class="product-desc-list">
                                                        <li>65% poly, 35% rayon</li>
                                                        <li>Hand wash cold</li>
                                                        <li>Partially lined</li>
                                                        <li>Hidden front button closure with keyhole accents</li>
                                                        <li>Button cuff sleeves</li>
                                                        <li>Lightweight semi-sheer fabrication</li>
                                                        <li>Made in USA</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- shop-details-area-end -->

            <!-- coupon-area -->
            
            <!-- coupon-area-end -->

            <!-- best-sellers-area -->
            <section class="best-sellers-area pt-85 pb-70">
                <div class="container">
                    <div class="row align-items-end mb-40">
                        <div class="col-md-8 col-sm-9">
                            <div class="section-title">
                                <span class="sub-title">Related Products</span>
                                <h2 class="title">From this Collection</h2>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-3">
                            <div class="section-btn text-left text-md-right">
                                <a href="shop.aspx?id=0&&sid=0&&bid=0&&sort=0&&price=0" class="btn">View All</a>
                            </div>
                        </div>
                    </div>
                    <div class="best-sellers-products">
                        <div class="row justify-content-center">


                                <asp:Repeater ID="lstbestdeal" runat="server">

                        <ItemTemplate>
                            <div class="col-3">
                                <div class="sp-product-item mb-20">
                                    <div class="sp-product-thumb">
                                        <span class="batch">    <%# Convert.ToDecimal(Eval("Discount")) > 0 
        ? "" + ((Convert.ToDecimal(Eval("Discount")) * 100) / Convert.ToDecimal(Eval("Price"))).ToString("0") + "%"
        : "" %></span>
                                        <a href="<%# Eval("ProductLink") %>"><img src="Admin/Uploads/Products/<%# Eval("img1") %>" />
</a>
                                    </div>
                                    <div class="sp-product-content">
                                    
                                        <h6 class="title"><a href="<%# Eval("ProductLink") %>"><%# Eval("ProductName") %></a></h6>
                                        <span class="product-status">IN Stock</span>
                                     <br />
                                       <p>
    $<%# Convert.ToDecimal(Eval("Discount")) > 0 
        ? (Convert.ToDecimal(Eval("price")) - Convert.ToDecimal(Eval("Discount"))).ToString("0.00") 
        : Convert.ToDecimal(Eval("price")).ToString("0.00") %>/-
</p>
                                    </div>
                                </div>
                            </div>
                              </ItemTemplate>

                    </asp:Repeater>
                        </div>
                    </div>
                </div>
            </section>
            <!-- best-sellers-area-end -->

        </main>
</asp:Content>

