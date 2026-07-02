<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .hidecss {
            visibility: hidden !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <main>

            <!-- slider-area -->
            <section class="slider-area" data-background="img/bg/slider_area_bg.jpg">
                <div class="container custom-container">
                    <div class="row">
                        <div class="col-7">
                            <div class="slider-active">
                                  <asp:Repeater ID="rptSliders" runat="server">

                        <ItemTemplate>


                                <div class="single-slider slider-bg" data-background="Admin/Uploads/Sliders/<%# Eval("SliderImage") %>">
                                    <div class="slider-content">
                                        <h5 class="sub-title hidecss" data-animation="fadeInUp" data-delay=".2s">top deal !</h5>
                                        <h2 class="title hidecss" data-animation="fadeInUp" data-delay=".4s"> <%# Eval("Title1") %></h2>
                                        <p class="hidecss" data-animation="fadeInUp" data-delay=".6s"> <%# Eval("Title2") %></p>
                                        <a href=" <%# Eval("SliderLink") %>" class="btn rounded-btn hidecss" data-animation="fadeInUp" data-delay=".8s">Shop Now</a>
                                    </div>
                                </div>
                               </ItemTemplate>

                    </asp:Repeater>
                                
                                

                            </div>
                        </div>
                        <div class="col-3">
                            <div class="slider-banner-img mb-20">
                                <a href="<%=top1link %>">
<img src="Admin/Uploads/Banners/4.jpeg" />
                                 

                                </a>
                            </div>
                            <div class="slider-banner-img">
                                <a href="<%=top2link %>">
                               <img src="Admin/Uploads/Banners/5.jpeg" />

                                </a>
                            </div>
                        </div>
                        <div class="col-3">
                            <div class="slider-banner-img">
                                <a href="<%=top3link %>">
                                <img src="Admin/Uploads/Banners/6.jpeg" />

                                </a>
                            </div>
                        </div>
                    </div>
                </div>


                    

                </section>




           <section class="discount-area pt-80">
                <div class="container-fluid">
                    <div class="row justify-content-center">
                        <div class="col-xl-4 col-lg-6 col-md-8"  onclick="window.location.href='<%=m1link %>';" style="cursor:pointer">
                            <div class="discount-item mb-20">
                                <div class="discount-thumb">
<img src="Admin/Uploads/Banners/7.jpeg" />
                                 
                                </div>
                                <div class="discount-content">
                                    <span><%=m1subtitle %></span>
                                    <h4 class="title"><a href="<%=m1link %>"><%=m1title %></a></h4>
                                    <%--<a href="<%=m1link %>" class="btn">shop now</a>--%>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-xl-4 col-lg-6 col-md-8"  onclick="window.location.href='<%=m2link %>';" style="cursor:pointer">
                            <div class="discount-item mb-20">
                                <div class="discount-thumb">
<img src="Admin/Uploads/Banners/8.jpeg" />
                                 
                                </div>
                                <div class="discount-content">
                                    <span><%=m2subtitle %></span>
                                    <h4 class="title"><a href="<%=m2link %>"><%=m2title %></a></h4>
                                <%--    <a href="<%=m2link %>" class="btn">shop now</a>--%>
                                </div>
                            </div>
                        </div>


                        <div class="col-xl-4 col-lg-6 col-md-8"  onclick="window.location.href='<%=m3link %>';" style="cursor:pointer">
                            <div class="discount-item style-two mb-20">
                                <div class="discount-thumb">
<img src="Admin/Uploads/Banners/9.jpeg" />
                                 
                                </div>
                                <div class="discount-content">
                                    <span><%=m3subtitle %></span>
                                    <h4 class="title"><a href="<%=m3link %>"><%=m3title %></a></h4>
                                    <%--<a href="<%=m3link %>" class="btn">shop now</a>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

             
           <section class="best-deal-area pt-60 pb-80">
                <div class="container-fluid">
                    <div class="row justify-content-center">
                        <div class="col-xl-7 col-lg-9">
                            <div class="best-deal-top-wrap">
                                <div class="bd-section-title">
                                    <h3 class="title">Best Deals <span>of this Week!</span></h3>
                                    <p>A virtual assistant collects the products from your list</p>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="row best-deal-active">

                          <asp:Repeater ID="lstbestdeal" runat="server">

                        <ItemTemplate>
                        <div class="col-xl-3">
                            <div class="best-deal-item">
                                <div class="best-deal-thumb">
                                    <a href="<%# Eval("ProductLink") %>">
<img src="Admin/Uploads/Products/<%# Eval("img1") %>" />
                                       

                                    </a>
                                </div>
                                <div class="best-deal-content">
                                    <div class="main-content">
                                     
                                        <h4 class="title"><a href="<%# Eval("ProductLink") %>"> <%# Eval("ProductName") %></a></h4>
                                  <p>
    $<%# Convert.ToDecimal(Eval("Discount")) > 0 
        ? (Convert.ToDecimal(Eval("price")) - Convert.ToDecimal(Eval("Discount"))).ToString("0.00") 
        : Convert.ToDecimal(Eval("price")).ToString("0.00") %>/-
</p>
                                    </div>
                                    <div class="icon"><a href="<%# Eval("ProductLink") %>">+</a></div>
                                </div>
                            </div>
                        </div>
                       </ItemTemplate>

                    </asp:Repeater>
                                
                    </div>
                </div>
            </section>




           <section class="best-sellers-area pt-75" >
                <div class="container-fluid">
                    <div class="row align-items-end mb-50">
                        <div class="col-md-8 col-sm-9">
                            <div class="section-title">
                                <span class="sub-title">New Arrivals</span>
                                <h2 class="title">New Arrivals Offers View</h2>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-3">
                            <div class="section-btn text-left text-md-right">
                                <a href="shop.html" class="btn">View All</a>
                            </div>
                        </div>
                    </div>
                    <div class="best-sellers-products">
                        <div class="row justify-content-center">
                             <asp:Repeater ID="lstproduct2" runat="server">

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






           <section class="discount-style-two pt-60 pb-50">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="discount-item-two">
                                <div class="discount-thumb">
                                    <img src="Admin/Uploads/Banners/10.jpeg" />
                                  
                                </div>
                                <div class="discount-content">
                                    <span><%=d1subtitle %></span>
                                    <h4 class="title"><a href="shop.html"><%=d1title %></a></h4>
                                    <p><%=d1offertext %></p>
                                    <a href="<%=d1link %>" class="btn rounded-btn">shop now</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="discount-item-two">
                                <div class="discount-thumb"><img src="Admin/Uploads/Banners/11.jpeg" />
                                

                                </div>
                                <div class="discount-content">
                                    <span><%=d2subtitle %></span>
                                    <h4 class="title"><a href="shop.html"><%=d2title %></a></h4>
                                    <p><%=d2offertext %></p>
                                    <a href="<%=d2link %>" class="btn rounded-btn">shop now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>





           <section class="best-sellers-area pt-75">
                <div class="container-fluid">
                    <div class="row align-items-end mb-50">
                        <div class="col-md-8 col-sm-9">
                            <div class="section-title">
                                <span class="sub-title">Best Sellers</span>
                                <h2 class="title">Best Offers View</h2>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-3">
                            <div class="section-btn text-left text-md-right">
                                <a href="shop.html" class="btn">View All</a>
                            </div>
                        </div>
                    </div>
                    <div class="best-sellers-products">
                        <div class="row justify-content-center">
                             <asp:Repeater ID="lstproduct3" runat="server">

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



                <section class="blog-area pt-70 pb-50">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-6 col-lg-8 col-md-10">
                            <div class="section-title section-title-two text-center mb-50">
                                <span class="sub-title">Our Articles</span>
                                <h2 class="title">Our Latest News</h2>
                                <p>Explore expert insights, natural wellness tips, and the latest trends in herbal living through our informative blogs.</p>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center">

                        <asp:Repeater ID="rptBlogs" runat="server">

<ItemTemplate>

                        <div class="col-lg-4 col-md-6 col-sm-9">
                            <div class="blog-post-item mb-30">
                                <div class="blog-post-thumb">
                                    <a href="blogview.aspx?id=<%# Eval("BlogID") %>">
                                        
                                        <img src='<%# String.IsNullOrEmpty(Convert.ToString(Eval("BlogImage")))
? ResolveUrl("~/Admin/Uploads/no-image.png")
: ResolveUrl("~/Admin/Uploads/Blogs/") + Eval("BlogImage") %>'
 />
                                      </a>
                                </div>
                                <div class="blog-post-content">
                                    <div class="blog-post-date"><%# Eval("DayOnly") %> <span><%# Eval("MonthName") %></span></div>
                                    <div class="blog-post-meta">
                                        <ul>
                                            <li><a href="blogview.aspx?id=<%# Eval("BlogID") %>">Admin</a></li>
                                       
                                        </ul>
                                    </div>
                                    <h4 class="title"><a href="blogview.aspx?id=<%# Eval("BlogID") %>"><%# Eval("Title") %></a></h4>
                                    <div class="blog-post-bottom">
                                        <ul>
                                            <li class="read-more"><a href="blogview.aspx?id=<%# Eval("BlogID") %>">Read More <i class="fas fa-angle-double-right"></i></a></li>
                                           
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        </ItemTemplate>

</asp:Repeater>
                    </div>
                </div>
            </section>
               </main>
</asp:Content>

