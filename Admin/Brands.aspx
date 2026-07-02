<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master"
    AutoEventWireup="true" CodeFile="Brands.aspx.cs"
    Inherits="Admin_Brands" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<main class="main-content">

    <div class="page-header d-flex flex-wrap align-items-start justify-content-between gap-3">
        <div>
            <h1>Brand Management</h1>
            <ul class="breadcrumb mt-1">
                <li><a href="#">Home</a></li>
                <li><a href="#">Dashboard</a></li>
                <li>Brands</li>
            </ul>
        </div>
    </div>

    <div class="row g-3">

        <!-- ADD / EDIT FORM -->
        <div class="col-12 col-lg-4">

            <div class="panel">

                <div class="panel-header">
                    <h5>
                        <i class="bi bi-award text-primary"></i>
                        Add New Brand
                    </h5>
                </div>

                <div class="panel-body">

                    <asp:HiddenField ID="hfBrandID" runat="server" />

                    <div class="mb-3">
                        <label class="form-label">
                            Brand Name
                            <span class="text-danger">*</span>
                        </label>

                        <asp:TextBox ID="txtBrandName"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter Brand Name">
                        </asp:TextBox>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">
                            Brand Logo
                        </label>

                        <asp:FileUpload ID="fuBrandLogo"
                            runat="server"
                            CssClass="form-control" />
                    </div>

                    <asp:Panel ID="existingLogoWrap"
                        runat="server"
                        Visible="false"
                        CssClass="mb-3">

                        <label class="form-label">
                            Current Logo
                        </label>

                        <br />

                        <img id="imgExistingLogo"
                            runat="server"
                            style="width:70px;height:70px;border-radius:8px;object-fit:cover;" />

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
                            Text="Save Brand"
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
                        All Brands
                    </h5>

                    <div class="search-filter-bar">

                        <div class="search-box">
                            <i class="bi bi-search"></i>

                            <asp:TextBox ID="txtSearch"
                                runat="server"
                                CssClass="form-control"
                                AutoPostBack="true"
                                OnTextChanged="txtSearch_TextChanged"
                                placeholder="Search brands...">
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
                                <th>Logo</th>
                                <th>Brand Name</th>
                                <th>Status</th>
                                <th style="text-align:center;">Actions</th>
                            </tr>
                        </thead>

                        <tbody>

                            <asp:Repeater ID="rptBrands" runat="server">

                                <ItemTemplate>

                                    <tr>

                                        <td>
                                            <%# Eval("BrandID") %>
                                        </td>

                                        <td>

                                            <img src='<%# String.IsNullOrEmpty(Convert.ToString(Eval("BrandLogo")))
                                            ? ResolveUrl("~/Admin/Uploads/no-image.png")
                                            : ResolveUrl("~/Admin/Uploads/Brands/") + Eval("BrandLogo") %>'
                                                width="45"
                                                height="45"
                                                style="border-radius:6px;" />

                                        </td>

                                        <td>
                                            <%# Eval("BrandName") %>
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
                                                CommandArgument='<%# Eval("BrandID") %>'
                                                OnClick="btnEdit_Click">

                                                Edit

                                            </asp:LinkButton>

                                            <asp:LinkButton ID="btnDelete"
                                                runat="server"
                                                CssClass="btn btn-sm btn-danger"
                                                CommandArgument='<%# Eval("BrandID") %>'
                                                OnClick="btnDelete_Click"
                                                OnClientClick="return confirm('Delete this brand?');">

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
                        <p>No brands found.</p>

                    </div>

                </div>

                <div style="padding:12px 16px;display:flex;align-items:center;justify-content:space-between;border-top:1px solid var(--border);flex-wrap:wrap;gap:8px;">

                    <asp:Label ID="lblCount"
                        runat="server"
                        Text="0 Brands"
                        Style="font-size:.8rem;color:var(--text-muted);" />

                </div>

            </div>

        </div>

    </div>

</main>

</asp:Content>