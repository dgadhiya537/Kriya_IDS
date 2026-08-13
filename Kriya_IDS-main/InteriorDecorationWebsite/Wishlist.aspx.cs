using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteriorDecorationWebsite
{
    public partial class Wishlist : Page
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
            if (Session["UserId"] == null)
            {
                Response.Redirect("Login.aspx?msg=login_required");
                return;
            }

            if (!IsPostBack)
            {
                fillGrid();
            }
        }

        private void fillGrid()
        {
            int userId = Convert.ToInt32(Session["UserId"]);
            try
            {
                using (SqlConnection con = getCon())
                {
                    SqlCommand cmd = new SqlCommand(@"
                        SELECT w.WishlistId, p.ProductName, p.Price, p.ProductImage, c.CategoryName 
                        FROM tbl_wishlist w
                        INNER JOIN tbl_products p ON w.ProductId = p.ProductId
                        INNER JOIN tbl_category c ON p.CategoryId = c.CategoryId
                        WHERE w.UserId = @UserId 
                        ORDER BY w.WishlistId DESC", con);
                    cmd.Parameters.AddWithValue("@UserId", userId);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables[0].Rows.Count == 0)
                    {
                        lblEmpty.Visible = true;
                        gvWishlist.DataSource = null;
                        gvWishlist.DataBind();
                    }
                    else
                    {
                        lblEmpty.Visible = false;
                        gvWishlist.DataSource = ds;
                        gvWishlist.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error: " + ex.Message + "</div>";
            }
        }

        protected void gvWishlist_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_del")
            {
                int wishlistId = Convert.ToInt32(e.CommandArgument);
                try
                {
                    using (SqlConnection con = getCon())
                    {
                        SqlCommand cmd = new SqlCommand("DELETE FROM tbl_wishlist WHERE WishlistId = @WishlistId", con);
                        cmd.Parameters.AddWithValue("@WishlistId", wishlistId);
                        cmd.ExecuteNonQuery();
                    }
                    Response.Write("<script>alert('Item removed from wishlist successfully!');</script>");
                    fillGrid();
                }
                catch (Exception ex)
                {
                    lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error: " + ex.Message + "</div>";
                }
            }
        }
    }
}
