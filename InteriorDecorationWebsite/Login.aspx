<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="InteriorDecorationWebsite.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section-padding container">
        <div class="form-card animate-fade">
            <h2 class="form-title">Welcome Back</h2>
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            
            <div class="form-group">
                <label class="form-label" for="txtEmail">Email Address</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" placeholder="Enter your email" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <label class="form-label" for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-input" placeholder="Enter password" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label class="form-label">Account Role</label>
                <asp:DropDownList ID="ddlRole" runat="server" CssClass="form-dropdown">
                    <asp:ListItem Value="User">User / Client</asp:ListItem>
                    <asp:ListItem Value="Admin">Administrator</asp:ListItem>
                </asp:DropDownList>
            </div>

            <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="btn-form btn-primary" OnClick="btnLogin_Click" />
            
            <div style="text-align: center; margin-top: 1.5rem;">
                <asp:LinkButton ID="lnkGuest" runat="server" OnClick="lnkGuest_Click" CssClass="nav-link" 
                    Style="display: inline-flex; justify-content: center; font-weight: 600; color: var(--accent-color); text-decoration: underline;" 
                    CausesValidation="false">
                    Continue as Guest
                </asp:LinkButton>
            </div>

            <div class="form-footer">
                Don't have an account? <a href="Register.aspx">Register here</a>
            </div>
        </div>
    </section>
</asp:Content>
