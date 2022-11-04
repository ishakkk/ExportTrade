using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class GonderimRapor : System.Web.UI.Page
    {

        DBIslemler db = new DBIslemler();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCek_Click(object sender, EventArgs e)
        {
            if (db.GonderimSekliRapor(Request.QueryString["x"], Convert.ToDateTime(txttar1.Text), Convert.ToDateTime(txttar2.Text)) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
            }
            Session["gonderimbaslangic"] = txttar1.Text;
            Session["gonderimbitis"] = txttar2.Text;
        }



        protected void btn_Click(object sender, EventArgs e)
        {
            //ASPxGridViewExporter1.WriteXlsToResponse("Gönderim_Çeşit_Raporlama_" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString());
        }
    }
}