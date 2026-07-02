<%@ Page Title="Our Collection - floraherbals.com" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Shop.aspx.cs" Inherits="Shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .category-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.toggle-icon {
    cursor: pointer;
    font-size: 18px;
    font-weight: bold;
}

.sub-menu {
    list-style: none;
    padding-left: 20px;
}


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    

            <!-- breadcrumb-area -->
            <div class="breadcrumb-area breadcrumb-bg-two">
                <div class="container custom-container">
                    <div class="row">
                        <div class="col-12">
                            <div class="breadcrumb-content">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.aspx">Home</a></li>
                                        <li class="breadcrumb-item"><a href="shop.html">Shop</a></li>
                                  
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- breadcrumb-area-end -->

            <!-- shop-area -->
            <section class="shop--area pt-90 pb-90">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-3 order-2 order-lg-0">
                            <aside class="shop-sidebar">
                                <div class="widget shop-widget">
    <div class="shop-widget-title">
        <h6 class="title">Product Categories</h6>
    </div>

    <asp:SqlDataSource ID="MyCon" runat="server"
    ConnectionString="<%$ ConnectionStrings:MyCon %>"
    SelectCommand="SELECT CategoryID, CategoryName FROM Categories ORDER BY CategoryName">
</asp:SqlDataSource>

<div class="shop-cat-list">
    <ul>
        <asp:ListView ID="lstbrand" runat="server"
            DataSourceID="MyCon"
            OnItemDataBound="lstbrand_ItemDataBound">

            <ItemTemplate>

                <li>
                    <div class="category-item">
                        <a href='shop.aspx?id=<%# Eval("CategoryID") %>&&sid=<%=Request.QueryString["sid"] %>&&bid=<%=Request.QueryString["bid"] %>&&sort=<%=Request.QueryString["sort"] %>&&price=<%=Request.QueryString["price"] %>'>
                            <%# Eval("CategoryName") %>
                        </a>

                        <span class="toggle-icon" onclick="toggleSubMenu(this)">+</span>
                    </div>

                    <ul class="sub-menu" style="display:none;">
                        <asp:ListView ID="lstSubCategory" runat="server">
                            <ItemTemplate>
                                <li>
                                    
                                    <a href='shop.aspx?id=<%=Request.QueryString["id"] %>&&sid=<%# Eval("SubCategoryID") %>&&bid=<%=Request.QueryString["bid"] %>&&sort=<%=Request.QueryString["sort"] %>&&price=<%=Request.QueryString["price"] %>'>
                                        <%# Eval("SubCategoryName") %>
                                    </a>
                                </li>
                            </ItemTemplate>
                        </asp:ListView>
                    </ul>
                </li>

            </ItemTemplate>

        </asp:ListView>
    </ul>
</div>
</div><script>
          function toggleSubMenu(element) {

              // Sabhi submenus band karo
              var allMenus = document.querySelectorAll('.sub-menu');
              var allIcons = document.querySelectorAll('.toggle-icon');

              allMenus.forEach(function (menu) {
                  if (menu !== element.parentElement.nextElementSibling) {
                      menu.style.display = 'none';
                  }
              });

              allIcons.forEach(function (icon) {
                  if (icon !== element) {
                      icon.innerHTML = '+';
                  }
              });

              // Current submenu toggle karo
              var submenu = element.parentElement.nextElementSibling;

              if (submenu.style.display === "block") {
                  submenu.style.display = "none";
                  element.innerHTML = "+";
              } else {
                  submenu.style.display = "block";
                  element.innerHTML = "-";
              }
          }
