using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace InteriorDecorationWebsite
{
    public partial class About : Page
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
            // About page is static, but maintains the SqlConnection helper pattern
        }
    }
}
