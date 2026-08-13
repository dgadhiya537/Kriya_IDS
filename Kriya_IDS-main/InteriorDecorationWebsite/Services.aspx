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
                <p class="service-detail">We handle every aspect of your home transformation — from initial space planning and 3D visualisations to on-site execution and final styling. Our residential projects cover living rooms, bedrooms, dining spaces, and balconies, all tailored to your personal style and lifestyle requirements.</p>
            </div>
            <div class="service-card animate-fade" style="animation-delay: 0.1s;">
                <i class="fa-solid fa-building-user service-icon"></i>
                <h3 class="service-title">Corporate Spaces</h3>
                <p class="service-desc">Optimized executive offices, collaboration booths, server rooms, and reception areas designed to boost employee productivity.</p>
                <p class="service-detail">Our commercial design experts create workspaces that inspire performance. We balance brand identity with employee well-being — incorporating acoustic panels, ergonomic workstations, wellness zones, and biophilic design elements that enhance focus and team collaboration in modern office environments.</p>
            </div>
            <div class="service-card animate-fade" style="animation-delay: 0.2s;">
                <i class="fa-solid fa-kitchen-set service-icon"></i>
                <h3 class="service-title">Modular Kitchens</h3>
                <p class="service-desc">Ergonomic, modern U-shape and L-shape kitchen layouts equipped with soft-close pull-outs, built-in pantries, and chimneys.</p>
                <p class="service-detail">We design kitchens that are as functional as they are beautiful. From German-engineered hardware fittings and quartz countertops to integrated appliances and under-cabinet lighting, every kitchen we craft is built for maximum efficiency and visual impact — a space you'll genuinely love to cook in.</p>
            </div>
            <div class="service-card animate-fade" style="animation-delay: 0.3s;">
                <i class="fa-solid fa-chair service-icon"></i>
                <h3 class="service-title">Bespoke Furniture</h3>
                <p class="service-desc">Custom-sized wardrobes, luxury sofa units, media consoles, and coffee tables handcrafted to match your space constraints.</p>
                <p class="service-detail">Our in-house carpentry workshop and partner craftsmen create made-to-measure furniture pieces that fit your space perfectly. We work with premium woods, veneers, lacquers, and upholstery fabrics to deliver pieces that are heirloom-quality — furniture that grows with your home and reflects your individuality.</p>
            </div>
            <div class="service-card animate-fade" style="animation-delay: 0.4s;">
                <i class="fa-solid fa-bed service-icon"></i>
                <h3 class="service-title">Bedroom &amp; Wardrobe Design</h3>
                <p class="service-desc">Serene, bespoke bedroom environments with custom wardrobe systems, upholstered headboards, and layered ambient lighting.</p>
                <p class="service-detail">A well-designed bedroom is more than a place to sleep — it's your personal retreat. We combine calming colour palettes, sound-absorbing materials, smart storage, and luxurious textiles to craft bedrooms that promote genuine rest and rejuvenation tailored to your sleep habits and aesthetic preferences.</p>
            </div>
            <div class="service-card animate-fade" style="animation-delay: 0.5s;">
                <i class="fa-solid fa-lightbulb service-icon"></i>
                <h3 class="service-title">Lighting &amp; Ambience</h3>
                <p class="service-desc">Layered lighting strategies with accent, task, and ambient fixtures that bring depth and drama to every room.</p>
                <p class="service-detail">Lighting is the invisible ingredient that defines a space's mood and character. Our lighting designers develop comprehensive plans using LED systems, smart dimmers, cove lighting, pendant clusters, and feature wall illumination — transforming ordinary rooms into atmospherically charged, magazine-worthy interiors.</p>
            </div>
        </div>
    </section>

    <!-- Consultation CTA -->
    <section class="section-padding" style="background-color: #d2ccc4; text-align: center;">
        <div class="container" style="max-width: 700px;">
            <h2 style="font-size: 2.25rem; font-weight: 700; color: #42362e; margin-bottom: 1rem;">Ready to Transform Your Space?</h2>
            <p style="color: #7a6a5e; margin-bottom: 2rem;">Get in touch with our design experts today to schedule a virtual walkthrough or face-to-face consultation.</p>
            <a href="Register.aspx" class="btn-primary">Register An Account</a>
        </div>
    </section>
</asp:Content>