</script>
                                <div class="widget shop-widget">
                                    <div class="shop-widget-title">
                                        <h6 class="title">Filter By Price</h6>
                                    </div>
                                      <div class="shop-cat-list">
                                         <ul class="price-range-list">
        <li><a href='shop.aspx?id=<%=Request.QueryString["id"] %>&&sid=<%=Request.QueryString["sid"] %>&&bid=<%=Request.QueryString["bid"] %>&&sort=<%=Request.QueryString["sort"] %>&&price=1'>$0 - $100</a></li>
        <li><a href='shop.aspx?id=<%=Request.QueryString["id"] %>&&sid=<%=Request.QueryString["sid"] %>&&bid=<%=Request.QueryString["bid"] %>&&sort=<%=Request.QueryString["sort"] %>&&price=2'>$101 - $250</a></li>
        <li><a href='shop.aspx?id=<%=Request.QueryString["id"] %>&&sid=<%=Request.QueryString["sid"] %>&&bid=<%=Request.QueryString["bid"] %>&&sort=<%=Request.QueryString["sort"] %>&&price=3'>$251 - $500</a></li>
        <li><a href='shop.aspx?id=<%=Request.QueryString["id"] %>&&sid=<%=Request.QueryString["sid"] %>&&bid=<%=Request.QueryString["bid"] %>&&sort=<%=Request.QueryString["sort"] %>&&price=4'>$501 - $1000</a></li>
        <li><a href='shop.aspx?id=<%=Request.QueryString["id"] %>&&sid=<%=Request.QueryString["sid"] %>&&bid=<%=Request.QueryString["bid"] %>&&sort=<%=Request.QueryString["sort"] %>&&price=5'>$1001 - $2000</a></li>
        <li><a href='shop.aspx?id=<%=Request.QueryString["id"] %>&&sid=<%=Request.QueryString["sid"] %>&&bid=<%=Request.QueryString["bid"] %>&&sort=<%=Request.QueryString["sort"] %>&&price=6'>$2001 - $5000</a></li>
        <li><a href='shop.aspx?id=<%=Request.QueryString["id"] %>&&sid=<%=Request.QueryString["sid"] %>&&bid=<%=Request.QueryString["bid"] %>&&sort=<%=Request.QueryString["sort"] %>&&price=7'>$5000+</a></li>
    </ul>
                                </div></div>
                                    
                                <div class="widget shop-widget">
                                    <div class="shop-widget-title">
                                        <h6 class="title">BRANDS</h6>
                                    </div>
                                    <div class="shop-cat-list">
                                        <ul>
                                             <asp:listview id="lstbrand1" runat="server" DataSourceID="Sqldatasource1">
                                            <ItemTemplate>

                                                
                                <li><a href='shop.aspx?id=<%=Request.QueryString["id"] %>&&sid=<%=Request.QueryString["sid"] %>&&bid=<%# Eval("brandid") %>&&sort=<%=Request.QueryString["sort"] %>&&price=<%=Request.QueryString["price"] %>'><%# Eval("brandname") %> <span>+</span></a></li>
                                 </ItemTemplate>
                                        </asp:listview>

                                        <asp:sqldatasource id="Sqldatasource1" runat="server" connectionstring="<%$ ConnectionStrings:MyCon%>"
                                            cancelselectonnullparameter="false" selectcommand="select brandid ,brandname from Brands order by newid()">
                                          
                                        </asp:sqldatasource>
                                          
                                        </ul>
                                    </div>
                                </div>
                               
                            </aside>
                        </div>
                        <div class="col-9">
                            
                            <div class="shop-top-meta mb-30">
                                <div class="row">
                                    <div class="col-md-6 col-sm-7">
                                        <div class="shop-top-left">
                                            <ul>
                                                <li><a href="#"><i class="fas fa-bars"></i> FILTER</a></li>
                                                <li>Showing  <asp:Label ID="lblcount" runat="server" ></asp:Label> results</li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-5">
                                        <div class="shop-top-right">
                                          
                                                <select name="select"  style="padding:8px" onchange="window.location = this.options[this.selectedIndex].value;">
                                                 

                                                     <option  value='shop.aspx?id=<%=Request.QueryString["id"] %>&&sid=<%=Request.QueryString["sid"] %>&&bid=<%=Request.QueryString["bid"] %>sort=1&&price=<%=Request.QueryString["price"] %>'>Default Sorting</option>
                                    
                                        <option value='shop.aspx?id=<%=Request.QueryString["id"] %>&&sid=<%=Request.QueryString["sid"] %>&&bid=<%=Request.QueryString["bid"] %>&&sort=2&&price=<%=Request.QueryString["price"] %>'>Sort by new arrivals</option>
                                                    <option value='shop.aspx?id=<%=Request.QueryString["id"] %>&&sid=<%=Request.QueryString["sid"] %>&&bid=<%=Request.QueryString["bid"] %>&&sort=5&&price=<%=Request.QueryString["price"] %>'>Sort by A to Z</option>
                                        <option value='shop.aspx?id=<%=Request.QueryString["id"] %>&&sid=<%=Request.QueryString["sid"] %>&&bid=<%=Request.QueryString["bid"] %>&&sort=3&&price=<%=Request.QueryString["price"] %>'>Sort by price: low to high</option>
                                        <option value='shop.aspx?id=<%=Request.QueryString["id"] %>&&sid=<%=Request.QueryString["sid"] %>&&bid=<%=Request.QueryString["bid"] %>&&sort=4&&price=<%=Request.QueryString["price"] %>'>Sort by price: high to low</option>
                                                </select>
                                         
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="shop-products-wrap">
                                <div class="row justify-content-center">

                                      <asp:Repeater ID="lstproduct2" runat="server">

                        <ItemTemplate>
                                    <div class="col-xl-3 col-md-4 col-sm-6">
                                        <div class="sp-product-item">
                                            <div class="sp-product-thumb">
                                                <span class="batch">New</span>
                                                <a href="shop-details.html"><img src="Admin/Uploads/Products/<%# Eval("img1") %>" /></a>
                                            </div>
                                            <div class="sp-product-content">
                                    
                                        <h6 class="title"><a href="shop-details.html"><%# Eval("ProductName") %></a></h6>
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
                    </div>
                </div>
            </section>
            <!-- shop-area-end -->

        </main>
</asp:Content>

