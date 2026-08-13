<%@ Page Title="My Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="InteriorDecorationWebsite.UserDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* ── Dashboard Layout ── */
        .dashboard-wrapper {
            display: grid;
            grid-template-columns: 320px 1fr;
            gap: 2rem;
            align-items: start;
            margin-top: 2rem;
        }
        @media (max-width: 768px) {
            .dashboard-wrapper {
                grid-template-columns: 1fr;
            }
        }

        /* ── Profile Card (Left column) ── */
        .profile-card {
            background: #ffffff;
            border: 1px solid #d2ccc4;
            border-radius: 16px;
            padding: 2rem 1.75rem;
            box-shadow: 0 2px 8px rgba(0,0,0,0.07);
            text-align: center;
        }
        .profile-card .avatar-icon {
            font-size: 5rem;
            color: #a8917f;
            margin-bottom: 1rem;
            display: block;
        }
        .profile-card .user-name {
            font-family: 'Playfair Display', serif;
            font-size: 1.5rem;
            font-weight: 700;
            color: #42362e;
            margin-bottom: 0.3rem;
        }
        .profile-card .user-role-badge {
            display: inline-block;
            background: rgba(168,145,127,0.15);
            color: #a8917f;
            font-size: 0.78rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            padding: 0.25rem 1rem;
            border-radius: 50px;
            margin-bottom: 1.5rem;
        }
        .profile-field {
            background: #f7f9f6;
            border: 1px solid #d2ccc4;
            border-radius: 8px;
            padding: 0.6rem 1rem;
            margin-bottom: 0.75rem;
            text-align: left;
        }
        .profile-field label {
            display: block;
            font-size: 0.72rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            color: #a8917f;
            margin-bottom: 0.2rem;
        }
        .profile-field span {
            font-size: 0.95rem;
            color: #42362e;
            font-weight: 500;
        }
        .profile-actions {
            display: flex;
            flex-direction: column;
            gap: 0.6rem;
            margin-top: 1.25rem;
        }
        .profile-actions a {
            display: block;
            padding: 0.65rem 1rem;
            border-radius: 8px;
            text-align: center;
            font-weight: 600;
            font-size: 0.9rem;
            text-decoration: none;
            transition: all 0.2s ease;
        }
        .btn-dash-primary {
            background: #42362e;
            color: #ffffff !important;
        }
        .btn-dash-primary:hover { background: #5a4a3f; }
        .btn-dash-outline {
            background: transparent;
            color: #42362e !important;
            border: 2px solid #42362e;
        }
        .btn-dash-outline:hover { background: #42362e; color: #ffffff !important; }

        /* ── Right column stats + info ── */
        .dashboard-right {
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        /* Quick stats strip */
        .dash-stats-row {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            gap: 1rem;
        }
        .dash-stat {
            background: #ffffff;
            border: 1px solid #d2ccc4;
            border-radius: 12px;
            padding: 1.25rem 1rem;
            text-align: center;
            box-shadow: 0 2px 6px rgba(0,0,0,0.05);
        }
        .dash-stat i {
            font-size: 1.75rem;
            color: #a8917f;
            margin-bottom: 0.5rem;
            display: block;
        }
        .dash-stat .stat-number {
            font-size: 1.7rem;
            font-weight: 800;
            color: #42362e;
            display: block;
        }
        .dash-stat .stat-label {
            font-size: 0.8rem;
            color: #7a6a5e;
            margin-top: 0.2rem;
        }

        /* Info card */
        .dash-info-card {
            background: #ffffff;
            border: 1px solid #d2ccc4;
            border-radius: 14px;
            padding: 1.5rem 1.75rem;
            box-shadow: 0 2px 6px rgba(0,0,0,0.05);
        }
        .dash-info-card h4 {
            font-family: 'Playfair Display', serif;
            font-size: 1.15rem;
            color: #42362e;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        .dash-info-card h4 i { color: #a8917f; }
        .dash-info-card p {
            font-size: 0.9rem;
            color: #7a6a5e;
            line-height: 1.65;
        }
        .dash-info-card a {
            color: #a8917f;
            font-weight: 600;
            font-size: 0.9rem;
            display: inline-block;
            margin-top: 0.75rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section-padding container">

        <!-- Page Title -->
        <div class="section-header">
            <span class="section-tag">Account Overview</span>
            <h2 class="section-title">My Dashboard</h2>
        </div>

        <!-- Messages -->
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>

        <!-- Two-column dashboard layout -->
        <div class="dashboard-wrapper animate-fade">

            <!-- LEFT: Profile Card -->
            <div class="profile-card">
                <i class="fa-solid fa-circle-user avatar-icon"></i>

                <div class="user-name">
                    <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                </div>
                <div class="user-role-badge">
                    <asp:Label ID="lblRole" runat="server" Text="Client"></asp:Label>
                </div>

                <!-- Email field -->
                <div class="profile-field">
                    <label>Email Address</label>
                    <span><asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></span>
                </div>

                <!-- Mobile field -->
                <div class="profile-field">
                    <label>Mobile Number</label>
                    <span><asp:Label ID="lblMobile" runat="server" Text=""></asp:Label></span>
                </div>

                <!-- Action buttons -->
                <div class="profile-actions">
                    <a href="Wishlist.aspx" class="btn-dash-primary">
                        <i class="fa-solid fa-heart"></i> My Wishlist
                    </a>
                    <a href="Cart.aspx" class="btn-dash-primary">
                        <i class="fa-solid fa-cart-shopping"></i> My Cart
                    </a>
                    <a href="Products.aspx" class="btn-dash-outline">
                        <i class="fa-solid fa-couch"></i> Browse Catalog
                    </a>
                </div>
            </div>

            <!-- RIGHT: Stats + Info -->
            <div class="dashboard-right">

                <!-- Stats row -->
                <div class="dash-stats-row">
                    <div class="dash-stat">
                        <i class="fa-solid fa-heart"></i>
                        <span class="stat-number">
                            <asp:Label ID="lblWishlistCount" runat="server" Text="0"></asp:Label>
                        </span>
                        <div class="stat-label">Wishlist Items</div>
                    </div>
                    <div class="dash-stat">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <span class="stat-number">
                            <asp:Label ID="lblCartCount" runat="server" Text="0"></asp:Label>
                        </span>
                        <div class="stat-label">Cart Items</div>
                    </div>
                    <div class="dash-stat">
                        <i class="fa-solid fa-star"></i>
                        <span class="stat-number">Premium</span>
                        <div class="stat-label">Membership</div>
                    </div>
                </div>

                <!-- Security info -->
                <div class="dash-info-card">
                    <h4><i class="fa-solid fa-shield-halved"></i> Account Security</h4>
                    <p>Your session is encrypted and securely stored. To update your profile details or mobile number, visit the account settings page or contact studio support.</p>
                    <a href="Register.aspx">Update Account Details &rarr;</a>
                </div>

                <!-- Services card -->
                <div class="dash-info-card">
                    <h4><i class="fa-solid fa-couch"></i> Design Services</h4>
                    <p>Explore our full range of interior design services — from residential spaces and modular kitchens to corporate offices and bespoke furniture.</p>
                    <a href="Services.aspx">View All Services &rarr;</a>
                </div>

                <!-- Support card -->
                <div class="dash-info-card">
                    <h4><i class="fa-solid fa-headset"></i> Studio Support</h4>
                    <p>Have a question about your order or design consultation? Our studio team is available Monday to Friday, 9 AM – 6 PM.</p>
                    <a href="Contact.aspx">Contact Us &rarr;</a>
                </div>

            </div>
        </div>
    </section>
</asp:Content>
