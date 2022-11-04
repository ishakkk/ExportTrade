using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class OdemeTipiEkle : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {
            if (db.OdemeSekliEkle(txtOdemeTipi.Text) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "successAlert()", true);

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "errorAlert()", true);

            }
        }
    }
}