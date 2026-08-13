using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace InteriorDecorationWebsite
{
    public partial class Login : Page
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
                // Check if redirect query message is present
                string msg = Request.QueryString["msg"];
                if (msg == "login_required")
                {
                    lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Please log in to access this page!</div>";
                }
                else if (msg == "deleted")
                {
                    lblMsg.Text = "<div class='msg-alert msg-success'><i class='fa-solid fa-circle-check'></i> Your account was deleted successfully.</div>";
                }

                // If already logged in, redirect accordingly
                if (Session["UserId"] != null)
                {
                    string role = Session["Role"] != null ? Session["Role"].ToString() : "User";
                    if (role == "Admin")
                    {
                        Response.Redirect("AdminDashboard.aspx");
                    }
                    else
                    {
                        Response.Redirect("UserDashboard.aspx");
                    }
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;
            string role = ddlRole.SelectedValue;

            try
            {
                using (SqlConnection con = getCon())
                {
                    SqlCommand cmd = new SqlCommand("SELECT Id, Name, Role FROM tbl_users WHERE Email = @Email AND Password = @Password AND Role = @Role", con);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Password", password);
                    cmd.Parameters.AddWithValue("@Role", role);

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            Session["UserId"] = dr["Id"].ToString();
                            Session["UserName"] = dr["Name"].ToString();
                            Session["Role"] = dr["Role"].ToString();
                            Session["Guest"] = null;

                            // Force master page navigation sync
                            Site master = (Site)this.Master;
                            if (master != null)
                            {
                                master.UpdateNavMenu();
                            }

                            if (role == "Admin")
                            {
                                Response.Redirect("AdminDashboard.aspx");
                            }
                            else
                            {
                                Response.Redirect("UserDashboard.aspx");
                            }
                        }
                        else
                        {
                            lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-circle-xmark'></i> Invalid email, password, or role selector!</div>";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Database Error: " + ex.Message + "</div>";
            }
        }

        protected void lnkGuest_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session["UserId"] = null;
            Session["UserName"] = "Guest";
            Session["Role"] = "Guest";
            Session["Guest"] = true;

            // Sync master menu layout
            Site master = (Site)this.Master;
            if (master != null)
            {
                master.UpdateNavMenu();
            }

            Response.Redirect("Home.aspx");
        }
    }
}
