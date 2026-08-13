using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace InteriorDecorationWebsite
{
    public partial class ProductDetails : Page
    {
        private SqlConnection getCon()
        {
            string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            con.Open();
            return con;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int productId = Convert.ToInt32(Request.QueryString["id"]);
                    loadProductDetails(productId);
                }
                else
                {
                    Response.Redirect("Products.aspx");
                }
            }
        }

        private void loadProductDetails(int productId)
        {
            try
            {
                using (SqlConnection con = getCon())
                {
                    SqlCommand cmd = new SqlCommand(@"
                        SELECT p.ProductName, p.Price, p.Description, p.ProductImage, c.CategoryName 
                        FROM tbl_products p
                        INNER JOIN tbl_category c ON p.CategoryId = c.CategoryId
                        WHERE p.ProductId = @Id", con);
                    cmd.Parameters.AddWithValue("@Id", productId);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            lblProductName.Text = dr["ProductName"].ToString();
                            lblCategory.Text = dr["CategoryName"].ToString();
                            lblPrice.Text = Convert.ToDecimal(dr["Price"]).ToString("$#,##0.00");
                            lblDescription.Text = dr["Description"].ToString();
                            imgProduct.ImageUrl = "images/products/" + dr["ProductImage"].ToString();
                        }
                        else
                        {
                            Response.Redirect("Products.aspx");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error: " + ex.Message + "</div>";
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx?msg=login_required");
                return;
            }

            int userId = Convert.ToInt32(Session["UserId"]);
            int productId = Convert.ToInt32(Request.QueryString["id"]);

            try
            {
                using (SqlConnection con = getCon())
                {
                    SqlCommand chkCmd = new SqlCommand("SELECT CartId, Quantity FROM tbl_cart WHERE UserId = @UserId AND ProductId = @ProductId", con);
                    chkCmd.Parameters.AddWithValue("@UserId", userId);
                    chkCmd.Parameters.AddWithValue("@ProductId", productId);

                    using (SqlDataReader dr = chkCmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            int cartId = Convert.ToInt32(dr["CartId"]);
                            int qty = Convert.ToInt32(dr["Quantity"]) + 1;
                            dr.Close();

                            SqlCommand upCmd = new SqlCommand("UPDATE tbl_cart SET Quantity = @Qty WHERE CartId = @CartId", con);
                            upCmd.Parameters.AddWithValue("@Qty", qty);
                            upCmd.Parameters.AddWithValue("@CartId", cartId);
                            upCmd.ExecuteNonQuery();
                        }
                        else
                        {
                            dr.Close();
                            SqlCommand insCmd = new SqlCommand("INSERT INTO tbl_cart (UserId, ProductId, Quantity, AddedDate) VALUES (@UserId, @ProductId, 1, GETDATE())", con);
                            insCmd.Parameters.AddWithValue("@UserId", userId);
                            insCmd.Parameters.AddWithValue("@ProductId", productId);
                            insCmd.ExecuteNonQuery();
                        }
                    }
                }

                Site master = (Site)this.Master;
                if (master != null)
                {
                    master.UpdateNavMenu();
                }

                lblMsg.Text = "<div class='msg-alert msg-success'><i class='fa-solid fa-circle-check'></i> Product added to your shopping cart!</div>";
            }
            catch (Exception ex)
            {
                lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error: " + ex.Message + "</div>";
            }
        }

        protected void btnAddToWishlist_Click(object sender, EventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx?msg=login_required");
                return;
            }

            int userId = Convert.ToInt32(Session["UserId"]);
            int productId = Convert.ToInt32(Request.QueryString["id"]);

            try
            {
                using (SqlConnection con = getCon())
                {
                    SqlCommand chk = new SqlCommand("SELECT COUNT(*) FROM tbl_wishlist WHERE UserId = @UserId AND ProductId = @ProductId", con);
                    chk.Parameters.AddWithValue("@UserId", userId);
                    chk.Parameters.AddWithValue("@ProductId", productId);
                    int count = (int)chk.ExecuteScalar();

                    if (count > 0)
                    {
                        lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Item is already in your wishlist!</div>";
                        return;
                    }

                    SqlCommand cmd = new SqlCommand("INSERT INTO tbl_wishlist (UserId, ProductId) VALUES (@UserId, @ProductId)", con);
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.Parameters.AddWithValue("@ProductId", productId);
                    cmd.ExecuteNonQuery();
                }

                lblMsg.Text = "<div class='msg-alert msg-success'><i class='fa-solid fa-circle-check'></i> Product added to your wishlist!</div>";
            }
            catch (Exception ex)
            {
                lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error: " + ex.Message + "</div>";
            }
        }
    }
}
