using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class TekliflerDetay : System.Web.UI.Page
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
        protected void btnTekOnay_Click(object sender, EventArgs e)
        {
            try
            {
                string metin;
                string teklifno;
                string kimicin;
                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                int id;
                var kayi_Id = ASPxGridView1.GetSelectedFieldValues("Id");
                id = Convert.ToInt32(kayi_Id[0]);
                SqlConnection con = new SqlConnection(strcon);
                con.Open();
                SqlCommand cmd = new SqlCommand("select TeklifNo from Orders where Id=@p1", con);
                cmd.Parameters.AddWithValue("@p1", id);
                teklifno = Convert.ToString(cmd.ExecuteScalar());
                SqlCommand kisicek = new SqlCommand("select TemsilciKullaniciAdi from Orders where Id=@p1", con);
                kisicek.Parameters.AddWithValue("@p1", id);
                kimicin = Convert.ToString(kisicek.ExecuteScalar());
                con.Close();
                metin = teklifno + " " + "Numaralı Teklifiniz Onaylandı";
                if (db.tekTeklifOnay(id, metin, kimicin, UserData.Id) == 1)
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

        protected void btnRapor_Click(object sender, EventArgs e)
        {
            ASPxGridView1.Columns["SigortaTON"].Visible = false;
            ASPxGridView1.Columns["TTarih"].Caption = "TEKLİF" + "\n" + "TARİHİ";
            ASPxGridView1.Columns["KalkisLimani"].Caption = "KALKIŞ" + "\n" + "LİMANI";
            ASPxGridView1.Columns["VarisLimani"].Caption = "VARIŞ" + "\n" + "LİMANI";
            ASPxGridView1.Columns["EkipmanTuru"].Caption = "EKİPMAN" + "\n" + "TÜRÜ";
            ASPxGridView1.Columns["siparisTipi"].Caption = "PARÇALI SİPARİŞ" + "\n" + "PARÇALI KONTEYNER";
            ASPxGridView1.Columns["KonteynerBulkSecimi"].Caption = "SEVK" + "\n" + "TİPİ";
            ASPxGridView1.Columns["birKonteynerTonaji"].Caption = "BİR KONTEYNER" + "\n" + "TONAJI";
            ASPxGridView1.Columns["BuKaleminBuKonteynerdekiTonaji"].Caption = "BU KALEMİN" + "\n" + "BU EKİPMANDAKİ" + "\n" + "TONAJI";
            ASPxGridView1.Columns["TorbaTipi"].Caption = "TORBA" + "\n" + "TİPİ";
            ASPxGridView1.Columns["TorbaAgirligi"].Caption = "TORBA" + "\n" + "AĞIRLIĞI";
            ASPxGridView1.Columns["BBTipi"].Caption = "BİGBAG" + "\n" + "TİPİ";
            ASPxGridView1.Columns["BBAgirligi"].Caption = "BİGBAG" + "\n" + "AĞIRLIĞI";
            ASPxGridView1.Columns["buUrununSiparisTonaji"].Caption = "BU ÜRÜNÜN" + "\n" + "SİPARİŞ TONAJI";

            ASPxGridView1.Columns["UrununKonteynerSayisi"].Caption = "ÜRÜNÜN" + "\n" + "KONTEYNER" + "\n" + "SAYISI";
            ASPxGridView1.Columns["SiparistekiKonteynerSayisi"].Caption = "SİPARİŞTEKİ" + "\n" + "KONTEYNER" + "\n" + "SAYISI";
            ASPxGridView1.Columns["UrunFiyat"].Caption = "ÜRÜN" + "\n" + "SADE" + "\n" + "FİYATI";
            ASPxGridView1.Columns["AraNakliyeTON"].Caption = "ARA" + "\n" + "NAKLİYE";
            ASPxGridView1.Columns["ArmatorLokali"].Caption = "ARMATÖR" + "\n" + "LOKALİ";
            ASPxGridView1.Columns["LimanIcDolumBedeliTON"].Caption = "LİMAN" + "\n" + "DOLUM" + "\n" + "BEDELİ";
            ASPxGridView1.Columns["FobMaliyet"].Caption = "FOB" + "\n" + "MALİYETİ";
            ASPxGridView1.Columns["FobSatisFiyati"].Caption = "FOB" + "\n" + "SATIŞ" + "\n" + "FİYATI";
            ASPxGridView1.Columns["TeklifTipi"].Caption = "GÖNDERİM" + "\n" + "ŞEKLİ";
            ASPxGridView1.Columns["GÖNDERİM ŞEKLİ"].Caption = "GÖNDERİM" + "\n" + "ŞEKLİ";
            ASPxGridView1.Columns["KalemMaliyeti"].Caption = "TESLİM ŞEKLİ" + "\n" + "MALİYET";
            ASPxGridView1.Columns["KalemSatisFiyati"].Caption = "TESLİM ŞEKLİ" + "\n" + "SATIŞ FİYATI";
            ASPxGridView1.Columns["TOPLAM SATIŞ"].Caption = "TOPLAM" + "\n" + "SATIŞ";
            ASPxGridView1.Columns["TOPLAM MALİYET"].Caption = "TOPLAM" + "\n" + "MALİYET";
            //ASPxGridView1.Columns["ÜRÜN SADE MALİYETİ"].Caption = "ÜRÜN" + "\n" + "SADE" + "\n" + "MALİYETİ";
            ASPxGridView1.Columns["KAR ORANI"].Caption = "KAR" + "\n" + "ORANI";
            ASPxGridView1.Columns["FARK"].Caption = "FARK";

            ASPxGridViewExporter1.WriteXlsxToResponse("Teklif_Listesi_" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString());
            ASPxGridView1.Columns["SigortaTON"].Visible = true;
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

            e.Command.Parameters["@Durum"].Value = "ONAY BEKLIYOR";
            e.Command.Parameters["@teklifno"].Value = Request.QueryString["teklifno"];
        }
        //protected void btnAciklama_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        if (ASPxGridView1.VisibleRowCount == 1)
        //        {
        //            ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);
        //        }
        //        int id;
        //        var kakyit_id = ASPxGridView1.GetSelectedFieldValues("Id");
        //        id = Convert.ToInt32(kakyit_id[0]);

        //        string gelen = "siparis";
        //        string kimicin;
        //        string teklifno;
        //        string metin;
        //        string durum;
        //        SqlConnection con = new SqlConnection(strcon);
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand("select TeklifNo from Orders where Id=@p1", con);
        //        cmd.Parameters.AddWithValue("@p1", id);
        //        teklifno = Convert.ToString(cmd.ExecuteScalar());
        //        SqlCommand kisicek = new SqlCommand("select TemsilciKullaniciAdi from Orders where Id=@p1", con);
        //        kisicek.Parameters.AddWithValue("@p1", id);
        //        kimicin = Convert.ToString(kisicek.ExecuteScalar());
        //        metin = teklifno + " " + "Numaralı Teklifinize Yetkili Tarafından Açıklama Eklendi";
        //        durum = "REVIZE ISTENILEN TEKLIF";
        //        if (db.AciklamaEkle(Convert.ToString(txtAciklama.Text), id, metin, kimicin, gelen, durum) == 1)
        //        {
        //            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlertRevize()", true);
        //        }
        //        else
        //        {
        //            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlertRevize()", true);

        //        }

        //    }
        //    catch
        //    {
        //        ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
        //    }










        //}

        //protected void btnSil_Click(object sender, EventArgs e)
        //{

        //    try
        //    {
        //        if (ASPxGridView1.VisibleRowCount == 1)
        //        {
        //            ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);
        //        }
        //        int id;
        //        var kakyit_id = ASPxGridView1.GetSelectedFieldValues("Id");

        //        id = Convert.ToInt32(kakyit_id[0]);
        //        string kimicin = "";
        //        string metin = "";
        //        SqlConnection con = new SqlConnection(strcon);
        //        con.Open();
        //        SqlCommand cek = new SqlCommand("select TemsilciKullaniciAdi from Orders where Id=@p1", con);
        //        cek.Parameters.AddWithValue("@p1", id);
        //        kimicin = Convert.ToString(cek.ExecuteScalar());
        //        metin = Request.QueryString["teklifno"] + " " + "Numaralı Teklifiniz Yetkili Tarafından Reddedildi";
        //        if (db.DeleteTeklif(id, kimicin, metin) == 1)
        //        {
        //            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "TeklifSil()", true);
        //        }
        //    }
        //    catch
        //    {
        //        ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
        //    }

        //}
    }
}