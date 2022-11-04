using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class SaticiRaporlama : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@Temsilci"].Value = Request.QueryString["id"];

        }

        protected void btnCek_Click(object sender, EventArgs e)
        {
            if (db.SaticiRaporlama(Convert.ToDateTime(txttar1.Text), Convert.ToDateTime(txttar2.Text)) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
            }
            Session["saticibaslangic"] = txttar1.Text;
            Session["saticibitis"] = txttar2.Text;
        }
    }
}