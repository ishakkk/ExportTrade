using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class Reddedilen : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (UserData.Authority != "SuperAdmın")
            {
                Response.Redirect("Admin.aspx");
            }
        }

        protected void btnRapor_Click(object sender, EventArgs e)
        {
            try
            {
                string teklifno;

                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");


                teklifno = Convert.ToString(teklif_no[0]);
                Response.Redirect("ReddedilenDetay.aspx?teklifno=" + teklifno + "");
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@Durum"].Value = "ONAY IPTALI";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsxToResponse("Reddedilen_Teklif_Listesi_" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString());
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            try
            {
                if (e.DataColumn.FieldName == "KAR ORANI")
                {
                    if (Convert.ToDouble(e.GetValue("KAR ORANI").ToString()) >= 0.10)
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;
                        //e.Cell.BackColor = Color.Green;
                        //e.Cell.ForeColor = Color.Black;
                    }
                    else if (Convert.ToDouble(e.GetValue("KAR ORANI").ToString()) < 0)
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;
                        //e.Cell.ForeColor = Color.White;
                    }
                    else if (Convert.ToDouble(e.GetValue("KAR ORANI").ToString()) >= 0 && Convert.ToDouble(e.GetValue("KAR ORANI").ToString()) < 0.10)
                    {
                        e.Cell.BackColor = Color.Orange;
                        e.Cell.ForeColor = Color.Black;
                    }
                }
            }
            catch
            {

            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            string teklifno;
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1)
                {
                    ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);


                    var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                    teklifno = Convert.ToString(teklif_no[0]);
                    if (db.KayirGonder(teklifno, drp.SelectedItem.Text) == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "success()", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "error()", true);
                    }
                }
                else
                {
                    List<object> id = ASPxGridView1.GetSelectedFieldValues(new string[] { "TeklifNo" });
                    for (int i = 0; i < id.Count; i++)
                    {
                        db.KayirGonder(id[i].ToString(), drp.SelectedItem.Text);
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "success()", true);
                    }
                }
            }
            catch
            {
            }

        }
    }
}