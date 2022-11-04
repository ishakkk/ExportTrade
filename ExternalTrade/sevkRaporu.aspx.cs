using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade
{
    public partial class sevkRaporu : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@temsilci"].Value = UserData.Id;
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
            ASPxGridView1.Columns["buUrununSiparisTonaji1"].Caption = "BU ÜRÜNÜN" + "\n" + "SİPARİŞ TONAJI";
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
            //ASPxGridView1.Columns["ÜRÜN SADE MALİYETİ"].Caption = "ÜRÜN" +"\n"+ "SADE" +"\n"+ "MALİYETİ";
            ASPxGridView1.Columns["KAR ORANI"].Caption = "KAR" + "\n" + "ORANI";
            ASPxGridView1.Columns["FARK"].Caption = "FARK";
            ASPxGridView1.Columns["SHIPPEDAMOUNT"].Caption = "SEVK EDİLEN" + "\n" + "TONAJ";
            ASPxGridView1.Columns["ValorMaliyetEtkisi"].Caption = "VALÖR" + "\n" + "T.ŞEKLİ MALİYET" + "\n" + "ETKİSİ";
            ASPxGridView1.Columns["ValorFobMaliyetEtkisi"].Caption = "VALÖR" + "\n" + "FOB MALİYET" + "\n" + "ETKİSİ";
            ASPxGridView1.Columns["fobKarOrani"].Caption = "FOB" + "\n" + "KAR" + "\n" + "ORANI";
            ASPxGridViewExporter1.WriteXlsxToResponse("Sevk_Raporu" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString());


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (db.SEVKRAPORU_USER(Convert.ToDateTime(txtTar1.Text), Convert.ToDateTime(txtTar2.Text), Convert.ToInt32(UserData.Id)) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "successAlert()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "errorAlert()", true);
            }

        }
    }
}