using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class IslemGorenler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ASPxGridView1.Columns["TorbaTipi"].Caption = "TORBA" + "\n" + "TİPİ";
            ASPxGridView1.Columns["TorbaAgirligi"].Caption = "TORBA" + "\n" + "AĞIRLIĞI";
            ASPxGridView1.Columns["BBTipi"].Caption = "BİGBAG" + "\n" + "TİPİ";
            ASPxGridView1.Columns["BBAgirligi"].Caption = "BİGBAG" + "\n" + "AĞIRLIĞI";
            ASPxGridView1.Columns["UrunFiyat"].Caption = "ÜRÜN" + "\n" + "SADE" + "\n" + "FİYATI";
            ASPxGridView1.Columns["AraNakliyeTON"].Caption = "ARA" + "\n" + "NAKLİYE";
            ASPxGridView1.Columns["ArmatorLokali"].Caption = "ARMATÖR" + "\n" + "LOKALİ";
            ASPxGridView1.Columns["LimanIcDolumBedeliTON"].Caption = "LİMAN" + "\n" + "DOLUM" + "\n" + "BEDELİ";
            ASPxGridView1.Columns["ValorFobMaliyetEtkisi"].Caption = "FOB" + "\n" + "VALÖR" + "\n" + "ETKİSİ";
            ASPxGridView1.Columns["FobMaliyet"].Caption = "FOB" + "\n" + "MALİYETİ";
            ASPxGridView1.Columns["FobSatisFiyati"].Caption = "FOB" + "\n" + "SATIŞ" + "\n" + "FİYATI";
            ASPxGridView1.Columns["FOBKARORANI"].Caption = "FOB" + "\n" + "KAR" + "\n" + "ORANI";
            ASPxGridView1.Columns["ValorMaliyetEtkisi"].Caption = "VALÖR" + "\n" + "T.ŞEKLİ MALİYET" + "\n" + "ETKİSİ";
            ASPxGridView1.Columns["KalemMaliyeti"].Caption = "TESLİM ŞEKLİ" + "\n" + "MALİYETİ";
            ASPxGridView1.Columns["KalemSatisFiyati"].Caption = "TESLİM ŞEKLİ" + "\n" + "SATIŞ FİYATI";
            ASPxGridView1.Columns["KAR ORANI"].Caption = "KAR" + "\n" + "ORANI";
            ASPxGridView1.Columns["buUrununSiparisTonaji"].Caption = "BU ÜRÜNÜN" + "\n" + "SİPARİŞ TONAJI";
            ASPxGridView1.Columns["TeklifTipi1"].Caption = "GÖNDERİM" + "\n" + "ŞEKLİ";
            ASPxGridView1.Columns["SEVK EDİLEN TONAJ"].Caption = "SEVK" + "\n" + "EDİLEN" + "\n" + "TONAJ";
            ASPxGridView1.Columns["TOPLAM SATIŞ"].Caption = "TOPLAM" + "\n" + "SATIŞ";
            ASPxGridView1.Columns["TOPLAM MALİYET"].Caption = "TOPLAM" + "\n" + "MALİYET";
            ASPxGridView1.Columns["KARORANI1"].Caption = "KAR" + "\n" + "ORANI";
            ASPxGridView1.Columns["TeklifTipi"].Caption = "GÖNDERİM" + "\n" + "ŞEKLİ";
            ASPxGridView1.Columns["KonteynerBulkSecimi"].Caption = "SEVK" + "\n" + "TİPİ";
            ASPxGridView1.Columns["KalkisLimani"].Caption = "KALKIŞ" + "\n" + "LİMANI";
            ASPxGridView1.Columns["VarisLimani"].Caption = "VARIŞ" + "\n" + "LİMANI";
            ASPxGridView1.Columns["EkipmanTuru"].Caption = "EKİPMAN" + "\n" + "TÜRÜ";
            ASPxGridView1.Columns["SiparistekiKonteynerSayisi"].Caption = "SİPARİŞTEKİ" + "\n" + "KONTEYNER" + "\n" + "SAYISI";
            ASPxGridViewExporter1.WriteXlsxToResponse("Operasyon_Realite" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString());
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                int Id;

                var kayit_Id = ASPxGridView1.GetSelectedFieldValues("Id");

                Id = Convert.ToInt32(kayit_Id[0]);

                Response.Redirect("IslemGorenRevize.aspx?Id=" + Id + "");

            }
            catch
            {

                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void Button2_Click1(object sender, EventArgs e)
        {
            Response.Redirect("IslemGoren2.aspx?tar1=" + txttar1.Text + "&tar2=" + txtTar2.Text + "");
        }
    }
}