<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="InteriorDecorationWebsite.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section-padding container">
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>

        <div class="product-details-container animate-fade">
            <div class="details-image-wrapper">
                <asp:Image ID="imgProduct" runat="server" CssClass="details-image" ImageUrl="images/products/default-product.jpg" AlternateText="Product Image" />
            </div>

            <div class="details-info">
                <span class="product-category"><asp:Label ID="lblCategory" runat="server" Text=""></asp:Label></span>
                <h1 style="font-family: var(--font-heading); font-size: 2.25rem; color: var(--primary-color); margin: 0.5rem 0;">
                    <asp:Label ID="lblProductName" runat="server" Text=""></asp:Label>
                </h1>
                
                <div class="details-price">
                    <asp:Label ID="lblPrice" runat="server" Text=""></asp:Label>
                </div>

                <div class="details-desc">
                    <asp:Label ID="lblDescription" runat="server" Text=""></asp:Label>
                </div>

                <div style="display: flex; gap: 1rem; margin-top: 2rem;">
                    <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" CssClass="btn-primary" Style="max-width: 200px;" OnClick="btnAddToCart_Click" />
                    <asp:Button ID="btnAddToWishlist" runat="server" Text="Add to Wishlist" CssClass="btn-outline" Style="max-width: 200px; border-color: var(--accent-color); color: var(--accent-color);" OnClick="btnAddToWishlist_Click" />
                </div>

                <div style="margin-top: 2rem; border-top: 1px solid var(--border-color); padding-top: 1rem; color: var(--text-secondary); font-size: 0.9rem;">
                    <p><i class="fa-solid fa-truck-fast"></i> Premium nationwide delivery & white-glove assembly available.</p>
                    <p><i class="fa-solid fa-shield-halved"></i> Includes 5-year studio Warranty against craftsmanship defects.</p>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
