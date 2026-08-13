using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InteriorDecorationWebsite
{
    public partial class Home : Page
    {
        private SqlConnection getCon()
        {
            string conStr = System.Configuration.ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            try
            {
                con.Open();
            }
            catch
            {
                EnsureDatabaseExists(conStr);
                con = new SqlConnection(conStr);
                con.Open();
            }
            return con;
        }

        private void EnsureDatabaseExists(string originalConStr)
        {
            try
            {
                SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder(originalConStr);
                string dbName = string.IsNullOrEmpty(builder.InitialCatalog) ? "InteriorDecorationDB" : builder.InitialCatalog;
                builder.InitialCatalog = "master";

                using (SqlConnection masterCon = new SqlConnection(builder.ConnectionString))
                {
                    masterCon.Open();

                    SqlCommand createDbCmd = new SqlCommand(string.Format("IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = '{0}') BEGIN CREATE DATABASE [{0}]; END", dbName), masterCon);
                    createDbCmd.ExecuteNonQuery();

                    SqlCommand useDbCmd = new SqlCommand(string.Format("USE [{0}];", dbName), masterCon);
                    useDbCmd.ExecuteNonQuery();

                    string script = @"
                        IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'tbl_users')
                        BEGIN
                            CREATE TABLE tbl_users (
                                Id INT IDENTITY(1,1) PRIMARY KEY,
                                Name NVARCHAR(100) NOT NULL,
                                Email NVARCHAR(100) NOT NULL UNIQUE,
                                Password NVARCHAR(100) NOT NULL,
                                Mobile NVARCHAR(20) NOT NULL,
                                Role NVARCHAR(20) NOT NULL DEFAULT 'User'
                            );
                            INSERT INTO tbl_users (Name, Email, Password, Mobile, Role) 
                            VALUES ('Studio Administrator', 'admin@interiors.com', 'admin123', '9876543210', 'Admin'),
                                   ('Sophia Bennett', 'user@interiors.com', 'user123', '9123456789', 'User');
                        END

                        IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'tbl_category')
                        BEGIN
                            CREATE TABLE tbl_category (
                                CategoryId INT IDENTITY(1,1) PRIMARY KEY,
                                CategoryName NVARCHAR(100) NOT NULL,
                                CategoryImage NVARCHAR(255) NOT NULL DEFAULT 'default-category.jpg'
                            );
                            INSERT INTO tbl_category (CategoryName, CategoryImage) VALUES 
                            ('Living Room', 'living-room.jpg'),
                            ('Bedroom', 'bedroom.jpg'),
                            ('Modular Kitchen', 'kitchen.jpg'),
                            ('Office & Studio', 'office.jpg');
                        END

                        IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'tbl_products')
                        BEGIN
                            CREATE TABLE tbl_products (
                                ProductId INT IDENTITY(1,1) PRIMARY KEY,
                                ProductName NVARCHAR(150) NOT NULL,
                                CategoryId INT NOT NULL FOREIGN KEY REFERENCES tbl_category(CategoryId) ON DELETE CASCADE,
                                Price DECIMAL(18,2) NOT NULL,
                                Description NVARCHAR(MAX) NULL,
                                ProductImage NVARCHAR(255) NOT NULL DEFAULT 'default-product.jpg'
                            );
                            INSERT INTO tbl_products (ProductName, CategoryId, Price, Description, ProductImage) VALUES 
                            ('Royal Velvet Sofa', 1, 1299.99, 'Plush velvet 3-seater sofa with gold brass accents.', 'sofa.jpg'),
                            ('Marble Coffee Table', 1, 450.00, 'Carrara marble top coffee table with solid walnut frame.', 'coffee-table.jpg'),
                            ('Emperador Accent Chair', 1, 380.00, 'Ergonomic leather armchair with brushed bronze legs.', 'accent-chair.jpg'),
                            ('King Size Upholstered Bed', 2, 1599.00, 'Handcrafted tufted headboard king bed with storage.', 'king-bed.jpg'),
                            ('Minimalist Sliding Wardrobe', 2, 899.50, 'Custom matte finish wardrobe with integrated LED strips.', 'wardrobe.jpg'),
                            ('Nordic Nightstand', 2, 220.00, 'Oak wood bedside table with soft-close drawers.', 'nightstand.jpg'),
                            ('L-Shape Luxury Kitchen', 3, 3499.00, 'Modular kitchen with quartz countertops & soft close hardware.', 'l-kitchen.jpg'),
                            ('Granite Island Unit', 3, 1150.00, 'Freestanding kitchen island with wine rack and seating bar.', 'kitchen-island.jpg'),
                            ('Ergonomic Executive Chair', 4, 349.99, 'High-back mesh chair with lumbar support.', 'office-chair.jpg'),
                            ('Solid Oak Executive Desk', 4, 750.00, 'Spacious study desk with cable management & wireless charger.', 'office-desk.jpg'),
                            ('Sculptural Pendant Lamp', 1, 195.00, 'Modern geometric brass chandelier for living areas.', 'pendant-lamp.jpg'),
                            ('Hand-Woven Wool Rug', 1, 290.00, 'Premium plush floor rug in neutral ivory tones.', 'wool-rug.jpg');
                        END

                        IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'tbl_wishlist')
                        BEGIN
                            CREATE TABLE tbl_wishlist (
                                WishlistId INT IDENTITY(1,1) PRIMARY KEY,
                                UserId INT NOT NULL FOREIGN KEY REFERENCES tbl_users(Id) ON DELETE CASCADE,
                                ProductId INT NOT NULL FOREIGN KEY REFERENCES tbl_products(ProductId) ON DELETE CASCADE
                            );
                        END

                        IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'tbl_cart')
                        BEGIN
                            CREATE TABLE tbl_cart (
                                CartId INT IDENTITY(1,1) PRIMARY KEY,
                                UserId INT NOT NULL FOREIGN KEY REFERENCES tbl_users(Id) ON DELETE CASCADE,
                                ProductId INT NOT NULL FOREIGN KEY REFERENCES tbl_products(ProductId) ON DELETE CASCADE,
                                Quantity INT NOT NULL DEFAULT 1,
                                AddedDate DATETIME NOT NULL DEFAULT GETDATE()
                            );
                        END

                        IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'tbl_contact')
                        BEGIN
                            CREATE TABLE tbl_contact (
                                ContactId INT IDENTITY(1,1) PRIMARY KEY,
                                Name NVARCHAR(100) NOT NULL,
                                Email NVARCHAR(100) NOT NULL,
                                Subject NVARCHAR(200) NOT NULL,
                                Message NVARCHAR(MAX) NOT NULL,
                                SubmittedDate DATETIME NOT NULL DEFAULT GETDATE()
                            );
                        END";

                    SqlCommand initCmd = new SqlCommand(script, masterCon);
                    initCmd.ExecuteNonQuery();
                }
            }
            catch { }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadCategories();
                loadProducts();
            }
        }

        private void loadCategories()
        {
            try
            {
                using (SqlConnection con = getCon())
                {
                    SqlCommand cmd = new SqlCommand("SELECT CategoryId, CategoryName, CategoryImage FROM tbl_category", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    rptCategories.DataSource = ds;
                    rptCategories.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error: " + ex.Message + "</div>";
            }
        }

        private void loadProducts()
        {
            try
            {
                using (SqlConnection con = getCon())
                {
                    SqlCommand cmd = new SqlCommand(@"
                        SELECT TOP 6 p.ProductId, p.ProductName, p.Price, p.ProductImage, c.CategoryName 
                        FROM tbl_products p 
                        INNER JOIN tbl_category c ON p.CategoryId = c.CategoryId
                        ORDER BY p.ProductId DESC", con);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    rptProducts.DataSource = ds;
                    rptProducts.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMsg.Text = "<div class='msg-alert msg-danger'><i class='fa-solid fa-triangle-exclamation'></i> Error: " + ex.Message + "</div>";
            }
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
