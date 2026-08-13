<%@ Page Title="My Wishlist" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Wishlist.aspx.cs" Inherits="InteriorDecorationWebsite.Wishlist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section class="section-padding container">
        <div class="section-header">
            <span class="section-tag">Favorites</span>
            <h2 class="section-title">My Wishlist</h2>
        </div>

        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
        
        <div class="table-container animate-fade">
            <asp:GridView ID="gvWishlist" runat="server" AutoGenerateColumns="False" 
                CssClass="custom-grid" GridLines="None" OnRowCommand="gvWishlist_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <img src='images/products/<%# Eval("ProductImage") %>' class="grid-image" alt="Product Image" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                    <asp:BoundField DataField="CategoryName" HeaderText="Category" />
                    <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="${0:N2}" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnRemove" runat="server" 
                                CommandName="cmd_del" CommandArgument='<%# Eval("WishlistId") %>' 
                                CssClass="btn-action-delete" OnClientClick="return confirm('Are you sure you want to remove this item from your wishlist?');">
                                <i class="fa-solid fa-trash"></i> Remove
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            
            <asp:Label ID="lblEmpty" runat="server" Text="Your wishlist is empty." Visible="false" 
                Style="text-align: center; display: block; font-weight: 500; font-size: 1.1rem; padding: 2rem 0; color: var(--text-secondary);"></asp:Label>
        </div>
    </section>
</asp:Content>
