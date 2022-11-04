using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade
{
    public partial class SevkEdilenDetay : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        protected void Page_Load(object sender, EventArgs e)
        {
            string islem = Request.QueryString["islem"];
            if (islem == "okundu")
            {
                if (UserData.Authority != "SuperAdmın")
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    db.KullaniciBildirimOkundu(id);
                }

            }
        }

        protected void btnRapor_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsToResponse("Sevk_Listesi_" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString());
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@temsilci"].Value = UserData.Id;
            e.Command.Parameters["@teklifno"].Value = Request.QueryString["teklifno"];
        }
    }
}