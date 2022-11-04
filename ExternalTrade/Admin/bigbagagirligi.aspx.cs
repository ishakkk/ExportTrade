using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class bigbagagirligi : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (UserData.Authority != "SuperAdmın" && UserData.Authority != "Admin2")
                Response.Redirect("Admin.aspx");
        }

        protected void btnguncelle_Click(object sender, EventArgs e)
        {
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                int bbagirlikId;
                var bbagirlik_Id = ASPxGridView1.GetSelectedFieldValues("Id");

                bbagirlikId = Convert.ToInt32(bbagirlik_Id[0]);
                Response.Redirect("bbagirligiguncelle.aspx?Id=" + bbagirlikId.ToString() + "");

            }
            catch { ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true); }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsToResponse("BigBag_Ağırlığı_Listesi_" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString());
        }
    }
}