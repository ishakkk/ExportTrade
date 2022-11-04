using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ExternalTrade.Classes;
using System.Web.Security;
namespace ExternalTrade
{
    public partial class Giris : System.Web.UI.Page
    {
        SystemLogin login = new SystemLogin();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (login.UserControl(UserName.Text,Password.Text) == true)
            {
               
                //HttpContext.Current.Request.Cookies.Clear();
                FormsAuthentication.RedirectFromLoginPage(UserName.Text,true);
            }
            else
            {
                //e.Authenticated = false;
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "dangerAlert()", true);
            }
        }
    }
}