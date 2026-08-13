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
                    Kriya-IDS is an award-winning design studio specialized in residential and commercial interior decoration. Over the last decade, we have partnered with hundreds of homeowners and business executives to conceptualize and build functional spaces that mirror their vision.
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

    <!-- Mission & Vision Section -->
    <section class="section-padding container">
        <div class="section-header">
            <span class="section-tag">Purpose &amp; Direction</span>
            <h2 class="section-title">Our Mission &amp; Vision</h2>
        </div>
        <div class="about-info-grid">
            <div class="about-info-card animate-fade">
                <div class="card-icon"><i class="fa-solid fa-bullseye"></i></div>
                <h4>Our Mission</h4>
                <p>To transform every space into a personalised sanctuary — delivering interior solutions that seamlessly blend aesthetics, functionality, and comfort, crafted uniquely for each client's lifestyle.</p>
            </div>
            <div class="about-info-card animate-fade" style="animation-delay: 0.12s;">
                <div class="card-icon"><i class="fa-solid fa-eye"></i></div>
                <h4>Our Vision</h4>
                <p>To be the most trusted interior design partner in the region — where cutting-edge creativity meets timeless craftsmanship, setting new benchmarks in luxury and sustainable living.</p>
            </div>
            <div class="about-info-card animate-fade" style="animation-delay: 0.24s;">
                <div class="card-icon"><i class="fa-solid fa-seedling"></i></div>
                <h4>Our Commitment</h4>
                <p>We are dedicated to environmentally responsible design — sourcing sustainable materials and working with local artisans to minimise our ecological footprint on every project we undertake.</p>
            </div>
        </div>
    </section>

    <!-- Core Philosophy Section -->
    <section class="section-padding" style="background-color: #42362e; color: white;">
        <div class="container text-center">
            <div class="section-header">
                <span class="section-tag" style="color: #b69788;">Our Values</span>
                <h2 class="section-title" style="color: white;">Our Design Philosophy</h2>
            </div>
            <div class="services-grid" style="margin-top: 2rem;">
                <div class="service-card" style="background-color: #5a4a3f; border-color: #6b5a50;">
                    <i class="fa-solid fa-gem service-icon"></i>
                    <h3 class="service-title" style="color: white;">Quality &amp; Luxury</h3>
                    <p class="service-desc" style="color: #d2ccc4;">We source the finest materials from premium global brands to ensure durability and status in every finish.</p>
                </div>
                <div class="service-card" style="background-color: #5a4a3f; border-color: #6b5a50;">
                    <i class="fa-solid fa-leaf service-icon"></i>
                    <h3 class="service-title" style="color: white;">Sustainable Layouts</h3>
                    <p class="service-desc" style="color: #d2ccc4;">Integrating natural ventilation, energy-efficient fixtures, and locally-sourced materials for long-term health.</p>
                </div>
                <div class="service-card" style="background-color: #5a4a3f; border-color: #6b5a50;">
                    <i class="fa-solid fa-heart service-icon"></i>
                    <h3 class="service-title" style="color: white;">Client Centricity</h3>
                    <p class="service-desc" style="color: #d2ccc4;">Every layout is customized to the client's day-to-day workflow, lifestyle needs, and storage requirements.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Team Highlights Section -->
    <section class="section-padding container">
        <div class="section-header">
            <span class="section-tag">The Minds Behind the Magic</span>
            <h2 class="section-title">Our Team</h2>
        </div>
        <div class="about-info-grid">
            <div class="about-info-card animate-fade">
                <div class="card-icon"><i class="fa-solid fa-user-tie"></i></div>
                <h4>Arjun Kriya — Founder &amp; Principal Designer</h4>
                <p>With 18 years in luxury interiors, Arjun leads vision and strategy at Kriya-IDS, having personally overseen 500+ projects across residential and hospitality spaces.</p>
            </div>
            <div class="about-info-card animate-fade" style="animation-delay: 0.12s;">
                <div class="card-icon"><i class="fa-solid fa-pen-ruler"></i></div>
                <h4>Meera Sharma — Lead Interior Architect</h4>
                <p>Meera brings a rare blend of spatial engineering and artistic sensibility. She heads our CAD and 3D visualisation team, turning concepts into photo-realistic designs before a single nail is placed.</p>
            </div>
            <div class="about-info-card animate-fade" style="animation-delay: 0.24s;">
                <div class="card-icon"><i class="fa-solid fa-palette"></i></div>
                <h4>Rohan Nair — Senior Styling &amp; Procurement Head</h4>
                <p>Rohan curates every material palette, fabric swatch, and hardware finish. He maintains relationships with over 120 premium vendors across India and Europe to deliver unmatched quality.</p>
            </div>
            <div class="about-info-card animate-fade" style="animation-delay: 0.36s;">
                <div class="card-icon"><i class="fa-solid fa-helmet-safety"></i></div>
                <h4>Priya Joshi — Project &amp; Site Manager</h4>
                <p>Priya ensures every project is executed on time and within budget. Her on-ground supervision and quality audits guarantee that the final delivery always exceeds client expectations.</p>
            </div>
        </div>
    </section>

    <!-- Achievements Section -->
    <section class="section-padding" style="background-color: #f7f9f6;">
        <div class="container">
            <div class="section-header">
                <span class="section-tag">Milestones &amp; Recognition</span>
                <h2 class="section-title">Our Achievements</h2>
            </div>
            <div class="about-info-grid">
                <div class="about-info-card animate-fade" style="border-left: 4px solid #a8917f;">
                    <div class="card-icon"><i class="fa-solid fa-trophy"></i></div>
                    <h4>Best Luxury Interior Studio 2023</h4>
                    <p>Recognised by the Indian Design Council for exceptional craftsmanship and innovation in residential luxury interiors across three consecutive years.</p>
                </div>
                <div class="about-info-card animate-fade" style="animation-delay: 0.12s; border-left: 4px solid #a8917f;">
                    <div class="card-icon"><i class="fa-solid fa-star"></i></div>
                    <h4>500+ Projects Completed</h4>
                    <p>From studio apartments in Mumbai to 5-star hotel lobbies in Goa, we have successfully transformed over 500 unique spaces since our founding in 2012.</p>
                </div>
                <div class="about-info-card animate-fade" style="animation-delay: 0.24s; border-left: 4px solid #a8917f;">
                    <div class="card-icon"><i class="fa-solid fa-handshake"></i></div>
                    <h4>98% Client Satisfaction Rate</h4>
                    <p>Our post-project surveys consistently show a 98% satisfaction rating, with over 70% of new projects coming from returning clients and referrals.</p>
                </div>
                <div class="about-info-card animate-fade" style="animation-delay: 0.36s; border-left: 4px solid #a8917f;">
                    <div class="card-icon"><i class="fa-solid fa-earth-asia"></i></div>
                    <h4>Pan-India &amp; International Reach</h4>
                    <p>We have executed projects in 14 Indian cities and collaborated with international clients in the UAE, Singapore, and the UK for diaspora residential projects.</p>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
