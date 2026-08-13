<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="InteriorDecorationWebsite.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section-padding container">
        <div class="about-grid">
            <div class="about-content animate-fade">
                <span class="section-tag">Since 2012</span>
                <h2>Crafting Spaces with Elegance and Detail</h2>
                <p>
                    LuxeInteriors is an award-winning design studio specialized in residential and commercial interior decoration. Over the last decade, we have partnered with hundreds of homeowners and business executives to conceptualize and build functional spaces that mirror their vision.
                </p>
                <p>
                    Our approach is highly collaborative, fusing premium materials, ergonomic designs, and custom elements. Whether it is a modular kitchen, a sleek living space, or a corporate workspace, we pay meticulous attention to details, lights, texture, and proportions.
                </p>
                <a href="Services.aspx" class="btn-primary" style="display: inline-block; margin-top: 1rem;">View Our Services</a>
            </div>
            <div class="about-image-card animate-fade" style="animation-delay: 0.3s;">
                <img src="images/banner/about-banner.jpg" alt="About Studio" class="about-image" />
                <div class="about-experience-badge">
                    <span>14+</span>
                    Years of Luxury Service
                </div>
            </div>
        </div>
    </section>

    <!-- Core Philosophy Section -->
    <section class="section-padding" style="background-color: #0f172a; color: white;">
        <div class="container text-center">
            <div class="section-header">
                <span class="section-tag" style="color: #d97706;">Our Values</span>
                <h2 class="section-title" style="color: white;">Our Design Philosophy</h2>
            </div>
            <div class="services-grid" style="margin-top: 2rem;">
                <div class="service-card" style="background-color: #1e293b; border-color: #334155;">
                    <i class="fa-solid fa-gem service-icon"></i>
                    <h3 class="service-title" style="color: white;">Quality & Luxury</h3>
                    <p class="service-desc" style="color: #94a3b8;">We source the finest materials from premium global brands to ensure durability and status in every finish.</p>
                </div>
                <div class="service-card" style="background-color: #1e293b; border-color: #334155;">
                    <i class="fa-solid fa-leaf service-icon"></i>
                    <h3 class="service-title" style="color: white;">Sustainable Layouts</h3>
                    <p class="service-desc" style="color: #94a3b8;">Integrating natural ventilation, energy-efficient fixtures, and locally-sourced materials for long-term health.</p>
                </div>
                <div class="service-card" style="background-color: #1e293b; border-color: #334155;">
                    <i class="fa-solid fa-heart service-icon"></i>
                    <h3 class="service-title" style="color: white;">Client Centricity</h3>
                    <p class="service-desc" style="color: #94a3b8;">Every layout is customized to the client's day-to-day workflow, lifestyle needs, and storage requirements.</p>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
