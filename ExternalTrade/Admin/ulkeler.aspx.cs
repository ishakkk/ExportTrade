using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class ulkeler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (UserData.Authority != "SuperAdmın" && UserData.Authority != "Admin2")
                Response.Redirect("Admin.aspx");
        }

        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                int ulkeId;
                int bolgeId;
                var ulke_Id = ASPxGridView1.GetSelectedFieldValues("Id");
                var bolge_Id = ASPxGridView1.GetSelectedFieldValues("UstId");
                ulkeId = Convert.ToInt32(ulke_Id[0]);
                bolgeId = Convert.ToInt32(bolge_Id[0]);
                Response.Redirect("ulkeguncelle.aspx?Id=" + ulkeId.ToString() + "&UstId=" + bolgeId + "");

            }
            catch
            {

                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }

        protected void export_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsToResponse("Ülke_Listesi_" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString());
        }
    }
}