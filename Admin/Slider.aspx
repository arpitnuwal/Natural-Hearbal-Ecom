<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Slider.aspx.cs" Inherits="Slider" %>

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
                <i class="bi bi-images text-primary"></i>
                Add New Slider
            </h5>
        </div>

        <div class="panel-body">

            <asp:HiddenField ID="hfSliderID" runat="server" />

            <div class="mb-3">
                <label class="form-label">
                    Title 1
                    <span class="text-danger">*</span>
                </label>

                <asp:TextBox ID="txtTitle1"
                    runat="server"
                    CssClass="form-control"
                    placeholder="Enter Title 1">
                </asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">
                    Title 2
                </label>

                <asp:TextBox ID="txtTitle2"
                    runat="server"
                    CssClass="form-control"
                    TextMode="MultiLine"
                    Rows="3"
                    placeholder="Enter Title 2">
                </asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">
                    Slider Link
                </label>

                <asp:TextBox ID="txtSliderLink"
                    runat="server"
                    CssClass="form-control"
                    placeholder="https://example.com">
                </asp:TextBox>
            </div>

            <div class="mb-3">
                <label class="form-label">
                    Slider Image
                    <small class="text-muted">(812 × 490)</small>
                </label>

                <asp:FileUpload ID="fuSliderImage"
                    runat="server"
                    CssClass="form-control" />
            </div>

            <asp:Panel ID="existingImageWrap"
                runat="server"
                Visible="false"
                CssClass="mb-3">

                <img id="imgExisting"
                    runat="server"
                    style="width:120px;height:70px;object-fit:cover;border-radius:8px;" />

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
                    Text="Save Slider"
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
                All Sliders
            </h5>

            <div class="search-filter-bar">

                <div class="search-box">

                    <i class="bi bi-search"></i>

                    <asp:TextBox ID="txtSearch"
                        runat="server"
                        CssClass="form-control"
                        AutoPostBack="true"
                        OnTextChanged="txtSearch_TextChanged"
                        placeholder="Search slider...">
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
                        <th>ID</th>
                        <th>Image</th>
                        <th>Title 1</th>
                        <th>Link</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>

                <tbody>

                    <asp:Repeater ID="rptSliders" runat="server">

                        <ItemTemplate>

                            <tr>

                                <td>
                                    <%# Eval("SliderID") %>
                                </td>

                                <td>

                                    <img src='<%# String.IsNullOrEmpty(Convert.ToString(Eval("SliderImage")))
                                    ? ResolveUrl("~/Admin/Uploads/no-image.png")
                                    : ResolveUrl("~/Admin/Uploads/Sliders/") + Eval("SliderImage") %>'
                                    width="90"
                                    height="55"
                                    style="border-radius:6px;object-fit:cover;" />

                                </td>

                                <td>
                                    <%# Eval("Title1") %>
                                </td>

                                <td>
                                    <%# Eval("SliderLink") %>
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

                                <td>

                                    <asp:LinkButton ID="btnEdit"
                                        runat="server"
                                        CssClass="btn btn-sm btn-primary"
                                        CommandArgument='<%# Eval("SliderID") %>'
                                        OnClick="btnEdit_Click">

                                        Edit

                                    </asp:LinkButton>

                                    <asp:LinkButton ID="btnDelete"
                                        runat="server"
                                        CssClass="btn btn-sm btn-danger"
                                        CommandArgument='<%# Eval("SliderID") %>'
                                        OnClick="btnDelete_Click"
                                        OnClientClick="return confirm('Delete this slider?');">

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

                <i class="bi bi-images"></i>
                <p>No sliders found.</p>

            </div>

        </div>

        <div style="padding:12px 16px;border-top:1px solid var(--border);">

            <asp:Label ID="lblCount"
                runat="server"
                Text="0 Sliders"
                Style="font-size:.8rem;color:var(--text-muted);" />

        </div>

    </div>

</div>


        </div>
         </main>


</asp:Content>

