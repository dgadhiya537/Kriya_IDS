using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteriorDecorationWebsite
{
    public partial class AdminDashboard : Page
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
            if (Session["Role"] == null || Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx?msg=login_required");
                return;
            }

            if (!IsPostBack)
            {
                fillStats();
                fillGridCategories();
                fillGridProducts();
                fillCategoryDropDown();
            }
        }

        private void fillStats()
        {
            try
            {
                using (SqlConnection con = getCon())
                {
                    SqlCommand cmdCat = new SqlCommand("SELECT COUNT(*) FROM tbl_category", con);
                    lblTotalCategories.Text = cmdCat.ExecuteScalar().ToString();

                    SqlCommand cmdProd = new SqlCommand("SELECT COUNT(*) FROM tbl_products", con);
                    lblTotalProducts.Text = cmdProd.ExecuteScalar().ToString();

                    SqlCommand cmdUsers = new SqlCommand("SELECT COUNT(*) FROM tbl_users WHERE Role='User'", con);
                    lblTotalUsers.Text = cmdUsers.ExecuteScalar().ToString();
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error loading stats: " + ex.Message + "</div>";
            }
        }

        private void fillGridCategories()
        {
            try
            {
                using (SqlConnection con = getCon())
                {
                    SqlCommand cmd = new SqlCommand("SELECT CategoryId, CategoryName, CategoryImage FROM tbl_category ORDER BY CategoryId DESC", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    gvCategories.DataSource = ds;
                    gvCategories.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error: " + ex.Message + "</div>";
            }
        }

        private void fillGridProducts()
        {
            try
            {
                using (SqlConnection con = getCon())
                {
                    SqlCommand cmd = new SqlCommand(@"
                        SELECT p.ProductId, p.ProductName, p.Price, p.Description, p.ProductImage, c.CategoryName 
                        FROM tbl_products p
                        INNER JOIN tbl_category c ON p.CategoryId = c.CategoryId
                        ORDER BY p.ProductId DESC", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    gvProducts.DataSource = ds;
                    gvProducts.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error: " + ex.Message + "</div>";
            }
        }

        private void fillCategoryDropDown()
        {
            try
            {
                using (SqlConnection con = getCon())
                {
                    SqlCommand cmd = new SqlCommand("SELECT CategoryId, CategoryName FROM tbl_category", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    ddlProductCategory.DataSource = ds;
                    ddlProductCategory.DataTextField = "CategoryName";
                    ddlProductCategory.DataValueField = "CategoryId";
                    ddlProductCategory.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error: " + ex.Message + "</div>";
            }
        }

        #region Category CRUD
        protected void btnSaveCategory_Click(object sender, EventArgs e)
        {
            string catName = txtCategoryName.Text.Trim();
            if (string.IsNullOrEmpty(catName))
            {
                lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Category name is required!</div>";
                return;
            }

            string imageName = "default-category.jpg";
            if (fuCategoryImage.HasFile)
            {
                imageName = Path.GetFileName(fuCategoryImage.FileName);
                string savePath = Server.MapPath("~/images/categories/") + imageName;
                fuCategoryImage.SaveAs(savePath);
            }
            else if (btnSaveCategory.Text == "Update Category" && !string.IsNullOrEmpty(lblCatImgName.Text))
            {
                imageName = lblCatImgName.Text;
            }

            try
            {
                using (SqlConnection con = getCon())
                {
                    if (btnSaveCategory.Text == "Save Category")
                    {
                        SqlCommand cmd = new SqlCommand("INSERT INTO tbl_category (CategoryName, CategoryImage) VALUES (@Name, @Image)", con);
                        cmd.Parameters.AddWithValue("@Name", catName);
                        cmd.Parameters.AddWithValue("@Image", imageName);
                        cmd.ExecuteNonQuery();
                        lblMsg.Text = "<div class='msg-alert msg-success'><i class='fa-solid fa-circle-check'></i> Category added successfully!</div>";
                    }
                    else
                    {
                        int catId = Convert.ToInt32(hfCategoryId.Value);
                        SqlCommand cmd = new SqlCommand("UPDATE tbl_category SET CategoryName = @Name, CategoryImage = @Image WHERE CategoryId = @Id", con);
                        cmd.Parameters.AddWithValue("@Name", catName);
                        cmd.Parameters.AddWithValue("@Image", imageName);
                        cmd.Parameters.AddWithValue("@Id", catId);
                        cmd.ExecuteNonQuery();
                        lblMsg.Text = "<div class='msg-alert msg-success'><i class='fa-solid fa-circle-check'></i> Category updated successfully!</div>";
                    }
                }

                clearCategoryFields();
                fillGridCategories();
                fillCategoryDropDown();
                fillStats();
            }
            catch (Exception ex)
            {
                lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error: " + ex.Message + "</div>";
            }
        }

        protected void btnCancelCategory_Click(object sender, EventArgs e)
        {
            clearCategoryFields();
        }

        private void clearCategoryFields()
        {
            txtCategoryName.Text = "";
            lblCatImgName.Text = "";
            hfCategoryId.Value = "";
            btnSaveCategory.Text = "Save Category";
            btnCancelCategory.Visible = false;
        }

        protected void gvCategories_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int catId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "cmd_edt_cat")
            {
                try
                {
                    using (SqlConnection con = getCon())
                    {
                        SqlCommand cmd = new SqlCommand("SELECT CategoryName, CategoryImage FROM tbl_category WHERE CategoryId = @Id", con);
                        cmd.Parameters.AddWithValue("@Id", catId);
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                txtCategoryName.Text = dr["CategoryName"].ToString();
                                lblCatImgName.Text = dr["CategoryImage"].ToString();
                                hfCategoryId.Value = catId.ToString();
                                btnSaveCategory.Text = "Update Category";
                                btnCancelCategory.Visible = true;
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error: " + ex.Message + "</div>";
                }
            }
            else if (e.CommandName == "cmd_del_cat")
            {
                try
                {
                    using (SqlConnection con = getCon())
                    {
                        SqlCommand cmd = new SqlCommand("DELETE FROM tbl_category WHERE CategoryId = @Id", con);
                        cmd.Parameters.AddWithValue("@Id", catId);
                        cmd.ExecuteNonQuery();
                    }
                    lblMsg.Text = "<div class='msg-alert msg-success'><i class='fa-solid fa-circle-check'></i> Category deleted successfully!</div>";
                    fillGridCategories();
                    fillGridProducts();
                    fillCategoryDropDown();
                    fillStats();
                }
                catch (Exception ex)
                {
                    lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error deleting category: " + ex.Message + "</div>";
                }
            }
        }
        #endregion

        #region Product CRUD
        protected void btnSaveProduct_Click(object sender, EventArgs e)
        {
            string prodName = txtProductName.Text.Trim();
            string priceStr = txtPrice.Text.Trim();
            string desc = txtDescription.Text.Trim();

            if (string.IsNullOrEmpty(prodName) || string.IsNullOrEmpty(priceStr) || ddlProductCategory.SelectedValue == null)
            {
                lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Product name, category, and price are required!</div>";
                return;
            }

            decimal price = Convert.ToDecimal(priceStr);
            int categoryId = Convert.ToInt32(ddlProductCategory.SelectedValue);

            string imageName = "default-product.jpg";
            if (fuProductImage.HasFile)
            {
                imageName = Path.GetFileName(fuProductImage.FileName);
                string savePath = Server.MapPath("~/images/products/") + imageName;
                fuProductImage.SaveAs(savePath);
            }
            else if (btnSaveProduct.Text == "Update Product" && !string.IsNullOrEmpty(lblProdImgName.Text))
            {
                imageName = lblProdImgName.Text;
            }

            try
            {
                using (SqlConnection con = getCon())
                {
                    if (btnSaveProduct.Text == "Save Product")
                    {
                        SqlCommand cmd = new SqlCommand("INSERT INTO tbl_products (ProductName, CategoryId, Price, Description, ProductImage) VALUES (@Name, @CatId, @Price, @Desc, @Image)", con);
                        cmd.Parameters.AddWithValue("@Name", prodName);
                        cmd.Parameters.AddWithValue("@CatId", categoryId);
                        cmd.Parameters.AddWithValue("@Price", price);
                        cmd.Parameters.AddWithValue("@Desc", desc);
                        cmd.Parameters.AddWithValue("@Image", imageName);
                        cmd.ExecuteNonQuery();
                        lblMsg.Text = "<div class='msg-alert msg-success'><i class='fa-solid fa-circle-check'></i> Product added successfully!</div>";
                    }
                    else
                    {
                        int prodId = Convert.ToInt32(hfProductId.Value);
                        SqlCommand cmd = new SqlCommand("UPDATE tbl_products SET ProductName = @Name, CategoryId = @CatId, Price = @Price, Description = @Desc, ProductImage = @Image WHERE ProductId = @Id", con);
                        cmd.Parameters.AddWithValue("@Name", prodName);
                        cmd.Parameters.AddWithValue("@CatId", categoryId);
                        cmd.Parameters.AddWithValue("@Price", price);
                        cmd.Parameters.AddWithValue("@Desc", desc);
                        cmd.Parameters.AddWithValue("@Image", imageName);
                        cmd.Parameters.AddWithValue("@Id", prodId);
                        cmd.ExecuteNonQuery();
                        lblMsg.Text = "<div class='msg-alert msg-success'><i class='fa-solid fa-circle-check'></i> Product updated successfully!</div>";
                    }
                }

                clearProductFields();
                fillGridProducts();
                fillStats();
            }
            catch (Exception ex)
            {
                lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error: " + ex.Message + "</div>";
            }
        }

        protected void btnCancelProduct_Click(object sender, EventArgs e)
        {
            clearProductFields();
        }

        private void clearProductFields()
        {
            txtProductName.Text = "";
            txtPrice.Text = "";
            txtDescription.Text = "";
            lblProdImgName.Text = "";
            hfProductId.Value = "";
            btnSaveProduct.Text = "Save Product";
            btnCancelProduct.Visible = false;
        }

        protected void gvProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int prodId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "cmd_edt_prod")
            {
                try
                {
                    using (SqlConnection con = getCon())
                    {
                        SqlCommand cmd = new SqlCommand("SELECT ProductName, CategoryId, Price, Description, ProductImage FROM tbl_products WHERE ProductId = @Id", con);
                        cmd.Parameters.AddWithValue("@Id", prodId);
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                txtProductName.Text = dr["ProductName"].ToString();
                                ddlProductCategory.SelectedValue = dr["CategoryId"].ToString();
                                txtPrice.Text = Convert.ToDecimal(dr["Price"]).ToString("F2");
                                txtDescription.Text = dr["Description"].ToString();
                                lblProdImgName.Text = dr["ProductImage"].ToString();
                                hfProductId.Value = prodId.ToString();
                                btnSaveProduct.Text = "Update Product";
                                btnCancelProduct.Visible = true;
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error: " + ex.Message + "</div>";
                }
            }
            else if (e.CommandName == "cmd_del_prod")
            {
                try
                {
                    using (SqlConnection con = getCon())
                    {
                        SqlCommand cmd = new SqlCommand("DELETE FROM tbl_products WHERE ProductId = @Id", con);
                        cmd.Parameters.AddWithValue("@Id", prodId);
                        cmd.ExecuteNonQuery();
                    }
                    lblMsg.Text = "<div class='msg-alert msg-success'><i class='fa-solid fa-circle-check'></i> Product deleted successfully!</div>";
                    fillGridProducts();
                    fillStats();
                }
                catch (Exception ex)
                {
                    lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error deleting product: " + ex.Message + "</div>";
                }
            }
        }
        #endregion
    }
}
