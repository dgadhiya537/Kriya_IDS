<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="InteriorDecorationWebsite.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero Banner Section -->
    <div class="hero-section">
        <div class="hero-overlay"></div>
        <div class="hero-content">
            <h1 class="hero-title">Elevate Your Living Experience</h1>
            <p class="hero-subtitle">Bespoke luxury interior design, architectural planning, and curated furnishings tailored for modern living.</p>
            <div class="hero-buttons">
                <a href="Products.aspx" class="btn-primary">Explore Collection</a>
                <a href="Contact.aspx" class="btn-outline">Book Consultation</a>
            </div>
        </div>
    </div>

    <!-- Featured Categories Section -->
    <section class="section-padding container">
        <div class="section-header animate-fade">
            <span class="section-tag">Curated Spaces</span>
            <h2 class="section-title">Design Categories</h2>
        </div>

        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>

        <div class="grid-3">
            <asp:Repeater ID="rptCategories" runat="server">
                <ItemTemplate>
                    <div class="product-card animate-fade">
                        <div class="product-img-wrapper">
                            <img src='images/categories/<%# Eval("CategoryImage") %>' class="product-img" alt='<%# Eval("CategoryName") %>' />
                        </div>
                        <div class="product-body" style="text-align: center;">
                            <h3 class="product-title" style="margin-bottom: 0.75rem;"><%# Eval("CategoryName") %></h3>
                            <a href='Products.aspx?cat=<%# Eval("CategoryId") %>' class="btn-cart" style="display: inline-block; width: auto; padding: 0.5rem 1.25rem;">Explore Category &rarr;</a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </section>

    <!-- Featured Products Section -->
    <section class="section-padding container" style="background-color: #ffffff; border-radius: 16px; margin-bottom: 4rem; padding: 3rem;">
        <div class="section-header animate-fade">
            <span class="section-tag">Signature Furnishings</span>
            <h2 class="section-title">Featured Products</h2>
        </div>

        <div class="grid-3">
            <asp:Repeater ID="rptProducts" runat="server" OnItemCommand="rptProducts_ItemCommand">
                <ItemTemplate>
                    <div class="product-card animate-fade">
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
    </section>
</asp:Content>
