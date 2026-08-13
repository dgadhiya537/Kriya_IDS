<%@ Page Title="My Wishlist" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="InteriorDecorationWebsite.Wishlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Wishlist Card Grid */
        .wishlist-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
            gap: 1.75rem;
            margin-top: 2rem;
        }

        /* Each product card */
        .wishlist-card {
            background: #ffffff;
            border: 1px solid #d2ccc4;
            border-radius: 14px;
            overflow: hidden;
            box-shadow: 0 2px 8px rgba(0,0,0,0.07);
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }
        .wishlist-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 24px rgba(0,0,0,0.12);
        }

        /* Product thumbnail - fixed height, no overflow */
        .wishlist-card-img {
            width: 100%;
            height: 190px;
            object-fit: cover;
            display: block;
        }

        /* Card body */
        .wishlist-card-body {
            padding: 1.1rem 1.25rem 1.25rem;
        }
        .wishlist-card-category {
            font-size: 0.72rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            color: #a8917f;
            margin-bottom: 0.3rem;
        }
        .wishlist-card-name {
            font-family: 'Playfair Display', serif;
            font-size: 1.05rem;
            font-weight: 700;
            color: #42362e;
            margin-bottom: 0.4rem;
            line-height: 1.3;
        }
        .wishlist-card-price {
            font-size: 1.1rem;
            font-weight: 800;
            color: #42362e;
            margin-bottom: 1rem;
        }

        /* Action buttons row inside card */
        .wishlist-card-actions {
            display: flex;
            gap: 0.5rem;
        }
        .wishlist-card-actions .btn-view {
            flex: 1;
            text-align: center;
            padding: 0.5rem;
            background: #42362e;
            color: #ffffff;
            text-decoration: none;
            border-radius: 7px;
            font-size: 0.82rem;
            font-weight: 600;
            transition: background 0.2s;
        }
        .wishlist-card-actions .btn-view:hover { background: #5a4a3f; }

        .wishlist-card-actions .btn-remove-wish {
            padding: 0.5rem 0.75rem;
            background: #fee2e2;
            color: #dc2626;
            border: none;
            border-radius: 7px;
            font-size: 0.82rem;
            font-weight: 600;
            cursor: pointer;
            text-decoration: none;
            transition: background 0.2s;
        }
        .wishlist-card-actions .btn-remove-wish:hover {
            background: #ef4444;
            color: #ffffff;
        }

        /* Empty state */
        .wishlist-empty {
            text-align: center;
            padding: 4rem 1rem;
            color: #7a6a5e;
        }
        .wishlist-empty i {
            font-size: 3.5rem;
            color: #d2ccc4;
            margin-bottom: 1rem;
            display: block;
        }
        .wishlist-empty h3 {
            font-size: 1.3rem;
            margin-bottom: 0.5rem;
            color: #42362e;
        }
        .wishlist-empty a {
            display: inline-block;
            margin-top: 1.25rem;
            padding: 0.6rem 1.5rem;
            background: #42362e;
            color: #ffffff;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section-padding container">
        <!-- Page Title -->
        <div class="section-header">
            <span class="section-tag">Favorites</span>
            <h2 class="section-title">My Wishlist</h2>
        </div>

        <!-- Success / Error messages -->
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>

        <!-- Wishlist card grid - each item rendered as a card -->
        <div class="wishlist-grid animate-fade">
            <asp:Repeater ID="rptWishlist" runat="server" OnItemCommand="rptWishlist_ItemCommand">
                <ItemTemplate>
                    <div class="wishlist-card">
                        <!-- Product image, fixed height -->
                        <img src='images/products/<%# Eval("ProductImage") %>'
                             alt='<%# Eval("ProductName") %>'
                             class="wishlist-card-img"
                             onerror="this.src='images/products/default-product.jpg'" />

                        <div class="wishlist-card-body">
                            <!-- Category -->
                            <div class="wishlist-card-category">
                                <i class="fa-solid fa-tag"></i>
                                <%# Eval("CategoryName") %>
                            </div>

                            <!-- Product Name -->
                            <div class="wishlist-card-name"><%# Eval("ProductName") %></div>

                            <!-- Price -->
                            <div class="wishlist-card-price">
                                $<%# string.Format("{0:N2}", Eval("Price")) %>
                            </div>

                            <!-- Buttons: View Details + Remove -->
                            <div class="wishlist-card-actions">
                                <a href='ProductDetails.aspx?id=<%# Eval("ProductId") %>'
                                   class="btn-view">
                                    <i class="fa-solid fa-eye"></i> View
                                </a>
                                <asp:LinkButton runat="server"
                                    CommandName="cmd_del"
                                    CommandArgument='<%# Eval("WishlistId") %>'
                                    CssClass="btn-remove-wish"
                                    OnClientClick="return confirm('Remove from wishlist?');"
                                    CausesValidation="false">
                                    <i class="fa-solid fa-trash"></i>
                                </asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <!-- Empty Wishlist message -->
        <asp:Panel ID="pnlEmpty" runat="server" Visible="false">
            <div class="wishlist-empty">
                <i class="fa-regular fa-heart"></i>
                <h3>Your wishlist is empty</h3>
                <p>Browse our collection and save items you love.</p>
                <a href="Products.aspx">Browse Products</a>
            </div>
        </asp:Panel>

    </section>
</asp:Content>
