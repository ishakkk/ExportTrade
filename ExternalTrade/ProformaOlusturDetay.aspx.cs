using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade
{
    public partial class ProformaOlusturDetay : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (UserData.Authority == "SuperAdmin" && UserData.Authority == "SuperAdmın" && UserData.Authority == "Operation")
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@teklifno"].Value = Request.QueryString["teklifno"];

        }
    }
}