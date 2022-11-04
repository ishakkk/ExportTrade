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
using System.Xml;

namespace ExternalTrade
{
    public partial class TeklifHazirla : System.Web.UI.Page
    {
        DBLogoConnection logo = new DBLogoConnection();
        DBIslemler db = new DBIslemler();
        string tekliftarihi;
        string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
        const string bugun = "https://www.tcmb.gov.tr/kurlar/today.xml";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (UserData.Authority == "Operation")
                Response.Redirect("Home.aspx");
            else
            {
                if (UserData.Authority == "SuperAdmın")
                {
                    btnEkle.Visible = false;
                    //btnrefresh.Visible = false;
                }
                string Temsilci;
                string adsoyad;
                if (UserData.Name == null || UserData.SurName == null || UserData.Name == "" || UserData.SurName == "")
                {
                    Temsilci = "";
                    adsoyad = "";
                }
                else
                {
                    Temsilci = UserData.Name + "" + UserData.SurName;
                    adsoyad = UserData.Name.ToString().Substring(0, 1) + UserData.SurName.ToString().Substring(0, 1);
                }
                int ikibinyili = 2000;
                int gunumuzyili = Convert.ToInt32(DateTime.Now.Year);
                int YilSonIkiHani = gunumuzyili - ikibinyili;
                tekliftarihi = Convert.ToString(DateTime.Now.Day) + Convert.ToString(DateTime.Now.Month) + Convert.ToString(YilSonIkiHani);

                using (SqlConnection con2 = new SqlConnection(strcon))
                {
                    con2.Open();
                    SqlCommand teklifsayisi = new SqlCommand("select COUNT(DISTINCT(TeklifNo)) from Orders  where  TeklifTarihi='" + tekliftarihi + "' and TemsilciKullaniciAdi='" + UserData.Id + "'", con2);
                    int sayi = Convert.ToInt32(teklifsayisi.ExecuteScalar());
                    txtTeklifNo.ReadOnly = false;
                    txtTeklifNo.Text = adsoyad + tekliftarihi + "-" + Convert.ToString(sayi + 1);
                    txtTeklifNo.ReadOnly = true;
                    txtTemsilci.Text = UserData.Name + " " + UserData.SurName;
                    txtTemsilci.ReadOnly = true;

                }

                using (SqlConnection con3 = new SqlConnection(strcon))
                {
                    if (Page.IsPostBack == false)
                    {
                        int sayi = 0;
                        con3.Open();
                        SqlCommand bolge = new SqlCommand("select *from Continent", con3);
                        SqlDataReader bolgeoku = bolge.ExecuteReader();
                        SqlCommand p = new SqlCommand("select *from PaletteFormul", con3);
                        SqlDataReader po = p.ExecuteReader();
                        DrpPalet.DataSource = po;
                        DrpPalet.DataValueField = "Name";
                        DrpPalet.DataTextField = "Name";
                        DrpPalet.DataBind();
                        po.Close();
                        SqlCommand say = new SqlCommand("select COUNT(*) from Sepet where TeklifNo='" + txtTeklifNo.Text + "'", con3);
                        sayi = Convert.ToInt32(say.ExecuteScalar());
                        if (sayi == 0)
                        {
                            SqlCommand cmd = new SqlCommand("select * from Maturity", con3);
                            SqlDataReader dr = cmd.ExecuteReader();
                            DrpVade.DataSource = dr;
                            DrpVade.DataTextField = "Maturity";
                            DrpVade.DataValueField = "Id";
                            DrpVade.DataBind();
                            string xox = "select  CL.CODE,CL.DEFINITION_,SLSMAN.DEFINITION_  from DTBSSRVR.TIGERDB.dbo.LG_219_SLSCLREL SLSCLREL inner join DTBSSRVR.TIGER.dbo.LG_SLSMAN AS SLSMAN on SLSCLREL.SALESMANREF = SLSMAN.LOGICALREF inner join DTBSSRVR.TIGERDB.dbo.LG_219_CLCARD CL on CL.LOGICALREF=SLSCLREL.CLIENTREF where SLSMAN.LOGICALREF='" + UserData.LogoId + "'";
                            //string xox = "select CODE,DEFINITION_ from DTBSSRVR.TIGERDB.dbo.LG_219_CLCARD where ACTIVE=0 and CODE like '120.02.%'";
                            SqlDataSource3.SelectCommand = xox;
                            SqlDataSource3.SelectCommandType = SqlDataSourceCommandType.Text;
                            cmbMusteri.DataSource = SqlDataSource3;
                            cmbMusteri.DataTextField = "DEFINITION_";
                            cmbMusteri.DataValueField = "CODE";
                            cmbMusteri.DataBind();
                            dr.Close();
                        }
                        else
                        {
                            SqlCommand cmd = new SqlCommand("select s.Vade,m.Id  from Sepet s left outer join Maturity m on s.Vade=m.Maturity where s.TeklifNo='" + txtTeklifNo.Text + "' group by s.Vade,m.Id", con3);
                            SqlDataReader dr = cmd.ExecuteReader();
                            DrpVade.DataSource = dr;
                            DrpVade.DataTextField = "Vade";
                            DrpVade.DataValueField = "Id";
                            DrpVade.DataBind();
                            DrpVade.Enabled = false;
                            dr.Close();
                            string xox = "select s.MusteriKodu as CODE,s.MusteriIsmi as DEFINITION_  from Sepet s left outer join DTBSSRVR.TIGERDB.dbo.LG_219_CLCARD CL on s.MusteriKodu=CL.CODE where s.TeklifNo='" + txtTeklifNo.Text + "' group by s.MusteriKodu,s.MusteriIsmi";
                            SqlDataSource3.SelectCommand = xox;
                            SqlDataSource3.SelectCommandType = SqlDataSourceCommandType.Text;
                            cmbMusteri.DataSource = SqlDataSource3;
                            cmbMusteri.DataTextField = "DEFINITION_";
                            cmbMusteri.DataValueField = "CODE";
                            cmbMusteri.DataBind();
                            txtDigerMusteri.Text = Convert.ToString(cmbMusteri.SelectedItem.Text);
                            txtDigerMusteri.Enabled = false;

                        }

                        SqlCommand cmd2 = new SqlCommand("select *from Port", con3);
                        SqlDataReader dr2 = cmd2.ExecuteReader();
                        DrpKalkisLimani.DataSource = dr2;
                        DrpKalkisLimani.DataTextField = "PortName";
                        DrpKalkisLimani.DataValueField = "Id";
                        DrpKalkisLimani.DataBind();

                        dr2.Close();

                        SqlCommand cmd3 = new SqlCommand("select *from EquipmentType", con3);
                        SqlDataReader dr3 = cmd3.ExecuteReader();
                        DrpEkipmanTuru.DataSource = dr3;
                        DrpEkipmanTuru.DataTextField = "EkipmanTürü";
                        DrpEkipmanTuru.DataValueField = "Id";
                        DrpEkipmanTuru.DataBind();

                        dr3.Close();

                        SqlCommand cmd4 = new SqlCommand("select *from BagType order by Id desc", con3);
                        SqlDataReader dr4 = cmd4.ExecuteReader();
                        drpTorbaTipi.DataSource = dr4;
                        drpTorbaTipi.DataTextField = "bagType";
                        drpTorbaTipi.DataValueField = "Id";
                        drpTorbaTipi.DataBind();

                        dr4.Close();

                        SqlCommand cmd5 = new SqlCommand("select *from BBWeight", con3);
                        SqlDataReader dr5 = cmd5.ExecuteReader();
                        drpBBAgirligi.DataSource = dr5;
                        drpBBAgirligi.DataTextField = "Weight";
                        drpBBAgirligi.DataValueField = "Id";
                        drpBBAgirligi.DataBind();

                        dr5.Close();

                        SqlCommand cmd6 = new SqlCommand("select *from BBType order by Id desc", con3);
                        SqlDataReader dr6 = cmd6.ExecuteReader();
                        DrpBBTipi.DataSource = dr6;
                        DrpBBTipi.DataTextField = "bbType";
                        DrpBBTipi.DataValueField = "Id";
                        DrpBBTipi.DataBind();
                        dr6.Close();


                        SqlCommand cmd7 = new SqlCommand("select *from BagWeight order by Id desc", con3);
                        SqlDataReader dr7 = cmd7.ExecuteReader();
                        DrpTorbaAgirligi.DataSource = dr7;
                        DrpTorbaAgirligi.DataTextField = "Weight";
                        DrpTorbaAgirligi.DataValueField = "Id";
                        DrpTorbaAgirligi.DataBind();
                        dr7.Close();

                        SqlCommand paletdoldur = new SqlCommand("select *from Palette order by Id desc", con3);
                        SqlDataReader paletdolduroku = paletdoldur.ExecuteReader();
                        drpPaletTipi.DataSource = paletdolduroku;
                        drpPaletTipi.DataValueField = "Id";
                        drpPaletTipi.DataTextField = "Name";
                        drpPaletTipi.DataBind();
                        SqlCommand cmd8 = new SqlCommand("select *from DeliveryPoint", con3);
                        SqlDataReader dr8 = cmd8.ExecuteReader();
                        drpTeslimNoktasi.DataSource = dr8;
                        drpTeslimNoktasi.DataTextField = "PointName";
                        drpTeslimNoktasi.DataValueField = "Id";
                        drpTeslimNoktasi.DataBind();
                        dr8.Close();
                        string islem = Request.QueryString["islem"];




                        con3.Close();



                    }



                }
            }



        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {



            string gun = Convert.ToString(DateTime.Now.Day);
            string ay = Convert.ToString(DateTime.Now.Month);
            int ikibinyil = 2000;
            int gunumuzyil = Convert.ToInt32(DateTime.Now.Year);
            int yilhesap = gunumuzyil - ikibinyil;
            string yil = Convert.ToString(yilhesap);
            switch (ay)
            {
                case "1": ay = "Ocak"; break;
                case "2": ay = "Şubat"; break;
                case "3": ay = "Mart"; break;
                case "4": ay = "Nisan"; break;
                case "5": ay = "Mayıs"; break;
                case "6": ay = "Haziran"; break;
                case "7": ay = "Temmuz"; break;
                case "8": ay = "Ağustos"; break;
                case "9": ay = "Eylül"; break;
                case "10": ay = "Ekim"; break;
                case "11": ay = "Kasım"; break;
                default: ay = "Aralık"; break;

            }
            DateTime manueltarih;
            DbConnection con = new DbConnection();
            SqlCommand say = new SqlCommand("select COUNT(TTarih) from Sepet where TeklifNo='" + txtTeklifNo.Text + "'", con.baglanti());
            if (Convert.ToInt32(say.ExecuteScalar()) == 0)
            {
                manueltarih = Convert.ToDateTime(txtManueltarih.Text);
            }
            else
            {
                SqlCommand tcek = new SqlCommand("select TTarih from Sepet where TeklifNo='" + txtTeklifNo.Text + "' group by TTarih", con.baglanti());
                manueltarih = Convert.ToDateTime(tcek.ExecuteScalar());
            }

            double konteynersayisi = 0;
            double controlnumber = 0;
            string musteriadi = "";
            string musterikodu = "";
            string musteritipi = "";
            if (Request.Form["musteri"] == "logo")
            {
                musteriadi = Convert.ToString(cmbMusteri.SelectedItem.Text);
                musterikodu = Convert.ToString(cmbMusteri.SelectedItem.Value);
                musteritipi = "tanimli";
            }
            else
            {
                musteriadi = Convert.ToString(txtDigerMusteri.Text);
                musterikodu = "";
                musteritipi = "diger";
            }
            string parsiyel = "";
            if (chkParsiyel.Checked == true)
            {
                parsiyel = "EVET";
            }
            else if (chkParsiyel.Checked == false)
            {
                parsiyel = "HAYIR";
            }
            double fobMaliyet = 0;
            string parcalisiparis = Convert.ToString(Request.Form["siparistipi"]);
            if (parcalisiparis == null || parcalisiparis == "")
            { parcalisiparis = "YOK"; }
            else
            { parcalisiparis = Convert.ToString(Request.Form["siparistipi"]); }
            double parite;
            SqlCommand USDKUR = new SqlCommand("SET dateformat DMY select dbo.DOVIZKURU_GETIR(1,GETDATE())", logo.LogoConnection());

            double USD = Convert.ToDouble(USDKUR.ExecuteScalar());
            if (USD == 0)
            {
                var cxml = new XmlDocument();
                cxml.Load(bugun);
                USD = Convert.ToDouble(cxml.SelectSingleNode("Tarih_Date/Currency [@Kod = 'USD']/BanknoteBuying").InnerXml.Replace(".", ","));
            }

            SqlCommand EUROKURCEK = new SqlCommand("SET dateformat DMY select dbo.DOVIZKURU_GETIR(20,GETDATE())", logo.LogoConnection());
            double EUR = Convert.ToDouble(EUROKURCEK.ExecuteScalar());
            if (EUR == 0)
            {
                var cxml = new XmlDocument();
                cxml.Load(bugun);
                EUR = Convert.ToDouble(cxml.SelectSingleNode("Tarih_Date/Currency [@Kod = 'EUR']/BanknoteBuying").InnerXml.Replace(".", ","));
            }
            parite = Convert.ToDouble(EUR) / Convert.ToDouble(USD);

            double bulkyuklemebedeli = 0, icnakliye = 0, navlunton = 0, depolamaton = 0, armatorlokali = 0, urunfiyat = 0, tfiyat, bfiyat, sfiyat, pfiyat, ambalajmaliyet = 0, cakilifiyat = 0;
            double navlunton2, urunmaliyet;
            if (txtNavlun.Text == "")
            {
                navlunton2 = 0;
            }
            else
            {
                if (double.TryParse(txtNavlun.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "navlunalert", true);
                    navlunton2 = 0;
                }
                else
                {
                    navlunton2 = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                }



            }

            string bolge, ulke;
            SqlCommand bolgecek = new SqlCommand("select ContinentName from Continent where Id='" + Convert.ToInt32(Request.Form["bolge"]) + "'", con.baglanti());
            bolge = Convert.ToString(bolgecek.ExecuteScalar());
            SqlCommand ulkecek = new SqlCommand("select CountryName from Country where Id='" + Convert.ToInt32(Request.Form["ulke"]) + "'", con.baglanti());
            ulke = Convert.ToString(ulkecek.ExecuteScalar());
            string varislimani = "";
            if (Request.Form["vliman"] == "tanimliliman")
            {
                SqlCommand varislimanicek = new SqlCommand("select PortName from OtherPorts where Id='" + Convert.ToInt32(Request.Form["liman"]) + "'", con.baglanti());
                varislimani = Convert.ToString(varislimanicek.ExecuteScalar());
                //varislimani = Convert.ToString(drpvarislimani.SelectedItem.Text);
            }
            else if (Request.Form["vliman"] == "digerliman")
            {
                varislimani = Convert.ToString(txtvarislimani.Text);
            }
            else
            {
                varislimani = "YOK";
            }
            string urunkodu = "";
            double bbagirligi, gumruklemeTON, kalemmaliyet, torbaagirligi;
            string urunanagrup = "";
            string urunadi = "";
            SqlCommand bulk = new SqlCommand("select Price from LoadingCharge", con.baglanti());
            bulkyuklemebedeli = Convert.ToDouble(bulk.ExecuteScalar());

            if (musterikodu == "120.02.00003")
            {
                SqlCommand fiyat = new SqlCommand("select Price_Intercarb from Product where Code='" + Convert.ToString(Request.Form["urunanasinif"]) + "'", con.baglanti());
                urunfiyat = Convert.ToDouble(fiyat.ExecuteScalar());
            }
            else if (musterikodu == "120.02.00004")
            {
                SqlCommand fiyat = new SqlCommand("select Price_Roskim from Product where Code='" + Convert.ToString(Request.Form["urunanasinif"]) + "'", con.baglanti());
                urunfiyat = Convert.ToDouble(fiyat.ExecuteScalar());
            }
            else if (musterikodu == "120.02.00121")
            {
                SqlCommand fiyat = new SqlCommand("select Price_Ozer from Product where Code='" + Convert.ToString(Request.Form["urunanasinif"]) + "'", con.baglanti());
                urunfiyat = Convert.ToDouble(fiyat.ExecuteScalar());
            }
            else
            {
                SqlCommand fiyat = new SqlCommand("select Price from Product where Code='" + Convert.ToString(Request.Form["urunanasinif"]) + "'", con.baglanti());
                urunfiyat = Convert.ToDouble(fiyat.ExecuteScalar());
            }
            SqlCommand urunmaliyetcek = new SqlCommand("select ISNULL(USDPrice,0) as USDPrice from SegmantasyonDB.dbo.Products where Code='" + Convert.ToString(Request.Form["urunanasinif"]) + "'", con.baglanti());
            urunmaliyet = Convert.ToDouble(urunmaliyetcek.ExecuteScalar());
            SqlCommand urungrup = new SqlCommand("select MainClass from Product where Code='" + Convert.ToString(Request.Form["urunanasinif"]) + "'", con.baglanti());
            urunanagrup = Convert.ToString(urungrup.ExecuteScalar());
            //SqlCommand urunkoducek = new SqlCommand("select Code from Product where Code='" + Convert.ToString(Request.Form["urunanasinif"]) + "'", con.baglanti());
            urunkodu = Convert.ToString(Request.Form["urunanasinif"]);
            SqlCommand urunadicek = new SqlCommand("select ProductName from Product where Code='" + Convert.ToString(Request.Form["urunanasinif"]) + "'", con.baglanti());
            urunadi = Convert.ToString(urunadicek.ExecuteScalar());


            SqlCommand torbafiyat = new SqlCommand("select Price from BagType where Id='" + Convert.ToInt32(drpTorbaTipi.SelectedItem.Value) + "'", con.baglanti());
            SqlCommand bbfiyat = new SqlCommand("select Price from BBType where Id='" + Convert.ToInt32(DrpBBTipi.SelectedItem.Value) + "'", con.baglanti());

            SqlCommand paletfiyat = new SqlCommand("select Price from Palette where Id='" + Convert.ToInt32(drpPaletTipi.SelectedItem.Value) + "'", con.baglanti());

            SqlCommand strecfiyat = new SqlCommand("select Price from Stretch", con.baglanti());
            sfiyat = Convert.ToDouble(strecfiyat.ExecuteScalar());
            string siparistipi = Convert.ToString(Request.Form["siparistipi"]);
            if (siparistipi == null || siparistipi == "")
            {
                siparistipi = "YOK";
            }
            else
            {
                siparistipi = Request.Form["siparistipi"];
            }
            double bigbagfiyat;
            double torbaf;
            if (DrpPalet.SelectedItem.Text == "YOK")
            { pfiyat = 0; }
            else
            {

                if (Convert.ToInt32(drpPaletTipi.SelectedItem.Value) == 2)
                {

                    pfiyat = (Convert.ToDouble(paletfiyat.ExecuteScalar()) / Convert.ToDouble(DrpPalet.SelectedItem.Text)) * 1000 * parite;

                }
                else
                {
                    pfiyat = (Convert.ToDouble(paletfiyat.ExecuteScalar()) / Convert.ToDouble(DrpPalet.SelectedItem.Text)) * 1000;
                }

            }
            if (DrpBBTipi.SelectedItem.Text == "YOK" || drpBBAgirligi.SelectedItem.Text == "YOK")
            {
                bfiyat = 0;
                bbagirligi = 0;
                bigbagfiyat = 0;
            }

            else
            {
                bfiyat = Convert.ToDouble(bbfiyat.ExecuteScalar());
                bbagirligi = Convert.ToDouble(drpBBAgirligi.SelectedItem.Text);
                bigbagfiyat = (bfiyat / bbagirligi) * 1000;
            }
            if (drpTorbaTipi.SelectedItem.Text == "YOK" || DrpTorbaAgirligi.SelectedItem.Text == "YOK")
            {
                tfiyat = 0;
                torbaagirligi = 0;
                torbaf = 0;
            }
            else
            {
                tfiyat = Convert.ToDouble(torbafiyat.ExecuteScalar());
                torbaagirligi = Convert.ToDouble(DrpTorbaAgirligi.SelectedItem.Text);
                torbaf = (1000 / torbaagirligi) * tfiyat;
            }
            if (torbaagirligi == 0 && bbagirligi == 0 && DrpPalet.Text == "YOK")
            {
                ambalajmaliyet = 0;
            }
            else if (torbaagirligi == 0 && bbagirligi == 0 && DrpPalet.Text != "YOK")
            {
                ambalajmaliyet = pfiyat + sfiyat;
            }
            else if (torbaagirligi != 0 && bbagirligi != 0 && DrpPalet.Text != "YOK")
            {
                ambalajmaliyet = ((tfiyat) * (1000 / torbaagirligi)) + ((bfiyat / bbagirligi) * (1000)) + ((pfiyat)) + sfiyat;
            }
            else if (torbaagirligi != 0 && bbagirligi != 0 && DrpPalet.Text == "YOK")
            {
                ambalajmaliyet = ((tfiyat) * (1000 / torbaagirligi)) + ((bfiyat / bbagirligi) * (1000)) + sfiyat;
            }
            else if (torbaagirligi == 0 && bbagirligi != 0 && DrpPalet.Text != "YOK")
            {
                ambalajmaliyet = ((bfiyat / bbagirligi) * (1000)) + (pfiyat) + sfiyat;
            }

            else if (torbaagirligi == 0 && bbagirligi != 0 && DrpPalet.Text == "YOK")
            {
                ambalajmaliyet = ((bfiyat / bbagirligi) * (1000)) + sfiyat;
            }

            else if (torbaagirligi != 0 && bbagirligi == 0 && DrpPalet.Text == "YOK")
            {
                ambalajmaliyet = ((tfiyat) * (1000 / torbaagirligi)) + sfiyat;
            }
            else if (torbaagirligi != 0 && bbagirligi == 0 && DrpPalet.Text != "YOK")
            {
                ambalajmaliyet = ((tfiyat) * (1000 / torbaagirligi)) + sfiyat + pfiyat;
            }
            string tekliftipi = Convert.ToString(Request.Form["tekliftipi"]);
            string konteynerbulksecimi = Convert.ToString(Request.Form["konteynerbulksecimi"]);
            if (Convert.ToString(DrpKalkisLimani.SelectedItem.Text) == "Limak" && konteynerbulksecimi == "BULK")
            {
                SqlCommand cakili = new SqlCommand("select Price from Port where Id='" + Convert.ToInt32(DrpKalkisLimani.SelectedItem.Value) + "'", con.baglanti());
                cakilifiyat = Convert.ToDouble(cakili.ExecuteScalar());
            }
            SqlCommand bulkgumruk = new SqlCommand("select GumruklemeBULK from Clearance", con.baglanti());
            SqlCommand konteynergumruk;
            SqlCommand konteynergumrukikion;
            SqlCommand konteyneronuzeri;
            if (DrpEkipmanTuru.SelectedItem.Text == "20 DV" || DrpEkipmanTuru.SelectedItem.Text == "40 DV")
            {
                konteynergumruk = new SqlCommand("select GumruklemeKONTEYNER from Clearance", con.baglanti());

                 konteynergumrukikion = new SqlCommand("select GumruklemeKONTEYNERikidokuz from Clearance", con.baglanti());
                 konteyneronuzeri = new SqlCommand("select GumruklemeKONTEYNERonuzeri from Clearance", con.baglanti());
            }
            else if (DrpEkipmanTuru.SelectedItem.Text == "Kara Yolu")
            {
                 konteynergumruk = new SqlCommand("select GumruklemeKonteynerKaraYolu from Clearance", con.baglanti());

                 konteynergumrukikion = new SqlCommand("select GumruklemeKonteynerKaraYoluikiuzeri from Clearance", con.baglanti());
                 konteyneronuzeri = new SqlCommand("select 0", con.baglanti());
            }
            else if (DrpEkipmanTuru.SelectedItem.Text == "Demir Yolu")
            {
                 konteynergumruk = new SqlCommand("select GumruklemeKonteynerDemirYolu from Clearance", con.baglanti());

                 konteynergumrukikion = new SqlCommand("select GumruklemeKonteynerDemirYoluikiuzeri from Clearance", con.baglanti());
                 konteyneronuzeri = new SqlCommand("select 0", con.baglanti());
            }
            else
            {
                konteynergumruk = new SqlCommand("select 0", con.baglanti());

                 konteynergumrukikion = new SqlCommand("select 0", con.baglanti());
                konteyneronuzeri = new SqlCommand("select 0", con.baglanti());
            }
            string birdenfazlabeyanname = Convert.ToString(Request.Form["birdenfazlabeyanname"]);
            if (birdenfazlabeyanname == null || birdenfazlabeyanname == "")
                birdenfazlabeyanname = "YOK";
            else
                birdenfazlabeyanname = Convert.ToString(Request.Form["birdenfazlabeyanname"]);
            // armatorlokali = Convert.ToDouble(txtArmatörLokali.Text) / (Convert.ToDouble(txtBirKonteynerTonaji.Text));
            // navlunton = Convert.ToDouble(txtNavlunTON.Text)/Convert.ToDouble(txtBirKonteynerTonaji.Text);

            if (Request.Form["birdenfazlabeyanname"] == "BIRDENFAZLABEYANNAME")
            {
                gumruklemeTON = ((Convert.ToDouble(bulkgumruk.ExecuteScalar())) * 2) / Convert.ToDouble(txtSiparisTonaji.Text) / USD;
            }
            else
            {
                if (double.TryParse(txtSiparisTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamsiparistonajialert()", true);
                    gumruklemeTON = 0;
                }
                else
                {
                    gumruklemeTON = Convert.ToDouble(bulkgumruk.ExecuteScalar()) / (Convert.ToDouble(txtSiparisTonaji.Text)) / USD;
                }
            }

            if (txtNavlunTON.Text == "")
            {
                txtNavlunTON.Text = "0";
            }
            else
            {
                navlunton = Convert.ToDouble(txtNavlunTON.Text);
            }
            depolamaton = cakilifiyat;
            SqlCommand icnakliyecek = new SqlCommand("select InsideTransport from Port where Id='" + Convert.ToInt32(DrpKalkisLimani.SelectedItem.Value) + "'", con.baglanti());
            icnakliye = Convert.ToDouble(icnakliyecek.ExecuteScalar());
            if (txtKomisyon.Text == "")
            {
                txtKomisyon.Text = "0";
            }
            if (txtInspectionTon.Text == "")
            {
                txtInspectionTon.Text = "0";
            }
            SqlCommand vadecek = new SqlCommand("select Price from Maturity where Id='" + Convert.ToInt32(DrpVade.SelectedItem.Value) + "'", con.baglanti());
            double vade = Convert.ToDouble(vadecek.ExecuteScalar());
            //BULK
            if ((Request.Form["konteynerbulksecimi"] == "BULK" && Request.Form["tekliftipi"] == "FAS" && Request.Form["ihrackayit"] != "ihrackayit") || (Request.Form["konteynerbulksecimi"] == "BULK" && Request.Form["tekliftipi"] == "FCA" && Request.Form["ihrackayit"] != "ihrackayit"))
            {


                if (musteriadi == null || musteriadi == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "cariAlert()", true);
                }
                else if (double.TryParse(txtbuurununtoplamtonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamtonajalert()", true);
                }
                else if (double.TryParse(txtSiparisTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamsiparistonajialert()", true);
                }
                else
                {
                    kalemmaliyet = (urunfiyat + ambalajmaliyet + gumruklemeTON + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + 0 + 0 + 0) * vade / 100 + (urunfiyat + ambalajmaliyet + gumruklemeTON + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + 0 + 0 + 0);

                    if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, Convert.ToDouble(gumruklemeTON), 0, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, "YOK", 0, "0", Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, "YOK", birdenfazlabeyanname, 0, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                    }
                }


            }
            else if (Request.Form["konteynerbulksecimi"] == "BULK" && Request.Form["tekliftipi"] == "FOB" && Request.Form["ihrackayit"] != "ihrackayit")
            {
                if (musteriadi == null || musteriadi == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "cariAlert()", true);
                }
                else if (double.TryParse(txtbuurununtoplamtonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamtonajalert()", true);
                }
                else if (double.TryParse(txtSiparisTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamsiparistonajialert()", true);
                }
                else
                {
                    kalemmaliyet = (urunfiyat + ambalajmaliyet + gumruklemeTON + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + 0 + 0 + 0 + bulkyuklemebedeli) * vade / 100 + (urunfiyat + ambalajmaliyet + gumruklemeTON + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + 0 + 0 + 0 + bulkyuklemebedeli);
                    fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + bulkyuklemebedeli + armatorlokali + gumruklemeTON) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + bulkyuklemebedeli + armatorlokali + gumruklemeTON);
                    if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, Convert.ToDouble(gumruklemeTON), bulkyuklemebedeli, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, "YOK", 0, "0", Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, "YOK", birdenfazlabeyanname, fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                    {

                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                    }

                }


            }

            else if ((Request.Form["konteynerbulksecimi"] == "BULK" && Request.Form["tekliftipi"] == "CFR" && Request.Form["ihrackayit"] != "ihrackayit") || (Request.Form["tekliftipi"] == "DAP" && Request.Form["konteynerbulksecimi"] == "BULK" && Request.Form["ihrackayit"] != "ihrackayit"))
            {
                if (musteriadi == null || musteriadi == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "cariAlert()", true);
                }
                else if (double.TryParse(txtbuurununtoplamtonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamtonajalert()", true);
                }
                else if (double.TryParse(txtSiparisTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamsiparistonajialert()", true);
                }
                else
                {
                    kalemmaliyet = (urunfiyat + ambalajmaliyet + gumruklemeTON + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + 0 + 0 + 0 + bulkyuklemebedeli + Convert.ToDouble(txtNavlunTON.Text)) * vade / 100 + (urunfiyat + ambalajmaliyet + gumruklemeTON + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + 0 + 0 + 0 + bulkyuklemebedeli + Convert.ToDouble(txtNavlunTON.Text));
                    fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + bulkyuklemebedeli + armatorlokali + gumruklemeTON) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + bulkyuklemebedeli + armatorlokali + gumruklemeTON);
                    if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, 0, Convert.ToDouble(txtNavlunTON.Text), 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, Convert.ToDouble(gumruklemeTON), bulkyuklemebedeli, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, "YOK", 0, "0", Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, "YOK", birdenfazlabeyanname, fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlunTON.Text), 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                    {

                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                    }
                }

            }
            else if (Request.Form["konteynerbulksecimi"] == "BULK" && Request.Form["tekliftipi"] == "CIF" && Request.Form["ihrackayit"] != "ihrackayit")
            {
                if (musteriadi == null || musteriadi == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "cariAlert()", true);
                }
                else if (double.TryParse(txtbuurununtoplamtonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamtonajalert()", true);
                }
                else if (double.TryParse(txtSiparisTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamsiparistonajialert()", true);
                }
                else if (double.TryParse(txtSigorta.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "sigortaAlert()", true);
                }
                else
                {
                    kalemmaliyet = (urunfiyat + ambalajmaliyet + gumruklemeTON + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + 0 + 0 + 0 + bulkyuklemebedeli + Convert.ToDouble(txtNavlunTON.Text) + Convert.ToDouble(txtSigorta.Text)) * vade / 100 + (urunfiyat + ambalajmaliyet + gumruklemeTON + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + 0 + 0 + 0 + bulkyuklemebedeli + Convert.ToDouble(txtNavlunTON.Text) + Convert.ToDouble(txtSigorta.Text));
                    fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + bulkyuklemebedeli + armatorlokali + gumruklemeTON) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + bulkyuklemebedeli + armatorlokali + gumruklemeTON);
                    if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, 0, Convert.ToDouble(txtNavlunTON.Text), 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, Convert.ToDouble(gumruklemeTON), bulkyuklemebedeli, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), Convert.ToDouble(txtSigorta.Text), Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, "YOK", 0, "0", Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, "YOK", birdenfazlabeyanname, fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlunTON.Text), 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                    }
                }

            }
            //RORO
            if ((Request.Form["konteynerbulksecimi"] == "RORO" && Request.Form["tekliftipi"] == "FAS" && Request.Form["ihrackayit"] != "ihrackayit") || (Request.Form["konteynerbulksecimi"] == "RORO" && Request.Form["tekliftipi"] == "FCA" && Request.Form["ihrackayit"] != "ihrackayit"))
            {


                if (musteriadi == null || musteriadi == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "cariAlert()", true);
                }
                else if (double.TryParse(txtbuurununtoplamtonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamtonajalert()", true);
                }
                else if (double.TryParse(txtSiparisTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamsiparistonajialert()", true);
                }
                else
                {
                    kalemmaliyet = (urunfiyat + ambalajmaliyet + gumruklemeTON + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + 0 + 0 + 0 + 0) * vade / 100 + (urunfiyat + ambalajmaliyet + gumruklemeTON + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + 0 + 0 + 0 + 0);

                    if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), 0, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, Convert.ToDouble(gumruklemeTON), 0, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, "YOK", 0, "0", Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, "YOK", birdenfazlabeyanname, 0, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                    }
                }


            }
            else if (Request.Form["konteynerbulksecimi"] == "RORO" && Request.Form["tekliftipi"] == "FOB" && Request.Form["ihrackayit"] != "ihrackayit")
            {
                
                if (musteriadi == null || musteriadi == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "cariAlert()", true);
                }
                else if (double.TryParse(txtbuurununtoplamtonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamtonajalert()", true);
                }
                else if (double.TryParse(txtSiparisTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamsiparistonajialert()", true);
                }
                else
                {
                    kalemmaliyet = (urunfiyat + ambalajmaliyet + gumruklemeTON + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + 0 + 0 + 0 + 0 + Convert.ToDouble(txtLimanDolum.Text)) * vade / 100 + (urunfiyat + ambalajmaliyet + gumruklemeTON + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + 0 + 0 + 0 + 0 + Convert.ToDouble(txtLimanDolum.Text));
                    fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + 0 + bulkyuklemebedeli + armatorlokali + gumruklemeTON) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + 0 + bulkyuklemebedeli + armatorlokali + gumruklemeTON);
                    if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), 0, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, Convert.ToDouble(gumruklemeTON), Convert.ToDouble(txtLimanDolum.Text), kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, "YOK", 0, "0", Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, "YOK", birdenfazlabeyanname, fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                    {

                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                    }

                }


            }

            else if ((Request.Form["konteynerbulksecimi"] == "RORO" && Request.Form["tekliftipi"] == "CFR" && Request.Form["ihrackayit"] != "ihrackayit") || (Request.Form["tekliftipi"] == "DAP" && Request.Form["konteynerbulksecimi"] == "RORO" && Request.Form["ihrackayit"] != "ihrackayit"))
            {
                if (musteriadi == null || musteriadi == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "cariAlert()", true);
                }
                else if (double.TryParse(txtbuurununtoplamtonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamtonajalert()", true);
                }
                else if (double.TryParse(txtSiparisTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamsiparistonajialert()", true);
                }
                else
                {
                    kalemmaliyet = (urunfiyat + ambalajmaliyet + gumruklemeTON + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + 0 + 0 + 0 + 0 + Convert.ToDouble(txtLimanDolum.Text) + Convert.ToDouble(txtNavlunTON.Text)) * vade / 100 + (urunfiyat + ambalajmaliyet + gumruklemeTON + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + 0 + 0 + 0 + 0 + Convert.ToDouble(txtLimanDolum.Text) + Convert.ToDouble(txtNavlunTON.Text));
                    fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + 0 + Convert.ToDouble(txtLimanDolum.Text) + armatorlokali + gumruklemeTON) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + 0 + Convert.ToDouble(txtLimanDolum.Text) + armatorlokali + gumruklemeTON);
                    if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), 0, 0, Convert.ToDouble(txtNavlunTON.Text), 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, Convert.ToDouble(gumruklemeTON), Convert.ToDouble(txtLimanDolum.Text), kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, "YOK", 0, "0", Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, "YOK", birdenfazlabeyanname, fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlunTON.Text), 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                    {

                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                    }
                }

            }
            else if (Request.Form["konteynerbulksecimi"] == "RORO" && Request.Form["tekliftipi"] == "CIF" && Request.Form["ihrackayit"] != "ihrackayit")
            {
                if (musteriadi == null || musteriadi == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "cariAlert()", true);
                }
                else if (double.TryParse(txtbuurununtoplamtonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamtonajalert()", true);
                }
                else if (double.TryParse(txtSiparisTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamsiparistonajialert()", true);
                }
                else if (double.TryParse(txtSigorta.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "sigortaAlert()", true);
                }
                else
                {
                    kalemmaliyet = (urunfiyat + ambalajmaliyet + gumruklemeTON + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + 0 + 0 + 0 + Convert.ToDouble(txtLimanDolum.Text) + Convert.ToDouble(txtNavlunTON.Text) + Convert.ToDouble(txtSigorta.Text)) * vade / 100 + (urunfiyat + ambalajmaliyet + gumruklemeTON + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + 0 + 0 + 0 + Convert.ToDouble(txtLimanDolum.Text) + Convert.ToDouble(txtNavlunTON.Text) + Convert.ToDouble(txtSigorta.Text));
                    fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye  + bulkyuklemebedeli + armatorlokali + gumruklemeTON) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + bulkyuklemebedeli + armatorlokali + gumruklemeTON);
                    if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), 0, 0, Convert.ToDouble(txtNavlunTON.Text), 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, Convert.ToDouble(gumruklemeTON), Convert.ToDouble(txtLimanDolum.Text), kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), Convert.ToDouble(txtSigorta.Text), Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, "YOK", 0, "0", Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, "YOK", birdenfazlabeyanname, fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlunTON.Text), 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                    }
                }

            }
            //parcalı sipariş 
            else if ((Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "CFR" && Request.Form["siparistipi"] == "parcalisiparis" && Request.Form["ihrackayit"] != "ihrackayit") || (Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "DAP" && Request.Form["siparistipi"] == "parcalisiparis" && Request.Form["ihrackayit"] != "ihrackayit") || (Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "CFR" && Request.Form["siparistipi"] != "parcalikonteyner" && Request.Form["ihrackayit"] != "ihrackayit") || (Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "DAP" && Request.Form["siparistipi"] != "parcalikonteyner" && Request.Form["ihrackayit"] != "ihrackayit"))
            {

                if (musteriadi == null || musteriadi == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "cariAlert()", true);
                }

                else if (double.TryParse(txtbuurununtoplamtonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamtonajalert()", true);
                }
                else if (double.TryParse(txtSiparisTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamsiparistonajialert()", true);
                }
                else if (double.TryParse(TextBoxSiperisKonteynerSayisi.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "siparisekipmansayisi()", true);
                }
                else if (double.TryParse(txtNavlun.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "navlunalert()", true);
                }
                //else if (double.TryParse(txtArmatörLokali.Text, out controlnumber) == false)
                //{
                //    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "almatorlokalialert()", true);
                //}
                else
                {
                    konteynersayisi = Convert.ToDouble(txtbuurununtoplamtonaji.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                    if (DrpKalkisLimani.Visible == false && txtArmatörLokali.Visible == false && DrpEkipmanTuru.SelectedItem.Text == "Kara Yolu" && txtNavlunTON.Visible == false)
                    {
                        double sig = 0;
                        if (txtSigorta.Text == "")
                        {
                            sig = 0;
                        }
                        else
                        {
                            sig = Convert.ToDouble(txtSigorta.Text);
                        }
                        //double konteynerGumrukleme = 0;
                        double navlun = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        double gumrukton = 0;
                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            SqlCommand karayolu = new SqlCommand("select GumruklemeKonteynerKaraYolu from Clearance", con.baglanti());
                            gumrukton = Convert.ToDouble(karayolu.ExecuteScalar()) / Convert.ToDouble(txtSiparisTonaji.Text) / Convert.ToDouble(USD);
                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) > 1)
                        {
                            SqlCommand karayolu = new SqlCommand("select GumruklemeKonteynerKaraYolu from Clearance", con.baglanti());
                            SqlCommand karayoluikiuzeri = new SqlCommand("select GumruklemeKonteynerKaraYoluikiuzeri from Clearance", con.baglanti());
                            int ikiuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            gumrukton = (Convert.ToDouble(karayolu.ExecuteScalar()) + Convert.ToDouble(karayoluikiuzeri.ExecuteScalar()) * ikiuzeri) / Convert.ToDouble(txtSiparisTonaji.Text) / Convert.ToDouble(USD);
                        }
                        kalemmaliyet = (urunfiyat + ambalajmaliyet + navlun + gumrukton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(sig)) * vade / 100 + (urunfiyat + ambalajmaliyet + navlun + gumrukton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(sig));
                        fobMaliyet = ((urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + gumrukton + Convert.ToDouble(sig)) * vade / 100) + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + gumrukton + Convert.ToDouble(sig));
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), 0, 0, navlun, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, 0, gumrukton, 0, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), Convert.ToDouble(sig), Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, "YOK", Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), "YOK", 0, parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }

                    }

                    else if (DrpKalkisLimani.SelectedItem.Text == "Limak" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")//if başladı
                    {

                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand limak20 = new SqlCommand("select ContainerFreeinLIMAK20 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(limak20.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }

                        //kalemmaliyet = urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + (armatorlokali2 / Convert.ToDouble(txtBirKonteynerTonaji.Text)) + (limandolumbedeli2/Convert.ToDouble(txtBirKonteynerTonaji.Text))+(Convert.ToDouble(txtNavlun.Text)/Convert.ToDouble(txtBirKonteynerTonaji.Text));
                        double inspection = Convert.ToDouble(txtInspectionTon.Text);
                        double komisyon = Convert.ToDouble(txtKomisyon.Text);
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);




                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        //fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        fobMaliyet = ((urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100) + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);

                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }



                    }
                    else if (DrpKalkisLimani.SelectedItem.Text == "YOK" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                      
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = 0;


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                        //if bitti



                    else if (DrpKalkisLimani.SelectedItem.Text == "Limak" && DrpEkipmanTuru.SelectedItem.Text == "40 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand limak40 = new SqlCommand("select ContainerFreeinLIMAK40 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(limak40.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }

                    else if (DrpKalkisLimani.SelectedItem.Text == "MIP" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand mip20 = new SqlCommand("select ContainerFreeinMIP20 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(mip20.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);

                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                    else if (DrpKalkisLimani.SelectedItem.Text == "MIP" && DrpEkipmanTuru.SelectedItem.Text == "40 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand mip40 = new SqlCommand("select ContainerFreeinMIP40 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(mip40.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        // navlunton2 = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                    //buraya koy
                    else if (Convert.ToString(DrpEkipmanTuru.SelectedItem.Text) == "Demir Yolu")
                    {
                        if (DrpKalkisLimani.Visible == false && txtArmatörLokali.Visible == false && Convert.ToString(DrpEkipmanTuru.SelectedItem.Text) == "Demir Yolu" && txtNavlunTON.Visible == false)
                        {
                            string siptipi;
                            if (Request.Form["siparistipi"] == null || Request.Form["siparistipi"] == "")
                            {
                                siptipi = "YOK";
                            }
                            else
                            {
                                siptipi = Request.Form["siparistipi"];
                            }
                            //double konteynerGumrukleme = 0;
                            double navlun = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                            double gumrukton = 0;
                            double sig;
                            if (txtSigorta.Text == "")
                            {
                                sig = 0;
                            }
                            else
                            {
                                sig = Convert.ToDouble(txtSigorta.Text);
                            }
                            if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                            {
                                SqlCommand demiryolu = new SqlCommand("select GumruklemeKonteynerKaraYolu from Clearance", con.baglanti());
                                gumrukton = Convert.ToDouble(demiryolu.ExecuteScalar()) / Convert.ToDouble(txtSiparisTonaji.Text) / Convert.ToDouble(USD);
                            }
                            else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) > 1)
                            {
                                SqlCommand demiryolu = new SqlCommand("select GumruklemeKonteynerDemirYolu from Clearance", con.baglanti());
                                SqlCommand demiryoluikiuzeri = new SqlCommand("select GumruklemeKonteynerDemirYoluikiuzeri from Clearance", con.baglanti());
                                int ikiuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                                gumrukton = (Convert.ToDouble(demiryolu.ExecuteScalar()) + Convert.ToDouble(demiryoluikiuzeri.ExecuteScalar()) * Convert.ToDouble(ikiuzeri)) / Convert.ToDouble(txtSiparisTonaji.Text) / Convert.ToDouble(USD);
                            }
                            SqlCommand demiryoluicnakliye = new SqlCommand("select InsideTransport from Port where PortName='Demir Yolu' ", con.baglanti());
                            double dyoluicnakliye = Convert.ToDouble(demiryoluicnakliye.ExecuteScalar());
                            kalemmaliyet = (urunfiyat + ambalajmaliyet + dyoluicnakliye + navlun + gumrukton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(sig)) * vade / 100 + (urunfiyat + dyoluicnakliye + ambalajmaliyet + navlun + gumrukton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(sig));


                            if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), 0, 0, navlun, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, dyoluicnakliye, gumrukton, 0, kalemmaliyet, "DAT", "YOK", sig, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, "YOK", Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), "YOK", 0, siptipi, "YOK", 0, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                            }
                        }
                    }


                }

            }

            else if ((Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "FOB" && Request.Form["siparistipi"] == "parcalisiparis" && Request.Form["ihrackayit"] != "ihrackayit") || (Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "FOB" && Request.Form["siparistipi"] != "parcalikonteyner" && Request.Form["ihrackayit"] != "ihrackayit"))
            {
                if (musteriadi == null || musteriadi == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "cariAlert()", true);
                }
                else if (double.TryParse(txtbuurununtoplamtonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamtonajalert()", true);
                }
                else if (double.TryParse(txtSiparisTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamsiparistonajialert()", true);
                }
                else if (double.TryParse(TextBoxSiperisKonteynerSayisi.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "siparisekipmansayisi()", true);
                }
                else if (double.TryParse(txtArmatörLokali.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "almatorlokalialert()", true);
                }
                else
                {
                    konteynersayisi = Convert.ToDouble(txtbuurununtoplamtonaji.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                    if (DrpKalkisLimani.SelectedItem.Text == "Limak" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand limak20 = new SqlCommand("select ContainerFreeinLIMAK20 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(limak20.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }

                        //kalemmaliyet = urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + (armatorlokali2 / Convert.ToDouble(txtBirKonteynerTonaji.Text)) + (limandolumbedeli2/Convert.ToDouble(txtBirKonteynerTonaji.Text))+(Convert.ToDouble(txtNavlun.Text)/Convert.ToDouble(txtBirKonteynerTonaji.Text));
                        double inspection = Convert.ToDouble(txtInspectionTon.Text);
                        double komisyon = Convert.ToDouble(txtKomisyon.Text);
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }//if bitti



                    else if (DrpKalkisLimani.SelectedItem.Text == "Limak" && DrpEkipmanTuru.SelectedItem.Text == "40 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand limak40 = new SqlCommand("select ContainerFreeinLIMAK40 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(limak40.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }

                    else if (DrpKalkisLimani.SelectedItem.Text == "MIP" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand mip20 = new SqlCommand("select ContainerFreeinMIP20 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(mip20.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }

                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        // fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        fobMaliyet = ((urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100) + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                    else if (DrpKalkisLimani.SelectedItem.Text == "MIP" && DrpEkipmanTuru.SelectedItem.Text == "40 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand mip40 = new SqlCommand("select ContainerFreeinMIP40 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(mip40.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                }

            }


            else if ((Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "FAS" && Request.Form["siparistipi"] == "parcalisiparis" && Request.Form["ihrackayit"] != "ihrackayit") || (Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "FCA" && Request.Form["siparistipi"] == "parcalisiparis" && Request.Form["ihrackayit"] != "ihrackayit") || (Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "FAS" && Request.Form["siparistipi"] != "parcalikonteyner" && Request.Form["ihrackayit"] != "ihrackayit") || (Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "FCA" && Request.Form["siparistipi"] != "parcalikonteyner" && Request.Form["ihrackayit"] != "ihrackayit"))
            {
                if (musteriadi == null || musteriadi == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "cariAlert()", true);
                }
                else if (double.TryParse(txtbuurununtoplamtonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamtonajalert()", true);
                }
                else if (double.TryParse(txtSiparisTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamsiparistonajialert()", true);
                }
                else if (double.TryParse(TextBoxSiperisKonteynerSayisi.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "siparisekipmansayisi()", true);
                }
                else
                {


                    konteynersayisi = Convert.ToDouble(txtbuurununtoplamtonaji.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                    if (DrpKalkisLimani.Visible == false && txtArmatörLokali.Visible == false && DrpEkipmanTuru.SelectedItem.Text == "Kara Yolu" && txtNavlunTON.Visible == false)
                    {
                        double gumrukton = 0;
                        double sig = 0;
                        if (txtSigorta.Text == "")
                        {
                            sig = 0;
                        }
                        else
                        {
                            sig = Convert.ToDouble(txtSigorta.Text);
                        }
                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            SqlCommand karayolu = new SqlCommand("select GumruklemeKonteynerKaraYolu from Clearance", con.baglanti());
                            gumrukton = Convert.ToDouble(karayolu.ExecuteScalar()) / Convert.ToDouble(txtSiparisTonaji.Text) / Convert.ToDouble(USD);
                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) > 1)
                        {
                            SqlCommand karayolu = new SqlCommand("select GumruklemeKonteynerKaraYolu from Clearance", con.baglanti());
                            SqlCommand karayoluikiuzeri = new SqlCommand("select GumruklemeKonteynerKaraYoluikiuzeri from Clearance", con.baglanti());
                            int ikiuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            gumrukton = (Convert.ToDouble(karayolu.ExecuteScalar()) + Convert.ToDouble(karayoluikiuzeri.ExecuteScalar()) * ikiuzeri) / Convert.ToDouble(txtSiparisTonaji.Text) / Convert.ToDouble(USD);
                        }
                        kalemmaliyet = (urunfiyat + ambalajmaliyet + 0 + gumrukton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(sig)) * vade / 100 + (urunfiyat + ambalajmaliyet + 0 + gumrukton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(sig));
                        fobMaliyet = ((urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + gumrukton + Convert.ToDouble(sig)) * vade / 100) + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + gumrukton + Convert.ToDouble(sig));
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), 0, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, 0, gumrukton, 0, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), Convert.ToDouble(sig), Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, "YOK", Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), "YOK", 0, parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }


                    }
                    if (DrpKalkisLimani.SelectedItem.Text == "Limak" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;

                        SqlCommand limak20 = new SqlCommand("select ContainerFreeinLIMAK20 from LoadingCharge", con.baglanti());
                        //armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        //limandolumbedeli2 = Convert.ToDouble(limak20.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }


                        double inspection = Convert.ToDouble(txtInspectionTon.Text);
                        double komisyon = Convert.ToDouble(txtKomisyon.Text);


                        kalemmaliyet = (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, 0, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, parcalisiparis, "YOK", 0, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }//if bitti



                    else if (DrpKalkisLimani.SelectedItem.Text == "Limak" && DrpEkipmanTuru.SelectedItem.Text == "40 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;

                        SqlCommand limak40 = new SqlCommand("select ContainerFreeinLIMAK40 from LoadingCharge", con.baglanti());



                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }

                        kalemmaliyet = (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, 0, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, parcalisiparis, "YOK", 0, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }

                    else if (DrpKalkisLimani.SelectedItem.Text == "MIP" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;

                        SqlCommand mip20 = new SqlCommand("select ContainerFreeinMIP20 from LoadingCharge", con.baglanti());


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }

                        kalemmaliyet = (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, 0, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, parcalisiparis, "YOK", 0, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                    else if (DrpKalkisLimani.SelectedItem.Text == "MIP" && DrpEkipmanTuru.SelectedItem.Text == "40 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;

                        SqlCommand mip40 = new SqlCommand("select ContainerFreeinMIP40 from LoadingCharge", con.baglanti());
                        // armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        //limandolumbedeli2 = Convert.ToDouble(mip40.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }

                        kalemmaliyet = (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, 0, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, parcalisiparis, "YOK", 0, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                }
            }
            else if ((Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "CIF" && Request.Form["siparistipi"] == "parcalisiparis" && Request.Form["ihrackayit"] != "ihrackayit") || (Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "CIF" && Request.Form["siparistipi"] != "parcalikonteyner" && Request.Form["ihrackayit"] != "ihrackayit"))
            {
                if (musteriadi == null || musteriadi == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "cariAlert()", true);
                }
                else if (double.TryParse(txtbuurununtoplamtonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamtonajalert()", true);
                }
                else if (double.TryParse(txtSiparisTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamsiparistonajialert()", true);
                }
                else if (double.TryParse(TextBoxSiperisKonteynerSayisi.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "siparisekipmansayisi()", true);
                }
                else if (double.TryParse(txtArmatörLokali.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "almatorlokalialert()", true);
                }
                else if (double.TryParse(txtSigorta.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "sigortaAlert()", true);
                }
                else
                {


                    konteynersayisi = Convert.ToDouble(txtbuurununtoplamtonaji.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                    if (DrpKalkisLimani.SelectedItem.Text == "Limak" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand limak20 = new SqlCommand("select ContainerFreeinLIMAK20 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(limak20.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        navlunton2 = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }

                        //kalemmaliyet = urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + (armatorlokali2 / Convert.ToDouble(txtBirKonteynerTonaji.Text)) + (limandolumbedeli2/Convert.ToDouble(txtBirKonteynerTonaji.Text))+(Convert.ToDouble(txtNavlun.Text)/Convert.ToDouble(txtBirKonteynerTonaji.Text));
                        double inspection = Convert.ToDouble(txtInspectionTon.Text);
                        double komisyon = Convert.ToDouble(txtKomisyon.Text);
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(txtSigorta.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(txtSigorta.Text));
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), Convert.ToDouble(txtSigorta.Text), Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }//if bitti



                    else if (DrpKalkisLimani.SelectedItem.Text == "Limak" && DrpEkipmanTuru.SelectedItem.Text == "40 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand limak40 = new SqlCommand("select ContainerFreeinLIMAK40 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(limak40.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        navlunton2 = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(txtSigorta.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(txtSigorta.Text));
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), Convert.ToDouble(txtSigorta.Text), Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }

                    else if (DrpKalkisLimani.SelectedItem.Text == "MIP" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand mip20 = new SqlCommand("select ContainerFreeinMIP20 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(mip20.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        navlunton2 = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(txtSigorta.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(txtSigorta.Text));
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), Convert.ToDouble(txtSigorta.Text), Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                    else if (DrpKalkisLimani.SelectedItem.Text == "MIP" && DrpEkipmanTuru.SelectedItem.Text == "40 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand mip40 = new SqlCommand("select ContainerFreeinMIP40 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(mip40.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        navlunton2 = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(txtSigorta.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(txtSigorta.Text));
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), Convert.ToDouble(txtSigorta.Text), Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), 0, parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                }
            }
            else if ((Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "EXW" && Request.Form["siparistipi"] == "parcalisiparis" && Request.Form["ihrackayit"] != "ihrackayit") || (Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "EXW" && Request.Form["siparistipi"] != "parcalikonteyner" && Request.Form["ihrackayit"] != "ihrackayit"))
            {

                if (musteriadi == null || musteriadi == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "cariAlert()", true);
                }
                else if (double.TryParse(txtbuurununtoplamtonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamtonajalert()", true);
                }
                else if (double.TryParse(txtSiparisTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamsiparistonajialert()", true);
                }
                else if (double.TryParse(TextBoxSiperisKonteynerSayisi.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "siparisekipmansayisi()", true);
                }
                else
                {


                    konteynersayisi = Convert.ToDouble(txtbuurununtoplamtonaji.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                    double konteynerGUMRUKLEME = 0;

                    SqlCommand limak20 = new SqlCommand("select ContainerFreeinLIMAK20 from LoadingCharge", con.baglanti());



                    if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                    {
                        konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                    }
                    else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                    {
                        int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                        konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                    }
                    else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                    {
                        int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                        int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                        konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                    }

                    //kalemmaliyet = urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + (armatorlokali2 / Convert.ToDouble(txtBirKonteynerTonaji.Text)) + (limandolumbedeli2/Convert.ToDouble(txtBirKonteynerTonaji.Text))+(Convert.ToDouble(txtNavlun.Text)/Convert.ToDouble(txtBirKonteynerTonaji.Text));
                    double inspection = Convert.ToDouble(txtInspectionTon.Text);
                    double komisyon = Convert.ToDouble(txtKomisyon.Text);
                    // armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                    kalemmaliyet = (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                    if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, 0, konteynerGUMRUKLEME, 0, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), "YOK", 0, parcalisiparis, "YOK", 0, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                    }
                }//if bitti

            }














        //16+4
            else if ((Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "CFR" && (Request.Form["siparistipi"] == "parcalikonteyner" && Request.Form["onaltidort"] == "onaltidort" && Request.Form["ihrackayit"] != "ihrackayit")) || (Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "DAP" && (Request.Form["siparistipi"] == "parcalikonteyner" && Request.Form["onaltidort"] == "onaltidort" && Request.Form["ihrackayit"] != "ihrackayit")))
            {
                if (musteriadi == null || musteriadi == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "cariAlert()", true);
                }
                else if (double.TryParse(txtbuurununtoplamtonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamtonajalert()", true);
                }
                else if (double.TryParse(txtSiparisTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamsiparistonajialert()", true);
                }
                else if (double.TryParse(TextBoxSiperisKonteynerSayisi.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "siparisekipmansayisi()", true);
                }
                else
                {

                    konteynersayisi = Convert.ToDouble(txtbuurununtoplamtonaji.Text) / Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text);

                    if (DrpKalkisLimani.SelectedItem.Text == "Limak" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand limak20 = new SqlCommand("select ContainerFreeinLIMAK20 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(limak20.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }

                        //kalemmaliyet = urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + (armatorlokali2 / Convert.ToDouble(txtBirKonteynerTonaji.Text)) + (limandolumbedeli2/Convert.ToDouble(txtBirKonteynerTonaji.Text))+(Convert.ToDouble(txtNavlun.Text)/Convert.ToDouble(txtBirKonteynerTonaji.Text));
                        double inspection = Convert.ToDouble(txtInspectionTon.Text);
                        double komisyon = Convert.ToDouble(txtKomisyon.Text);
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        if (db.sepeteEkle2(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(Request.Form["onaltidort"]), "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, vade, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(Request.Form["urundetay"]), Convert.ToString(Request.Form["urundetay2"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }//if bitti



                    else if (DrpKalkisLimani.SelectedItem.Text == "Limak" && DrpEkipmanTuru.SelectedItem.Text == "40 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand limak40 = new SqlCommand("select ContainerFreeinLIMAK40 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(limak40.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        if (db.sepeteEkle2(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(Request.Form["onaltidort"]), "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, vade, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(Request.Form["urundetay"]), Convert.ToString(Request.Form["urundetay2"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }

                    else if (DrpKalkisLimani.SelectedItem.Text == "MIP" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand mip20 = new SqlCommand("select ContainerFreeinMIP20 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(mip20.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        //navlunton2 = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);
                        }
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        if (db.sepeteEkle2(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(Request.Form["onaltidort"]), "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, vade, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(Request.Form["urundetay"]), Convert.ToString(Request.Form["urundetay2"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                    else if (DrpKalkisLimani.SelectedItem.Text == "MIP" && DrpEkipmanTuru.SelectedItem.Text == "40 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand mip40 = new SqlCommand("select ContainerFreeinMIP40 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(mip40.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        // navlunton2 = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        if (db.sepeteEkle2(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(Request.Form["onaltidort"]), "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, vade, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(Request.Form["urundetay"]), Convert.ToString(Request.Form["urundetay2"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                }
            }

            else if ((Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "FOB" && (Request.Form["siparistipi"] == "parcalikonteyner" && Request.Form["onaltidort"] == "onaltidort" && Request.Form["ihrackayit"] != "ihrackayit")) || (Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "FOB" && (Request.Form["siparistipi"] == "parcalikonteyner" && Request.Form["onaltidort"] == "onaltidort" && Request.Form["ihrackayit"] != "ihrackayit")))
            {
                if (musteriadi == null || musteriadi == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "cariAlert()", true);
                }
                else if (double.TryParse(txtbuurununtoplamtonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamtonajalert()", true);
                }
                else if (double.TryParse(txtSiparisTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamsiparistonajialert()", true);
                }
                else if (double.TryParse(TextBoxSiperisKonteynerSayisi.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "siparisekipmansayisi()", true);
                }
                else if (double.TryParse(txtArmatörLokali.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "almatorlokalialert()", true);
                }
                else if (double.TryParse(txtBukaleminBuKonteynerdekiTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "buurununnuekipmandakitonajiAlert()", true);
                }
                else
                {


                    konteynersayisi = Convert.ToDouble(txtbuurununtoplamtonaji.Text) / Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text);
                    if (DrpKalkisLimani.SelectedItem.Text == "Limak" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand limak20 = new SqlCommand("select ContainerFreeinLIMAK20 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(limak20.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }

                        //kalemmaliyet = urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + (armatorlokali2 / Convert.ToDouble(txtBirKonteynerTonaji.Text)) + (limandolumbedeli2/Convert.ToDouble(txtBirKonteynerTonaji.Text))+(Convert.ToDouble(txtNavlun.Text)/Convert.ToDouble(txtBirKonteynerTonaji.Text));
                        double inspection = Convert.ToDouble(txtInspectionTon.Text);
                        double komisyon = Convert.ToDouble(txtKomisyon.Text);
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        if (db.sepeteEkle2(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(Request.Form["onaltidort"]), "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, vade, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(Request.Form["urundetay"]), Convert.ToString(Request.Form["urundetay2"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }//if bitti



                    else if (DrpKalkisLimani.SelectedItem.Text == "Limak" && DrpEkipmanTuru.SelectedItem.Text == "40 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand limak40 = new SqlCommand("select ContainerFreeinLIMAK40 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(limak40.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text));
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        if (db.sepeteEkle2(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(Request.Form["onaltidort"]), "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, vade, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(Request.Form["urundetay"]), Convert.ToString(Request.Form["urundetay2"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }

                    else if (DrpKalkisLimani.SelectedItem.Text == "MIP" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand mip20 = new SqlCommand("select ContainerFreeinMIP20 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(mip20.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + 0) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + 0);
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        if (db.sepeteEkle2(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(Request.Form["onaltidort"]), "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, vade, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(Request.Form["urundetay"]), Convert.ToString(Request.Form["urundetay2"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                    else if (DrpKalkisLimani.SelectedItem.Text == "MIP" && DrpEkipmanTuru.SelectedItem.Text == "40 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand mip40 = new SqlCommand("select ContainerFreeinMIP40 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(mip40.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + 0) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + 0);
                        if (db.sepeteEkle2(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(Request.Form["onaltidort"]), "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, vade, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(Request.Form["urundetay"]), Convert.ToString(Request.Form["urundetay2"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                }

            }
            else if ((Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "FAS" && Request.Form["siparistipi"] == "parcalikonteyner" && Request.Form["onaltidort"] == "onaltidort" && Request.Form["ihrackayit"] != "ihrackayit") || (Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "FCA" && Request.Form["siparistipi"] == "parcalikonteyner" && Request.Form["onaltidort"] == "onaltidort" && Request.Form["ihrackayit"] != "ihrackayit") || (Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "FAS" && Request.Form["onaltidort"] == "onaltidort" && Request.Form["siparistipi"] == "parcalikonteyner" && Request.Form["ihrackayit"] != "ihrackayit") || (Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "FCA" && Request.Form["onaltidort"] == "onaltidort" && Request.Form["siparistipi"] == "parcalikonteyner" && Request.Form["ihrackayit"] != "ihrackayit"))
            {
                if (musteriadi == null || musteriadi == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "cariAlert()", true);
                }
                else if (double.TryParse(txtbuurununtoplamtonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamtonajalert()", true);
                }
                else if (double.TryParse(txtSiparisTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamsiparistonajialert()", true);
                }
                else if (double.TryParse(TextBoxSiperisKonteynerSayisi.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "siparisekipmansayisi()", true);
                }
                else if (double.TryParse(txtBukaleminBuKonteynerdekiTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "buurununnuekipmandakitonajiAlert()", true);
                }
                else
                {
                    konteynersayisi = Convert.ToDouble(txtbuurununtoplamtonaji.Text) / Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text);

                    if (DrpKalkisLimani.Visible == false && txtArmatörLokali.Visible == false && DrpEkipmanTuru.SelectedItem.Text == "Kara Yolu" && txtNavlunTON.Visible == false)
                    {
                        //double konteynerGumrukleme = 0;
                        //double navlun = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        double gumrukton = 0;
                        double sig = 0;
                        if (txtSigorta.Text == "")
                        {
                            sig = 0;
                        }
                        else
                        {
                            sig = Convert.ToDouble(txtSigorta.Text);
                        }
                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            SqlCommand karayolu = new SqlCommand("select GumruklemeKonteynerKaraYolu from Clearance", con.baglanti());
                            gumrukton = Convert.ToDouble(karayolu.ExecuteScalar()) / Convert.ToDouble(txtSiparisTonaji.Text) / Convert.ToDouble(USD);
                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) > 1)
                        {
                            SqlCommand karayolu = new SqlCommand("select GumruklemeKonteynerKaraYolu from Clearance", con.baglanti());
                            SqlCommand karayoluikiuzeri = new SqlCommand("select GumruklemeKonteynerKaraYoluikiuzeri from Clearance", con.baglanti());
                            int ikiuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            gumrukton = (Convert.ToDouble(karayolu.ExecuteScalar()) + Convert.ToDouble(karayoluikiuzeri.ExecuteScalar()) * ikiuzeri) / Convert.ToDouble(txtSiparisTonaji.Text) / Convert.ToDouble(USD);
                        }
                        kalemmaliyet = (urunfiyat + ambalajmaliyet + 0 + gumrukton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(sig)) * vade / 100 + (urunfiyat + ambalajmaliyet + 0 + gumrukton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(sig));
                        fobMaliyet = ((urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + gumrukton + Convert.ToDouble(sig)) * vade / 100) + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + gumrukton + Convert.ToDouble(sig));
                        if (db.sepeteEkle2(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), 0, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, 0, gumrukton, 0, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), Convert.ToDouble(sig), Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, "YOK", Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), "YOK", Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(Request.Form["onaltidort"]), "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, vade, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(Request.Form["urundetay"]), Convert.ToString(Request.Form["urundetay2"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }


                    }
                    if (DrpKalkisLimani.SelectedItem.Text == "Limak" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        SqlCommand limak20 = new SqlCommand("select ContainerFreeinLIMAK20 from LoadingCharge", con.baglanti());
                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        double inspection = Convert.ToDouble(txtInspectionTon.Text);
                        double komisyon = Convert.ToDouble(txtKomisyon.Text);
                        kalemmaliyet = (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        if (db.sepeteEkle2(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, 0, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(Request.Form["onaltidort"]), "YOK", 0, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, vade, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(Request.Form["urundetay"]), Convert.ToString(Request.Form["urundetay2"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }//if bitti
                    else if (DrpKalkisLimani.SelectedItem.Text == "Limak" && DrpEkipmanTuru.SelectedItem.Text == "40 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;

                        SqlCommand limak40 = new SqlCommand("select ContainerFreeinLIMAK40 from LoadingCharge", con.baglanti());



                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }

                        kalemmaliyet = (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        if (db.sepeteEkle2(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, 0, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(Request.Form["onaltidort"]), "YOK", 0, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, vade, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(Request.Form["urundetay"]), Convert.ToString(Request.Form["urundetay2"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }

                    else if (DrpKalkisLimani.SelectedItem.Text == "MIP" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;

                        SqlCommand mip20 = new SqlCommand("select ContainerFreeinMIP20 from LoadingCharge", con.baglanti());


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        kalemmaliyet = (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));

                        if (db.sepeteEkle2(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, 0, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(Request.Form["onaltidort"]), "YOK", 0, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, vade, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(Request.Form["urundetay"]), Convert.ToString(Request.Form["urundetay2"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                    else if (DrpKalkisLimani.SelectedItem.Text == "MIP" && DrpEkipmanTuru.SelectedItem.Text == "40 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;

                        SqlCommand mip40 = new SqlCommand("select ContainerFreeinMIP40 from LoadingCharge", con.baglanti());
                        // armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        //limandolumbedeli2 = Convert.ToDouble(mip40.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        kalemmaliyet = (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));

                        if (db.sepeteEkle2(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, 0, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(Request.Form["onaltidort"]), "YOK", 0, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, vade, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(Request.Form["urundetay"]), Convert.ToString(Request.Form["urundetay2"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                }
            }
            else if ((Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "CIF" && Request.Form["siparistipi"] == "parcalikonteyner" && Request.Form["onaltidort"] == "onaltidort" && Request.Form["ihrackayit"] != "ihrackayit") || (Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "CIF" && Request.Form["onaltidort"] == "onaltidort" && Request.Form["siparistipi"] == "parcalikonteyner" && Request.Form["ihrackayit"] != "ihrackayit"))
            {
                if (musteriadi == null || musteriadi == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "cariAlert()", true);
                }
                else if (double.TryParse(txtbuurununtoplamtonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamtonajalert()", true);
                }
                else if (double.TryParse(txtSiparisTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamsiparistonajialert()", true);
                }
                else if (double.TryParse(TextBoxSiperisKonteynerSayisi.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "siparisekipmansayisi()", true);
                }
                else if (double.TryParse(txtArmatörLokali.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "almatorlokalialert()", true);
                }
                else if (double.TryParse(txtSigorta.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "sigortaAlert()", true);
                }
                else if (double.TryParse(txtBukaleminBuKonteynerdekiTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "buurununnuekipmandakitonajiAlert()", true);
                }
                else
                {
                    konteynersayisi = Convert.ToDouble(txtbuurununtoplamtonaji.Text) / Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text);
                    if (DrpKalkisLimani.SelectedItem.Text == "Limak" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand limak20 = new SqlCommand("select ContainerFreeinLIMAK20 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(limak20.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        navlunton2 = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }

                        //kalemmaliyet = urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + (armatorlokali2 / Convert.ToDouble(txtBirKonteynerTonaji.Text)) + (limandolumbedeli2/Convert.ToDouble(txtBirKonteynerTonaji.Text))+(Convert.ToDouble(txtNavlun.Text)/Convert.ToDouble(txtBirKonteynerTonaji.Text));
                        double inspection = Convert.ToDouble(txtInspectionTon.Text);
                        double komisyon = Convert.ToDouble(txtKomisyon.Text);
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(txtSigorta.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(txtSigorta.Text));
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        if (db.sepeteEkle2(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), Convert.ToDouble(txtSigorta.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(Request.Form["onaltidort"]), "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, vade, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(Request.Form["urundetay"]), Convert.ToString(Request.Form["urundetay2"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }//if bitti



                    else if (DrpKalkisLimani.SelectedItem.Text == "Limak" && DrpEkipmanTuru.SelectedItem.Text == "40 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand limak40 = new SqlCommand("select ContainerFreeinLIMAK40 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(limak40.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        navlunton2 = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(txtSigorta.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(txtSigorta.Text));
                        if (db.sepeteEkle2(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), Convert.ToDouble(txtSigorta.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(Request.Form["onaltidort"]), "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, vade, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(Request.Form["urundetay"]), Convert.ToString(Request.Form["urundetay2"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }

                    else if (DrpKalkisLimani.SelectedItem.Text == "MIP" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand mip20 = new SqlCommand("select ContainerFreeinMIP20 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(mip20.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        navlunton2 = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(txtSigorta.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(txtSigorta.Text));
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        if (db.sepeteEkle2(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), Convert.ToDouble(txtSigorta.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(Request.Form["onaltidort"]), "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, vade, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(Request.Form["urundetay"]), Convert.ToString(Request.Form["urundetay2"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                    else if (DrpKalkisLimani.SelectedItem.Text == "MIP" && DrpEkipmanTuru.SelectedItem.Text == "40 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand mip40 = new SqlCommand("select ContainerFreeinMIP40 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(mip40.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        navlunton2 = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(txtSigorta.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(txtSigorta.Text));
                        if (db.sepeteEkle2(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), Convert.ToDouble(txtSigorta.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(Request.Form["onaltidort"]), "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, vade, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(Request.Form["urundetay"]), Convert.ToString(Request.Form["urundetay2"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                }
            }
            else if ((Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "EXW" && Request.Form["siparistipi"] == "parcalikonteyner" && Request.Form["onaltidort"] == "onaltidort" && Request.Form["ihrackayit"] != "ihrackayit") || (Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "EXW" && Request.Form["onaltidort"] == "onaltidort" && Request.Form["siparistipi"] == "parcalikonteyner" && Request.Form["ihrackayit"] != "ihrackayit"))
            {
                if (musteriadi == null || musteriadi == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "carialert()", true);
                }
                else if (double.TryParse(txtbuurununtoplamtonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamtonajalert()", true);
                }
                else if (double.TryParse(txtSiparisTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamsiparistonajialert()", true);
                }
                else if (double.TryParse(TextBoxSiperisKonteynerSayisi.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "siparisekipmansayisi()", true);
                }
                else if (double.TryParse(txtBukaleminBuKonteynerdekiTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "buurununnuekipmandakitonajiAlert()", true);
                }
                konteynersayisi = Convert.ToDouble(txtbuurununtoplamtonaji.Text) / Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text);

                double konteynerGUMRUKLEME = 0;

                SqlCommand limak20 = new SqlCommand("select ContainerFreeinLIMAK20 from LoadingCharge", con.baglanti());



                if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                {
                    konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                }
                else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                {
                    int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                    konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                }
                else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                {
                    int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                    int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                    konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                }

                //kalemmaliyet = urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + (armatorlokali2 / Convert.ToDouble(txtBirKonteynerTonaji.Text)) + (limandolumbedeli2/Convert.ToDouble(txtBirKonteynerTonaji.Text))+(Convert.ToDouble(txtNavlun.Text)/Convert.ToDouble(txtBirKonteynerTonaji.Text));
                double inspection = Convert.ToDouble(txtInspectionTon.Text);
                double komisyon = Convert.ToDouble(txtKomisyon.Text);
                // armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                kalemmaliyet = (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                if (db.sepeteEkle2(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, 0, konteynerGUMRUKLEME, 0, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), "YOK", Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(Request.Form["onaltidort"]), "YOK", 0, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, vade, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(Request.Form["urundetay"]), Convert.ToString(Request.Form["urundetay2"]), urunmaliyet, vade, "HAYIR") == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                }
            }//i


            else if (Convert.ToString(DrpEkipmanTuru.SelectedItem.Text) == "Demir Yolu")
            {
                if (DrpKalkisLimani.Visible == false && txtArmatörLokali.Visible == false && Convert.ToString(DrpEkipmanTuru.SelectedItem.Text) == "Demir Yolu" && txtNavlunTON.Visible == false)
                {
                    string siptipi;
                    if (Request.Form["siparistipi"] == null || Request.Form["siparistipi"] == "")
                    {
                        siptipi = "YOK";
                    }
                    else
                    {
                        siptipi = Request.Form["siparistipi"];
                    }
                    //double konteynerGumrukleme = 0;
                    double navlun = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                    double gumrukton = 0;
                    double sig;
                    if (txtSigorta.Text == "")
                    {
                        sig = 0;
                    }
                    else
                    {
                        sig = Convert.ToDouble(txtSigorta.Text);
                    }
                    if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                    {
                        SqlCommand demiryolu = new SqlCommand("select GumruklemeKonteynerKaraYolu from Clearance", con.baglanti());
                        gumrukton = Convert.ToDouble(demiryolu.ExecuteScalar()) / Convert.ToDouble(txtSiparisTonaji.Text) / Convert.ToDouble(USD);
                    }
                    else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) > 1)
                    {
                        SqlCommand demiryolu = new SqlCommand("select GumruklemeKonteynerDemirYolu from Clearance", con.baglanti());
                        SqlCommand demiryoluikiuzeri = new SqlCommand("select GumruklemeKonteynerDemirYoluikiuzeri from Clearance", con.baglanti());
                        int ikiuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                        gumrukton = (Convert.ToDouble(demiryolu) + Convert.ToDouble(demiryoluikiuzeri) * ikiuzeri) / Convert.ToDouble(txtSiparisTonaji.Text) / Convert.ToDouble(USD);
                    }
                    SqlCommand demiryoluicnakliye = new SqlCommand("select InsideTransport from Port where PortName='Demir Yolu' ", con.baglanti());
                    double dyoluicnakliye = Convert.ToDouble(demiryoluicnakliye.ExecuteScalar());
                    kalemmaliyet = (urunfiyat + ambalajmaliyet + dyoluicnakliye + navlun + gumrukton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(sig)) * vade / 100 + (urunfiyat + dyoluicnakliye + ambalajmaliyet + navlun + gumrukton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(sig));


                    if (db.sepeteEkle2(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), 0, 0, navlun, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, dyoluicnakliye, gumrukton, 0, kalemmaliyet, "DAT", "YOK", sig, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, "YOK", Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), "YOK", 0, siptipi, "YOK", 0, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, vade, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(Request.Form["urundetay"]), Convert.ToString(Request.Form["urundetay2"]), urunmaliyet, vade, "HAYIR") == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                    }
                }
            }






















































            //parçalı konteyner

            else if ((Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "CFR" && Request.Form["siparistipi"] == "parcalikonteyner" && Request.Form["ihrackayit"] != "ihrackayit" && Request.Form["onaltidort"] != "onaltidort") || (Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "DAP" && Request.Form["siparistipi"] == "parcalikonteyner" && Request.Form["ihrackayit"] != "ihrackayit" && Request.Form["onaltidort"] != "onaltidort"))
            {
                if (musteriadi == null || musteriadi == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "cariAlert()", true);
                }
                else if (double.TryParse(txtbuurununtoplamtonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamtonajalert()", true);
                }
                else if (double.TryParse(txtSiparisTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamsiparistonajialert()", true);
                }
                else if (double.TryParse(TextBoxSiperisKonteynerSayisi.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "siparisekipmansayisi()", true);
                }
                else
                {
                    //konteynersayisi = Convert.ToDouble(txtbuurununtoplamtonaji.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                    konteynersayisi = Convert.ToDouble(txtbuurununtoplamtonaji.Text) / Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text);
                    if (DrpKalkisLimani.Visible == false && txtArmatörLokali.Visible == false && DrpEkipmanTuru.SelectedItem.Text == "Kara Yolu" && txtNavlunTON.Visible == false)
                    {
                        //double konteynerGumrukleme = 0;
                        double navlun = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        double gumrukton = 0;
                        double sig = 0;
                        if (txtSigorta.Text == "")
                        {
                            sig = 0;
                        }
                        else
                        {
                            sig = Convert.ToDouble(txtSigorta.Text);
                        }
                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            SqlCommand karayolu = new SqlCommand("select GumruklemeKonteynerKaraYolu from Clearance", con.baglanti());
                            gumrukton = Convert.ToDouble(karayolu.ExecuteScalar()) / Convert.ToDouble(txtSiparisTonaji.Text) / Convert.ToDouble(USD);
                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) > 1)
                        {
                            SqlCommand karayolu = new SqlCommand("select GumruklemeKonteynerKaraYolu from Clearance", con.baglanti());
                            SqlCommand karayoluikiuzeri = new SqlCommand("select GumruklemeKonteynerKaraYoluikiuzeri from Clearance", con.baglanti());
                            int ikiuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            gumrukton = (Convert.ToDouble(karayolu.ExecuteScalar()) + Convert.ToDouble(karayoluikiuzeri.ExecuteScalar()) * ikiuzeri) / Convert.ToDouble(txtSiparisTonaji.Text) / Convert.ToDouble(USD);
                        }
                        kalemmaliyet = (urunfiyat + ambalajmaliyet + navlun + gumrukton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(sig)) * vade / 100 + (urunfiyat + ambalajmaliyet + navlun + gumrukton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(sig));
                        fobMaliyet = ((urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + gumrukton + Convert.ToDouble(sig)) * vade / 100) + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + gumrukton + Convert.ToDouble(sig));
                        if (Request.Form["tekliftipi"] == "CFR")
                        {
                            if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), 0, 0, navlun, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, 0, gumrukton, 0, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), Convert.ToDouble(sig), Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, "YOK", Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), "YOK", 0, parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                            }
                        }
                        else if (Request.Form["tekliftipi"] == "DAP")
                        {
                            if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), 0, 0, navlun, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, 0, gumrukton, 0, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), Convert.ToDouble(sig), Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, "YOK", Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), "YOK", 0, parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                            }
                        }


                    }

                    else if (DrpKalkisLimani.SelectedItem.Text == "Limak" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand limak20 = new SqlCommand("select ContainerFreeinLIMAK20 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(limak20.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }

                        //kalemmaliyet = urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + (armatorlokali2 / Convert.ToDouble(txtBirKonteynerTonaji.Text)) + (limandolumbedeli2/Convert.ToDouble(txtBirKonteynerTonaji.Text))+(Convert.ToDouble(txtNavlun.Text)/Convert.ToDouble(txtBirKonteynerTonaji.Text));
                        double inspection = Convert.ToDouble(txtInspectionTon.Text);
                        double komisyon = Convert.ToDouble(txtKomisyon.Text);
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }//if bitti



                    else if (DrpKalkisLimani.SelectedItem.Text == "Limak" && DrpEkipmanTuru.SelectedItem.Text == "40 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand limak40 = new SqlCommand("select ContainerFreeinLIMAK40 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(limak40.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }

                    else if (DrpKalkisLimani.SelectedItem.Text == "MIP" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand mip20 = new SqlCommand("select ContainerFreeinMIP20 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(mip20.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        //navlunton2 = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                    else if (DrpKalkisLimani.SelectedItem.Text == "MIP" && DrpEkipmanTuru.SelectedItem.Text == "40 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand mip40 = new SqlCommand("select ContainerFreeinMIP40 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(mip40.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        // navlunton2 = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                }
            }

            else if ((Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "FOB" && Request.Form["siparistipi"] == "parcalikonteyner" && Request.Form["ihrackayit"] != "ihrackayit" && Request.Form["onaltidort"] != "onaltidort"))
            {
                if (musteriadi == null || musteriadi == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "cariAlert()", true);
                }
                else if (double.TryParse(txtbuurununtoplamtonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamtonajalert()", true);
                }
                else if (double.TryParse(txtSiparisTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamsiparistonajialert()", true);
                }
                else if (double.TryParse(TextBoxSiperisKonteynerSayisi.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "siparisekipmansayisi()", true);
                }
                else if (double.TryParse(txtArmatörLokali.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "almatorlokalialert()", true);
                }
                else if (double.TryParse(txtBukaleminBuKonteynerdekiTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "buurununnuekipmandakitonajiAlert()", true);
                }
                else
                {


                    konteynersayisi = Convert.ToDouble(txtbuurununtoplamtonaji.Text) / Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text);
                    if (DrpKalkisLimani.SelectedItem.Text == "Limak" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand limak20 = new SqlCommand("select ContainerFreeinLIMAK20 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(limak20.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }

                        //kalemmaliyet = urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + (armatorlokali2 / Convert.ToDouble(txtBirKonteynerTonaji.Text)) + (limandolumbedeli2/Convert.ToDouble(txtBirKonteynerTonaji.Text))+(Convert.ToDouble(txtNavlun.Text)/Convert.ToDouble(txtBirKonteynerTonaji.Text));
                        double inspection = Convert.ToDouble(txtInspectionTon.Text);
                        double komisyon = Convert.ToDouble(txtKomisyon.Text);
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }//if bitti



                    else if (DrpKalkisLimani.SelectedItem.Text == "Limak" && DrpEkipmanTuru.SelectedItem.Text == "40 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand limak40 = new SqlCommand("select ContainerFreeinLIMAK40 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(limak40.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text));
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }

                    else if (DrpKalkisLimani.SelectedItem.Text == "MIP" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand mip20 = new SqlCommand("select ContainerFreeinMIP20 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(mip20.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + 0) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + 0);
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                    else if (DrpKalkisLimani.SelectedItem.Text == "MIP" && DrpEkipmanTuru.SelectedItem.Text == "40 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand mip40 = new SqlCommand("select ContainerFreeinMIP40 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(mip40.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + 0) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + 0);
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                }

            }
            else if ((Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "FAS" && Request.Form["siparistipi"] == "parcalikonteyner" && Request.Form["ihrackayit"] != "ihrackayit" && Request.Form["onaltidort"] != "onaltidort") || (Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "FCA" && Request.Form["siparistipi"] == "parcalikonteyner" && Request.Form["ihrackayit"] != "ihrackayit" && Request.Form["onaltidort"] != "onaltidort"))
            {
                if (musteriadi == null || musteriadi == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "cariAlert()", true);
                }
                else if (double.TryParse(txtbuurununtoplamtonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamtonajalert()", true);
                }
                else if (double.TryParse(txtSiparisTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamsiparistonajialert()", true);
                }
                else if (double.TryParse(TextBoxSiperisKonteynerSayisi.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "siparisekipmansayisi()", true);
                }
                else if (double.TryParse(txtBukaleminBuKonteynerdekiTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "buurununnuekipmandakitonajiAlert()", true);
                }
                else
                {


                    konteynersayisi = Convert.ToDouble(txtbuurununtoplamtonaji.Text) / Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text);

                    if (DrpKalkisLimani.Visible == false && txtArmatörLokali.Visible == false && DrpEkipmanTuru.SelectedItem.Text == "Kara Yolu" && txtNavlunTON.Visible == false)
                    {
                        //double konteynerGumrukleme = 0;
                        //double navlun = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        double gumrukton = 0;
                        double sig = 0;
                        if (txtSigorta.Text == "")
                        {
                            sig = 0;
                        }
                        else
                        {
                            sig = Convert.ToDouble(txtSigorta.Text);
                        }
                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            SqlCommand karayolu = new SqlCommand("select GumruklemeKonteynerKaraYolu from Clearance", con.baglanti());
                            gumrukton = Convert.ToDouble(karayolu.ExecuteScalar()) / Convert.ToDouble(txtSiparisTonaji.Text) / Convert.ToDouble(USD);
                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) > 1)
                        {
                            SqlCommand karayolu = new SqlCommand("select GumruklemeKonteynerKaraYolu from Clearance", con.baglanti());
                            SqlCommand karayoluikiuzeri = new SqlCommand("select GumruklemeKonteynerKaraYoluikiuzeri from Clearance", con.baglanti());
                            int ikiuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            gumrukton = (Convert.ToDouble(karayolu.ExecuteScalar()) + Convert.ToDouble(karayoluikiuzeri.ExecuteScalar()) * ikiuzeri) / Convert.ToDouble(txtSiparisTonaji.Text) / Convert.ToDouble(USD);
                        }
                        kalemmaliyet = (urunfiyat + ambalajmaliyet + 0 + gumrukton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(sig)) * vade / 100 + (urunfiyat + ambalajmaliyet + 0 + gumrukton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(sig));
                        fobMaliyet = ((urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + gumrukton + Convert.ToDouble(sig)) * vade / 100) + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + gumrukton + Convert.ToDouble(sig));
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), 0, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, 0, gumrukton, 0, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), Convert.ToDouble(sig), Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, "YOK", Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), "YOK", Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }


                    }
                    if (DrpKalkisLimani.SelectedItem.Text == "Limak" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;

                        SqlCommand limak20 = new SqlCommand("select ContainerFreeinLIMAK20 from LoadingCharge", con.baglanti());
                        //armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        //limandolumbedeli2 = Convert.ToDouble(limak20.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }


                        double inspection = Convert.ToDouble(txtInspectionTon.Text);
                        double komisyon = Convert.ToDouble(txtKomisyon.Text);


                        kalemmaliyet = (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, 0, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), parcalisiparis, "YOK", 0, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }//if bitti
                    else if (DrpKalkisLimani.SelectedItem.Text == "Limak" && DrpEkipmanTuru.SelectedItem.Text == "40 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;

                        SqlCommand limak40 = new SqlCommand("select ContainerFreeinLIMAK40 from LoadingCharge", con.baglanti());



                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }

                        kalemmaliyet = (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, 0, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), parcalisiparis, "YOK", 0, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }

                    else if (DrpKalkisLimani.SelectedItem.Text == "MIP" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;

                        SqlCommand mip20 = new SqlCommand("select ContainerFreeinMIP20 from LoadingCharge", con.baglanti());


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        kalemmaliyet = (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));

                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, 0, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), parcalisiparis, "YOK", 0, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                    else if (DrpKalkisLimani.SelectedItem.Text == "MIP" && DrpEkipmanTuru.SelectedItem.Text == "40 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;

                        SqlCommand mip40 = new SqlCommand("select ContainerFreeinMIP40 from LoadingCharge", con.baglanti());
                        // armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        //limandolumbedeli2 = Convert.ToDouble(mip40.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        kalemmaliyet = (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));

                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, 0, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), parcalisiparis, "YOK", 0, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                }
            }
            else if ((Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "CIF" && Request.Form["siparistipi"] == "parcalikonteyner" && Request.Form["ihrackayit"] != "ihrackayit" && Request.Form["onaltidort"] != "onaltidort"))
            {
                if (musteriadi == null || musteriadi == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "cariAlert()", true);
                }
                else if (double.TryParse(txtbuurununtoplamtonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamtonajalert()", true);
                }
                else if (double.TryParse(txtSiparisTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamsiparistonajialert()", true);
                }
                else if (double.TryParse(TextBoxSiperisKonteynerSayisi.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "siparisekipmansayisi()", true);
                }
                else if (double.TryParse(txtArmatörLokali.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "almatorlokalialert()", true);
                }
                else if (double.TryParse(txtSigorta.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "sigortaAlert()", true);
                }
                else if (double.TryParse(txtBukaleminBuKonteynerdekiTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "buurununnuekipmandakitonajiAlert()", true);
                }
                else
                {
                    konteynersayisi = Convert.ToDouble(txtbuurununtoplamtonaji.Text) / Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text);
                    if (DrpKalkisLimani.SelectedItem.Text == "Limak" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand limak20 = new SqlCommand("select ContainerFreeinLIMAK20 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(limak20.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        navlunton2 = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }

                        //kalemmaliyet = urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + (armatorlokali2 / Convert.ToDouble(txtBirKonteynerTonaji.Text)) + (limandolumbedeli2/Convert.ToDouble(txtBirKonteynerTonaji.Text))+(Convert.ToDouble(txtNavlun.Text)/Convert.ToDouble(txtBirKonteynerTonaji.Text));
                        double inspection = Convert.ToDouble(txtInspectionTon.Text);
                        double komisyon = Convert.ToDouble(txtKomisyon.Text);
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);


                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(txtSigorta.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(txtSigorta.Text));
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), Convert.ToDouble(txtSigorta.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }//if bitti



                    else if (DrpKalkisLimani.SelectedItem.Text == "Limak" && DrpEkipmanTuru.SelectedItem.Text == "40 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand limak40 = new SqlCommand("select ContainerFreeinLIMAK40 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(limak40.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        navlunton2 = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(txtSigorta.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(txtSigorta.Text));
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), Convert.ToDouble(txtSigorta.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }

                    else if (DrpKalkisLimani.SelectedItem.Text == "MIP" && DrpEkipmanTuru.SelectedItem.Text == "20 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand mip20 = new SqlCommand("select ContainerFreeinMIP20 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(mip20.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        navlunton2 = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(txtSigorta.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(txtSigorta.Text));
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), Convert.ToDouble(txtSigorta.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                    else if (DrpKalkisLimani.SelectedItem.Text == "MIP" && DrpEkipmanTuru.SelectedItem.Text == "40 DV")//if başladı
                    {
                        double konteynerGUMRUKLEME = 0;
                        double armatorlokali2, limandolumbedeli2;
                        SqlCommand mip40 = new SqlCommand("select ContainerFreeinMIP40 from LoadingCharge", con.baglanti());
                        if (txtArmatörLokali.Text == "")
                            armatorlokali2 = 0;
                        else
                            armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        limandolumbedeli2 = Convert.ToDouble(mip40.ExecuteScalar()) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                        navlunton2 = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                        if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                        {
                            konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                        {
                            int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                            konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                        }
                        fobMaliyet = (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME) * vade / 100 + (urunfiyat + ambalajmaliyet + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + limandolumbedeli2 + armatorlokali2 + konteynerGUMRUKLEME);
                        kalemmaliyet = (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(txtSigorta.Text)) * vade / 100 + (urunfiyat + armatorlokali2 + ambalajmaliyet + navlunton2 + limandolumbedeli2 + konteynerGUMRUKLEME + icnakliye + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(txtSigorta.Text));
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, armatorlokali2, navlunton2, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, icnakliye, konteynerGUMRUKLEME, limandolumbedeli2, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), Convert.ToDouble(txtSigorta.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), Convert.ToString(DrpKalkisLimani.SelectedItem.Text), Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, Convert.ToDouble(txtNavlun.Text), Convert.ToDouble(txtArmatörLokali.Text), Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                }
            }
            else if ((Request.Form["konteynerbulksecimi"] == "KONTEYNER" && Request.Form["tekliftipi"] == "EXW" && Request.Form["siparistipi"] == "parcalikonteyner" && Request.Form["ihrackayit"] != "ihrackayit" && Request.Form["onaltidort"] != "onaltidort"))
            {
                if (musteriadi == null || musteriadi == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "carialert()", true);
                }
                else if (double.TryParse(txtbuurununtoplamtonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamtonajalert()", true);
                }
                else if (double.TryParse(txtSiparisTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "toplamsiparistonajialert()", true);
                }
                else if (double.TryParse(TextBoxSiperisKonteynerSayisi.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "siparisekipmansayisi()", true);
                }
                else if (double.TryParse(txtBukaleminBuKonteynerdekiTonaji.Text, out controlnumber) == false)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "buurununnuekipmandakitonajiAlert()", true);
                }
                konteynersayisi = Convert.ToDouble(txtbuurununtoplamtonaji.Text) / Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text);

                double konteynerGUMRUKLEME = 0;

                SqlCommand limak20 = new SqlCommand("select ContainerFreeinLIMAK20 from LoadingCharge", con.baglanti());



                if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                {
                    konteynerGUMRUKLEME = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                }
                else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) >= 2 && Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) < 10)
                {
                    int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                    konteynerGUMRUKLEME = ((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                }
                else if (Convert.ToDouble(TextBoxSiperisKonteynerSayisi.Text) >= 10)
                {
                    int ikion = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                    int onuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1 - ikion;
                    konteynerGUMRUKLEME = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtSiparisTonaji.Text)) / Convert.ToDouble(USD);

                }

                //kalemmaliyet = urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + icnakliye + depolamaton + (armatorlokali2 / Convert.ToDouble(txtBirKonteynerTonaji.Text)) + (limandolumbedeli2/Convert.ToDouble(txtBirKonteynerTonaji.Text))+(Convert.ToDouble(txtNavlun.Text)/Convert.ToDouble(txtBirKonteynerTonaji.Text));
                double inspection = Convert.ToDouble(txtInspectionTon.Text);
                double komisyon = Convert.ToDouble(txtKomisyon.Text);
                // armatorlokali2 = Convert.ToDouble(txtArmatörLokali.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);

                kalemmaliyet = (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text)) * vade / 100 + (urunfiyat + ambalajmaliyet + konteynerGUMRUKLEME + depolamaton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text));
                if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), depolamaton, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, 0, konteynerGUMRUKLEME, 0, kalemmaliyet, Convert.ToString(Request.Form["tekliftipi"]), Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), "YOK", Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), parcalisiparis, "YOK", 0, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                }
            }//i


            else if (Convert.ToString(DrpEkipmanTuru.SelectedItem.Text) == "Demir Yolu")
            {
                if (DrpKalkisLimani.Visible == false && txtArmatörLokali.Visible == false && Convert.ToString(DrpEkipmanTuru.SelectedItem.Text) == "Demir Yolu" && txtNavlunTON.Visible == false)
                {
                    string siptipi;
                    if (Request.Form["siparistipi"] == null || Request.Form["siparistipi"] == "")
                    {
                        siptipi = "YOK";
                    }
                    else
                    {
                        siptipi = Request.Form["siparistipi"];
                    }
                    //double konteynerGumrukleme = 0;
                    double navlun = Convert.ToDouble(txtNavlun.Text) / Convert.ToDouble(txtBirKonteynerTonaji.Text);
                    double gumrukton = 0;
                    double sig;
                    if (txtSigorta.Text == "")
                    {
                        sig = 0;
                    }
                    else
                    {
                        sig = Convert.ToDouble(txtSigorta.Text);
                    }
                    if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) == 1)
                    {
                        SqlCommand demiryolu = new SqlCommand("select GumruklemeKonteynerKaraYolu from Clearance", con.baglanti());
                        gumrukton = Convert.ToDouble(demiryolu.ExecuteScalar()) / Convert.ToDouble(txtSiparisTonaji.Text) / Convert.ToDouble(USD);
                    }
                    else if (Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) > 1)
                    {
                        SqlCommand demiryolu = new SqlCommand("select GumruklemeKonteynerDemirYolu from Clearance", con.baglanti());
                        SqlCommand demiryoluikiuzeri = new SqlCommand("select GumruklemeKonteynerDemirYoluikiuzeri from Clearance", con.baglanti());
                        int ikiuzeri = Convert.ToInt32(TextBoxSiperisKonteynerSayisi.Text) - 1;
                        gumrukton = (Convert.ToDouble(demiryolu) + Convert.ToDouble(demiryoluikiuzeri) * ikiuzeri) / Convert.ToDouble(txtSiparisTonaji.Text) / Convert.ToDouble(USD);
                    }
                    SqlCommand demiryoluicnakliye = new SqlCommand("select InsideTransport from Port where PortName='Demir Yolu' ", con.baglanti());
                    double dyoluicnakliye = Convert.ToDouble(demiryoluicnakliye.ExecuteScalar());
                    kalemmaliyet = (urunfiyat + ambalajmaliyet + dyoluicnakliye + navlun + gumrukton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(sig)) * vade / 100 + (urunfiyat + dyoluicnakliye + ambalajmaliyet + navlun + gumrukton + Convert.ToDouble(txtInspectionTon.Text) + Convert.ToDouble(txtKomisyon.Text) + Convert.ToDouble(sig));


                    if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), Convert.ToDouble(txtInspectionTon.Text), Convert.ToDouble(txtKomisyon.Text), 0, 0, navlun, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, dyoluicnakliye, gumrukton, 0, kalemmaliyet, "DAT", "YOK", sig, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, "YOK", Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), "YOK", 0, siptipi, "YOK", 0, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "HAYIR") == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                    }
                }
            }


                //ihraç kayıtlılar (16)

            else if (Request.Form["ihrackayit"] == "ihrackayit")
            {


                double birekipmantonaji, buurununtoplamtonaji, toplamsiparistonaji, buurununbuekipmandakitonaji;
                string siparisekipmansayisi;
                if (txtBirKonteynerTonaji.Text == null || txtBirKonteynerTonaji.Text == "")
                {
                    birekipmantonaji = 0;
                }
                else
                {
                    birekipmantonaji = Convert.ToDouble(txtBirKonteynerTonaji.Text);
                }
                if (txtbuurununtoplamtonaji.Text == null || txtbuurununtoplamtonaji.Text == "")
                {
                    buurununtoplamtonaji = 0;
                }
                else
                {
                    buurununtoplamtonaji = Convert.ToDouble(txtbuurununtoplamtonaji.Text);
                }
                if (txtSiparisTonaji.Text == null || txtSiparisTonaji.Text == "")
                {
                    toplamsiparistonaji = 0;
                }
                else
                {
                    toplamsiparistonaji = Convert.ToDouble(txtSiparisTonaji.Text);
                }
                if (TextBoxSiperisKonteynerSayisi.Text == null || TextBoxSiperisKonteynerSayisi.Text == "")
                {
                    siparisekipmansayisi = "0";
                }
                else
                {
                    siparisekipmansayisi = Convert.ToString(TextBoxSiperisKonteynerSayisi.Text);
                }
                if (txtBukaleminBuKonteynerdekiTonaji.Text == null || txtBukaleminBuKonteynerdekiTonaji.Text == "")
                {
                    buurununbuekipmandakitonaji = 0;
                }
                else
                {
                    buurununbuekipmandakitonaji = Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text);
                }
                konteynerbulksecimi = "";
                siparistipi = "";
                if (Request.Form["konteynerbulksecimi"] == null || Request.Form["konteynerbulksecimi"] == "")
                {
                    konteynerbulksecimi = "YOK";
                }
                else
                {
                    konteynerbulksecimi = Request.Form["konteynerbulksecimi"];
                }

                if (Request.Form["siparistipi"] == null || Request.Form["siparistipi"] == "")
                {
                    siparistipi = "YOK";
                }
                else
                {
                    siparistipi = Request.Form["siparistipi"];
                }

                //tamam                
                if (Request.Form["destination"] == "tanimlides")
                {
                    double aranakliye;
                    if (drpTeslimNoktasi.SelectedItem.Text == "Fabrika Teslim")
                    {
                        aranakliye = 0;
                        kalemmaliyet = ((urunfiyat + ambalajmaliyet + aranakliye) * vade / 100) + (urunfiyat + ambalajmaliyet + aranakliye);
                        if (siparistipi == "parcalisiparis" || siparistipi == "YOK")
                        {
                            if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), 0, 0, 0, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, aranakliye, 0, 0, kalemmaliyet, Request.Form["tekliftipi"], konteynerbulksecimi, 0, buurununtoplamtonaji, Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, Convert.ToString(drpTeslimNoktasi.SelectedItem.Text), "YOK", birekipmantonaji, siparisekipmansayisi, Convert.ToString(DrpVade.SelectedItem.Text), "YOK", 0, siparistipi, birdenfazlabeyanname, 0, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade,"EVET") == 1)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                            }
                        }
                        else if (siparistipi == "parcalikonteyner" && (Request.Form["onaltidort"] == null || Request.Form["onaltidort"] == ""))
                        {
                            if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), 0, 0, 0, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, aranakliye, 0, 0, kalemmaliyet, Request.Form["tekliftipi"], konteynerbulksecimi, 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, "YOK", Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), "YOK", Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), siparistipi, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade,"EVET") == 1)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                            }
                        }
                        else if (siparistipi == "parcalikonteyner" && Request.Form["onaltidort"] == "onaltidort")
                        {
                            if (db.sepeteEkle2(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), 0, 0, 0, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, aranakliye, 0, 0, kalemmaliyet, Request.Form["tekliftipi"], Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), "YOK", Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, vade, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(Request.Form["urundetay"]), Convert.ToString(Request.Form["urundetay2"]), urunmaliyet, vade, "EVET") == 1)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                            }
                        }

                    }
                    else if (drpTeslimNoktasi.SelectedItem.Text == "Mersin")
                    {
                        SqlConnection bagla = new SqlConnection(strcon);
                        bagla.Open();
                        SqlCommand mip = new SqlCommand("select InsideTransport from Port where Id=1", bagla);
                        aranakliye = Convert.ToDouble(mip.ExecuteScalar());
                        bagla.Close();
                        kalemmaliyet = ((urunfiyat + ambalajmaliyet + aranakliye) * vade / 100) + (urunfiyat + ambalajmaliyet + aranakliye);
                        if (siparistipi == "parcalisiparis" || siparistipi == "YOK")
                        {
                            if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), 0, 0, 0, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, aranakliye, 0, 0, kalemmaliyet, Request.Form["tekliftipi"], konteynerbulksecimi, 0, buurununtoplamtonaji, Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, Convert.ToString(drpTeslimNoktasi.SelectedItem.Text), "YOK", birekipmantonaji, siparisekipmansayisi, Convert.ToString(DrpVade.SelectedItem.Text), "YOK", 0, siparistipi, birdenfazlabeyanname, 0, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "EVET") == 1)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                            }

                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                            }
                        }
                        else if (siparistipi == "parcalikonteyner" && Request.Form["onaltidort"] == null)
                        {
                            if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), 0, 0, 0, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, aranakliye, 0, 0, kalemmaliyet, Request.Form["tekliftipi"], konteynerbulksecimi, 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, "YOK", Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), "YOK", Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), siparistipi, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "EVET") == 1)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                            }
                        }
                        else if (siparistipi == "parcalikonteyner" && Request.Form["onaltidort"] != null)
                        {
                            if (db.sepeteEkle2(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), 0, 0, 0, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, aranakliye, 0, 0, kalemmaliyet, Request.Form["tekliftipi"], Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), "YOK", Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, vade, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(Request.Form["urundetay"]), Convert.ToString(Request.Form["urundetay2"]), urunmaliyet, vade, "EVET") == 1)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                            }
                        }
                    }
                    else if (drpTeslimNoktasi.SelectedItem.Text == "İskenderun")
                    {
                        SqlConnection bagla = new SqlConnection(strcon);
                        bagla.Open();
                        SqlCommand limak = new SqlCommand("select InsideTransport from Port where Id=2", bagla);
                        aranakliye = Convert.ToDouble(limak.ExecuteScalar());
                        bagla.Close();
                        kalemmaliyet = ((urunfiyat + ambalajmaliyet + aranakliye) * vade / 100) + (urunfiyat + ambalajmaliyet + aranakliye);
                        if (siparistipi == "parcalisiparis" || siparistipi == "YOK")
                        {
                            if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), 0, 0, 0, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, aranakliye, 0, 0, kalemmaliyet, Request.Form["tekliftipi"], konteynerbulksecimi, 0, buurununtoplamtonaji, Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, Convert.ToString(drpTeslimNoktasi.SelectedItem.Text), "YOK", birekipmantonaji, siparisekipmansayisi, Convert.ToString(DrpVade.SelectedItem.Text), "YOK", 0, siparistipi, birdenfazlabeyanname, 0, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "EVET") == 1)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                            }

                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                            }
                        }
                        else if (siparistipi == "parcalikonteyner" && Request.Form["onaltidort"] == null)
                        {
                            if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), 0, 0, 0, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, aranakliye, 0, 0, kalemmaliyet, Request.Form["tekliftipi"], konteynerbulksecimi, 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, "YOK", Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), "YOK", Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), siparistipi, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "EVET") == 1)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                            }
                        }
                        else if (siparistipi == "parcalikonteyner" && Request.Form["onaltidort"] != null)
                        {
                            if (db.sepeteEkle2(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), 0, 0, 0, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, aranakliye, 0, 0, kalemmaliyet, Request.Form["tekliftipi"], Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), "YOK", Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, vade, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(Request.Form["urundetay"]), Convert.ToString(Request.Form["urundetay2"]), urunmaliyet, vade, "EVET") == 1)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                            }
                        }
                    }
                }
                else if (Request.Form["destination"] == "digdes")
                {
                    double aranakliye;

                    aranakliye = Convert.ToDouble(txtteslimnoktasiaranakliyeton.Text);
                    kalemmaliyet = ((urunfiyat + ambalajmaliyet + aranakliye) * vade / 100) + (urunfiyat + ambalajmaliyet + aranakliye);
                    if (siparistipi == "parcalisiparis" || siparistipi == "YOK")
                    {
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), 0, 0, 0, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, aranakliye, 0, 0, kalemmaliyet, Request.Form["tekliftipi"], konteynerbulksecimi, 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, Convert.ToString(drpTeslimNoktasi.SelectedItem.Text), "YOK", Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), "YOK", 0, siparistipi, birdenfazlabeyanname, 0, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "EVET") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                    else if (siparistipi == "parcalikonteyner" && Request.QueryString["onaltidort"] == null)
                    {
                        if (db.sepeteEkle(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), 0, 0, 0, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, aranakliye, 0, 0, kalemmaliyet, Request.Form["tekliftipi"], konteynerbulksecimi, 0, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, "YOK", Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), "YOK", Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), siparistipi, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, Convert.ToString(Request.Form["urundetay"]), urunmaliyet, vade, "EVET") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                    else if (siparistipi == "parcalikonteyner" && Request.QueryString["onaltidort"] != null)
                    {
                        if (db.sepeteEkle2(urunadi, urunfiyat, Convert.ToString(drpTorbaTipi.SelectedItem.Text), Convert.ToInt32(torbaagirligi), Convert.ToString(DrpBBTipi.SelectedItem.Text), Convert.ToInt32(bbagirligi), Convert.ToString(DrpPalet.SelectedItem.Text), 0, 0, 0, 0, 0, 0, Convert.ToString(tekliftarihi), ambalajmaliyet, aranakliye, 0, 0, kalemmaliyet, Request.Form["tekliftipi"], Convert.ToString(Request.Form["konteynerbulksecimi"]), 0, Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), Convert.ToString(txtTeklifNo.Text), musteriadi, bolge, ulke, varislimani, Convert.ToString(DrpEkipmanTuru.SelectedItem.Text), Convert.ToDouble(txtBirKonteynerTonaji.Text), Convert.ToString(TextBoxSiperisKonteynerSayisi.Text), Convert.ToString(DrpVade.SelectedItem.Text), "YOK", Convert.ToDouble(txtBukaleminBuKonteynerdekiTonaji.Text), parcalisiparis, "YOK", fobMaliyet, parsiyel, urunanagrup, konteynersayisi, manueltarih, gun, ay, yil, urunkodu, musterikodu, 0, 0, Convert.ToDouble(txtSiparisTonaji.Text), musteritipi, vade, Convert.ToDouble(txtbuurununtoplamtonaji.Text), Convert.ToString(Request.Form["urundetay"]), Convert.ToString(Request.Form["urundetay2"]), urunmaliyet, vade, "EVET") == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
                        }
                    }
                }

            }
            SqlConnection.ClearPool(con.baglanti());
            con.baglanti().Close();


        }


        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@temsilci"].Value = Convert.ToString(UserData.Id);
        }


        protected void SqlDataSource4_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@TemsilciKullaniciAdi"].Value = Convert.ToString(UserData.Id);
        }
        protected void DrpEkipmanTuru_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(DrpEkipmanTuru.SelectedItem.Value) == 3 || Convert.ToInt32(DrpEkipmanTuru.SelectedItem.Value) == 4)
            {
                System.Threading.Thread.Sleep(500);
                DrpKalkisLimani.Visible = false;

                lblKalkisLimani.Visible = false;
                txtArmatörLokali.Visible = false;
                txtNavlunTON.Visible = false;
                txtSigorta.Visible = true;
            }
            else
            {
                System.Threading.Thread.Sleep(250);
                DrpKalkisLimani.Visible = true;
                lblKalkisLimani.Visible = true;
                txtArmatörLokali.Visible = true;
                txtNavlunTON.Visible = true;
                txtSigorta.Visible = false;
            }

        }



        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting1(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }



        protected void btnrefresh_Click(object sender, EventArgs e)
        {
            Response.Redirect("TeklifHazirla.aspx");
        }

        protected void btnModalPopupGoster_Click(object sender, EventArgs e)
        {
            if (ASPxGridView1.VisibleRowCount <= 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);

            }
            else
            {
                if (ASPxGridView1.VisibleRowCount >= 1)
                {
                    ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);
                }
                int id;
                var kayit_id = ASPxGridView1.GetSelectedFieldValues("Id");
                id = Convert.ToInt32(kayit_id[0]);




                pnlKayitEkle.Visible =
                pnlHider.Visible = true;

                double kalemsatisfiyati, fobsatisfiyati;
                double[] maliyet = new double[2];
                SqlConnection con = new SqlConnection(strcon);
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select *from Sepet where Id=@p1", con);
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
                        lblfobmaliyet.Text = dr["FobMaliyet"].ToString();
                        lblKalemMaliyet.Text = dr["KalemMaliyeti"].ToString();
                        maliyet[0] = Convert.ToDouble(dr["KalemMaliyeti"]);
                        maliyet[1] = Convert.ToDouble(dr["FobMaliyet"]);
                    }
                    dr.Close();

                    double parite;
                    SqlCommand USDKUR = new SqlCommand("SET dateformat DMY select CAST(dbo.DOVIZKURU_GETIR(1,GETDATE()) as decimal(18,3))", logo.LogoConnection());

                    double USD = Convert.ToDouble(USDKUR.ExecuteScalar());
                    if (USD == 0)
                    {
                        var cxml = new XmlDocument();
                        cxml.Load(bugun);
                        USD = Convert.ToDouble(cxml.SelectSingleNode("Tarih_Date/Currency [@Kod = 'USD']/BanknoteBuying").InnerXml.Replace(".", ","));
                    }

                    SqlCommand EUROKURCEK = new SqlCommand("SET dateformat DMY select CAST(dbo.DOVIZKURU_GETIR(20,GETDATE()) as decimal(18,3))", logo.LogoConnection());
                    double EUR = Convert.ToDouble(EUROKURCEK.ExecuteScalar());
                    if (EUR == 0)
                    {
                        var cxml = new XmlDocument();
                        cxml.Load(bugun);
                        EUR = Convert.ToDouble(cxml.SelectSingleNode("Tarih_Date/Currency [@Kod = 'EUR']/BanknoteBuying").InnerXml.Replace(".", ","));
                    }
                    lbldolar.Text = USD.ToString();
                    lbleuro.Text = EUR.ToString();
                    parite = EUR / USD;
                    SqlCommand paritecek = new SqlCommand("SET dateformat DMY select  CAST(dbo.DOVIZKURU_GETIR(20,GETDATE())/dbo.DOVIZKURU_GETIR(1,GETDATE()) as decimal(18,3))", logo.LogoConnection());
                    lblParite.Text = Convert.ToString(paritecek.ExecuteScalar());
                    //lbleuro2.Text = "EURO FİYATI="+Convert.ToString(Math.Round(maliyet[0] / Convert.ToDouble(lblParite.Text),3));
                    //lbltl2.Text ="TL FİYATI="+ Convert.ToString(Math.Round(maliyet[0] *Convert.ToDouble(lbldolar.Text),3));

                    //lbleuro3.Text ="EURO FİYATI=" +Convert.ToString(Math.Round(maliyet[1] / Convert.ToDouble(lblParite.Text), 3));
                    //lbltl3.Text = "TL FİYATI=" + Convert.ToString(Math.Round(maliyet[1] * Convert.ToDouble(lbldolar.Text), 3));

                    con.Close();
                    SqlConnection.ClearPool(con);
                }

                catch
                {

                }


            }

        }
        protected void btnEkle2_Click(object sender, EventArgs e)
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
                SqlCommand cmd = new SqlCommand("select *from Sepet where Id=@p1", con);
                cmd.Parameters.AddWithValue("@p1", id);
                cmd.CommandTimeout = 10000;
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

                        kalemsatisfiyati = Convert.ToDouble(txtTeslimSekliSatisFİyati.Text);
                    }

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
                    SqlCommand gonder = new SqlCommand("UpdateSepet", con);
                    gonder.CommandTimeout = 10000;
                    gonder.CommandType = CommandType.StoredProcedure;
                    gonder.Parameters.AddWithValue("@Komisyon", komisyon);
                    gonder.Parameters.AddWithValue("@FobMaliyet", fobmaliyet);
                    gonder.Parameters.AddWithValue("@KalemSatisFiyati", kalemsatisfiyati);
                    gonder.Parameters.AddWithValue("@Id", id);
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
                SqlConnection.ClearPool(con);
                con.Close();
            }
            catch
            {

            }
            pnlKayitEkle.Visible =
           pnlHider.Visible = false;
        }
        protected void lbModalPopupKapat_Click(object sender, EventArgs e)
        {
            pnlKayitEkle.Visible =
            pnlHider.Visible = false;
        }

        protected void btnEkle_Click1(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            double eurocfr, eurofob,tlcfr, tlfob;

            eurocfr = Math.Round(Convert.ToDouble(txtTeslimSekliSatisFİyati.Text)/Convert.ToDouble(lblParite.Text),3);
            eurofob = Math.Round(Convert.ToDouble(txtFobSatisFiyati.Text) / Convert.ToDouble(lblParite.Text), 3);

            tlcfr = Math.Round(Convert.ToDouble(txtTeslimSekliSatisFİyati.Text) * Convert.ToDouble(lbldolar.Text), 3);
            tlfob = Math.Round(Convert.ToDouble(txtFobSatisFiyati.Text) * Convert.ToDouble(lbldolar.Text), 3);
            lbleurocfr.Text = eurocfr.ToString();
            lbleurofob.Text = eurofob.ToString();
            lbltlcfr.Text = tlcfr.ToString();
            lbltlfob.Text = tlfob.ToString();
        }
    }
}