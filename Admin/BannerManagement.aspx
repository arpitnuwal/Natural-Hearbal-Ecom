<%@ Page Title="Banner Management" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master"
    AutoEventWireup="true" CodeFile="BannerManagement.aspx.cs"
    Inherits="BannerManagement" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
    .banner-preview {
        width: 90px;
        height: 60px;
        object-fit: cover;
        border-radius: 8px;
        border: 1px solid #ddd;
    }

    .field-section {
        display: none;
    }

    .image-preview {
        max-width: 250px;
        border-radius: 10px;
        border: 1px solid #ddd;
        padding: 5px;
        margin-top: 10px;
    }

    .required {
        color: red;
    }

    .info-box {
        background: #eef4ff;
        border-left: 4px solid #4f6ef7;
        padding: 10px 15px;
        border-radius: 8px;
        font-size: 13px;
    }

    .thumb-table {
        width: 70px;
        height: 55px;
        object-fit: cover;
        border-radius: 8px;
        border: 1px solid #ddd;
    }
</style>

<script>

    function toggleBannerFields() {

        var section = document.getElementById('<%= ddlBannerSection.ClientID %>').value;

        document.getElementById("divBannerType").style.display = "none";
        document.getElementById("divSubtitle").style.display = "none";
        document.getElementById("divTitle").style.display = "none";
        document.getElementById("divOfferText").style.display = "none";

        if (section === "Top") {

            document.getElementById("divBannerType").style.display = "block";
        }
        else if (section === "Middle") {

            document.getElementById("divSubtitle").style.display = "block";
            document.getElementById("divTitle").style.display = "block";
        }
        else if (section === "Bottom") {

            document.getElementById("divSubtitle").style.display = "block";
            document.getElementById("divTitle").style.display = "block";
            document.getElementById("divOfferText").style.display = "block";
        }
    }

    function previewImage(input) {

        if (input.files && input.files[0]) {

            var reader = new FileReader();

            reader.onload = function (e) {

                document.getElementById("imgPreview").src = e.target.result;
                document.getElementById("imgPreview").style.display = "block";
            };

            reader.readAsDataURL(input.files[0]);
        }
    }

    window.onload = function () {
        toggleBannerFields();
    };

