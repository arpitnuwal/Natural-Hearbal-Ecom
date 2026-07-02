<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master"
    AutoEventWireup="true" CodeFile="AddProducts.aspx.cs" Inherits="AddProducts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<main class="main-content">

    <div class="page-header d-flex flex-wrap align-items-start justify-content-between gap-3">
        <div>
            <h1>Add Products</h1>
            <ul class="breadcrumb mt-1">
                <li><a href="#">Home</a></li>
                <li><a href="#">Dashboard</a></li>
                <li>Add Products</li>
            </ul>
        </div>
    </div>

    <div class="row g-3">

        <div class="col-12">

            <div class="panel">

                <div class="panel-header">
                    <h5>
                        <i class="bi bi-box-seam text-primary"></i>
                        Add / Edit Product
                    </h5>
                </div>

                <div class="panel-body">

                    <asp:HiddenField ID="hfProductID" runat="server" />

                    <!-- Row 1 -->

                    <div class="row">

                        <div class="col-md-4 mb-3">
                            <label class="form-label">
                                Category <span class="text-danger">*</span>
                            </label>

                            <asp:DropDownList ID="ddlCategory"
                                runat="server"
                                CssClass="form-select"
                                AutoPostBack="true"
                                OnSelectedIndexChanged="ddlCategory_Changed">
                            </asp:DropDownList>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label class="form-label">
                                Sub Category <span class="text-danger">*</span>
                            </label>

                            <asp:DropDownList ID="ddlSubCategory"
                                runat="server"
                                CssClass="form-select">
                            </asp:DropDownList>
                        </div>

                        <div class="col-md-4 mb-3">
                            <label class="form-label">
                                Brand <span class="text-danger">*</span>
                            </label>

                            <asp:DropDownList ID="ddlBrand"
                                runat="server"
                                CssClass="form-select">
                            </asp:DropDownList>
                        </div>

                    </div>

                    <!-- Row 2 -->

                    <div class="row">

                        <div class="col-md-6 mb-3">
                            <label class="form-label">
                                Product Name <span class="text-danger">*</span>
                            </label>

                            <asp:TextBox ID="txtProductName"
                                runat="server"
                                CssClass="form-control"
                                placeholder="Enter Product Name">
                            </asp:TextBox>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label class="form-label">
                                Product Link
                            </label>

                            <asp:TextBox ID="txtProductLink"
                                runat="server"
                                CssClass="form-control"
                                placeholder="https://example.com/product">
                            </asp:TextBox>
                        </div>

                    </div>

                    <!-- Row 3 -->

                    <div class="row">

                        <div class="col-md-3 mb-3">
                            <label class="form-label">
                                Price
                            </label>

                            <asp:TextBox ID="txtPrice"
                                runat="server"
                                CssClass="form-control"
                               
                                placeholder="0.00">
                            </asp:TextBox>
                        </div>

                          <div class="col-md-3 mb-3">
                            <label class="form-label">
                                Discount
                            </label>

                            <asp:TextBox ID="txtDiscount"
                                runat="server"
                                CssClass="form-control"
                               Text="0"
                                placeholder="0.00">
                            </asp:TextBox>
                        </div>

                        <div class="col-md-6 mb-3">
                            <label class="form-label">
                                Short Description
                            </label>

                            <asp:TextBox ID="txtShortDescription"
                                runat="server"
                                CssClass="form-control"
                                placeholder="Enter Short Description">
                            </asp:TextBox>
                        </div>

                    </div>

                    <!-- Description -->

                    <div class="mb-3">
                        <label class="form-label">
                            Description
                        </label>

                        <asp:TextBox ID="txtDescription"
                            runat="server"
                            CssClass="form-control"
                            TextMode="MultiLine"
                            Rows="5"
                            placeholder="Enter Product Description">
                        </asp:TextBox>
                    </div>

                    <!-- Images -->

                    <div class="row">

                        <!-- Image 1 -->

                        <div class="col-md-3 mb-3">
                            <label class="form-label">Image 1</label>

                            <asp:FileUpload ID="fuImg1"
                                runat="server"
                                CssClass="form-control" />

                            <asp:Panel ID="existImg1Wrap"
                                runat="server"
                                Visible="false"
                                CssClass="mt-2">

                                <img id="existImg1"
                                    runat="server"
                                    style="width:100%;height:140px;object-fit:cover;border-radius:8px;" />

                            </asp:Panel>
                        </div>

                        <!-- Image 2 -->

                        <div class="col-md-3 mb-3">
                            <label class="form-label">Image 2</label>

                            <asp:FileUpload ID="fuImg2"
                                runat="server"
                                CssClass="form-control" />

                            <asp:Panel ID="existImg2Wrap"
                                runat="server"
                                Visible="false"
                                CssClass="mt-2">

                                <img id="existImg2"
                                    runat="server"
                                    style="width:100%;height:140px;object-fit:cover;border-radius:8px;" />

                            </asp:Panel>
                        </div>

                        <!-- Image 3 -->

                        <div class="col-md-3 mb-3">
                            <label class="form-label">Image 3</label>

                            <asp:FileUpload ID="fuImg3"
                                runat="server"
                                CssClass="form-control" />

                            <asp:Panel ID="existImg3Wrap"
                                runat="server"
                                Visible="false"
                                CssClass="mt-2">

                                <img id="existImg3"
                                    runat="server"
                                    style="width:100%;height:140px;object-fit:cover;border-radius:8px;" />

                            </asp:Panel>
                        </div>

                        <!-- Image 4 -->

                        <div class="col-md-3 mb-3">
                            <label class="form-label">Image 4</label>

                            <asp:FileUpload ID="fuImg4"
                                runat="server"
                                CssClass="form-control" />

                            <asp:Panel ID="existImg4Wrap"
                                runat="server"
                                Visible="false"
                                CssClass="mt-2">

                                <img id="existImg4"
                                    runat="server"
                                    style="width:100%;height:140px;object-fit:cover;border-radius:8px;" />

                            </asp:Panel>
                        </div>

                    </div>

                    <!-- Status -->

                    <div class="mb-3">
                        <label class="form-label d-block">
                            Status
                        </label>

                        <asp:CheckBox ID="chkStatus"
                            runat="server"
                            Checked="true"
                            Text=" Active" />
                    </div>

                    <!-- Buttons -->

                    <div class="d-flex gap-2 mt-3">

                        <asp:Button ID="btnSave"
                            runat="server"
                            Text="Save Product"
                            CssClass="btn-primary-custom"
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

    </div>

</main>

</asp:Content>