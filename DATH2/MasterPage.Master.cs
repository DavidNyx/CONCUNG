using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ConCung
{
    
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (DataContainer.login == true)
            {
                litStatus.Text = DataContainer.userName;
                LnkLogIn.Visible = false;
                lnkRegister.Visible = false;

                litStatus.Visible = true;
                btnLogOut.Visible = true;
            }
            else
            {
                LnkLogIn.Visible = true;
                lnkRegister.Visible = true;

                litStatus.Visible = false;
                btnLogOut.Visible = false;
            }
        }

        protected void lnkLogOut_Click(object sender, EventArgs e)
        {
            DataContainer.login = false;
            Response.Redirect("~/Index.aspx");
        }
    }
    public static class DataContainer
    {
        public static bool login = false;
        public static string userPhoneNum = "";
        public static string userName = "";
    }
}