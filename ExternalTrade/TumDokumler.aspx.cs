using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade
{
    public partial class TumDokumler : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
        protected void Page_Load(object sender, EventArgs e)
        {
            //if(UserData.Authority!="SuperAdmın" && UserData.Authority!="Operation")
            //{
            //    Response.Redirect("Home.aspx");
            //}
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            string teklifno;

            try
            {
                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                teklifno = Convert.ToString(teklif_no[0]);
                Response.Redirect("Operasyon.aspx?teklifno=" + teklifno + "");
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            try
            {
                if (e.DataColumn.FieldName == "SigortaDokumu")
                {
                    if (Convert.ToBoolean(e.GetValue("SigortaDokumu").ToString()) == true)
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;

                    }
                    else if (Convert.ToBoolean(e.GetValue("SigortaDokumu").ToString()) == false)
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;

                    }

                }


                if (e.DataColumn.FieldName == "UlkeSertifikasi")
                {
                    if (Convert.ToBoolean(e.GetValue("UlkeSertifikasi").ToString()) == true)
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;

                    }
                    else if (Convert.ToBoolean(e.GetValue("UlkeSertifikasi").ToString()) == false)
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;

                    }

                }

                if (e.DataColumn.FieldName == "DolasimBelgesi")
                {
                    if (Convert.ToBoolean(e.GetValue("DolasimBelgesi").ToString()) == true)
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;

                    }
                    else if (Convert.ToBoolean(e.GetValue("DolasimBelgesi").ToString()) == false)
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;

                    }

                }
                if (e.DataColumn.FieldName == "UlkeSertifikasi")
                {
                    if (Convert.ToBoolean(e.GetValue("UlkeSertifikasi").ToString()) == true)
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;

                    }
                    else if (Convert.ToBoolean(e.GetValue("UlkeSertifikasi").ToString()) == false)
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;

                    }

                }
                if (e.DataColumn.FieldName == "Proforma")
                {
                    if (Convert.ToBoolean(e.GetValue("Proforma").ToString()) == true)
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;

                    }
                    else if (Convert.ToBoolean(e.GetValue("Proforma").ToString()) == false)
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;

                    }

                }
                if (e.DataColumn.FieldName == "CommercialInvoice")
                {
                    if (Convert.ToBoolean(e.GetValue("CommercialInvoice").ToString()) == true)
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;

                    }
                    else if (Convert.ToBoolean(e.GetValue("CommercialInvoice").ToString()) == false)
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;

                    }

                }
                if (e.DataColumn.FieldName == "PackingList")
                {
                    if (Convert.ToBoolean(e.GetValue("PackingList").ToString()) == true)
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;

                    }
                    else if (Convert.ToBoolean(e.GetValue("PackingList").ToString()) == false)
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;

                    }

                }
                if (e.DataColumn.FieldName == "Konsimento")
                {
                    if (Convert.ToBoolean(e.GetValue("Konsimento").ToString()) == true)
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;

                    }
                    else if (Convert.ToBoolean(e.GetValue("Konsimento").ToString()) == false)
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;

                    }

                }
            }
            catch
            {

            }
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            string teklifno, belgeyolu = "", adsoyad;
            adsoyad = UserData.Name + " " + UserData.SurName;
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                teklifno = Convert.ToString(teklif_no[0]);

                if (fl.HasFile)
                {
                    if (!Directory.Exists(Server.MapPath("~/OperationDocuments/" + teklifno + "")))
                    {
                        Directory.CreateDirectory(Server.MapPath("~/OperationDocuments/" + teklifno + ""));
                        belgeyolu = fl.FileName;
                        fl.SaveAs(Server.MapPath("~/OperationDocuments/" + teklifno + "/" + belgeyolu));

                        if (db.DokumanYukle(teklifno, belgeyolu, adsoyad) == 1)
                        {

                        }

                    }

                    else
                    {
                        belgeyolu = fl.FileName;
                        fl.SaveAs(Server.MapPath("~/OperationDocuments/" + teklifno + "/" + belgeyolu));

                        if (db.DokumanYukle(teklifno, belgeyolu, adsoyad) == 1)
                        {

                        }
                    }

                }


                ClientScript.RegisterStartupScript(this.GetType(), "", "belgeler()", true);
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "hata()", true);
            }


        }

        protected void btnFaturaNo_Click(object sender, EventArgs e)
        {

            try
            {
                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                string teklifno;
                var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");

                teklifno = Convert.ToString(teklif_no[0]);
                if (db.EditSalesDocument2(teklifno, txtFaturaNo.Text, Convert.ToDateTime(txtFaturaTarihi.Text), 1) == 1)
                {
                    Response.Redirect("CommercialInvoiceOperation.aspx?TeklifNo=" + teklifno + "");
                }


            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            string teklifno;
            if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
            var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
            teklifno = Convert.ToString(teklif_no[0]);
            if (drp.SelectedItem.Value == "1")
                Response.Redirect("Proforma_Operation.aspx?teklifno=" + teklifno + "");
            else if (drp.SelectedItem.Value == "2")
                Response.Redirect("CommercialInvoiceOperation.aspx?teklifno=" + teklifno + "");
            else if (drp.SelectedItem.Value == "3")
                Response.Redirect("PckingListOperation.aspx?teklifno=" + teklifno + "");
            else if (drp.SelectedItem.Value == "4")
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select ISNULL(SPECODE,0) as KOD from AllOperationDocuments where TeklifNo='" + teklifno + "'", con);
                    if (Convert.ToString(cmd.ExecuteScalar()) == "0")
                    {
                        Response.Redirect("KonsimentoOperation.aspx?teklifno=" + teklifno + "");
                    }
                    else
                    {
                        Response.Redirect("KonsimentoOperation_2.aspx?teklifno=" + teklifno + "&kod=" + Convert.ToString(cmd.ExecuteScalar() + ""));
                    }
                    con.Close();
                }
            }

        }
    }
}