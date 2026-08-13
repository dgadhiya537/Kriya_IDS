using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteriorDecorationWebsite
{
    public partial class Products : Page
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
                loadCategoryFilters();
                if (Request.QueryString["cat"] != null)
                {
                    int catId = Convert.ToInt32(Request.QueryString["cat"]);
                    loadProducts(catId);
                }
                else
                {
                    loadProducts(0);
                }
            }
        }

        private void loadCategoryFilters()
        {
            try
            {
                using (SqlConnection con = getCon())
                {
                    SqlCommand cmd = new SqlCommand("SELECT CategoryId, CategoryName FROM tbl_category", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    rptCategoryFilter.DataSource = ds;
                    rptCategoryFilter.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error: " + ex.Message + "</div>";
            }
        }

        private void loadProducts(int catId)
        {
            try
            {
                using (SqlConnection con = getCon())
                {
                    string query = @"
                        SELECT p.ProductId, p.ProductName, p.Price, p.ProductImage, c.CategoryName 
                        FROM tbl_products p 
                        INNER JOIN tbl_category c ON p.CategoryId = c.CategoryId";

                    if (catId > 0)
                    {
                        query += " WHERE p.CategoryId = @CatId";
                    }
                    query += " ORDER BY p.ProductId DESC";

                    SqlCommand cmd = new SqlCommand(query, con);
                    if (catId > 0)
                    {
                        cmd.Parameters.AddWithValue("@CatId", catId);
                    }

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables[0].Rows.Count == 0)
                    {
                        lblNoProducts.Visible = true;
                        rptProducts.DataSource = null;
                        rptProducts.DataBind();
                    }
                    else
                    {
                        lblNoProducts.Visible = false;
                        rptProducts.DataSource = ds;
                        rptProducts.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error loading products: " + ex.Message + "</div>";
            }
        }

        protected void btnFilter_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int catId = Convert.ToInt32(btn.CommandArgument);
            loadProducts(catId);
        }

        protected void rptProducts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx?msg=login_required");
                return;
            }

            int userId = Convert.ToInt32(Session["UserId"]);
            int productId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "cmd_cart")
            {
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
            else if (e.CommandName == "cmd_wish")
            {
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
}
