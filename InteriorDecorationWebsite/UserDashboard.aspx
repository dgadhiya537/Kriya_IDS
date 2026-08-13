<%@ Page Title="User Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserDashboard.aspx.cs" Inherits="InteriorDecorationWebsite.UserDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section-padding container">
        <div class="section-header">
            <span class="section-tag">Account Overview</span>
            <h2 class="section-title">My Dashboard</h2>
        </div>

        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>

        <div class="about-grid animate-fade">
            <div class="form-card" style="margin: 0; max-width: 100%;">
                <div style="text-align: center; margin-bottom: 2rem;">
                    <i class="fa-solid fa-circle-user" style="font-size: 5rem; color: var(--accent-color);"></i>
                    <h2 style="font-size: 1.75rem; font-weight: 700; margin-top: 1rem; color: var(--primary-color);">
                        <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                    </h2>
                    <span class="section-tag" style="display: inline-block; background-color: rgba(217, 119, 6, 0.1); padding: 0.25rem 1rem; border-radius: 50px;">
                        <asp:Label ID="lblRole" runat="server" Text="Client"></asp:Label>
                    </span>
                </div>

                <div class="form-group">
                    <label class="form-label">Email Address</label>
                    <div class="form-input" style="background-color: #f1f5f9;"><asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></div>
                </div>
                <div class="form-group">
                    <label class="form-label">Mobile Number</label>
                    <div class="form-input" style="background-color: #f1f5f9;"><asp:Label ID="lblMobile" runat="server" Text=""></asp:Label></div>
                </div>

                <div style="display: flex; gap: 1rem; margin-top: 2rem;">
                    <a href="Wishlist.aspx" class="btn-primary btn-form text-center"><i class="fa-solid fa-heart"></i> Go to Wishlist</a>
                    <a href="Products.aspx" class="btn-outline btn-form text-center" style="border-color: var(--primary-color); color: var(--primary-color);"><i class="fa-solid fa-couch"></i> Browse Catalog</a>
                </div>
            </div>

            <div class="details-info" style="justify-content: flex-start;">
                <div class="stat-card" style="margin-bottom: 2rem; padding: 2rem;">
                    <i class="fa-solid fa-heart stat-icon"></i>
                    <div class="stat-info">
                        <h5>Saved Wishlist Items</h5>
                        <p><asp:Label ID="lblWishlistCount" runat="server" Text="0"></asp:Label></p>
                    </div>
                </div>

                <div class="service-card" style="text-align: left; padding: 2rem;">
                    <h3 class="service-title"><i class="fa-solid fa-shield-halved" style="color: var(--accent-color);"></i> Account Security</h3>
                    <p class="service-desc">Your session is encrypted and securely stored. To update your profile details or mobile number, please visit the registration page or contact studio support.</p>
                    <a href="Register.aspx" style="color: var(--accent-color); font-weight: 600; display: inline-block; margin-top: 1rem;">Update Account Details &rarr;</a>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
