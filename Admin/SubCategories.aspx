<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master"
    AutoEventWireup="true" CodeFile="SubCategories.aspx.cs"
    Inherits="Admin_SubCategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<main class="main-content">

    <div class="page-header d-flex flex-wrap align-items-start justify-content-between gap-3">
        <div>
            <h1>Sub Category Management</h1>
            <ul class="breadcrumb mt-1">
                <li><a href="#">Home</a></li>
                <li><a href="#">Dashboard</a></li>
                <li>Sub Categories</li>
            </ul>
        </div>
    </div>

    <div class="row g-3">

        <!-- ADD / EDIT FORM -->
        <div class="col-12 col-lg-4">
            <div class="panel">

                <div class="panel-header">
                    <h5>
                        <i class="bi bi-diagram-3 text-primary"></i>
                        Add New Sub Category
                    </h5>
                </div>

                <div class="panel-body">

                    <asp:HiddenField ID="hfSubCategoryID" runat="server" />

                    <div class="mb-3">
                        <label class="form-label">
                            Category
                            <span class="text-danger">*</span>
                        </label>

                        <asp:DropDownList ID="ddlCategory"
                            runat="server"
                            CssClass="form-select">
                        </asp:DropDownList>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">
                            Sub Category Name
                            <span class="text-danger">*</span>
                        </label>

                        <asp:TextBox ID="txtSubCategoryName"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter Sub Category Name">
                        </asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">
                            Sub Category Image
                        </label>

                        <asp:FileUpload ID="fuSubCategoryImage"
                            runat="server"
                            CssClass="form-control" />
                    </div>

                    <asp:Panel ID="existingImgWrap"
                        runat="server"
                        Visible="false"
                        CssClass="mb-3">

                        <label class="form-label">
                            Current Image
                        </label>

                        <br />

                        <asp:Image ID="imgExisting"
                            runat="server"
                            Width="70"
                            Height="70"
                            Style="border-radius:8px;object-fit:cover;" />

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
                            Text="Save Sub-Category"
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

        <!-- TABLE -->
        <div class="col-12 col-lg-8">

            <div class="panel">

                <div class="panel-header">

                    <h5>
                        <i class="bi bi-table text-primary"></i>
                        All Sub Categories
                    </h5>

                    <div class="search-filter-bar">

                        <div class="search-box">
                            <i class="bi bi-search"></i>

                            <asp:TextBox ID="txtSearch"
                                runat="server"
                                CssClass="form-control"
                                AutoPostBack="true"
                                OnTextChanged="txtSearch_TextChanged"
                                placeholder="Search sub categories...">
                            </asp:TextBox>
                        </div>

                        <asp:DropDownList ID="ddlFilterCategory"
                            runat="server"
                            CssClass="filter-select"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="ddlFilterCategory_SelectedIndexChanged">
                        </asp:DropDownList>

                        <asp:DropDownList ID="ddlFilterStatus"
                            runat="server"
                            CssClass="filter-select"
                            AutoPostBack="true"
                            OnSelectedIndexChanged="ddlFilterStatus_SelectedIndexChanged">

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
                                <th>Category</th>
                                <th>Sub Category</th>
                                <th>Status</th>
                                <th style="text-align:center;">Actions</th>
                            </tr>
                        </thead>

                        <tbody>

                            <asp:Repeater ID="rptSubCategories" runat="server">

                                <ItemTemplate>

                                    <tr>

                                        <td>
                                            <%# Eval("SubCategoryID") %>
                                        </td>

                                        <td>

                                            <img src='<%# String.IsNullOrEmpty(Convert.ToString(Eval("SubCategoryImage")))
                                            ? ResolveUrl("~/Admin/Uploads/no-image.png")
                                            : ResolveUrl("~/Admin/Uploads/SubCategories/") + Eval("SubCategoryImage") %>'
                                                width="45"
                                                height="45"
                                                style="border-radius:6px;" />

                                        </td>

                                        <td>
                                            <%# Eval("CategoryName") %>
                                        </td>

                                        <td>
                                            <%# Eval("SubCategoryName") %>
                                        </td>

                                        <td>

                                            <span class='<%# Convert.ToBoolean(Eval("Status"))
                                            ? "badge bg-success"
                                            : "badge bg-danger" %>'>

                                                <%# Convert.ToBoolean(Eval("Status"))
                                                ? "Active"
                                                : "Inactive" %>

                                            </span>

                                        </td>

                                        <td style="text-align:center;">

                                            <asp:LinkButton ID="btnEdit"
                                                runat="server"
                                                CssClass="btn btn-sm btn-primary"
                                                CommandArgument='<%# Eval("SubCategoryID") %>'
                                                OnClick="btnEdit_Click">

                                                Edit

                                            </asp:LinkButton>

                                            <asp:LinkButton ID="btnDelete"
                                                runat="server"
                                                CssClass="btn btn-sm btn-danger"
                                                CommandArgument='<%# Eval("SubCategoryID") %>'
                                                OnClick="btnDelete_Click"
                                                OnClientClick="return confirm('Delete this sub category?');">

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
                        <p>No sub categories found.</p>

                    </div>

                </div>

                <div style="padding:12px 16px;display:flex;align-items:center;justify-content:space-between;border-top:1px solid var(--border);flex-wrap:wrap;gap:8px;">

                    <asp:Label ID="lblCount"
                        runat="server"
                        Text="0 Records"
                        Style="font-size:.8rem;color:var(--text-muted);" />

                </div>

            </div>

        </div>

    </div>

</main>

</asp:Content>