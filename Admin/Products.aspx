<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMasterPage.master" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <main class="main-content">

     <div class="page-header d-flex flex-wrap align-items-start justify-content-between gap-3">
        <div>
            <h1>Product Management</h1>
            <ul class="breadcrumb mt-1">
                <li><a href="#">Home</a></li>
                <li><a href="#">Dashboard</a></li>
                <li>Products</li>
            </ul>
        </div>
    </div>

    <div class="row g-3"> 
        


    <div class="col-12">

    <div class="panel">

        <div class="panel-header">

    <h5>
        <i class="bi bi-table text-primary"></i>
        All Products
    </h5>

    <div class="search-filter-bar">

        <div class="search-box">
            <i class="bi bi-search"></i>

            <asp:TextBox ID="txtSearch"
                runat="server"
                CssClass="form-control"
                AutoPostBack="true"
                OnTextChanged="txtSearch_TextChanged"
                placeholder="Search products...">
            </asp:TextBox>
        </div>

        <asp:DropDownList ID="ddlFilterStatus"
            runat="server"
            CssClass="filter-select"
            AutoPostBack="true"
            OnSelectedIndexChanged="ddlFilterStatus_SelectedIndexChanged">

            <asp:ListItem Text="All Status" Value="" />
            <asp:ListItem Text="Active" Value="1" />
            <asp:ListItem Text="Inactive" Value="0" />

        </asp:DropDownList>

        <a href="AddProducts.aspx"
            class="btn-primary-custom">
            <i class="bi bi-plus-circle"></i>
            Add Product
        </a>

    </div>

</div>

        <div style="overflow-x:auto;">

            <table class="custom-table">

                <thead>
<tr>
    <th style="width:80px;">ID</th>
    <th style="width:90px;">Image</th>
    <th>Product Details</th>
    <th>Category</th>
    <th>Brand</th>
    <th style="width:120px;">Price</th>
    <th style="width:100px;">Status</th>
    <th style="width:130px;text-align:center;">Actions</th>
</tr>
</thead>

                <tbody>

                    <asp:Repeater ID="rptProducts" runat="server">

                        <ItemTemplate>

                            <tr>

                                <td>
                                    <%# Eval("ProductID") %>
                                </td>

                                <td>

    <img src='<%# GetFirstImage(Eval("ProductID")) %>'
        width="60"
        height="60"
        style="border-radius:10px;object-fit:cover;" />

</td>

                              <td>

    <div class="d-flex flex-column">

        <strong>
            <%# Eval("ProductName") %>
        </strong>

        <small class="text-muted">
            <%# Eval("SubCategoryName") %>
        </small>

    </div>

</td>

                                <td>
                                    <%# Eval("CategoryName") %>
                                </td>

                                <td>
                                    <%# Eval("BrandName") %>
                                </td>

                                <td>

                                    ₹ <%# String.Format("{0:N2}", Eval("Price")) %>

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

    <div class="d-flex justify-content-center gap-1">

        <asp:LinkButton ID="btnEdit"
            runat="server"
            CssClass="btn btn-sm btn-primary"
            CommandArgument='<%# Eval("ProductID") %>'
            OnClick="btnEdit_Click">

            <i class="bi bi-pencil"></i>

        </asp:LinkButton>

        <asp:LinkButton ID="btnDelete"
            runat="server"
            CssClass="btn btn-sm btn-danger"
            CommandArgument='<%# Eval("ProductID") %>'
            OnClick="btnDelete_Click"
            OnClientClick="return confirm('Delete this product?');">

            <i class="bi bi-trash"></i>

        </asp:LinkButton>

    </div>

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
                <p>No products found.</p>

            </div>

        </div>

       <div style="padding:12px 16px;
display:flex;
align-items:center;
justify-content:space-between;
border-top:1px solid var(--border);
flex-wrap:wrap;
gap:8px;">

    <asp:Label ID="lblCount"
        runat="server"
        Text="0 Products"
        Style="font-size:.8rem;color:var(--text-muted);" />

    <a href="AddProducts.aspx"
        class="btn-secondary-custom">

        <i class="bi bi-plus-circle"></i>
        Add New Product

    </a>

</div>

    </div>

</div>


        </div>
        </main>

</asp:Content>

