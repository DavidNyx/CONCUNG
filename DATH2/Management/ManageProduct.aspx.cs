using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConCung.Management
{
    public partial class ManageProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if ((ddlSale.Items.FindByText("Không") == null))
            {
                ddlSale.Items.Insert(0, new ListItem("Không", "NULL"));
                ddlSale.SelectedValue = "NULL";
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            
        }
    }
}