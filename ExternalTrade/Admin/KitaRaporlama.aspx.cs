using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class KitaRaporlama : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCek_Click(object sender, EventArgs e)
        {
            if (db.KitaRaporlama(Convert.ToDateTime(txttar1.Text), Convert.ToDateTime(txttar2.Text), Request.QueryString["kita"]) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
            }
            Session["kitabaslangic"] = txttar1.Text;
            Session["kitabitis"] = txttar2.Text;
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@Kıta"].Value = Request.QueryString["kita"];
        }

       
    }
}