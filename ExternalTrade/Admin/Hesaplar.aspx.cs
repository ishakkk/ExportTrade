using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class Hesaplar : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (UserData.Authority != "Admin2" && UserData.Authority != "SuperAdmın" && UserData.Authority != "Admin")
            {
                Response.Redirect("Admin.aspx");
            }
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            if (db.InsertEditable(Convert.ToDateTime(txtTar1.Text), Convert.ToDateTime(txtTar2.Text)) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
            }
        }

        protected void btnGuncelle_Click(object sender, EventArgs e)
        {
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                string teklifno;

                var kayit_Id = ASPxGridView1.GetSelectedFieldValues("TeklifNo");

                teklifno = Convert.ToString(kayit_Id[0]);
                if (db.Gonder(teklifno) == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                }

            }
            catch
            {

                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }

        protected void ASPxGridView1_BatchUpdate(object sender, DevExpress.Web.Data.ASPxDataBatchUpdateEventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void btnHepsi_Click(object sender, EventArgs e)
        {
            if (db.HepsiniGonder() == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
            }
        }
    }
}