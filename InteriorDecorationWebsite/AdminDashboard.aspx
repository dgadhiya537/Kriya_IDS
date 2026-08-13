<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="InteriorDecorationWebsite.AdminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section-padding container">
        <div class="section-header">
            <span class="section-tag">Management Panel</span>
            <h2 class="section-title">Admin Dashboard</h2>
        </div>

        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>

        <!-- Stats Overview -->
        <div class="dashboard-grid animate-fade">
            <div class="stat-card">
                <i class="fa-solid fa-layer-group stat-icon"></i>
                <div class="stat-info">
                    <h5>Categories</h5>
                    <p><asp:Label ID="lblTotalCategories" runat="server" Text="0"></asp:Label></p>
                </div>
            </div>
            <div class="stat-card">
                <i class="fa-solid fa-couch stat-icon"></i>
                <div class="stat-info">
                    <h5>Products</h5>
                    <p><asp:Label ID="lblTotalProducts" runat="server" Text="0"></asp:Label></p>
                </div>
            </div>
            <div class="stat-card">
                <i class="fa-solid fa-users stat-icon"></i>
                <div class="stat-info">
                    <h5>Registered Users</h5>
                    <p><asp:Label ID="lblTotalUsers" runat="server" Text="0"></asp:Label></p>
                </div>
            </div>
        </div>

        <!-- Section 1: Manage Categories -->
        <div class="admin-form-split animate-fade" style="margin-top: 3rem;">
            <div class="form-card" style="margin: 0; max-width: 100%;">
                <h3 style="font-size: 1.5rem; font-weight: 700; margin-bottom: 1.5rem; color: var(--primary-color);">Manage Category</h3>
                <asp:HiddenField ID="hfCategoryId" runat="server" />
                
                <div class="form-group">
                    <label class="form-label" for="txtCategoryName">Category Name</label>
                    <asp:TextBox ID="txtCategoryName" runat="server" CssClass="form-input" placeholder="e.g. Living Room"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label">Category Image</label>
                    <asp:FileUpload ID="fuCategoryImage" runat="server" CssClass="form-input" />
                    <asp:Label ID="lblCatImgName" runat="server" ForeColor="#64748b" FontSize="Small"></asp:Label>
                </div>

                <asp:Button ID="btnSaveCategory" runat="server" Text="Save Category" CssClass="btn-form btn-primary" OnClick="btnSaveCategory_Click" />
                <asp:Button ID="btnCancelCategory" runat="server" Text="Cancel" CssClass="btn-form" Style="background-color: #cbd5e1; color: var(--text-primary); margin-top: 0.5rem;" Visible="false" OnClick="btnCancelCategory_Click" CausesValidation="false" />
            </div>

            <div class="table-container" style="margin: 0;">
                <h3 style="margin-bottom: 1rem;">Category Directory</h3>
                <asp:GridView ID="gvCategories" runat="server" AutoGenerateColumns="False" 
                    CssClass="custom-grid" GridLines="None" OnRowCommand="gvCategories_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="CategoryId" HeaderText="ID" />
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <img src='images/categories/<%# Eval("CategoryImage") %>' class="grid-image" alt="Category Image" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="CategoryName" HeaderText="Category Name" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="cmd_edt_cat" CommandArgument='<%# Eval("CategoryId") %>' CssClass="btn-action-edit" CausesValidation="false">
                                    <i class="fa-solid fa-pen-to-square"></i> Edit
                                </asp:LinkButton>
                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="cmd_del_cat" CommandArgument='<%# Eval("CategoryId") %>' CssClass="btn-action-delete" OnClientClick="return confirm('Deleting a category will delete all associated products. Continue?');" CausesValidation="false">
                                    <i class="fa-solid fa-trash"></i> Delete
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>

        <!-- Section 2: Manage Products -->
        <div class="admin-form-split animate-fade" style="margin-top: 4rem;">
            <div class="form-card" style="margin: 0; max-width: 100%;">
                <h3 style="font-size: 1.5rem; font-weight: 700; margin-bottom: 1.5rem; color: var(--primary-color);">Manage Product</h3>
                <asp:HiddenField ID="hfProductId" runat="server" />

                <div class="form-group">
                    <label class="form-label" for="txtProductName">Product Name</label>
                    <asp:TextBox ID="txtProductName" runat="server" CssClass="form-input" placeholder="e.g. Velvet Sofa"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label">Category</label>
                    <asp:DropDownList ID="ddlProductCategory" runat="server" CssClass="form-dropdown"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="form-label" for="txtPrice">Price ($)</label>
                    <asp:TextBox ID="txtPrice" runat="server" CssClass="form-input" placeholder="e.g. 299.99"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label" for="txtDescription">Description</label>
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-input" TextMode="MultiLine" Rows="3" placeholder="Enter product details"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="form-label">Product Image</label>
                    <asp:FileUpload ID="fuProductImage" runat="server" CssClass="form-input" />
                    <asp:Label ID="lblProdImgName" runat="server" ForeColor="#64748b" FontSize="Small"></asp:Label>
                </div>

                <asp:Button ID="btnSaveProduct" runat="server" Text="Save Product" CssClass="btn-form btn-primary" OnClick="btnSaveProduct_Click" />
                <asp:Button ID="btnCancelProduct" runat="server" Text="Cancel" CssClass="btn-form" Style="background-color: #cbd5e1; color: var(--text-primary); margin-top: 0.5rem;" Visible="false" OnClick="btnCancelProduct_Click" CausesValidation="false" />
            </div>

            <div class="table-container" style="margin: 0;">
                <h3 style="margin-bottom: 1rem;">Product Inventory</h3>
                <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" 
                    CssClass="custom-grid" GridLines="None" OnRowCommand="gvProducts_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="ProductId" HeaderText="ID" />
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <img src='images/products/<%# Eval("ProductImage") %>' class="grid-image" alt="Product Image" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                        <asp:BoundField DataField="CategoryName" HeaderText="Category" />
                        <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="${0:N2}" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="btnEdit" runat="server" CommandName="cmd_edt_prod" CommandArgument='<%# Eval("ProductId") %>' CssClass="btn-action-edit" CausesValidation="false">
                                    <i class="fa-solid fa-pen-to-square"></i> Edit
                                </asp:LinkButton>
                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="cmd_del_prod" CommandArgument='<%# Eval("ProductId") %>' CssClass="btn-action-delete" OnClientClick="return confirm('Are you sure you want to delete this product?');" CausesValidation="false">
                                    <i class="fa-solid fa-trash"></i> Delete
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </section>
</asp:Content>
