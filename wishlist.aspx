<%@ Page Title="Wishlist - floraherbals.com" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="wishlist.aspx.cs" Inherits="wishlist" %>

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
                                    
                                        <li class="breadcrumb-item active" aria-current="page">Wishlist</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- breadcrumb-area-end -->

            <!-- cart-area -->
            <div class="cart-area pt-90 pb-90" runat="server" id="data" visible="false">
                <div class="container" >
                    <div class="row justify-content-center">
                        <div class="col-xl-12">
                            <div class="cart-wrapper">
                                 <div class="table-responsive">
                            <table class="table">
                                 <tr>
                                  
                                    <th>Images</th>
                                    <th >Product Name</th>
                                    <th >Price</th>
                                    <th  >Discount</th>
                                
                                    <th>Subtotal</th>
                                   
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

                       
                    </div>

                        
                </div>
                    </div>
               
            </div>
            <!-- cart-area-end -->
            <div class="cart-area pt-90 pb-90" runat="server" id="nodata">
                  <div class="row" 
    style="border:2px dashed #ffcc29; padding:50px 20px; margin:0px 0; border-radius:15px; background:#fffdf5; text-align:center;">

    <div class="col-12">
        <div style="font-size:60px; margin-bottom:15px;">🛒</div>

        <h2 style="font-size:30px; font-weight:600; color:#333; margin-bottom:10px;">
            Your wishlist is Empty
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
        </main>
</asp:Content>

