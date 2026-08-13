using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteriorDecorationWebsite
{
    public partial class Cart : Page
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
                fillCartGrid();
            }
        }

        private void fillCartGrid()
        {
            int userId = Convert.ToInt32(Session["UserId"]);

            try
            {
                using (SqlConnection con = getCon())
                {
                    SqlCommand cmd = new SqlCommand(@"
                        SELECT c.CartId, p.ProductName, p.Price, p.ProductImage, cat.CategoryName, c.Quantity
                        FROM tbl_cart c
                        INNER JOIN tbl_products p ON c.ProductId = p.ProductId
                        INNER JOIN tbl_category cat ON p.CategoryId = cat.CategoryId
                        WHERE c.UserId = @UserId
                        ORDER BY c.CartId DESC", con);
                    cmd.Parameters.AddWithValue("@UserId", userId);

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);

                    if (ds.Tables[0].Rows.Count == 0)
                    {
                        lblEmpty.Visible = true;
                        gvCart.DataSource = null;
                        gvCart.DataBind();
                        lblGrandTotal.Text = "$0.00";
                        btnCheckout.Enabled = false;
                    }
                    else
                    {
                        lblEmpty.Visible = false;
                        gvCart.DataSource = ds;
                        gvCart.DataBind();
                        btnCheckout.Enabled = true;

                        // Calculate grand total
                        decimal grandTotal = 0;
                        foreach (DataRow row in ds.Tables[0].Rows)
                        {
                            decimal price = Convert.ToDecimal(row["Price"]);
                            int qty = Convert.ToInt32(row["Quantity"]);
                            grandTotal += (price * qty);
                        }
                        lblGrandTotal.Text = grandTotal.ToString("$#,##0.00");
                    }
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error loading cart: " + ex.Message + "</div>";
            }
        }

        protected void gvCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_del_cart")
            {
                int cartId = Convert.ToInt32(e.CommandArgument);
                try
                {
                    using (SqlConnection con = getCon())
                    {
                        SqlCommand cmd = new SqlCommand("DELETE FROM tbl_cart WHERE CartId = @CartId", con);
                        cmd.Parameters.AddWithValue("@CartId", cartId);
                        cmd.ExecuteNonQuery();
                    }

                    fillCartGrid();
                    Site master = (Site)this.Master;
                    if (master != null)
                    {
                        master.UpdateNavMenu();
                    }
                }
                catch (Exception ex)
                {
                    lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error: " + ex.Message + "</div>";
                }
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            int userId = Convert.ToInt32(Session["UserId"]);
            try
            {
                using (SqlConnection con = getCon())
                {
                    SqlCommand cmd = new SqlCommand("DELETE FROM tbl_cart WHERE UserId = @UserId", con);
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.ExecuteNonQuery();
                }

                fillCartGrid();
                Site master = (Site)this.Master;
                if (master != null)
                {
                    master.UpdateNavMenu();
                }

                lblMsg.Text = "<div class='msg-alert msg-success'><i class='fa-solid fa-circle-check'></i> Thank you for your order! Your purchase has been processed successfully.</div>";
            }
            catch (Exception ex)
            {
                lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Checkout Error: " + ex.Message + "</div>";
            }
        }
    }
}
