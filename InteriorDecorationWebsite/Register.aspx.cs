using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteriorDecorationWebsite
{
    public partial class Register : Page
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
                fillGrid();
            }
        }

        private void fillGrid()
        {
            try
            {
                using (SqlConnection con = getCon())
                {
                    SqlCommand cmd = new SqlCommand("SELECT Id, Name, Email, Mobile, Role FROM tbl_users ORDER BY Id DESC", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    gvUsers.DataSource = ds;
                    gvUsers.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error loading users: " + ex.Message + "</div>";
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;
            string mobile = txtMobile.Text.Trim();

            if (btnSubmit.Text == "Save")
            {
                // INSERT LOGIC
                try
                {
                    using (SqlConnection con = getCon())
                    {
                        // Check if Email exists
                        SqlCommand emailChk = new SqlCommand("SELECT COUNT(*) FROM tbl_users WHERE Email = @Email", con);
                        emailChk.Parameters.AddWithValue("@Email", email);
                        int emailCount = (int)emailChk.ExecuteScalar();

                        if (emailCount > 0)
                        {
                            lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Email address is already registered!</div>";
                            return;
                        }

                        SqlCommand cmd = new SqlCommand("INSERT INTO tbl_users (Name, Email, Password, Mobile, Role) VALUES (@Name, @Email, @Password, @Mobile, 'User')", con);
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", password);
                        cmd.Parameters.AddWithValue("@Mobile", mobile);
                        cmd.ExecuteNonQuery();
                    }

                    clearFields();
                    lblMsg.Text = "<div class='msg-alert msg-success'><i class='fa-solid fa-circle-check'></i> Registration successful! You can now log in.</div>";
                    Response.Write("<script>alert('User registered successfully!');</script>");
                    fillGrid();
                }
                catch (Exception ex)
                {
                    lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error registering: " + ex.Message + "</div>";
                }
            }
            else if (btnSubmit.Text == "Update")
            {
                // UPDATE LOGIC
                int userId = Convert.ToInt32(hfUserId.Value);
                try
                {
                    using (SqlConnection con = getCon())
                    {
                        SqlCommand cmd = new SqlCommand("UPDATE tbl_users SET Name = @Name, Email = @Email, Password = @Password, Mobile = @Mobile WHERE Id = @Id", con);
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", password);
                        cmd.Parameters.AddWithValue("@Mobile", mobile);
                        cmd.Parameters.AddWithValue("@Id", userId);
                        cmd.ExecuteNonQuery();
                    }

                    clearFields();
                    btnSubmit.Text = "Save";
                    btnCancel.Visible = false;
                    lblMsg.Text = "<div class='msg-alert msg-success'><i class='fa-solid fa-circle-check'></i> User details updated successfully!</div>";
                    Response.Write("<script>alert('User updated successfully!');</script>");
                    fillGrid();
                }
                catch (Exception ex)
                {
                    lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error updating: " + ex.Message + "</div>";
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            clearFields();
            btnSubmit.Text = "Save";
            btnCancel.Visible = false;
            lblMsg.Text = "";
        }

        private void clearFields()
        {
            txtName.Text = "";
            txtEmail.Text = "";
            txtPassword.Text = "";
            txtMobile.Text = "";
            hfUserId.Value = "";
        }

        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int userId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "cmd_edt")
            {
                try
                {
                    using (SqlConnection con = getCon())
                    {
                        SqlCommand cmd = new SqlCommand("SELECT Name, Email, Password, Mobile FROM tbl_users WHERE Id = @Id", con);
                        cmd.Parameters.AddWithValue("@Id", userId);
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                txtName.Text = dr["Name"].ToString();
                                txtEmail.Text = dr["Email"].ToString();
                                txtPassword.Text = dr["Password"].ToString();
                                txtMobile.Text = dr["Mobile"].ToString();
                                hfUserId.Value = userId.ToString();
                                btnSubmit.Text = "Update";
                                btnCancel.Visible = true;
                                lblMsg.Text = "";
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error fetching user details: " + ex.Message + "</div>";
                }
            }
            else if (e.CommandName == "cmd_del")
            {
                try
                {
                    using (SqlConnection con = getCon())
                    {
                        SqlCommand cmd = new SqlCommand("DELETE FROM tbl_users WHERE Id = @Id", con);
                        cmd.Parameters.AddWithValue("@Id", userId);
                        cmd.ExecuteNonQuery();
                    }

                    // If user deletes their own logged-in account
                    if (Session["UserId"] != null && Convert.ToInt32(Session["UserId"]) == userId)
                    {
                        Session.Clear();
                        Session.Abandon();
                        Response.Redirect("Login.aspx?msg=deleted");
                    }
                    else
                    {
                        lblMsg.Text = "<div class='msg-alert msg-success'><i class='fa-solid fa-circle-check'></i> User deleted successfully!</div>";
                        Response.Write("<script>alert('User deleted successfully!');</script>");
                        fillGrid();
                    }
                }
                catch (Exception ex)
                {
                    lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error deleting user: " + ex.Message + "</div>";
                }
            }
        }
    }
}
