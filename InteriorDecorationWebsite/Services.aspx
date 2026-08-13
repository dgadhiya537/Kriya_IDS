<%@ Page Title="Our Services" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="InteriorDecorationWebsite.Services" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section-padding container">
        <div class="section-header">
            <span class="section-tag">Expertise</span>
            <h2 class="section-title">Design Solutions We Provide</h2>
        </div>
        <div class="services-grid">
            <div class="service-card animate-fade">
                <i class="fa-solid fa-house-chimney service-icon"></i>
                <h3 class="service-title">Residential Interior</h3>
                <p class="service-desc">Complete home decor from architectural planning, false ceiling designs, lighting concepts, and premium furniture selections.</p>
            </div>
            <div class="service-card animate-fade" style="animation-delay: 0.1s;">
                <i class="fa-solid fa-building-user service-icon"></i>
                <h3 class="service-title">Corporate Spaces</h3>
                <p class="service-desc">Optimized executive offices, collaboration booths, server rooms, and reception areas designed to boost employee productivity.</p>
            </div>
            <div class="service-card animate-fade" style="animation-delay: 0.2s;">
                <i class="fa-solid fa-kitchen-set service-icon"></i>
                <h3 class="service-title">Modular Kitchens</h3>
                <p class="service-desc">Ergonomic, modern U-shape and L-shape kitchen layouts equipped with soft-close pull-outs, built-in pantries, and chimneys.</p>
            </div>
            <div class="service-card animate-fade" style="animation-delay: 0.3s;">
                <i class="fa-solid fa-chair service-icon"></i>
                <h3 class="service-title">Bespoke Furniture</h3>
                <p class="service-desc">Custom-sized wardrobes, luxury sofa units, media consoles, and coffee tables handcrafted to match your space constraints.</p>
            </div>
        </div>
    </section>

    <!-- Consultation CTA -->
    <section class="section-padding" style="background-color: #f1f5f9; text-align: center;">
        <div class="container" style="max-width: 700px;">
            <h2 style="font-size: 2.25rem; font-weight: 700; color: #0f172a; margin-bottom: 1rem;">Ready to Transform Your Space?</h2>
            <p style="color: #64748b; margin-bottom: 2rem;">Get in touch with our design experts today to schedule a virtual walkthrough or face-to-face consultation.</p>
            <a href="Register.aspx" class="btn-primary">Register An Account</a>
        </div>
    </section>
</asp:Content>
