using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class RevizeDetay : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@Durum"].Value = "REVIZE ISTENILEN TEKLIF";

            e.Command.Parameters["@teklifno"].Value = Request.QueryString["teklifno"];
        }



        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                int id;
                var kayit_Id = ASPxGridView1.GetSelectedFieldValues("Id");
                id = Convert.ToInt32(kayit_Id[0]);

                Response.Redirect("RevizeGir.aspx?teklifno=" + Request.QueryString["teklifno"] + "&id=" + id + "");
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }




        }

        protected void btnModalPopupGoster_Click(object sender, EventArgs e)
        {
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1)
                {
                    ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);
                }
                int id;
                var kayit_id = ASPxGridView1.GetSelectedFieldValues("Id");
                id = Convert.ToInt32(kayit_id[0]);


                pnlKayitEkle.Visible =
                pnlHider.Visible = true;

                double kalemsatisfiyati, fobsatisfiyati;

                SqlConnection con = new SqlConnection(strcon);
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select *from Orders where Id=@p1", con);
                    cmd.Parameters.AddWithValue("@p1", id);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {

                        if (dr["KalemSatisFiyati"].ToString() == null || dr["KalemSatisFiyati"].ToString() == "")
                        {
                            kalemsatisfiyati = 0;
                        }
                        else
                        {
                            kalemsatisfiyati = Convert.ToDouble(dr["KalemSatisFiyati"]);
                        }
                        if (dr["FobSatisFiyati"].ToString() == null || dr["FobSatisFiyati"].ToString() == "")
                        {
                            fobsatisfiyati = 0;
                        }
                        else
                        {
                            fobsatisfiyati = Convert.ToDouble(dr["FobSatisFiyati"]);
                        }
                        lbleskisatis.Text = Convert.ToString(kalemsatisfiyati);
                        lbleskifob.Text = Convert.ToString(fobsatisfiyati);
                    }
                    dr.Close();

                    con.Close();
                }
                catch
                {

                }
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }

        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1)
                {
                    ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);
                }
                int id;
                var kayit_id = ASPxGridView1.GetSelectedFieldValues("Id");
                id = Convert.ToInt32(kayit_id[0]);
                double aranakliyeTON, limandolumbedeliTON, navlunTON, armatorlokali, depolamaTON, gumruklemeTON, inspection, fobmaliyet, kalemsatisfiyati, fobkarorani, teslimseklikarorani, kalemmaliyet, sigortaton, fobsatisfiyati, komisyon, urunfiyat, ambalaj;
                string tekliftipi;
                SqlConnection con = new SqlConnection(strcon);
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select *from Orders where Id=@p1", con);
                    cmd.Parameters.AddWithValue("@p1", id);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        if (dr["Komisyon"].ToString() == null || dr["Komisyon"].ToString() == "")
                        {
                            komisyon = 0;
                        }
                        else
                        {
                            komisyon = Convert.ToDouble(dr["Komisyon"]);
                        }
                        if (dr["FobMaliyet"].ToString() == null || dr["FobMaliyet"].ToString() == "")
                        {
                            fobmaliyet = 0;
                        }
                        else
                        {
                            fobmaliyet = Convert.ToDouble(dr["FobMaliyet"]);
                        }
                        if (dr["KalemSatisFiyati"].ToString() == null || dr["KalemSatisFiyati"].ToString() == "")
                        {
                            kalemsatisfiyati = 0;
                        }
                        else
                        {
                            kalemsatisfiyati = Convert.ToDouble(dr["KalemSatisFiyati"]);
                        }
                        //if (dr["fobKarOrani"].ToString() == null || dr["fobKarOrani"].ToString() == "")
                        //{
                        //    fobkarorani = 0;
                        //}
                        //else
                        //{
                        //    fobkarorani = Convert.ToDouble(dr["fobKarOrani"]);
                        //}
                        //if (dr["teslimsekliKarOrani"].ToString() == null || dr["teslimsekliKarOrani"].ToString() == "")
                        //{
                        //    teslimseklikarorani = 0;
                        //}
                        //else
                        //{
                        //    teslimseklikarorani = Convert.ToDouble(dr["teslimsekliKarOrani"]);
                        //}
                        if (dr["KalemMaliyeti"].ToString() == null || dr["KalemMaliyeti"].ToString() == "")
                        {
                            kalemmaliyet = 0;
                        }
                        else
                        {
                            kalemmaliyet = Convert.ToDouble(dr["KalemMaliyeti"]);
                        }

                        if (dr["SigortaTON"].ToString() == null || dr["SigortaTON"].ToString() == "")
                        {
                            sigortaton = 0;
                        }
                        else
                        {
                            sigortaton = Convert.ToDouble(dr["SigortaTON"]);
                        }
                        //if (dr["FobSatisFiyati"].ToString() == null || dr["FobSatisFiyati"].ToString() == "")
                        //{
                        //    fobsatisfiyati = 0;
                        //}
                        //else
                        //{
                        //    fobsatisfiyati = Convert.ToDouble(dr["FobSatisFiyati"]);
                        //}
                        if (dr["TeklifTipi"].ToString() == null || dr["TeklifTipi"].ToString() == "")
                        {
                            tekliftipi = "YOK";
                        }
                        else
                        {
                            tekliftipi = Convert.ToString(dr["TeklifTipi"]);
                        }
                        if (dr["UrunFiyat"].ToString() == null || dr["UrunFiyat"].ToString() == "")
                        {
                            urunfiyat = 0;
                        }
                        else
                        {
                            urunfiyat = Convert.ToDouble(dr["UrunFiyat"]);
                        }
                        if (dr["Ambalaj"].ToString() == null || dr["Ambalaj"].ToString() == "")
                        {
                            ambalaj = 0;
                        }
                        else
                        {
                            ambalaj = Convert.ToDouble(dr["Ambalaj"].ToString());
                        }
                        if (dr["GumruklemeTON"].ToString() == null || dr["GumruklemeTON"].ToString() == "")
                        {
                            gumruklemeTON = 0;
                        }
                        else
                        {
                            gumruklemeTON = Convert.ToDouble(dr["GumruklemeTON"]);
                        }
                        if (dr["Inspection"].ToString() == "" || dr["Inspection"].ToString() == null)
                        {
                            inspection = 0;
                        }
                        else
                        {
                            inspection = Convert.ToDouble(dr["Inspection"]);
                        }
                        if (dr["AraNakliyeTON"].ToString() == null || dr["AraNakliyeTON"].ToString() == "")
                        {
                            aranakliyeTON = 0;
                        }
                        else
                        {
                            aranakliyeTON = Convert.ToDouble(dr["AraNakliyeTON"]);
                        }
                        if (dr["DepolamaTON"].ToString() == "" || dr["DepolamaTON"].ToString() == null)
                        {
                            depolamaTON = 0;
                        }
                        else
                        {
                            depolamaTON = Convert.ToDouble(dr["DepolamaTON"]);
                        }
                        if (dr["ArmatorLokali"].ToString() == null || dr["ArmatorLokali"].ToString() == "")
                        {
                            armatorlokali = 0;
                        }
                        else
                        {
                            armatorlokali = Convert.ToDouble(dr["ArmatorLokali"]);
                        }
                        if (dr["NavlunTON"].ToString() == null || dr["NavlunTON"].ToString() == "")
                        {
                            navlunTON = 0;
                        }
                        else
                        {
                            navlunTON = Convert.ToDouble(dr["NavlunTON"]);
                        }
                        if (dr["LimanIcDolumBedeliTON"].ToString() == null || dr["LimanIcDolumBedeliTON"].ToString() == "")
                        {
                            limandolumbedeliTON = 0;
                        }
                        else
                        {
                            limandolumbedeliTON = Convert.ToDouble(dr["LimanIcDolumBedeliTON"]);
                        }
                        SqlCommand gonder = new SqlCommand("UpdateOrders", con);
                        gonder.CommandTimeout = 10000;
                        gonder.CommandType = CommandType.StoredProcedure;
                        gonder.Parameters.AddWithValue("@Komisyon", @komisyon);
                        gonder.Parameters.AddWithValue("@FobMaliyet", fobmaliyet);
                        gonder.Parameters.AddWithValue("@KalemSatisFiyati", Convert.ToDouble(txtTeslimSekliSatisFİyati.Text));
                        gonder.Parameters.AddWithValue("@Id", id);
                        //gonder.Parameters.AddWithValue("@fobKarOrani",fobkarorani);
                        //gonder.Parameters.AddWithValue("@teslimsekliKarOrani",teslimseklikarorani);
                        gonder.Parameters.AddWithValue("@TeklifTipi", tekliftipi);
                        gonder.Parameters.AddWithValue("@UrunFiyat", urunfiyat);
                        gonder.Parameters.AddWithValue("@Ambalaj", ambalaj);
                        gonder.Parameters.AddWithValue("@GumruklemeTON", gumruklemeTON);
                        gonder.Parameters.AddWithValue("@Inspection", inspection);
                        gonder.Parameters.AddWithValue("@AraNakliyeTON", aranakliyeTON);
                        gonder.Parameters.AddWithValue("@DepolamaTON", depolamaTON);
                        gonder.Parameters.AddWithValue("@ArmatorLokali", armatorlokali);
                        gonder.Parameters.AddWithValue("@LimanIcDolumBedeliTON", limandolumbedeliTON);
                        gonder.Parameters.AddWithValue("@KalemMaliyeti", kalemmaliyet);
                        gonder.Parameters.AddWithValue("@NavlunTON", navlunTON);
                        gonder.Parameters.AddWithValue("@SigortaTON", sigortaton);
                        gonder.Parameters.AddWithValue("@FobSatisFiyati", Convert.ToDouble(txtFobSatisFiyati.Text));
                        gonder.ExecuteNonQuery();

                    }
                    dr.Close();

                    con.Close();
                }
                catch
                {

                }
                pnlKayitEkle.Visible =
               pnlHider.Visible = false;
                Response.Redirect("RevizeDetay.aspx?teklifno=" + Request.QueryString["teklifno"] + "");
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }

        }

        protected void lbModalPopupKapat_Click(object sender, EventArgs e)
        {
            pnlKayitEkle.Visible =
            pnlHider.Visible = false;
        }

        protected void btnRapor_Click(object sender, EventArgs e)
        {
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
            ASPxGridViewExporter1.WriteXlsToResponse("Revize_İstenilen_Teklifler_Listesi_" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString());
        }



        //protected void btnkaydet_Click(object sender, EventArgs e)
        //{
        //    //int id = Convert.ToInt32(Request.QueryString["id"]);
        //    if (ASPxGridView1.VisibleRowCount == 1)
        //    {
        //        ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);
        //    }
        //    int id;
        //    var kayit_id = ASPxGridView1.GetSelectedFieldValues("Id");
        //    id = Convert.ToInt32(kayit_id[0]);
        //    double aranakliyeTON, limandolumbedeliTON, navlunTON, armatorlokali, depolamaTON, gumruklemeTON, inspection, fobmaliyet, kalemsatisfiyati, fobkarorani, teslimseklikarorani, kalemmaliyet, sigortaton, fobsatisfiyati, komisyon, urunfiyat, ambalaj;
        //    string tekliftipi;
        //    SqlConnection con = new SqlConnection(strcon);
        //    try
        //    {
        //        con.Open();
        //        SqlCommand cmd = new SqlCommand("select *from Orders where Id=@p1", con);
        //        cmd.Parameters.AddWithValue("@p1", id);
        //        SqlDataReader dr = cmd.ExecuteReader();
        //        while (dr.Read())
        //        {
        //            if (dr["Komisyon"].ToString() == null || dr["Komisyon"].ToString() == "")
        //            {
        //                komisyon = 0;
        //            }
        //            else
        //            {
        //                komisyon = Convert.ToDouble(dr["Komisyon"]);
        //            }
        //            if (dr["FobMaliyet"].ToString() == null || dr["FobMaliyet"].ToString() == "")
        //            {
        //                fobmaliyet = 0;
        //            }
        //            else
        //            {
        //                fobmaliyet = Convert.ToDouble(dr["FobMaliyet"]);
        //            }
        //            if (dr["KalemSatisFiyati"].ToString() == null || dr["KalemSatisFiyati"].ToString() == "")
        //            {
        //                kalemsatisfiyati = 0;
        //            }
        //            else
        //            {
        //                kalemsatisfiyati = Convert.ToDouble(dr["KalemSatisFiyati"]);
        //            }
        //            if (dr["fobKarOrani"].ToString() == null || dr["fobKarOrani"].ToString() == "")
        //            {
        //                fobkarorani = 0;
        //            }
        //            else
        //            {
        //                fobkarorani = Convert.ToDouble(dr["fobKarOrani"]);
        //            }
        //            if (dr["teslimsekliKarOrani"].ToString() == null || dr["teslimsekliKarOrani"].ToString() == "")
        //            {
        //                teslimseklikarorani = 0;
        //            }
        //            else
        //            {
        //                teslimseklikarorani = Convert.ToDouble(dr["teslimsekliKarOrani"]);
        //            }
        //            if (dr["KalemMaliyeti"].ToString() == null || dr["KalemMaliyeti"].ToString() == "")
        //            {
        //                kalemmaliyet = 0;
        //            }
        //            else
        //            {
        //                kalemmaliyet = Convert.ToDouble(dr["KalemMaliyeti"]);
        //            }

        //            if (dr["SigortaTON"].ToString() == null || dr["SigortaTON"].ToString() == "")
        //            {
        //                sigortaton = 0;
        //            }
        //            else
        //            {
        //                sigortaton = Convert.ToDouble(dr["SigortaTON"]);
        //            }
        //            if (dr["FobSatisFiyati"].ToString() == null || dr["FobSatisFiyati"].ToString() == "")
        //            {
        //                fobsatisfiyati = 0;
        //            }
        //            else
        //            {
        //                fobsatisfiyati = Convert.ToDouble(dr["FobSatisFiyati"]);
        //            }
        //            if (dr["TeklifTipi"].ToString() == null || dr["TeklifTipi"].ToString() == "")
        //            {
        //                tekliftipi = "YOK";
        //            }
        //            else
        //            {
        //                tekliftipi = Convert.ToString(dr["TeklifTipi"]);
        //            }
        //            if (dr["UrunFiyat"].ToString() == null || dr["UrunFiyat"].ToString() == "")
        //            {
        //                urunfiyat = 0;
        //            }
        //            else
        //            {
        //                urunfiyat = Convert.ToDouble(dr["UrunFiyat"]);
        //            }
        //            if (dr["Ambalaj"].ToString() == null || dr["Ambalaj"].ToString() == "")
        //            {
        //                ambalaj = 0;
        //            }
        //            else
        //            {
        //                ambalaj = Convert.ToDouble(dr["Ambalaj"].ToString());
        //            }
        //            if (dr["GumruklemeTON"].ToString() == null || dr["GumruklemeTON"].ToString() == "")
        //            {
        //                gumruklemeTON = 0;
        //            }
        //            else
        //            {
        //                gumruklemeTON = Convert.ToDouble(dr["GumruklemeTON"]);
        //            }
        //            if (dr["Inspection"].ToString() == "" || dr["Inspection"].ToString() == null)
        //            {
        //                inspection = 0;
        //            }
        //            else
        //            {
        //                inspection = Convert.ToDouble(dr["Inspection"]);
        //            }
        //            if (dr["AraNakliyeTON"].ToString() == null || dr["AraNakliyeTON"].ToString() == "")
        //            {
        //                aranakliyeTON = 0;
        //            }
        //            else
        //            {
        //                aranakliyeTON = Convert.ToDouble(dr["AraNakliyeTON"]);
        //            }
        //            if (dr["DepolamaTON"].ToString() == "" || dr["DepolamaTON"].ToString() == null)
        //            {
        //                depolamaTON = 0;
        //            }
        //            else
        //            {
        //                depolamaTON = Convert.ToDouble(dr["DepolamaTON"]);
        //            }
        //            if (dr["ArmatorLokali"].ToString() == null || dr["ArmatorLokali"].ToString() == "")
        //            {
        //                armatorlokali = 0;
        //            }
        //            else
        //            {
        //                armatorlokali = Convert.ToDouble(dr["ArmatorLokali"]);
        //            }
        //            if (dr["NavlunTON"].ToString() == null || dr["NavlunTON"].ToString() == "")
        //            {
        //                navlunTON = 0;
        //            }
        //            else
        //            {
        //                navlunTON = Convert.ToDouble(dr["NavlunTON"]);
        //            }
        //            if (dr["LimanIcDolumBedeliTON"].ToString() == null || dr["LimanIcDolumBedeliTON"].ToString() == "")
        //            {
        //                limandolumbedeliTON = 0;
        //            }
        //            else
        //            {
        //                limandolumbedeliTON = Convert.ToDouble(dr["@LimanIcDolumBedeliTON"]);
        //            }
        //            SqlCommand gonder = new SqlCommand("UpdateOrders", con);
        //            gonder.CommandTimeout = 10000;
        //            gonder.CommandType = CommandType.StoredProcedure;
        //            gonder.Parameters.AddWithValue("@FobMaliyet", fobmaliyet);
        //            gonder.Parameters.AddWithValue("@KalemSatisFiyati", Convert.ToDouble(txtTeslimSekliSatisFİyati.Text));
        //            gonder.Parameters.AddWithValue("@Id", id);
        //            gonder.Parameters.AddWithValue("@fobKarOrani", fobkarorani);
        //            gonder.Parameters.AddWithValue("@teslimsekliKarOrani", teslimseklikarorani);
        //            gonder.Parameters.AddWithValue("@TeklifTipi", tekliftipi);
        //            gonder.Parameters.AddWithValue("@KalemMaliyeti", kalemmaliyet);
        //            gonder.Parameters.AddWithValue("@SigortaTON", sigortaton);
        //            gonder.Parameters.AddWithValue("@FobSatisFiyati", Convert.ToDouble(txtFobSatisFiyati.Text));
        //            gonder.Parameters.AddWithValue("@NavlunTON", navlunTON);
        //            gonder.Parameters.AddWithValue("@ArmatorLokali", armatorlokali);
        //            gonder.Parameters.AddWithValue("@DepolamaTON", depolamaTON);
        //            gonder.Parameters.AddWithValue("@AraNakliyeTON", aranakliyeTON);
        //            gonder.Parameters.AddWithValue("@Inspection", inspection);
        //            gonder.Parameters.AddWithValue("@GumruklemeTON", gumruklemeTON);
        //            gonder.Parameters.AddWithValue("@Ambalaj", ambalaj);
        //            gonder.Parameters.AddWithValue("@UrunFiyat", urunfiyat);
        //            gonder.Parameters.AddWithValue("@TeklifTipi", tekliftipi);
        //            gonder.Parameters.AddWithValue("@LimanIcDolumBedeliTON", limandolumbedeliTON);
        //            gonder.ExecuteNonQuery();

        //        }
        //        dr.Close();

        //        con.Close();
        //    }
        //    catch
        //    {

        //    }
        //    Response.Redirect("RevizeDetay.aspx?teklifno="+Request.QueryString["teklifno"]+"");
        //}

        //protected void btnvazgec_Click(object sender, EventArgs e)
        //{

        //}
    }
}