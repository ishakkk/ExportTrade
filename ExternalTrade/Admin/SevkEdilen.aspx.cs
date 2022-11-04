using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class SevkEdilen : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
        protected void Page_Load(object sender, EventArgs e)
        {

            DBIslemler db = new DBIslemler();
            db.KILIT();
            if (UserData.Authority != "SuperAdmın" && UserData.Authority != "SuperAdmin")
            {
                ASPxGridView1.Columns["SATIŞ ONAYI VEREN"].Visible = false;
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
                if (teklifno == null)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "warningAlert()", true);
                }
                else
                {
                    Response.Redirect("SevkEdilenDetay.aspx?teklifno=" + teklifno + "");
                }
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            ASPxGridViewExporter1.WriteXlsxToResponse("Sevk_Listesi_" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString());
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
                if (e.DataColumn.FieldName == "TeklifNo")
                {
                    if (e.GetValue("TeklifTipi").ToString() == "CFR" || e.GetValue("TeklifTipi").ToString() == "CIF" || e.GetValue("TeklifTipi").ToString() == "DAP")
                    {
                        if (Convert.ToInt32(e.GetValue("TarihFarki")) >= 30)
                        {
                            e.Cell.BackColor = Color.LightSkyBlue;
                        }
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