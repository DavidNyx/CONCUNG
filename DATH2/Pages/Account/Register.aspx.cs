using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConCung.Pages.Account
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string connString = System.Configuration.ConfigurationManager.ConnectionStrings["CONCUNGConnectionString"].ConnectionString;
            SqlConnection sqlCon = new SqlConnection(connString);
            sqlCon.Open();

            

            
            sqlCon.Close();

        }
    }
}