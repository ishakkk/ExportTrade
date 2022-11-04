using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class TorbaTipi : System.Web.UI.Page
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
                if (ASPxGridView1.VisibleRowCount == 1)
                {
                    ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);
                }
                int torbatipiid;
                var torbatipi_id = ASPxGridView1.GetSelectedFieldValues("Id");
                torbatipiid = Convert.ToInt32(torbatipi_id[0]);
                Response.Redirect("torbatipiguncelle.aspx?Id=" + Convert.ToString(torbatipi_id[0]) + "");
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }

        }

        protected void export_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsToResponse("TorbaTipi_Listesi_" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString());
        }
    }
}