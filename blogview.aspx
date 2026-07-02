<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="blogview.aspx.cs" Inherits="blogview" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <main>

            <!-- breadcrumb-area -->
            <section class="breadcrumb-area breadcrumb-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="breadcrumb-content">
                                <h2 class="title">Blogs</h2>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Blogs</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- breadcrumb-area-end -->

           
            <section class="blog-details-area blog-gray-bg">
                <div class="container">
                    <div class="container-inner-wrap">
                        <div class="row justify-content-center">
                             <div class="col-lg-1">
                               
                            </div>
                            <div class="col-lg-10">

                                    <asp:Repeater ID="rptBlogs" runat="server">

<ItemTemplate>
                                <div class="standard-blog-item mb-50">
                                    <div class="blog-thumb">
                                      <img src='<%# String.IsNullOrEmpty(Convert.ToString(Eval("BlogImage")))
? ResolveUrl("~/Admin/Uploads/no-image.png")
: ResolveUrl("~/Admin/Uploads/Blogs/") + Eval("BlogImage") %>'  style="text-align:center"
                                    </div>
                                    <div class="standard-blog-content blog-details-content">
                                        <h4 class="title"><%# Eval("Title") %></h4>
                                        <ul class="standard-blog-meta">
                                            <li><a href="#"><i class="far fa-user"></i>By Admin</a></li>
                                            <li><a href="#"><i class="far fa-calendar"></i><%# Eval("ndate") %></a></li>
                                            
                                        </ul>
                                        <p><%# Eval("Description") %></p>
                                
                                        
                                    </div>
                                </div>
                                
                                         </ItemTemplate>

</asp:Repeater>                            
                            </div>
                            <div class="col-lg-1">
                               
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            </main>
</asp:Content>

