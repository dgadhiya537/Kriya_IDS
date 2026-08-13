<%@ Page Title="Product Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="InteriorDecorationWebsite.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Product Details Layout */
        .product-details-wrapper {
            display: grid;
            grid-template-columns: 420px 1fr;
            gap: 3rem;
            align-items: start;
            padding: 3rem 0;
        }

        /* Medium-sized image box */
        .product-details-img-box {
            background: #f7f9f6;
            border-radius: 14px;
            border: 1px solid #d2ccc4;
            overflow: hidden;
        }
        .product-details-img-box img {
            width: 100%;
            height: 320px;
            object-fit: cover;
            display: block;
        }

        /* Info panel on the right */
        .product-details-info {
            padding: 0;
        }
        .product-details-info .product-category {
            font-size: 0.78rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            color: #a8917f;
            margin-bottom: 0.5rem;
            display: block;
        }
        .product-details-info h1 {
            font-family: 'Playfair Display', serif;
            font-size: 1.9rem;
            color: #42362e;
            margin: 0 0 0.75rem 0;
            line-height: 1.3;
        }
        .product-details-price {
            font-size: 1.75rem;
            font-weight: 800;
            color: #42362e;
            margin-bottom: 1.25rem;
        }

        /* Divider line */
        .product-divider {
            border: none;
            border-top: 1px solid #d2ccc4;
            margin: 1.25rem 0;
        }

        /* Description area */
        .product-desc-label {
            font-size: 0.8rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #7a6a5e;
            margin-bottom: 0.4rem;
        }
        .product-desc-text {
            font-size: 0.95rem;
            color: #7a6a5e;
            line-height: 1.75;
        }

        /* Key features list */
        .product-features {
            list-style: none;
            padding: 0;
            margin: 1rem 0;
        }
        .product-features li {
            font-size: 0.9rem;
            color: #42362e;
            padding: 0.3rem 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        .product-features li i {
            color: #a8917f;
            font-size: 0.85rem;
        }

        /* Action buttons row */
        .product-action-row {
            display: flex;
            gap: 0.75rem;
            margin-top: 1.5rem;
            flex-wrap: wrap;
        }
        .product-action-row .btn-add-cart {
            background-color: #42362e;
            color: #ffffff;
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 8px;
            font-size: 0.95rem;
            font-weight: 600;
            cursor: pointer;
            transition: background-color 0.2s;
        }
        .product-action-row .btn-add-cart:hover {
            background-color: #5a4a3f;
        }
        .product-action-row .btn-add-wish {
            background-color: transparent;
            color: #a8917f;
            border: 2px solid #a8917f;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            font-size: 0.95rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.2s;
        }
        .product-action-row .btn-add-wish:hover {
            background-color: #a8917f;
            color: #ffffff;
        }

        /* Delivery info strip */
        .product-delivery-info {
            background: #f7f9f6;
            border: 1px solid #d2ccc4;
            border-radius: 10px;
            padding: 1rem 1.25rem;
            margin-top: 1.5rem;
        }
        .product-delivery-info p {
            font-size: 0.88rem;
            color: #7a6a5e;
            margin: 0.3rem 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        .product-delivery-info p i {
            color: #a8917f;
        }

        @media (max-width: 768px) {
            .product-details-wrapper {
                grid-template-columns: 1fr;
                gap: 1.5rem;
                padding: 1.5rem 0;
            }
            .product-details-img-box img { height: 240px; }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="container">
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>

        <div class="product-details-wrapper animate-fade">

            <!-- Left: Medium Image -->
            <div class="product-details-img-box">
                <asp:Image ID="imgProduct" runat="server"
                    CssClass="product-details-image"
                    ImageUrl="images/products/default-product.jpg"
                    AlternateText="Product Image" />
            </div>

            <!-- Right: Product Info -->
            <div class="product-details-info">

                <!-- Category + Name + Price -->
                <span class="product-category">
                    <i class="fa-solid fa-tag"></i>
                    <asp:Label ID="lblCategory" runat="server" Text=""></asp:Label>
                </span>

                <h1><asp:Label ID="lblProductName" runat="server" Text=""></asp:Label></h1>

                <div class="product-details-price">
                    <asp:Label ID="lblPrice" runat="server" Text=""></asp:Label>
                </div>

                <hr class="product-divider" />

                <!-- Description -->
                <div class="product-desc-label">Description</div>
                <div class="product-desc-text">
                    <asp:Label ID="lblDescription" runat="server" Text=""></asp:Label>
                </div>

                <hr class="product-divider" />

                <!-- Key Features -->
                <div class="product-desc-label">Key Features</div>
                <ul class="product-features">
                    <li><i class="fa-solid fa-check-circle"></i> Premium quality materials</li>
                    <li><i class="fa-solid fa-check-circle"></i> Handcrafted by skilled artisans</li>
                    <li><i class="fa-solid fa-check-circle"></i> Custom sizes available on request</li>
                    <li><i class="fa-solid fa-check-circle"></i> 5-year craftsmanship warranty</li>
                </ul>

                <!-- Action Buttons -->
                <div class="product-action-row">
                    <asp:Button ID="btnAddToCart" runat="server"
                        Text="Add to Cart"
                        CssClass="btn-add-cart"
                        OnClick="btnAddToCart_Click" />
                    <asp:Button ID="btnAddToWishlist" runat="server"
                        Text="Add to Wishlist"
                        CssClass="btn-add-wish"
                        OnClick="btnAddToWishlist_Click" />
                </div>

                <!-- Delivery & Warranty Info -->
                <div class="product-delivery-info">
                    <p><i class="fa-solid fa-truck-fast"></i> Free nationwide delivery on orders above $500</p>
                    <p><i class="fa-solid fa-shield-halved"></i> 5-year studio warranty against craftsmanship defects</p>
                    <p><i class="fa-solid fa-rotate-left"></i> Easy 30-day returns on all unused items</p>
                </div>

            </div>
        </div>
    </section>
</asp:Content>
