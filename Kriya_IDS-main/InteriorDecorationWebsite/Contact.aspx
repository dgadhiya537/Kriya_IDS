<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="InteriorDecorationWebsite.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Header Banner with Background Image -->
    <div class="page-banner" style="background-image: url('images/banner/contact-bg.jpg');">
        <div class="page-banner-content">
            <h1>Get In Touch</h1>
            <p>Connect with our principal interior designers for consultations, project inquiries, or custom design quotes.</p>
        </div>
    </div>

    <section class="container section-padding" style="padding-top: 1rem;">
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>

        <div class="contact-grid">
            <!-- Contact Info Panel -->
            <div class="contact-info-card">
                <h3 style="font-family: var(--font-heading); font-size: 1.75rem; margin-bottom: 1.5rem; color: var(--accent-color);">Studio Headquarters</h3>
                
                <div class="contact-info-item">
                    <i class="fa-solid fa-location-dot contact-icon"></i>
                    <div>
                        <h4 style="font-size: 1.1rem; color: #ffffff;">Main Studio</h4>
                        <p style="color: #d2ccc4;">100 Architectural Way, Suite 500<br />Design District, NY 10001</p>
                    </div>
                </div>

                <div class="contact-info-item">
                    <i class="fa-solid fa-phone contact-icon"></i>
                    <div>
                        <h4 style="font-size: 1.1rem; color: #ffffff;">Phone Line</h4>
                        <p style="color: #d2ccc4;">+1 (800) 555-KRIYA / +1 (212) 555-0199</p>
                    </div>
                </div>

                <div class="contact-info-item">
                    <i class="fa-solid fa-envelope contact-icon"></i>
                    <div>
                        <h4 style="font-size: 1.1rem; color: #ffffff;">Email Inquiries</h4>
                        <p style="color: #d2ccc4;">consultation@kriya-ids.com</p>
                    </div>
                </div>

                <div class="contact-info-item">
                    <i class="fa-solid fa-clock contact-icon"></i>
                    <div>
                        <h4 style="font-size: 1.1rem; color: #ffffff;">Studio Hours</h4>
                        <p style="color: #d2ccc4;">Monday - Friday: 9:00 AM - 6:00 PM<br />Saturday: By Appointment Only</p>
                    </div>
                </div>
            </div>

            <!-- Contact Form connected to Database -->
            <div class="form-card" style="margin: 0; max-width: 100%;">
                <h3 style="font-family: var(--font-heading); font-size: 1.75rem; margin-bottom: 1.5rem; color: var(--primary-color);">Send Us a Message</h3>
                
                <div class="form-group">
                    <label class="form-label" for="txtName">Your Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-input" placeholder="Enter your full name"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Name is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtEmail">Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" placeholder="Enter your email" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtSubject">Subject / Service Type</label>
                    <asp:TextBox ID="txtSubject" runat="server" CssClass="form-input" placeholder="e.g. Residential Interior Design Quote"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ControlToValidate="txtSubject" ErrorMessage="Subject is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group">
                    <label class="form-label" for="txtMessage">Message</label>
                    <asp:TextBox ID="txtMessage" runat="server" CssClass="form-input" TextMode="MultiLine" Rows="4" placeholder="Describe your space, timeline, and design preferences..."></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ControlToValidate="txtMessage" ErrorMessage="Message is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </div>

                <asp:Button ID="btnSubmitContact" runat="server" Text="Submit Inquiry" CssClass="btn-form btn-primary" OnClick="btnSubmitContact_Click" />
            </div>
        </div>
    </section>
</asp:Content>
