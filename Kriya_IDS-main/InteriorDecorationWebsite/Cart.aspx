<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="InteriorDecorationWebsite.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Header Banner -->
    <div class="page-banner" style="background-image: url('images/banner/cart-bg.jpg');">
        <div class="page-banner-content">
            <h1>Your Shopping Cart</h1>
            <p>Review your selected interior design furnishings, luxury decor items, and bespoke pieces.</p>
        </div>
    </div>

    <section class="container section-padding" style="padding-top: 1rem;">
        <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>

        <div class="table-container">
            <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" 
                CssClass="custom-grid" GridLines="None" OnRowCommand="gvCart_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="Item Image">
                        <ItemTemplate>
                            <img src='images/products/<%# Eval("ProductImage") %>' style="width: 70px; height: 70px; object-fit: cover; border-radius: 6px;" alt="Product" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                    <asp:BoundField DataField="CategoryName" HeaderText="Category" />
                    <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="${0:N2}" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    <asp:TemplateField HeaderText="Subtotal">
                        <ItemTemplate>
                            <strong><%# string.Format("${0:N2}", Convert.ToDecimal(Eval("Price")) * Convert.ToInt32(Eval("Quantity"))) %></strong>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="cmd_del_cart" CommandArgument='<%# Eval("CartId") %>' CssClass="btn-action-delete" OnClientClick="return confirm('Remove this item from your cart?');" CausesValidation="false">
                                <i class="fa-solid fa-trash"></i> Remove
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:Label ID="lblEmpty" runat="server" Text="<div style='text-align:center; padding:3rem; color:var(--text-secondary);'><i class='fa-solid fa-cart-flatbed' style='font-size:3rem; margin-bottom:1rem; color:var(--accent-color);'></i><h3>Your cart is currently empty!</h3><p>Browse our luxury collection to add items.</p></div>" Visible="false"></asp:Label>
        </div>

        <div class="form-card" style="margin: 2rem 0 0 auto; max-width: 400px; text-align: right;">
            <h3 style="font-size: 1.2rem; color: var(--text-secondary); margin-bottom: 0.5rem;">Cart Summary</h3>
            <h2 style="font-size: 2rem; color: var(--primary-color); font-weight: 800; margin-bottom: 1.5rem;">
                Total: <asp:Label ID="lblGrandTotal" runat="server" Text="$0.00"></asp:Label>
            </h2>

            <asp:Button ID="btnCheckout" runat="server" Text="Proceed to Checkout" CssClass="btn-form btn-primary" OnClick="btnCheckout_Click" />
        </div>
    </section>
</asp:Content>
