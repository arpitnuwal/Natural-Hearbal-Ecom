<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="categories.aspx.cs" Inherits="categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <main class="main-content">

  <!-- PAGE HEADER -->
  <div class="page-header d-flex flex-wrap align-items-start justify-content-between gap-3">
    <div>
      <h1>Category Management</h1>
      <ul class="breadcrumb mt-1">
        <li><a href="#">Home</a></li>
        <li><a href="#">Dashboard</a></li>
        <li>Categories</li>
      </ul>
    </div>
    <button class="btn-primary-custom" onclick="openAddModal()">
      <i class="bi bi-plus-lg"></i> Add New Category
    </button>
  </div>



  <div class="row g-3">
    <!-- ── ADD / EDIT FORM ── -->
    <div class="col-12 col-lg-4">
      <div class="panel">
        <div class="panel-header">
          <h5><i class="bi bi-pencil-square text-primary"></i> <span id="formTitle">Add New Category</span></h5>
          <span id="formBadge" class="badge" style="background:#eef1ff;color:#4f6ef7;font-size:.75rem;border-radius:20px;padding:4px 10px;">New</span>
        </div>
        <div class="panel-body">
          <asp:HiddenField ID="hfCategoryID" runat="server" />

<div class="mb-3">
    <label class="form-label">Category Name <span class="text-danger">*</span></label>
    <asp:TextBox ID="txtCategoryName" runat="server" CssClass="form-control" placeholder="e.g. Electronics"></asp:TextBox>
</div>

<div class="mb-4">
    <label class="form-label">Category Image</label>
    <asp:FileUpload ID="fuCategoryImage" runat="server" CssClass="form-control" />
</div>

<div class="mb-3">
    <label class="form-label d-block">Status</label>
    <asp:CheckBox ID="chkStatus" runat="server" Checked="true" Text=" Active" />
</div>

<div class="d-flex gap-2">
    <asp:Button ID="btnSave"
        runat="server"
        Text="Save Category"
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

    <!-- ── CATEGORY TABLE ── -->
    <div class="col-12 col-lg-8">
      <div class="panel">
        <div class="panel-header">
          <h5><i class="bi bi-table text-primary"></i> All Categories</h5>
          <div class="search-filter-bar">
            <div class="search-box">
              <i class="bi bi-search"></i>
              <asp:TextBox ID="txtSearch"
    runat="server"
    CssClass="form-control"
    AutoPostBack="true"
    OnTextChanged="txtSearch_TextChanged"
    placeholder="Search categories..." />
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
            <button class="btn-secondary-custom" style="height:38px;padding:0 12px;font-size:.8rem;" onclick="exportCSV()">
              <i class="bi bi-download"></i> Export
            </button>
          </div>
        </div>

        <div style="overflow-x:auto;">
          <table class="custom-table" id="catTable">
            <thead>
            <tr>
    <th>#</th>
    <th>
    <asp:LinkButton ID="lnkSortName"
        runat="server"
        OnClick="lnkSortName_Click"
        CausesValidation="false">
        Category
    </asp:LinkButton>
</th>
    <th>Status</th>
    <th style="text-align:center;">Actions</th>
</tr>
            </thead>
           <tbody>
    <asp:Repeater ID="rptCategories" runat="server">
        <ItemTemplate>
            <tr>
                <td><%# Eval("CategoryID") %></td>

                <td>
                    <div class="d-flex align-items-center gap-2">
                      <img src='<%# String.IsNullOrEmpty(Convert.ToString(Eval("CategoryImage")))
? ResolveUrl("~/Admin/Uploads/no-image.png")
: ResolveUrl("~/Admin/Uploads/categoryimage/") + Eval("CategoryImage") %>'
width="40"
height="40"
style="border-radius:6px;" />
                        <%# Eval("CategoryName") %>
                    </div>
                </td>

                <td>
                    <span class='<%# Convert.ToBoolean(Eval("Status")) ? "badge bg-success" : "badge bg-danger" %>'>
                        <%# Convert.ToBoolean(Eval("Status")) ? "Active" : "Inactive" %>
                    </span>
                </td>

                <td style="text-align:center;">

                    <asp:LinkButton ID="btnEdit"
                        runat="server"
                        CssClass="btn btn-sm btn-primary"
                        CommandArgument='<%# Eval("CategoryID") %>'
                        OnClick="btnEdit_Click">
                        Edit
                    </asp:LinkButton>

                    <asp:LinkButton ID="btnDelete"
                        runat="server"
                        CssClass="btn btn-sm btn-danger"
                        CommandArgument='<%# Eval("CategoryID") %>'
                        OnClick="btnDelete_Click"
                        OnClientClick="return confirm('Delete this category?');">
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
     class="empty-state"
     visible="false">
        </div>

        <!-- PAGINATION + COUNT -->
        <div style="padding:12px 16px;display:flex;align-items:center;justify-content:space-between;border-top:1px solid var(--border);flex-wrap:wrap;gap:8px;">
          <asp:Label ID="lblCount"
    runat="server"
    Text="0 Categories"
    Style="font-size:.8rem;color:var(--text-muted);" />
          <div class="d-flex gap-1" id="pagination"></div>
        </div>
      </div>
    </div>
  </div>
</main>

</asp:Content>

