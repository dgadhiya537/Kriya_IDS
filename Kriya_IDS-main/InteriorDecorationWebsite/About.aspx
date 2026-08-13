<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="InteriorDecorationWebsite.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* ── About Hero ── */
        .about-hero {
            background: linear-gradient(135deg, rgba(66,54,46,0.82), rgba(90,74,63,0.88)),
                        url('images/categories/living-room.jpg') center/cover no-repeat;
            padding: 6rem 1.5rem;
            text-align: center;
            color: #ffffff;
        }
        .about-hero .section-tag { color: #b69788; }
        .about-hero h1 {
            font-family: var(--font-heading);
            font-size: 3rem;
            font-weight: 700;
            margin: 0.5rem 0 1rem;
            color: #ffffff;
        }
        .about-hero p {
            font-size: 1.15rem;
            color: #f0ebe6;
            max-width: 680px;
            margin: 0 auto 2rem;
            line-height: 1.8;
        }

        /* ── Stats Row ── */
        .stats-row {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(160px, 1fr));
            gap: 0;
            background: var(--primary-color);
        }
        .stat-item {
            text-align: center;
            padding: 2rem 1.5rem;
            border-right: 1px solid rgba(255,255,255,0.1);
        }
        .stat-item:last-child { border-right: none; }
        .stat-item .num {
            font-family: var(--font-heading);
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--accent-color);
            display: block;
        }
        .stat-item .lbl {
            font-size: 0.85rem;
            color: #d2ccc4;
            margin-top: 0.25rem;
            display: block;
        }

        /* ── About Story ── */
        .about-story-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 4rem;
            align-items: center;
        }
        @media (max-width: 768px) {
            .about-story-grid { grid-template-columns: 1fr; gap: 2rem; }
            .about-hero h1 { font-size: 2rem; }
        }
        .about-story-img {
            width: 100%;
            height: 450px;
            object-fit: cover;
            border-radius: 16px;
            box-shadow: var(--shadow-lg);
        }
        .about-story-body .section-tag { display: block; margin-bottom: 0.5rem; }
        .about-story-body h2 {
            font-family: var(--font-heading);
            font-size: 2.2rem;
            color: var(--primary-color);
            margin-bottom: 1.25rem;
            line-height: 1.3;
        }
        .about-story-body p {
            color: var(--text-secondary);
            line-height: 1.8;
            margin-bottom: 1rem;
        }

        /* ── Team Cards ── */
        .team-card {
            background: var(--card-bg);
            border-radius: 16px;
            overflow: hidden;
            border: 1px solid var(--border-color);
            box-shadow: var(--shadow-sm);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .team-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-md);
        }
        .team-card-img-wrap {
            height: 200px;
            background: linear-gradient(135deg, var(--primary-color), var(--primary-light));
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 4rem;
            color: var(--accent-color);
        }
        .team-card-body { padding: 1.5rem; }
        .team-card-body h4 {
            font-family: var(--font-heading);
            font-size: 1.15rem;
            color: var(--primary-color);
            margin-bottom: 0.2rem;
        }
        .team-card-body .role {
            font-size: 0.82rem;
            color: var(--accent-color);
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 0.75rem;
        }
        .team-card-body p {
            font-size: 0.9rem;
            color: var(--text-secondary);
            line-height: 1.65;
        }

        /* ── Values Dark Section ── */
        .values-section {
            background: var(--primary-color);
            padding: 4rem 0;
        }
        .values-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 1.5rem;
            margin-top: 2.5rem;
        }
        .value-card {
            background: rgba(255,255,255,0.05);
            border: 1px solid rgba(255,255,255,0.1);
            border-radius: 14px;
            padding: 1.75rem;
            text-align: center;
            transition: background 0.3s ease;
        }
        .value-card:hover { background: rgba(168,145,127,0.15); }
        .value-card i { font-size: 2rem; color: var(--accent-color); margin-bottom: 0.75rem; display: block; }
        .value-card h4 { color: #ffffff; font-size: 1.05rem; margin-bottom: 0.5rem; }
        .value-card p { color: #d2ccc4; font-size: 0.88rem; line-height: 1.6; }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- ── About Hero ── -->
    <div class="about-hero">
        <span class="section-tag">Since 2012</span>
        <h1>We Design Spaces That Feel Like You</h1>
        <p>Kriya-IDS is an award-winning interior design studio crafting bespoke residential and commercial spaces that blend artistry, precision, and your personal story into every square foot.</p>
        <a href="Services.aspx" class="btn-primary">Explore Our Services</a>
    </div>

    <!-- ── Stats Row ── -->
    <div class="stats-row">
        <div class="stat-item">
            <span class="num">500+</span>
            <span class="lbl">Projects Completed</span>
        </div>
        <div class="stat-item">
            <span class="num">14+</span>
            <span class="lbl">Years of Experience</span>
        </div>
        <div class="stat-item">
            <span class="num">98%</span>
            <span class="lbl">Client Satisfaction</span>
        </div>
        <div class="stat-item">
            <span class="num">14</span>
            <span class="lbl">Cities Served</span>
        </div>
        <div class="stat-item">
            <span class="num">120+</span>
            <span class="lbl">Vendor Partners</span>
        </div>
    </div>

    <!-- ── Our Story ── -->
    <section class="section-padding container">
        <div class="about-story-grid">
            <img src="images/categories/bedroom.jpg" alt="Kriya-IDS Studio" class="about-story-img" />
            <div class="about-story-body">
                <span class="section-tag">Our Story</span>
                <h2>Crafting Spaces with Elegance &amp; Detail</h2>
                <p>Kriya-IDS was founded in 2012 by Arjun Kriya with a singular belief — that great interior design is not a luxury reserved for a few, but a thoughtful process that every homeowner deserves. Starting with residential apartments in Mumbai, we have grown into a full-service design studio with projects across 14 Indian cities and an international portfolio.</p>
                <p>Our approach is deeply collaborative. We listen before we design. Every client brings a unique story — a way they move through their home, a favourite colour they can't explain, a piece of furniture they've held onto for 20 years. We weave all of this into a cohesive, beautiful space that feels completely and authentically theirs.</p>
                <p>Today, Kriya-IDS is trusted by 500+ homeowners, hospitality brands, and corporate clients — with a 98% satisfaction rate and a growing list of industry awards that reflect our commitment to craft and creativity.</p>
                <a href="Contact.aspx" class="btn-primary" style="display: inline-block; margin-top: 1.25rem;">Get in Touch</a>
            </div>
        </div>
    </section>

    <!-- ── Mission & Vision ── -->
    <section class="section-padding" style="background: #f7f9f6;">
        <div class="container">
            <div class="section-header">
                <span class="section-tag">Purpose &amp; Direction</span>
                <h2 class="section-title">Our Mission &amp; Vision</h2>
            </div>
            <div class="about-info-grid">
                <div class="about-info-card animate-fade">
                    <div class="card-icon"><i class="fa-solid fa-bullseye"></i></div>
                    <h4>Our Mission</h4>
                    <p>To transform every space into a personalised sanctuary — delivering interior solutions that seamlessly blend aesthetics, functionality, and comfort, uniquely crafted for each client's lifestyle and aspirations.</p>
                </div>
                <div class="about-info-card animate-fade" style="animation-delay: 0.12s;">
                    <div class="card-icon"><i class="fa-solid fa-eye"></i></div>
                    <h4>Our Vision</h4>
                    <p>To be the most trusted interior design partner in the region — where cutting-edge creativity meets timeless craftsmanship, continuously setting new benchmarks in luxury, sustainability, and living experience.</p>
                </div>
                <div class="about-info-card animate-fade" style="animation-delay: 0.24s;">
                    <div class="card-icon"><i class="fa-solid fa-seedling"></i></div>
                    <h4>Our Commitment</h4>
                    <p>We are dedicated to environmentally responsible design — sourcing sustainable materials, working with local artisans, and minimising our ecological footprint on every project we undertake with pride.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- ── Core Values (Dark Section) ── -->
    <section class="values-section">
        <div class="container">
            <div class="section-header">
                <span class="section-tag" style="color: #b69788;">What We Stand For</span>
                <h2 class="section-title" style="color: white;">Our Core Values</h2>
            </div>
            <div class="values-grid">
                <div class="value-card">
                    <i class="fa-solid fa-gem"></i>
                    <h4>Quality &amp; Luxury</h4>
                    <p>We source finest materials from premium global brands — ensuring durability, prestige, and beauty in every finish.</p>
                </div>
                <div class="value-card">
                    <i class="fa-solid fa-leaf"></i>
                    <h4>Sustainability</h4>
                    <p>Natural ventilation, energy-efficient fixtures, and locally sourced materials for spaces that are healthy long-term.</p>
                </div>
                <div class="value-card">
                    <i class="fa-solid fa-heart"></i>
                    <h4>Client Centricity</h4>
                    <p>Every layout is customised to your daily routine, workflow, lifestyle needs, and unique storage requirements.</p>
                </div>
                <div class="value-card">
                    <i class="fa-solid fa-lightbulb"></i>
                    <h4>Innovation</h4>
                    <p>We stay at the forefront of design trends — from smart home integration to biophilic design and beyond.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- ── Team ── -->
    <section class="section-padding container">
        <div class="section-header">
            <span class="section-tag">The Minds Behind the Magic</span>
            <h2 class="section-title">Meet Our Team</h2>
        </div>
        <div class="about-info-grid">
            <div class="team-card animate-fade">
                <div class="team-card-img-wrap"><i class="fa-solid fa-user-tie"></i></div>
                <div class="team-card-body">
                    <h4>Arjun Kriya</h4>
                    <div class="role">Founder &amp; Principal Designer</div>
                    <p>18 years in luxury interiors. Personally overseen 500+ projects across residential and hospitality spaces across India and internationally.</p>
                </div>
            </div>
            <div class="team-card animate-fade" style="animation-delay: 0.1s;">
                <div class="team-card-img-wrap"><i class="fa-solid fa-pen-ruler"></i></div>
                <div class="team-card-body">
                    <h4>Meera Sharma</h4>
                    <div class="role">Lead Interior Architect</div>
                    <p>Expert in spatial engineering and 3D visualisation — turning concepts into photo-realistic designs before a single nail is placed.</p>
                </div>
            </div>
            <div class="team-card animate-fade" style="animation-delay: 0.2s;">
                <div class="team-card-img-wrap"><i class="fa-solid fa-palette"></i></div>
                <div class="team-card-body">
                    <h4>Rohan Nair</h4>
                    <div class="role">Styling &amp; Procurement Head</div>
                    <p>Curates every material palette, fabric swatch, and hardware finish. Manages relationships with 120+ premium vendors across India and Europe.</p>
                </div>
            </div>
            <div class="team-card animate-fade" style="animation-delay: 0.3s;">
                <div class="team-card-img-wrap"><i class="fa-solid fa-helmet-safety"></i></div>
                <div class="team-card-body">
                    <h4>Priya Joshi</h4>
                    <div class="role">Project &amp; Site Manager</div>
                    <p>Ensures every project is executed on time and within budget with on-ground supervision and quality audits at every stage.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- ── Achievements ── -->
    <section class="section-padding" style="background: #f7f9f6;">
        <div class="container">
            <div class="section-header">
                <span class="section-tag">Milestones &amp; Recognition</span>
                <h2 class="section-title">Our Achievements</h2>
            </div>
            <div class="about-info-grid">
                <div class="about-info-card animate-fade" style="border-left: 4px solid var(--accent-color);">
                    <div class="card-icon"><i class="fa-solid fa-trophy"></i></div>
                    <h4>Best Luxury Interior Studio 2023</h4>
                    <p>Recognised by the Indian Design Council for exceptional craftsmanship and innovation in residential luxury interiors three years running.</p>
                </div>
                <div class="about-info-card animate-fade" style="animation-delay: 0.12s; border-left: 4px solid var(--accent-color);">
                    <div class="card-icon"><i class="fa-solid fa-star"></i></div>
                    <h4>500+ Projects Completed</h4>
                    <p>From studio apartments in Mumbai to 5-star hotel lobbies in Goa — 500+ unique spaces transformed since our founding in 2012.</p>
                </div>
                <div class="about-info-card animate-fade" style="animation-delay: 0.24s; border-left: 4px solid var(--accent-color);">
                    <div class="card-icon"><i class="fa-solid fa-handshake"></i></div>
                    <h4>98% Client Satisfaction Rate</h4>
                    <p>Post-project surveys consistently show 98% satisfaction, with over 70% of new projects coming from returning clients and referrals.</p>
                </div>
                <div class="about-info-card animate-fade" style="animation-delay: 0.36s; border-left: 4px solid var(--accent-color);">
                    <div class="card-icon"><i class="fa-solid fa-earth-asia"></i></div>
                    <h4>Pan-India &amp; International Reach</h4>
                    <p>Projects executed in 14 Indian cities and international collaborations in the UAE, Singapore, and the UK for diaspora clients.</p>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
