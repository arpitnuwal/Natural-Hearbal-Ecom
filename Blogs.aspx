<%@ Page Title="Blog - floraherbals.com" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Blogs.aspx.cs" Inherits="Blogs" %>

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
                                        <li class="breadcrumb-item"><a href="index.aspx">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Blogs</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- breadcrumb-area-end -->

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