</script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="main-content">

    <!-- PAGE HEADER -->

    <div class="page-header">
        <h1>Banner Management</h1>

        <ul class="breadcrumb">
            <li><a href="Dashboard.aspx">Dashboard</a></li>
            <li>Banner Management</li>
        </ul>
    </div>

    <!-- FORM PANEL -->

    <div class="panel">

        <div class="panel-header">
            <h5>
                <i class="bi bi-image"></i>
                Add / Update Banner
            </h5>
        </div>

        <div class="panel-body">

            <asp:HiddenField ID="hfBannerID" runat="server" />

            <div class="row">

                <!-- Banner Section -->

                <div class="col-md-4 mb-3">
                    <label class="form-label">
                        Banner Section <span class="required">*</span>
                    </label>

                    <asp:DropDownList ID="ddlBannerSection"
                        runat="server"
                        CssClass="form-select"
                        onchange="toggleBannerFields();">

                        <asp:ListItem Value="">Select Section</asp:ListItem>
                        <asp:ListItem>Top</asp:ListItem>
                        <asp:ListItem>Middle</asp:ListItem>
                        <asp:ListItem>Bottom</asp:ListItem>

                    </asp:DropDownList>
                </div>

                <!-- Banner Type -->

                <div class="col-md-4 mb-3" id="divBannerType">

                    <label class="form-label">
                        Banner Type <span class="required">*</span>
                    </label>

                    <asp:DropDownList ID="ddlBannerType"
                        runat="server"
                        CssClass="form-select">

                        <asp:ListItem Value="">Select Type</asp:ListItem>
                        <asp:ListItem>Small</asp:ListItem>
                        <asp:ListItem>Large</asp:ListItem>

                    </asp:DropDownList>

                </div>

                <!-- Subtitle -->

                <div class="col-md-4 mb-3" id="divSubtitle">

                    <label class="form-label">
                        Subtitle
                    </label>

                    <asp:TextBox ID="txtSubtitle"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Enter Subtitle">
                    </asp:TextBox>

                </div>

                <!-- Title -->

                <div class="col-md-6 mb-3" id="divTitle">

                    <label class="form-label">
                        Title
                    </label>

                    <asp:TextBox ID="txtTitle"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Enter Title">
                    </asp:TextBox>

                </div>

                <!-- Offer -->

                <div class="col-md-6 mb-3" id="divOfferText">

                    <label class="form-label">
                        Offer Text
                    </label>

                    <asp:TextBox ID="txtOfferText"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Enter Offer Text">
                    </asp:TextBox>

                </div>

                <!-- Link URL -->

                <div class="col-md-6 mb-3">

                    <label class="form-label">
                        Link URL <span class="required">*</span>
                    </label>

                    <asp:TextBox ID="txtLinkURL"
                        runat="server"
                        CssClass="form-control"
                        placeholder="https://example.com">
                    </asp:TextBox>

                </div>

                <!-- Status -->

                <div class="col-md-3 mb-3">

                    <label class="form-label">
                        Status
                    </label>

                    <asp:DropDownList ID="ddlStatus"
                        runat="server"
                        CssClass="form-select">

                        <asp:ListItem Value="Active">Active</asp:ListItem>
                        <asp:ListItem Value="Inactive">Inactive</asp:ListItem>

                    </asp:DropDownList>

                </div>

            </div>

            <!-- IMAGE -->

            <div class="row">

                <div class="col-md-6">

                    <label class="form-label">
                        Banner Image <span class="required">*</span>
                    </label>

                    <asp:FileUpload ID="fuBanner"
                        runat="server"
                        CssClass="form-control"
                        onchange="previewImage(this);" />

                    <img id="imgPreview"
                        src="#"
                        style="display:none;"
                        class="image-preview" />

                    <asp:Image ID="imgExisting"
                        runat="server"
                        CssClass="image-preview"
                        Visible="false" />

                </div>

                <div class="col-md-6">

                    <div class="info-box mt-4">

                        <b>Image Size Rules</b>

                        <hr />

                        <b>Top Banner</b><br />

                        Small : 298 × 235 px<br />
                        Large : 298 × 490 px<br /><br />

                        <b>Middle Banner</b><br />
                        425 × 223 px<br /><br />

                        <b>Bottom Banner</b><br />
                        635 × 301 px

                    </div>

                </div>

            </div>

            <hr />

            <div class="d-flex gap-2">

                <asp:Button ID="btnSave"
                    runat="server"
                    Text="Save Banner"
                    CssClass="btn-primary-custom"
                    OnClick="btnSave_Click" />

                <asp:Button ID="btnCancel"
                    runat="server"
                    Text="Cancel"
                    CssClass="btn-secondary-custom"
                    CausesValidation="false"
                    OnClick="btnCancel_Click" />

            </div>

            <br />

            <asp:Label ID="lblMessage"
                runat="server"
                Font-Bold="true">
            </asp:Label>

        </div>

    </div>

    <br />

    <!-- LIST PANEL -->

    <div class="panel">

        <div class="panel-header">

            <h5>
                <i class="bi bi-card-list"></i>
                Banner List
            </h5>

            <div class="search-filter-bar">

                <div class="search-box">
                    <i class="bi bi-search"></i>

                    <asp:TextBox ID="txtSearch"
                        runat="server"
                        CssClass="form-control"
                        placeholder="Search Banner">
                    </asp:TextBox>
                </div>

                <asp:DropDownList ID="ddlFilterStatus"
                    runat="server"
                    CssClass="filter-select">

                    <asp:ListItem Value="">All</asp:ListItem>
                    <asp:ListItem>Active</asp:ListItem>
                    <asp:ListItem>Inactive</asp:ListItem>

                </asp:DropDownList>

                <asp:Button ID="btnSearch"
                    runat="server"
                    Text="Search"
                    CssClass="btn-secondary-custom"
                    OnClick="btnSearch_Click" />

            </div>

        </div>

        <div class="panel-body">

            <div class="table-responsive">

                <asp:GridView ID="gvBanners"
                    runat="server"
                    AutoGenerateColumns="false"
                    CssClass="custom-table"
                    GridLines="None">

                    <Columns>

                        <asp:BoundField DataField="BannerID"
                            HeaderText="ID" />

                        <asp:TemplateField HeaderText="Preview">

                            <ItemTemplate>
<img src='<%# ResolveUrl("~/Admin/Uploads/Banners/") + Eval("ImageName") %>'
     class="thumb-table" />

                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:BoundField DataField="BannerSection"
                            HeaderText="Section" />

                        <asp:BoundField DataField="BannerType"
                            HeaderText="Type" />

                        <asp:BoundField DataField="Title"
                            HeaderText="Title" />

                        <asp:BoundField DataField="LinkURL"
                            HeaderText="Link URL" />

                        <asp:TemplateField HeaderText="Status">

                            <ItemTemplate>

                                <span class='<%# Eval("Status").ToString()=="Active" ? "status-pill pill-active" : "status-pill pill-inactive" %>'>
                                    <%# Eval("Status") %>
                                </span>

                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:BoundField DataField="CreatedDate"
                            HeaderText="Created Date"
                            DataFormatString="{0:dd MMM yyyy}" />

                        <asp:TemplateField HeaderText="Actions">

                            <ItemTemplate>

                                <asp:LinkButton ID="btnEdit"
                                    runat="server"
                                    CssClass="act-btn edit"
                                    CommandArgument='<%# Eval("BannerID") %>'
                                    OnCommand="btnEdit_Command">

                                    <i class="bi bi-pencil"></i>

                                </asp:LinkButton>

                                <asp:LinkButton ID="btnDelete"
                                    runat="server"
                                    CssClass="act-btn danger"
                                    CommandArgument='<%# Eval("BannerID") %>'
                                    OnCommand="btnDelete_Command"
                                    OnClientClick="return confirm('Are you sure you want to delete this banner?');">

                                    <i class="bi bi-trash"></i>

                                </asp:LinkButton>

                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>

                </asp:GridView>

            </div>

            <div class="mt-3">
                <asp:Label ID="lblCount"
                    runat="server"
                    Font-Bold="true">
                </asp:Label>
            </div>

        </div>

    </div>

</div>

</asp:Content>