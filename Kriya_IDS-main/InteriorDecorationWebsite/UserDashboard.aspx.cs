using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace InteriorDecorationWebsite
{
    public partial class UserDashboard : Page
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
                LoadUserProfile();
            }
        }

        private void LoadUserProfile()
        {
            int userId = Convert.ToInt32(Session["UserId"]);

            try
            {
                using (SqlConnection con = getCon())
                {
                    SqlCommand cmd = new SqlCommand("SELECT Name, Email, Mobile, Role FROM tbl_users WHERE Id = @Id", con);
                    cmd.Parameters.AddWithValue("@Id", userId);
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            lblName.Text = dr["Name"].ToString();
                            lblEmail.Text = dr["Email"].ToString();
                            lblMobile.Text = dr["Mobile"].ToString();
                            lblRole.Text = dr["Role"].ToString();
                        }
                    }

                    SqlCommand wishCmd = new SqlCommand("SELECT COUNT(*) FROM tbl_wishlist WHERE UserId = @UserId", con);
                    wishCmd.Parameters.AddWithValue("@UserId", userId);
                    lblWishlistCount.Text = wishCmd.ExecuteScalar().ToString();

                    SqlCommand cartCmd = new SqlCommand("SELECT COUNT(*) FROM tbl_cart WHERE UserId = @UserId2", con);
                    cartCmd.Parameters.AddWithValue("@UserId2", userId);
                    lblCartCount.Text = cartCmd.ExecuteScalar().ToString();
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error: " + ex.Message + "</div>";
            }
        }
    }
}
