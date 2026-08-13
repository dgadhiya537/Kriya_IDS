<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="InteriorDecorationWebsite.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section-padding container">
        <div class="form-card animate-fade" style="max-width: 600px; margin: 0 auto 4rem auto;">
            <h2 class="form-title">Join LuxeInteriors</h2>
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            <asp:HiddenField ID="hfUserId" runat="server" />
            
            <div class="form-group">
                <label class="form-label" for="txtName">Full Name</label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-input" placeholder="Enter your full name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" ErrorMessage="Name is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label class="form-label" for="txtEmail">Email Address</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-input" placeholder="Enter your email address" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label class="form-label" for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-input" placeholder="Create a password" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label class="form-label" for="txtMobile">Mobile Number</label>
                <asp:TextBox ID="txtMobile" runat="server" CssClass="form-input" placeholder="Enter mobile number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ControlToValidate="txtMobile" ErrorMessage="Mobile is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            
            <asp:Button ID="btnSubmit" runat="server" Text="Save" CssClass="btn-form btn-primary" OnClick="btnSubmit_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn-form" Style="background-color: #cbd5e1; color: var(--text-primary); margin-top: 0.5rem;" Visible="false" OnClick="btnCancel_Click" CausesValidation="false" />
        </div>

        <!-- GridView Below showing Registered Users -->
        <div class="table-container animate-fade" style="margin-top: 3rem;">
            <h3>Registered User Management</h3>
            <p style="color: var(--text-secondary); font-size: 0.9rem; margin-bottom: 1rem;">View, Edit, or Delete user records directly in real time.</p>
            <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" 
                CssClass="custom-grid" GridLines="None" OnRowCommand="gvUsers_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="User ID" />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Mobile" HeaderText="Mobile" />
                    <asp:BoundField DataField="Role" HeaderText="Role" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="cmd_edt" CommandArgument='<%# Eval("Id") %>' CssClass="btn-action-edit" CausesValidation="false">
                                <i class="fa-solid fa-pen-to-square"></i> Edit
                            </asp:LinkButton>
                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="cmd_del" CommandArgument='<%# Eval("Id") %>' CssClass="btn-action-delete" OnClientClick="return confirm('Are you sure you want to delete this user?');" CausesValidation="false">
                                <i class="fa-solid fa-trash"></i> Delete
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </section>
</asp:Content>
