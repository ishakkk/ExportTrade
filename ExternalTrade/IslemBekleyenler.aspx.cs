using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade
{
    public partial class IslemBekleyenler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        DBIslemler db = new DBIslemler();

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (db.InsertEditableUser(Convert.ToDateTime(txtTar1.Text), Convert.ToDateTime(txtTar2.Text), UserData.Id) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
            }
        }

        protected void btnRapor_Click(object sender, EventArgs e)
        {
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                string TeklifNo;
                var Teklif_No = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                TeklifNo = Convert.ToString(Teklif_No[0]);
                if (db.Gonder(TeklifNo) == 1)
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (db.HepsiniGonder2(UserData.Id) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
            }
        }

        protected void SqlDataSource1_Selecting1(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@temsilci"].Value = UserData.Id;
        }
    }
}