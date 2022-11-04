using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class Teklifler : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
        protected void Page_Load(object sender, EventArgs e)
        {

            string islem = Request.QueryString["islem"];
            if (islem == "okundu")
            {
                if (UserData.Authority != "SuperAdmın")
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    db.BildirimOkundu(id);
                }

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
                Response.Redirect("TekliflerDetay.aspx?teklifno=" + teklifno + "");
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@Durum"].Value = "ONAY BEKLIYOR";

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                try
                {
                    string teklifno;

                    if (ASPxGridView1.VisibleRowCount == 1)
                    {
                        ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);

                        var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");


                        teklifno = Convert.ToString(teklif_no[0]);
                        if (db.HayaletKayitSil(teklifno, UserData.Id) == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "", "SepetSil()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "", "SepetSilHata()", true);
                        }





                    }
                    else
                    {
                        List<object> id = ASPxGridView1.GetSelectedFieldValues(new string[] { "TeklifNo" });

                        for (int i = 0; i < id.Count; i++)
                        {
                            db.HayaletKayitSil(id[i].ToString(), UserData.Id);

                        }
                        ClientScript.RegisterStartupScript(this.GetType(), "", "SepetSil()", true);
                    }

                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
                }
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsxToResponse("Teklif_Listesi_" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString());
        }

        protected void btnAciklama_Click(object sender, EventArgs e)
        {
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1)
                {
                    ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);
                }
                string teklifno = "";
                var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                teklifno = Convert.ToString(teklif_no[0]);
                string gelen = "teklif";
                string kimicin;
                string metin;
                string durum;
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand kisicek = new SqlCommand("select TemsilciKullaniciAdi from Orders where TeklifNo=@p1", con);
                kisicek.Parameters.AddWithValue("@p1", teklifno);
                kimicin = Convert.ToString(kisicek.ExecuteScalar());
                metin = teklifno + " " + "Numaralı Teklifinize Yetkili Tarafından Açıklama Eklendi";
                durum = "REVIZE ISTENILEN TEKLIF";
                if (db.AciklamaEkle(Convert.ToString(txtAciklama.Text), teklifno, metin, kimicin, gelen, durum, UserData.Id) == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlertRevize()", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlertRevize()", true);

                }
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }

        protected void btnTeklifOnay_Click(object sender, EventArgs e)
        {
            try
            {
                string metin;
                string teklifno;
                string kimicin;
                if (ASPxGridView1.VisibleRowCount == 1)
                {
                    ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);


                    var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                    teklifno = Convert.ToString(teklif_no[0]);
                    SqlConnection con = new SqlConnection(strcon);
                    con.Open();
                    SqlCommand kisicek = new SqlCommand("select TemsilciKullaniciAdi from Orders where TeklifNo=@p1", con);
                    kisicek.Parameters.AddWithValue("@p1", teklifno);
                    kimicin = Convert.ToString(kisicek.ExecuteScalar());

                    string[] cumle = new string[10];
                    double[] rakam = new double[10];
                    cumle[0] = UserData.Name + " " + UserData.SurName;
                    SqlCommand bilgicek = new SqlCommand("SELECT o.[TeklifNo],o.[Temsilci],o.[MusteriIsmi],o.[Ulke],CAST(SUM(o.[buUrununSiparisTonaji]) as DECIMAL(18,2)) as [TOPLAM TONAJ], CAST((SUM(o.[KalemSatisFiyati])-SUM(o.[KalemMaliyeti]))/SUM(o.[KalemMaliyeti]) as decimal(18,2)) as [KAR ORANI] FROM [Orders] o where o.[TeklifNo]='" + teklifno + "' and o.[SevkDurumu] IS NULL group by o.[TeklifNo],o.[Temsilci],o.[MusteriIsmi],o.[Ulke]", con);
                    SqlDataReader oku = bilgicek.ExecuteReader();
                    while (oku.Read())
                    {
                        cumle[1] = oku["Temsilci"].ToString();
                        cumle[2] = oku["MusteriIsmi"].ToString();
                        cumle[3] = oku["Ulke"].ToString();
                        rakam[0] = Convert.ToDouble(oku["TOPLAM TONAJ"]);
                        rakam[1] = Convert.ToDouble(oku["KAR ORANI"]);
                    }
                    oku.Close();
                    con.Close();
                    string onaylayan = UserData.Name + " " + UserData.SurName;
                    con.Close();
                    metin = teklifno + " " + "Numaralı Teklifiniz Onaylandı";
                    if (db.sepettentekTeklifOnay(teklifno, metin, kimicin, UserData.Id, onaylayan, rakam[1], cumle[1], cumle[3], cumle[2], rakam[0]) == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                    }



                }
                else
                {

                    List<object> id = ASPxGridView1.GetSelectedFieldValues(new string[] { "TeklifNo" });

                    for (int i = 0; i < id.Count; i++)
                    {
                        SqlConnection con = new SqlConnection(strcon);
                        con.Open();
                        SqlCommand kisicek = new SqlCommand("select TemsilciKullaniciAdi from Orders where TeklifNo=@p1", con);
                        kisicek.Parameters.AddWithValue("@p1", id[i].ToString());
                        kimicin = Convert.ToString(kisicek.ExecuteScalar());

                        string[] cumle = new string[10];
                        double[] rakam = new double[10];
                        cumle[0] = UserData.Name + " " + UserData.SurName;
                        SqlCommand bilgicek = new SqlCommand("SELECT o.[TeklifNo],o.[Temsilci],o.[MusteriIsmi],o.[Ulke],CAST(SUM(o.[buUrununSiparisTonaji]) as DECIMAL(18,2)) as [TOPLAM TONAJ], CAST((SUM(o.[KalemSatisFiyati])-SUM(o.[KalemMaliyeti]))/SUM(o.[KalemMaliyeti]) as decimal(18,2)) as [KAR ORANI] FROM [Orders] o where o.[TeklifNo]='" + id[i].ToString() + "' and o.[SevkDurumu] IS NULL group by o.[TeklifNo],o.[Temsilci],o.[MusteriIsmi],o.[Ulke]", con);
                        SqlDataReader oku = bilgicek.ExecuteReader();
                        while (oku.Read())
                        {
                            cumle[1] = oku["Temsilci"].ToString();
                            cumle[2] = oku["MusteriIsmi"].ToString();
                            cumle[3] = oku["Ulke"].ToString();
                            rakam[0] = Convert.ToDouble(oku["TOPLAM TONAJ"]);
                            rakam[1] = Convert.ToDouble(oku["KAR ORANI"]);
                        }
                        oku.Close();
                        con.Close();
                        string onaylayan = UserData.Name + " " + UserData.SurName;
                        con.Close();
                        metin = id[i].ToString() + " " + "Numaralı Teklifiniz Onaylandı";
                        db.sepettentekTeklifOnay(id[i].ToString(), metin, kimicin, UserData.Id, onaylayan, rakam[1], cumle[1], cumle[3], cumle[2], rakam[0]);

                    }
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);


                }

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
                if (e.DataColumn.FieldName == "CFR KAR ORANI")
                {
                    if (Convert.ToDouble(e.GetValue("CFR KAR ORANI").ToString()) >= 0.10)
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;
                        //e.Cell.BackColor = Color.Green;
                        //e.Cell.ForeColor = Color.Black;
                    }
                    else if (Convert.ToDouble(e.GetValue("CFR KAR ORANI").ToString()) < 0)
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;
                        //e.Cell.ForeColor = Color.White;
                    }
                    else if (Convert.ToDouble(e.GetValue("CFR KAR ORANI").ToString()) >= 0 && Convert.ToDouble(e.GetValue("CFR KAR ORANI").ToString()) < 0.10)
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

        protected void btnRevizeEt_Click(object sender, EventArgs e)
        {
            bool bolge = false, ulke = false, musteri = false, varislimani = false, vade = false, konteynerbulk = false, gonderimsekli = false, psippkon = false, urun = false, ttipi = false, tagirlik = false, bbtipi = false, bbagirlik = false, palet = false, inspection = false, komisyon = false, konteynertipi = false, kalkislimani = false, birekipmantonaji = false, buurununbuekipmandakitonaji = false, buUrununToplamTonaji = false, armatorlokali = false, navlun = false, siparisEkipmanSayisi = false;
            if (chkTum.Checked == true)
            {
                bolge = true;
                ulke = true; musteri = true; varislimani = true; vade = true; konteynerbulk = true; gonderimsekli = true; psippkon = true; urun = true; ttipi = true; tagirlik = true; bbtipi = true; bbagirlik = true; palet = true; inspection = true; komisyon = true; konteynertipi = true; kalkislimani = true; birekipmantonaji = true; buurununbuekipmandakitonaji = true; buUrununToplamTonaji = true; armatorlokali = true; navlun = true; siparisEkipmanSayisi = true;

            }
            else
            {
                if (chkBolge.Checked == true)
                {
                    bolge = true;
                }

                if (chkUlke.Checked == true)
                {
                    ulke = true;
                }
                if (chkMusteri.Checked == true)
                {
                    musteri = true;
                }
                if (chkVarisLimani.Checked == true)
                {
                    varislimani = true;
                }
                if (chkVade.Checked == true)
                {
                    vade = true;
                }
                if (chkKonteynerBulk.Checked == true)
                {
                    konteynerbulk = true;
                }
                if (chkGonderimSekli.Checked == true)
                {
                    gonderimsekli = true;
                }
                if (chkParcali.Checked == true)
                {
                    psippkon = true;
                }
                if (chkUrun.Checked == true)
                {
                    urun = true;
                }
                if (chkTorbaTipi.Checked == true)
                {
                    tagirlik = true;
                }
                if (chkBBTipi.Checked == true)
                {
                    bbtipi = true;
                }
                if (chkBBAgirligi.Checked == true)
                {
                    bbagirlik = true;
                }
                if (chkPalet.Checked == true)
                {
                    palet = true;
                }
                if (chkInspection.Checked == true)
                {
                    inspection = true;
                }
                if (chkKomisyon.Checked == true)
                {
                    komisyon = true;
                }
                if (chkKonteynerTİpi.Checked == true)
                {
                    konteynertipi = true;
                }
                if (chkKalkisLimani.Checked == true)
                {
                    kalkislimani = true;
                }
                if (chkBirEkipmanTonaji.Checked == true)
                {
                    birekipmantonaji = true;
                }
                if (chkbuurununBuEkipmandakiTonaji.Checked == true)
                {
                    buurununbuekipmandakitonaji = true;
                }
                if (chkbuUrununToplamTonaji.Checked == true)
                {
                    buUrununToplamTonaji = true;
                }
                if (chkSiparisEkipmanSayisi.Checked == true)
                {
                    siparisEkipmanSayisi = true;
                }
                if (chkArmatorLokali.Checked == true)
                {
                    armatorlokali = true;
                }
                if (chkNavlun.Checked == true)
                {
                    navlun = true;
                }

            }
            string teklifno;
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }

                var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                teklifno = Convert.ToString(teklif_no[0]);
                if (db.RevizeyeGonder(teklifno, bolge, ulke, musteri, varislimani, vade, konteynerbulk, gonderimsekli, psippkon, urun, ttipi, tagirlik, bbtipi, bbagirlik, palet, inspection, komisyon, konteynertipi, kalkislimani, birekipmantonaji, buurununbuekipmandakitonaji, buUrununToplamTonaji, armatorlokali, navlun, siparisEkipmanSayisi) == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlertRevize()", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlertRevize()", true);
                }
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "sec()", true);
            }

        }
    }
}