<%@ Page Title="Our Services" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="InteriorDecorationWebsite.Services" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* ── Services Hero Banner ── */
        .services-hero {
            background: linear-gradient(135deg, rgba(66,54,46,0.85), rgba(90,74,63,0.9)),
                        url('images/banner/products-bg.jpg') center/cover no-repeat;
            padding: 5rem 1.5rem;
            text-align: center;
            color: #ffffff;
            margin-bottom: 0;
        }
        .services-hero h1 {
            font-family: var(--font-heading);
            font-size: 3rem;
            font-weight: 700;
            margin-bottom: 0.75rem;
        }
        .services-hero p {
            font-size: 1.15rem;
            color: #f0ebe6;
            max-width: 600px;
            margin: 0 auto;
        }

        /* ── Service Feature Cards (alternating image + text) ── */
        .service-feature {
            display: grid;
            grid-template-columns: 1fr 1fr;
            align-items: stretch;
            min-height: 380px;
            border-bottom: 1px solid var(--border-color);
        }
        .service-feature:last-of-type { border-bottom: none; }
        .service-feature.reverse { direction: rtl; }
        .service-feature.reverse > * { direction: ltr; }

        .service-feature-img {
            width: 100%;
            height: 100%;
            min-height: 320px;
            object-fit: cover;
            display: block;
        }
        .service-feature-body {
            padding: 3rem 3.5rem;
            display: flex;
            flex-direction: column;
            justify-content: center;
            background: #ffffff;
        }
        .service-feature-icon {
            font-size: 2.5rem;
            color: var(--accent-color);
            margin-bottom: 1rem;
        }
        .service-feature-tag {
            font-size: 0.78rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 2px;
            color: var(--accent-color);
            margin-bottom: 0.5rem;
        }
        .service-feature-title {
            font-family: var(--font-heading);
            font-size: 1.9rem;
            color: var(--primary-color);
            margin-bottom: 1rem;
            line-height: 1.25;
        }
        .service-feature-desc {
            color: var(--text-secondary);
            font-size: 0.97rem;
            line-height: 1.75;
            margin-bottom: 1rem;
        }
        .service-feature-detail {
            font-size: 0.9rem;
            color: var(--text-secondary);
            line-height: 1.7;
            border-left: 3px solid var(--accent-color);
            padding-left: 1rem;
            margin-top: 0.5rem;
            font-style: italic;
        }

        /* ── Mini Service Cards Grid ── */
        .mini-services-section {
            background: #f7f9f6;
            padding: 4rem 0;
        }
        .mini-services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
            gap: 1.75rem;
            margin-top: 2.5rem;
        }
        .mini-service-card {
            background: #ffffff;
            border-radius: 14px;
            padding: 2rem 1.75rem;
            border: 1px solid var(--border-color);
            box-shadow: var(--shadow-sm);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .mini-service-card:hover {
            transform: translateY(-5px);
            box-shadow: var(--shadow-md);
            border-color: var(--accent-color);
        }
        .mini-service-card .mini-icon {
            width: 52px;
            height: 52px;
            border-radius: 12px;
            background: rgba(168,145,127,0.12);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: var(--accent-color);
            margin-bottom: 1rem;
        }
        .mini-service-card h4 {
            font-family: var(--font-heading);
            font-size: 1.15rem;
            color: var(--primary-color);
            margin-bottom: 0.5rem;
        }
        .mini-service-card p {
            font-size: 0.9rem;
            color: var(--text-secondary);
            line-height: 1.65;
        }

        /* ── Process Steps ── */
        .process-section {
            padding: 4rem 0;
            background: var(--primary-color);
            color: #ffffff;
        }
        .process-steps {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 2rem;
            margin-top: 2.5rem;
            counter-reset: steps;
        }
        .process-step {
            text-align: center;
            counter-increment: steps;
            position: relative;
        }
        .process-step::before {
            content: counter(steps);
            display: block;
            width: 52px;
            height: 52px;
            border-radius: 50%;
            background: var(--accent-color);
            color: #ffffff;
            font-size: 1.4rem;
            font-weight: 700;
            line-height: 52px;
            margin: 0 auto 1rem auto;
        }
        .process-step h4 {
            font-size: 1rem;
            font-weight: 600;
            color: #ffffff;
            margin-bottom: 0.4rem;
        }
        .process-step p {
            font-size: 0.85rem;
            color: #d2ccc4;
            line-height: 1.55;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .service-feature {
                grid-template-columns: 1fr;
            }
            .service-feature.reverse { direction: ltr; }
            .service-feature-body { padding: 2rem 1.5rem; }
            .service-feature-img { min-height: 220px; }
            .services-hero h1 { font-size: 2rem; }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- ── Hero Banner ── -->
    <div class="services-hero">
        <span class="section-tag" style="color: #b69788;">What We Do</span>
        <h1>Premium Interior Design Services</h1>
        <p>From concept to completion — bespoke interior solutions crafted for every lifestyle and space.</p>
    </div>

    <!-- ── Alternating Feature Sections ── -->
    <section>

        <!-- 1. Residential Interior -->
        <div class="service-feature">
            <img src="images/categories/living-room.jpg" alt="Residential Interior" class="service-feature-img" />
            <div class="service-feature-body">
                <div class="service-feature-icon"><i class="fa-solid fa-house-chimney"></i></div>
                <div class="service-feature-tag">Residential Design</div>
                <h2 class="service-feature-title">Residential Interior Design</h2>
                <p class="service-feature-desc">Complete home transformation — from architectural planning and false ceiling concepts to lighting design and curated furniture selections. We cover living rooms, dining spaces, balconies, and every corner of your home.</p>
                <p class="service-feature-detail">Our process begins with a detailed lifestyle interview, progresses through 3D visualisation and material sampling, and ends with a white-glove installation that brings your dream home to life with zero compromise.</p>
            </div>
        </div>

        <!-- 2. Modular Kitchens -->
        <div class="service-feature reverse">
            <img src="images/categories/kitchen.jpg" alt="Modular Kitchen" class="service-feature-img" />
            <div class="service-feature-body">
                <div class="service-feature-icon"><i class="fa-solid fa-kitchen-set"></i></div>
                <div class="service-feature-tag">Kitchen Design</div>
                <h2 class="service-feature-title">Modular Kitchen Solutions</h2>
                <p class="service-feature-desc">Ergonomic U-shape, L-shape, and island kitchen layouts crafted with soft-close hardware, built-in pantries, quartz countertops, and professional-grade chimney integrations.</p>
                <p class="service-feature-detail">We work with German engineering standards for fittings and partner with premium countertop suppliers — creating kitchens that feel as luxurious as they are functional, every single day.</p>
            </div>
        </div>

        <!-- 3. Bedroom & Wardrobe -->
        <div class="service-feature">
            <img src="images/categories/bedroom.jpg" alt="Bedroom Design" class="service-feature-img" />
            <div class="service-feature-body">
                <div class="service-feature-icon"><i class="fa-solid fa-bed"></i></div>
                <div class="service-feature-tag">Bedroom &amp; Storage</div>
                <h2 class="service-feature-title">Bedroom &amp; Wardrobe Design</h2>
                <p class="service-feature-desc">Serene, personalised bedroom environments with custom wardrobe systems, upholstered headboards, layered ambient lighting, and premium linen selections that transform rest into a ritual.</p>
                <p class="service-feature-detail">We balance aesthetics with practicality — every wardrobe is designed with dedicated zones for hanging, folding, accessories, and shoes, all within a seamlessly integrated design that disappears into the room.</p>
            </div>
        </div>

        <!-- 4. Corporate Spaces -->
        <div class="service-feature reverse">
            <img src="images/categories/office.jpg" alt="Corporate Space" class="service-feature-img" />
            <div class="service-feature-body">
                <div class="service-feature-icon"><i class="fa-solid fa-building-user"></i></div>
                <div class="service-feature-tag">Commercial Design</div>
                <h2 class="service-feature-title">Corporate &amp; Office Spaces</h2>
                <p class="service-feature-desc">Optimised executive offices, collaboration hubs, reception areas, and server rooms — all designed to reflect your brand identity and drive employee productivity and satisfaction.</p>
                <p class="service-feature-detail">We incorporate biophilic elements, acoustic management, ergonomic workstations, and smart lighting to create modern offices where people genuinely want to work and clients are impressed at first sight.</p>
            </div>
        </div>

    </section>

    <!-- ── Additional Services Mini Cards ── -->
    <section class="mini-services-section">
        <div class="container">
            <div class="section-header">
                <span class="section-tag">Also Available</span>
                <h2 class="section-title">More Design Specialisations</h2>
            </div>
            <div class="mini-services-grid">
                <div class="mini-service-card">
                    <div class="mini-icon"><i class="fa-solid fa-chair"></i></div>
                    <h4>Bespoke Furniture</h4>
                    <p>Custom wardrobes, sofa units, media consoles, and coffee tables handcrafted to your exact space constraints, material preferences, and design vision.</p>
                </div>
                <div class="mini-service-card">
                    <div class="mini-icon"><i class="fa-solid fa-lightbulb"></i></div>
                    <h4>Lighting &amp; Ambience</h4>
                    <p>Layered lighting strategies — cove lighting, pendant clusters, smart dimmers, and accent fixtures that create depth, drama, and the perfect mood in every room.</p>
                </div>
                <div class="mini-service-card">
                    <div class="mini-icon"><i class="fa-solid fa-paint-roller"></i></div>
                    <h4>Wall Treatments &amp; Textures</h4>
                    <p>Feature walls with venetian plaster, fluted panels, wallpaper murals, and Japandi-inspired limewash finishes that add character and dimension to any space.</p>
                </div>
                <div class="mini-service-card">
                    <div class="mini-icon"><i class="fa-solid fa-water"></i></div>
                    <h4>Bathroom &amp; Spa Design</h4>
                    <p>Luxury bathrooms with freestanding bathtubs, rain showers, floating vanities, and spa-grade finishes that transform your daily routine into an indulgent experience.</p>
                </div>
                <div class="mini-service-card">
                    <div class="mini-icon"><i class="fa-solid fa-tree"></i></div>
                    <h4>Balcony &amp; Outdoor Living</h4>
                    <p>Terrace gardens, louvred pergolas, and weather-resistant furniture arrangements designed to maximise your outdoor square footage all year round.</p>
                </div>
                <div class="mini-service-card">
                    <div class="mini-icon"><i class="fa-solid fa-vr-cardboard"></i></div>
                    <h4>3D Visualisation &amp; Walkthroughs</h4>
                    <p>Photo-realistic 3D renders and immersive virtual walkthroughs of your project before a single piece of material is ordered — see it before you build it.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- ── Our Process ── -->
    <section class="process-section">
        <div class="container">
            <div class="section-header">
                <span class="section-tag" style="color: #b69788;">How We Work</span>
                <h2 class="section-title" style="color: white;">Our Design Process</h2>
            </div>
            <div class="process-steps">
                <div class="process-step">
                    <h4>Discovery Call</h4>
                    <p>We understand your lifestyle, preferences, budget, and timeline in a structured 45-minute consultation.</p>
                </div>
                <div class="process-step">
                    <h4>Concept &amp; Mood Board</h4>
                    <p>Our designers craft 2–3 distinct concept directions with curated material palettes for your review.</p>
                </div>
                <div class="process-step">
                    <h4>3D Design &amp; Approval</h4>
                    <p>Full 3D renders and a virtual walkthrough of your finalised design are presented for approval.</p>
                </div>
                <div class="process-step">
                    <h4>Execution &amp; On-Site</h4>
                    <p>Our project manager oversees every contractor, material delivery, and quality checkpoint on-site.</p>
                </div>
                <div class="process-step">
                    <h4>Styling &amp; Handover</h4>
                    <p>Final styling touches — cushions, art, plants, and accessories — are placed and your home is handed over.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- ── CTA ── -->
    <section class="section-padding" style="text-align: center;">
        <div class="container" style="max-width: 700px;">
            <span class="section-tag">Start Your Journey</span>
            <h2 class="section-title" style="margin-bottom: 1rem;">Ready to Transform Your Space?</h2>
            <p style="color: var(--text-secondary); margin-bottom: 2rem;">Get in touch with our design experts today to schedule a virtual walkthrough or in-studio consultation — completely free.</p>
            <a href="Contact.aspx" class="btn-primary" style="margin-right: 1rem;">Book a Consultation</a>
            <a href="Products.aspx" class="btn-outline" style="border-color: var(--accent-color); color: var(--accent-color); padding: 0.85rem 1.85rem; border-radius: 8px; text-decoration: none; font-weight: 600; display: inline-block; transition: all 0.3s ease;">Browse Products</a>
        </div>
    </section>

</asp:Content>
