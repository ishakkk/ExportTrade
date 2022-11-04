using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade
{
    public partial class OperationKonsimento : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        DbConnection con = new DbConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (UserData.Authority != "SuperAdmın" && UserData.Authority != "Operation")
            //    Response.Redirect("Home.aspx");
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            string teklifno;
            try
            {
                if (Convert.ToInt32(drpSecim.SelectedItem.Value) == 1)
                {
                    if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                    var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                    teklifno = Convert.ToString(teklif_no[0]);
                    if (db.UpdateFreeTime(teklifno, Convert.ToString(txtFreeTime.Text), true) == 1)
                    {
                        Response.Redirect("KonsimentoOperation.aspx?teklifno=" + teklifno + "");
                    }
                }

                else
                {
                    if (Convert.ToInt32(drpSecim.SelectedItem.Value) == 2)
                    {

                        SqlCommand kodolustur = new SqlCommand("select NEWID()", con.baglanti());
                        string kod = Convert.ToString(kodolustur.ExecuteScalar());
                        List<object> id = ASPxGridView1.GetSelectedFieldValues(new string[] { "TeklifNo" });

                        for (int i = 0; i < id.Count; i++)
                        {

                            db.SiparisBirlestir(id[i].ToString(), kod, Convert.ToString(txtFreeTime.Text), UserData.Id);
                        }

                        Response.Redirect("KonsimentoOperation_2.aspx?kod=" + kod + "");
                    }
                }
            }






            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }

        protected void btnRapor_Click(object sender, EventArgs e)
        {
            string teklifno;
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                teklifno = Convert.ToString(teklif_no[0]);

                Response.Redirect("OperationKonsimentoDetay.aspx?teklifno=" + teklifno + "");


            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }
    }
}