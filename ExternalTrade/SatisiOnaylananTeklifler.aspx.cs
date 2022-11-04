using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade
{
    public partial class SatisiOnaylananTeklifler : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
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

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@Durum"].Value = "SATISA DONDU";
            e.Command.Parameters["@temsilci"].Value = UserData.Id;
        }

        protected void btnRapor_Click(object sender, EventArgs e)
        {

            string teklifno;
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                teklifno = Convert.ToString(teklif_no[0]);
                //Fiches.UpdateOrders(teklifno, Convert.ToString(drpAmbar.SelectedItem.Value), Convert.ToString(drpFabrika.SelectedItem.Value));
                Response.Redirect("SatisiOnaylananTekliflerDetay.aspx?teklifno=" + teklifno + "");
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }

        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@Durum"].Value = "SATISA DONDU";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsToResponse("Satışı_Onaylanan_Listesi_" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString());
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1)
                {
                    ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);
                }

                string metin, teklifno, carikodu;
                var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                teklifno = Convert.ToString(teklif_no[0]);

                SqlConnection con = new SqlConnection(strcon);
                con.Open();

                metin = UserData.Name + " " + UserData.SurName + " " + teklifno + " " + "Numaralı Siparişe Cari Kodu Girdi";
                SqlCommand carikoducek = new SqlCommand("select MusteriKodu from Orders where TeklifNo='" + teklifno + "'", con);
                carikodu = Convert.ToString(carikoducek.ExecuteScalar());

                if (carikodu == null || carikodu == "")
                {

                    if (db.MusteriKoduGir(teklifno, txtMusteriKodu.Text) == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "musterikodu()", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "musterikoduhata()", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "musterikodumevcut()", true);
                }



                con.Close();
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "sec()", true);
            }
        }

        protected void btnLogo_Click(object sender, EventArgs e)
        {
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1)
                {
                    ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);
                }
                string teklifno;
                int kayitsayisi = 0;
                bool yazildimi = false;
                var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                teklifno = Convert.ToString(teklif_no[0]);
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select COUNT(YediyuzluKod) from Orders where TeklifNo='" + teklifno + "' and (YediyuzluKod is not null or YediyuzluKod='-1')", con);
                    kayitsayisi = Convert.ToInt32(cmd.ExecuteScalar());
                    if (kayitsayisi == 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "EksikMamulKodu()", true);
                    }
                    else
                    {
                        SqlCommand cmd2 = new SqlCommand("select distinct InsertLogo  from Orders  where TeklifNo='" + teklifno + "'", con);
                        yazildimi = Convert.ToBoolean(cmd2.ExecuteScalar());
                        if (yazildimi == true)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "", "Yazilmis()", true);
                        }
                        else
                        {
                            if (db.LogoUstBilgiler(teklifno, Convert.ToString(drpIsyeri.SelectedItem.Value), Convert.ToString(drpBolum.SelectedItem.Value), Convert.ToString(drpFabrika.SelectedItem.Value), Convert.ToString(drpAmbar.SelectedItem.Value)) == 1)
                            {
                                //Fiches.Orders(teklifno, Convert.ToString(drpAmbar.SelectedItem.Value), Convert.ToString(drpFabrika.SelectedItem.Value));
                                ClientScript.RegisterStartupScript(this.GetType(), "", "LogoyaYazildi()", true);
                            }
                            else
                            {

                            }
                        }
                    }
                }
            }
            catch
            {

            }
        }

        protected void btnLogoUp_Click(object sender, EventArgs e)
        {
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1)
                {
                    ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);
                }
                string teklifno;
                int kayitsayisi = 0;

                var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                teklifno = Convert.ToString(teklif_no[0]);
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select COUNT(YediyuzluKod) from Orders where TeklifNo='" + teklifno + "' and (YediyuzluKod is not null or YediyuzluKod='-1')", con);
                    kayitsayisi = Convert.ToInt32(cmd.ExecuteScalar());
                    if (kayitsayisi == 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "EksikMamulKodu()", true);
                    }
                    else
                    {



                        if (db.LogoUstBilgilerGuncelle(teklifno, Convert.ToString(drpIsyeri.SelectedItem.Value), Convert.ToString(drpBolum.SelectedItem.Value), Convert.ToString(drpFabrika.SelectedItem.Value), Convert.ToString(drpAmbar.SelectedItem.Value)) == 1)
                        {
                            //Fiches.UpdateOrders(teklifno, Convert.ToString(drpAmbar.SelectedItem.Value), Convert.ToString(drpFabrika.SelectedItem.Value));
                            ClientScript.RegisterStartupScript(this.GetType(), "", "LogodaGuncellendi()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "", "LogodaGuncellenemedi()", true);
                        }

                    }
                }
            }
            catch
            {

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string teklifno;
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");

                teklifno = Convert.ToString(teklif_no[0]);
                if (db.TeklifiRevizeyeGonder(teklifno) == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "OK()", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "NO()", true);
                }

            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }
    }
}