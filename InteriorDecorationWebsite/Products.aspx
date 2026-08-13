<%@ Page Title="Product Catalog" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="InteriorDecorationWebsite.Products" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .category-filter-bar {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
            margin-bottom: 3rem;
        }
        .filter-btn {
            background-color: #ffffff;
            color: var(--text-primary);
            padding: 0.65rem 1.4rem;
            border-radius: 50px;
            border: 1px solid var(--border-color);
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: var(--shadow-sm);
        }
        .filter-btn:hover, .filter-btn.active {
            background-color: var(--accent-color);
            color: #ffffff;
            border-color: var(--accent-color);
            box-shadow: 0 4px 12px rgba(217, 119, 6, 0.3);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Aesthetic Products Header Banner -->
    <div class="page-banner">
        <div class="page-banner-content">
            <h1>Design & Furniture Catalog</h1>
            <p>Explore our curated gallery of luxury furnishings, artisan craftsmanship, and interior accents.</p>
        </div>
    </div>

    <section class="section-padding container">
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>

        <!-- Category Filter Buttons -->
        <div class="category-filter-bar">
            <asp:LinkButton ID="btnAll" runat="server" CssClass="filter-btn active" OnClick="btnFilter_Click" CommandArgument="0">All Products</asp:LinkButton>
            <asp:Repeater ID="rptCategoryFilter" runat="server">
                <ItemTemplate>
                    <asp:LinkButton ID="btnCat" runat="server" CssClass="filter-btn" OnClick="btnFilter_Click" CommandArgument='<%# Eval("CategoryId") %>'><%# Eval("CategoryName") %></asp:LinkButton>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <!-- Product Grid -->
        <div class="grid-3">
            <asp:Repeater ID="rptProducts" runat="server" OnItemCommand="rptProducts_ItemCommand">
                <ItemTemplate>
                    <div class="product-card">
                        <div class="product-img-wrapper">
                            <img src='images/products/<%# Eval("ProductImage") %>' class="product-img" alt='<%# Eval("ProductName") %>' />
                        </div>
                        <div class="product-body">
                            <span class="product-category"><%# Eval("CategoryName") %></span>
                            <h3 class="product-title">
                                <a href='ProductDetails.aspx?id=<%# Eval("ProductId") %>' style="color: var(--primary-color); text-decoration: none;"><%# Eval("ProductName") %></a>
                            </h3>
                            <div class="product-price"><%# string.Format("${0:N2}", Eval("Price")) %></div>

                            <div class="product-actions">
                                <asp:LinkButton ID="btnCart" runat="server" CommandName="cmd_cart" CommandArgument='<%# Eval("ProductId") %>' CssClass="btn-cart">
                                    <i class="fa-solid fa-cart-plus"></i> Add to Cart
                                </asp:LinkButton>
                                <asp:LinkButton ID="btnWishlist" runat="server" CommandName="cmd_wish" CommandArgument='<%# Eval("ProductId") %>' CssClass="btn-wishlist-icon" title="Add to Wishlist">
                                    <i class="fa-solid fa-heart"></i>
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <asp:Label ID="lblNoProducts" runat="server" Text="<div style='text-align:center; width:100%; padding:4rem; color:var(--text-secondary);'><h3>No products found in this category.</h3></div>" Visible="false"></asp:Label>
    </section>
</asp:Content>
