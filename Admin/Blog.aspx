<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Blog.aspx.cs" Inherits="Blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <main class="main-content">

     <div class="page-header d-flex flex-wrap align-items-start justify-content-between gap-3">
        <div>
            <h1>Blog Management</h1>
            <ul class="breadcrumb mt-1">
                <li><a href="#">Home</a></li>
                <li><a href="#">Dashboard</a></li>
                <li>Blogs</li>
            </ul>
        </div>
    </div>

    <div class="row g-3">


        <div class="col-12 col-lg-4">

<div class="panel">

<div class="panel-header">
<h5>
<i class="bi bi-journal-text text-primary"></i>
Add New Blog
</h5>
</div>

<div class="panel-body">

<asp:HiddenField ID="hfBlogID" runat="server" />

<div class="mb-3">
<label class="form-label">
Title
<span class="text-danger">*</span>
</label>

<asp:TextBox ID="txtTitle"
runat="server"
CssClass="form-control"
placeholder="Enter Blog Title">
</asp:TextBox>
</div>

<div class="mb-3">
<label class="form-label">
Short Description
</label>

<asp:TextBox ID="txtShortDescription"
runat="server"
CssClass="form-control"
TextMode="MultiLine"
Rows="3">
</asp:TextBox>
</div>

<div class="mb-3">
<label class="form-label">
Description
</label>

<asp:TextBox ID="txtDescription"
runat="server"
CssClass="form-control"
TextMode="MultiLine"
Rows="6">
</asp:TextBox>
</div>

<div class="mb-3">
<label class="form-label">
Blog Image
</label>

<asp:FileUpload ID="fuBlogImage"
runat="server"
CssClass="form-control" />
</div>

<asp:Panel ID="existingImageWrap"
runat="server"
Visible="false"
CssClass="mb-3">

<img id="imgExisting"
runat="server"
style="width:80px;height:80px;border-radius:8px;object-fit:cover;" />

</asp:Panel>

<div class="mb-3">
<label class="form-label d-block">
Status
</label>

<asp:CheckBox ID="chkStatus"
runat="server"
Checked="true"
Text=" Active" />
</div>

<div class="d-flex gap-2">

<asp:Button ID="btnSave"
runat="server"
Text="Save Blog"
CssClass="btn-primary-custom flex-fill justify-content-center"
OnClick="btnSave_Click" />

<asp:Button ID="btnReset"
runat="server"
Text="Reset"
CssClass="btn-secondary-custom"
OnClick="btnReset_Click" />

</div>

</div>
</div>
</div>
        <div class="col-12 col-lg-8">

<div class="panel">

<div class="panel-header">

<h5>
<i class="bi bi-table text-primary"></i>
All Blogs
</h5>

<div class="search-filter-bar">

<div class="search-box">
<i class="bi bi-search"></i>

<asp:TextBox ID="txtSearch"
runat="server"
CssClass="form-control"
AutoPostBack="true"
OnTextChanged="txtSearch_TextChanged"
placeholder="Search blogs...">
</asp:TextBox>

</div>

<asp:DropDownList ID="ddlStatus"
runat="server"
CssClass="filter-select"
AutoPostBack="true"
OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged">

<asp:ListItem Text="All Status" Value="" />
<asp:ListItem Text="Active" Value="1" />
<asp:ListItem Text="Inactive" Value="0" />

</asp:DropDownList>

</div>

</div>

<div style="overflow-x:auto;">

<table class="custom-table">

<thead>
<tr>
<th>#</th>
<th>Image</th>
<th>Title</th>
<th>Short Description</th>
<th>Status</th>
<th>Date</th>
<th>Actions</th>
</tr>
</thead>

<tbody>

<asp:Repeater ID="rptBlogs" runat="server">

<ItemTemplate>

<tr>

<td><%# Eval("BlogID") %></td>

<td>

<img src='<%# String.IsNullOrEmpty(Convert.ToString(Eval("BlogImage")))
? ResolveUrl("~/Admin/Uploads/no-image.png")
: ResolveUrl("~/Admin/Uploads/Blogs/") + Eval("BlogImage") %>'
width="50"
height="50"
style="border-radius:8px;object-fit:cover;" />

</td>

<td><%# Eval("Title") %></td>

<td><%# Eval("ShortDescription") %></td>

<td>

<span class='<%# Convert.ToBoolean(Eval("Status"))
? "badge bg-success"
: "badge bg-danger" %>'>

<%# Convert.ToBoolean(Eval("Status"))
? "Active"
: "Inactive" %>

</span>

</td>

<td>
<%# Convert.ToDateTime(Eval("CreatedDate")).ToString("dd MMM yyyy") %>
</td>

<td>

<asp:LinkButton ID="btnEdit"
runat="server"
CssClass="btn btn-sm btn-primary"
CommandArgument='<%# Eval("BlogID") %>'
OnClick="btnEdit_Click">
Edit
</asp:LinkButton>

<asp:LinkButton ID="btnDelete"
runat="server"
CssClass="btn btn-sm btn-danger"
CommandArgument='<%# Eval("BlogID") %>'
OnClick="btnDelete_Click"
OnClientClick="return confirm('Delete this blog?');">
Delete
</asp:LinkButton>

</td>

</tr>

</ItemTemplate>

</asp:Repeater>

</tbody>

</table>

    <div id="emptyState"
     runat="server"
     visible="false"
     class="empty-state">

    <i class="bi bi-inbox"></i>
    <p>No blogs found.</p>

</div>

</div>

</div>


            <div style="padding:12px 16px;display:flex;align-items:center;justify-content:space-between;border-top:1px solid var(--border);flex-wrap:wrap;gap:8px;">

    <asp:Label ID="lblCount"
        runat="server"
        Text="0 Blogs"
        Style="font-size:.8rem;color:var(--text-muted);" />

</div>

</div>



        </div>
         </main>

</asp:Content>

