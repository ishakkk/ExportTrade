using ClosedXML.Excel;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;

namespace ExternalTrade.Classes
{
    public class DBIslemler
    {
        string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
        public int sepeteEkle(string urunadi, double urunfiyat, string torbatipi, int torbaagirligi, string bbtipi, int bbagirligi, string palet, double inspection, double komisyon, double depolamaton, double armatorlokali, double navlunton, double kalemsatisfiyati, string tarih, double ambalajmaliyeti, double icnakliyefiyat, double gumrukleme, double limandolumbedeli, double kalemmaliyet, string tekliftipi, string konteynerbulksecimi, double sigortaTON, double buurununsiparistonaji, string teklifno, string musteriismi, string kita, string ulke, string varislimani, string EkipmanTuru, double birKonteynerTonaji, string siparistekikonteynersayisi, string vade, string kalkislimani, double BuKaleminBuKonteynerdekiTonaji, string siparistipi, string birdenfazlabeyanname, double fobmaliyet, string parsiyel, string anagrup, double urununkonteynersayisi, DateTime ttarih, string gun, string ay, string yil, string urunkodu, string musterikodu, double girilennavlun, double girilenarmatorlokali, double toplamsiparistonaji, string musteritipi, string yediyuzlukod, double urunmaliyet, double valorcarpani,string ihrackayit)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("insert into Sepet(Temsilci,Urun,UrunFiyat,TorbaTipi,TorbaAgirligi,BBTipi,BBAgirligi,Palet,Inspection,Komisyon,DepolamaTON,ArmatorLokali,NavlunTON,KalemSatisFiyati,TeklifTarihi,Ambalaj,AraNakliyeTON,GumruklemeTON,LimanIcDolumBedeliTON,KalemMaliyeti,TeklifTipi,KonteynerBulkSecimi,SigortaTON,buUrununSiparisTonaji,TeklifNo,MusteriIsmi,Kita,Ulke,VarisLimani,TemsilciKullaniciAdi,Durum,EkipmanTuru,birKonteynerTonaji,SiparistekiKonteynerSayisi,Vade,KalkisLimani,BuKaleminBuKonteynerdekiTonaji,siparisTipi,birdenfazlabeyanname,FobMaliyet,Parsiyel,UrunAnaGrup,UrununKonteynerSayisi,TTarih,Gun,Ay,Yil,UrunKodu,MusteriKodu,GirilenNavlun,GirilenArmatorLokali,ToplamSiparisTonaji,MusteriTipi,YediyuzluKod,[UrunSadeFiyat],VadeCarpani,IhracKayitli) values(@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9,@p10,@p11,@p12,@p13,@p14,@p15,@p16,@p17,@p18,@p19,@p20,@p21,@p22,@p23,@p24,@p25,@p26,@p27,@p28,@p29,@p30,@p31,@p32,@p33,@p34,@p35,@p36,@p37,@p38,@p39,@p40,@p41,@p42,@p43,@p44,@p45,@p46,@p47,@p48,@p49,@p50,@p51,@p52,@p53,@p54,@p55,@p56,@p57)", con);
                    cmd.Parameters.AddWithValue("@p1", Convert.ToString(UserData.Name + " " + UserData.SurName));
                    cmd.Parameters.AddWithValue("@p2", urunadi);
                    cmd.Parameters.AddWithValue("@p3", urunfiyat);
                    cmd.Parameters.AddWithValue("@p4", torbatipi);
                    cmd.Parameters.AddWithValue("@p5", torbaagirligi);
                    cmd.Parameters.AddWithValue("@p6", bbtipi);
                    cmd.Parameters.AddWithValue("@p7", bbagirligi);
                    cmd.Parameters.AddWithValue("@p8", palet);
                    cmd.Parameters.AddWithValue("@p9", inspection);
                    cmd.Parameters.AddWithValue("@p10", komisyon);
                    cmd.Parameters.AddWithValue("@p11", depolamaton);
                    cmd.Parameters.AddWithValue("@p12", armatorlokali);
                    cmd.Parameters.AddWithValue("@p13", navlunton);
                    cmd.Parameters.AddWithValue("@p14", kalemsatisfiyati);
                    cmd.Parameters.AddWithValue("@p15", tarih);
                    cmd.Parameters.AddWithValue("@p16", ambalajmaliyeti);
                    cmd.Parameters.AddWithValue("@p17", icnakliyefiyat);
                    cmd.Parameters.AddWithValue("@p18", gumrukleme);
                    cmd.Parameters.AddWithValue("@p19", limandolumbedeli);
                    cmd.Parameters.AddWithValue("@p20", kalemmaliyet);
                    cmd.Parameters.AddWithValue("@p21", tekliftipi);
                    cmd.Parameters.AddWithValue("@p22", konteynerbulksecimi);
                    cmd.Parameters.AddWithValue("@p23", sigortaTON);
                    cmd.Parameters.AddWithValue("@p24", buurununsiparistonaji);
                    cmd.Parameters.AddWithValue("@p25", teklifno);
                    cmd.Parameters.AddWithValue("@p26", musteriismi);
                    cmd.Parameters.AddWithValue("@p27", kita);
                    cmd.Parameters.AddWithValue("@p28", ulke);
                    cmd.Parameters.AddWithValue("@p29", varislimani);
                    cmd.Parameters.AddWithValue("@p30", UserData.Id);
                    cmd.Parameters.AddWithValue("@p31", "ONAY BEKLIYOR");
                    cmd.Parameters.AddWithValue("@p32", EkipmanTuru);
                    cmd.Parameters.AddWithValue("@p33", birKonteynerTonaji);
                    cmd.Parameters.AddWithValue("@p34", siparistekikonteynersayisi);
                    cmd.Parameters.AddWithValue("@p35", vade);
                    cmd.Parameters.AddWithValue("@p36", kalkislimani);
                    cmd.Parameters.AddWithValue("@p37", BuKaleminBuKonteynerdekiTonaji);
                    cmd.Parameters.AddWithValue("@p38", siparistipi);
                    cmd.Parameters.AddWithValue("@p39", birdenfazlabeyanname);
                    cmd.Parameters.AddWithValue("@p40", fobmaliyet);
                    cmd.Parameters.AddWithValue("@p41", parsiyel);
                    cmd.Parameters.AddWithValue("@p42", anagrup);
                    cmd.Parameters.AddWithValue("@p43", urununkonteynersayisi);
                    cmd.Parameters.AddWithValue("@p44", ttarih);
                    cmd.Parameters.AddWithValue("@p45", gun);
                    cmd.Parameters.AddWithValue("@p46", ay);
                    cmd.Parameters.AddWithValue("@p47", yil);
                    cmd.Parameters.AddWithValue("@p48", urunkodu);
                    cmd.Parameters.AddWithValue("@p49", musterikodu);
                    cmd.Parameters.AddWithValue("@p50", girilennavlun);
                    cmd.Parameters.AddWithValue("@p51", girilenarmatorlokali);
                    cmd.Parameters.AddWithValue("@p52", toplamsiparistonaji);
                    cmd.Parameters.AddWithValue("@p53", musteritipi);
                    cmd.Parameters.AddWithValue("@p54", yediyuzlukod);
                    cmd.Parameters.AddWithValue("@p55", urunmaliyet);
                    cmd.Parameters.AddWithValue("@p56", valorcarpani);
                    cmd.Parameters.AddWithValue("@p57",ihrackayit);
                    cmd.ExecuteNonQuery();

                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    }
                    // //SqlConnection.ClearPool(con);
                    return 1;
                }
                catch
                {
                    con.Close();
                    return 0;
                }
            }

        }
        public int sepeteEkle2(string urunadi, double urunfiyat, string torbatipi, int torbaagirligi, string bbtipi, int bbagirligi, string palet, double inspection, double komisyon, double depolamaton, double armatorlokali, double navlunton, double kalemsatisfiyati, string tarih, double ambalajmaliyeti, double icnakliyefiyat, double gumrukleme, double limandolumbedeli, double kalemmaliyet, string tekliftipi, string konteynerbulksecimi, double sigortaTON, double buurununsiparistonaji, string teklifno, string musteriismi, string kita, string ulke, string varislimani, string EkipmanTuru, double birKonteynerTonaji, string siparistekikonteynersayisi, string vade, string kalkislimani, double BuKaleminBuKonteynerdekiTonaji, string siparistipi, string birdenfazlabeyanname, double fobmaliyet, string parsiyel, string anagrup, double urununkonteynersayisi, DateTime ttarih, string gun, string ay, string yil, string urunkodu, string musterikodu, double girilennavlun, double girilenarmatorlokali, double toplamsiparistonaji, string musteritipi, double vadefiyati, double buUrununToplamTonaji, string yediyuzlukod1, string yediyuzlukod2, double urunmaliyet, double valorcarpani,string ihtackayit)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    int kontrol = 0;
                  
                    double yeniambalaj, yeniambalaj1250, yeniambalaj1375, strecfiyat, pfiyat1375, pfiyat1250, paletfiyat, tfiyat, bbfiyat1250, bbfiyat1375, tonaj, fob, yeniteslimseklimaliyet, bbfiyat;
                    string palet1250, palet1375, bb1250, bb1375;
                    SqlCommand streccek = new SqlCommand("Select Price from Stretch", con);
                    strecfiyat = Convert.ToDouble(streccek.ExecuteScalar());
                    tonaj = (buUrununToplamTonaji / birKonteynerTonaji) * 22;
                    if (bbtipi == "SLINGBAG")
                    {
                        palet1250 = "YOK";
                        palet1375 = "YOK";
                        pfiyat1250 = 0;
                        pfiyat1375 = 0;
                    }
                    else
                    {
                        palet1250 = "1250";
                        palet1375 = "1375";
                        SqlCommand paletfiyatcek = new SqlCommand("select Price from Palette", con);
                        paletfiyat = Convert.ToDouble(paletfiyatcek.ExecuteScalar());
                        pfiyat1375 = (paletfiyat / 1375) * 1000;
                        pfiyat1250 = (paletfiyat / 1250) * 1000;
                    }

                    if (torbatipi == "YOK" || torbaagirligi == 0)
                    {
                        tfiyat = 0;
                    }
                    else
                    {
                        //select @tfiyat= Price from BagType where bagType=@torbatipi
                        SqlCommand tfiyatcek = new SqlCommand("select Price from BagType where bagType='" + torbatipi + "'", con);
                        tfiyat = Convert.ToDouble(tfiyatcek.ExecuteScalar());
                    }
                    if (bbtipi == "YOK" || bbagirligi == 0)
                    {
                        bbfiyat1250 = 0;
                        bbfiyat1375 = 0;
                        bb1250 = "0";
                        bb1375 = "0";
                    }
                    else
                    {
                        SqlCommand bbfiyatcek = new SqlCommand("select Price from BBType where bbType='" + bbtipi + "'", con);
                        bbfiyat = Convert.ToDouble(bbfiyatcek.ExecuteScalar());
                        bbfiyat1250 = bbfiyat;
                        bbfiyat1375 = bbfiyat;
                        bb1375 = "1375";
                        bb1250 = "1250";
                    }
                    if (torbaagirligi == 0 && bbagirligi == 0)
                    {

                        yeniambalaj1375 = (pfiyat1375 + strecfiyat) * 22;
                        yeniambalaj1250 = (pfiyat1250 + strecfiyat) * 5;
                        yeniambalaj = ((yeniambalaj1375 + yeniambalaj1250)) / 27;
                    }


                    else if (torbaagirligi != 0 && bbagirligi != 0)
                    {
                        yeniambalaj1375 = (((tfiyat) * (1000 / torbaagirligi)) + ((bbfiyat1375 / 1375) * 1000) + pfiyat1375 + strecfiyat) * 22;
                        yeniambalaj1250 = (((tfiyat) * (1000 / torbaagirligi)) + ((bbfiyat1250 / 1250) * 1000) + pfiyat1250 + strecfiyat) * 5;
                        yeniambalaj = ((yeniambalaj1375 + yeniambalaj1250)) / 27;
                    }
                    else if (torbaagirligi != 0 && bbagirligi == 0)
                    {
                        yeniambalaj1375 = (((tfiyat) * (1000 / torbaagirligi)) + pfiyat1375 + strecfiyat) * 22;
                        yeniambalaj1250 = (((tfiyat) * (1000 / torbaagirligi)) + pfiyat1250 + strecfiyat) * 5;
                        yeniambalaj = ((yeniambalaj1375 + yeniambalaj1250)) / 27;
                    }

                    else if (torbaagirligi == 0 && bbagirligi != 0)
                    {
                        yeniambalaj1375 = (((bbfiyat1375 / 1375) * 1000) + pfiyat1375 + strecfiyat) * 22;
                        yeniambalaj1250 = (((bbfiyat1250 / 1250) * 1000) + pfiyat1250 + strecfiyat) * 5;
                        yeniambalaj = ((yeniambalaj1375 + yeniambalaj1250)) / 27;
                    }
                    else
                    {
                        yeniambalaj1250 = 0;
                        yeniambalaj1375 = 0;
                        yeniambalaj = 0;
                    }
                    if (tekliftipi == "EXW" || tekliftipi == "FAS" || tekliftipi == "FCA")
                    {
                        fobmaliyet = 0;
                    }
                    else
                    {
                        fobmaliyet = ((urunfiyat + yeniambalaj + inspection + komisyon + icnakliyefiyat + depolamaton + limandolumbedeli + armatorlokali + gumrukleme) * vadefiyati / 100) + urunfiyat + yeniambalaj + inspection + komisyon + icnakliyefiyat + depolamaton + limandolumbedeli + armatorlokali + gumrukleme;
                    }
                    yeniteslimseklimaliyet = ((urunfiyat + armatorlokali + yeniambalaj + navlunton + limandolumbedeli + gumrukleme + icnakliyefiyat + depolamaton + inspection + komisyon + sigortaTON) * vadefiyati / 100) + urunfiyat + armatorlokali + yeniambalaj + navlunton + limandolumbedeli + gumrukleme + icnakliyefiyat + depolamaton + inspection + komisyon + sigortaTON;


                    SqlCommand cmd = new SqlCommand("insert into Sepet(Temsilci,Urun,UrunFiyat,TorbaTipi,TorbaAgirligi,BBTipi,BBAgirligi,Palet,Inspection,Komisyon,DepolamaTON,ArmatorLokali,NavlunTON,KalemSatisFiyati,TeklifTarihi,Ambalaj,AraNakliyeTON,GumruklemeTON,LimanIcDolumBedeliTON,KalemMaliyeti,TeklifTipi,KonteynerBulkSecimi,SigortaTON,buUrununSiparisTonaji,TeklifNo,MusteriIsmi,Kita,Ulke,VarisLimani,TemsilciKullaniciAdi,Durum,EkipmanTuru,birKonteynerTonaji,SiparistekiKonteynerSayisi,Vade,KalkisLimani,BuKaleminBuKonteynerdekiTonaji,siparisTipi,birdenfazlabeyanname,FobMaliyet,Parsiyel,UrunAnaGrup,UrununKonteynerSayisi,TTarih,Gun,Ay,Yil,UrunKodu,MusteriKodu,GirilenNavlun,GirilenArmatorLokali,ToplamSiparisTonaji,MusteriTipi,YediyuzluKod,[UrunSadeFiyat],VadeCarpani,Kontrol,IhracKayitli) values(@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9,@p10,@p11,@p12,@p13,@p14,@p15,@p16,@p17,@p18,@p19,@p20,@p21,@p22,@p23,@p24,@p25,@p26,@p27,@p28,@p29,@p30,@p31,@p32,@p33,@p34,@p35,@p36,@p37,@p38,@p39,@p40,@p41,@p42,@p43,@p44,@p45,@p46,@p47,@p48,@p49,@p50,@p51,@p52,@p53,@p54,@p55,@p56,@p57,@p58)", con);
                    cmd.Parameters.AddWithValue("@p1", Convert.ToString(UserData.Name + " " + UserData.SurName));
                    cmd.Parameters.AddWithValue("@p2", urunadi);
                    cmd.Parameters.AddWithValue("@p3", urunfiyat);
                    cmd.Parameters.AddWithValue("@p4", torbatipi);
                    cmd.Parameters.AddWithValue("@p5", torbaagirligi);
                    cmd.Parameters.AddWithValue("@p6", bbtipi);
                    cmd.Parameters.AddWithValue("@p7", bb1375);
                    cmd.Parameters.AddWithValue("@p8", palet1375);
                    cmd.Parameters.AddWithValue("@p9", inspection);
                    cmd.Parameters.AddWithValue("@p10", komisyon);
                    cmd.Parameters.AddWithValue("@p11", depolamaton);
                    cmd.Parameters.AddWithValue("@p12", armatorlokali);
                    cmd.Parameters.AddWithValue("@p13", navlunton);
                    cmd.Parameters.AddWithValue("@p14", kalemsatisfiyati);
                    cmd.Parameters.AddWithValue("@p15", tarih);
                    cmd.Parameters.AddWithValue("@p16", yeniambalaj);
                    cmd.Parameters.AddWithValue("@p17", icnakliyefiyat);
                    cmd.Parameters.AddWithValue("@p18", gumrukleme);
                    cmd.Parameters.AddWithValue("@p19", limandolumbedeli);
                    cmd.Parameters.AddWithValue("@p20", yeniteslimseklimaliyet);
                    cmd.Parameters.AddWithValue("@p21", tekliftipi);
                    cmd.Parameters.AddWithValue("@p22", konteynerbulksecimi);
                    cmd.Parameters.AddWithValue("@p23", sigortaTON);
                    cmd.Parameters.AddWithValue("@p24", tonaj);
                    cmd.Parameters.AddWithValue("@p25", teklifno);
                    cmd.Parameters.AddWithValue("@p26", musteriismi);
                    cmd.Parameters.AddWithValue("@p27", kita);
                    cmd.Parameters.AddWithValue("@p28", ulke);
                    cmd.Parameters.AddWithValue("@p29", varislimani);
                    cmd.Parameters.AddWithValue("@p30", UserData.Id);
                    cmd.Parameters.AddWithValue("@p31", "ONAY BEKLIYOR");
                    cmd.Parameters.AddWithValue("@p32", EkipmanTuru);
                    cmd.Parameters.AddWithValue("@p33", birKonteynerTonaji);
                    cmd.Parameters.AddWithValue("@p34", siparistekikonteynersayisi);
                    cmd.Parameters.AddWithValue("@p35", vade);
                    cmd.Parameters.AddWithValue("@p36", kalkislimani);
                    cmd.Parameters.AddWithValue("@p37", BuKaleminBuKonteynerdekiTonaji);
                    cmd.Parameters.AddWithValue("@p38", siparistipi);
                    cmd.Parameters.AddWithValue("@p39", birdenfazlabeyanname);
                    cmd.Parameters.AddWithValue("@p40", fobmaliyet);
                    cmd.Parameters.AddWithValue("@p41", parsiyel);
                    cmd.Parameters.AddWithValue("@p42", anagrup);
                    cmd.Parameters.AddWithValue("@p43", urununkonteynersayisi);
                    cmd.Parameters.AddWithValue("@p44", ttarih);
                    cmd.Parameters.AddWithValue("@p45", gun);
                    cmd.Parameters.AddWithValue("@p46", ay);
                    cmd.Parameters.AddWithValue("@p47", yil);
                    cmd.Parameters.AddWithValue("@p48", urunkodu);
                    cmd.Parameters.AddWithValue("@p49", musterikodu);
                    cmd.Parameters.AddWithValue("@p50", girilennavlun);
                    cmd.Parameters.AddWithValue("@p51", girilenarmatorlokali);
                    cmd.Parameters.AddWithValue("@p52", toplamsiparistonaji);
                    cmd.Parameters.AddWithValue("@p53", musteritipi);
                    cmd.Parameters.AddWithValue("@p54", yediyuzlukod1);
                    cmd.Parameters.AddWithValue("@p55", urunmaliyet);
                    cmd.Parameters.AddWithValue("@p56", valorcarpani);
                    cmd.Parameters.AddWithValue("@p57", kontrol);
                    cmd.Parameters.AddWithValue("@p58",ihtackayit);
                    cmd.ExecuteNonQuery();

                    tonaj = (buUrununToplamTonaji / birKonteynerTonaji) * 5;

                    SqlCommand cmd2 = new SqlCommand("insert into Sepet(Temsilci,Urun,UrunFiyat,TorbaTipi,TorbaAgirligi,BBTipi,BBAgirligi,Palet,Inspection,Komisyon,DepolamaTON,ArmatorLokali,NavlunTON,KalemSatisFiyati,TeklifTarihi,Ambalaj,AraNakliyeTON,GumruklemeTON,LimanIcDolumBedeliTON,KalemMaliyeti,TeklifTipi,KonteynerBulkSecimi,SigortaTON,buUrununSiparisTonaji,TeklifNo,MusteriIsmi,Kita,Ulke,VarisLimani,TemsilciKullaniciAdi,Durum,EkipmanTuru,birKonteynerTonaji,SiparistekiKonteynerSayisi,Vade,KalkisLimani,BuKaleminBuKonteynerdekiTonaji,siparisTipi,birdenfazlabeyanname,FobMaliyet,Parsiyel,UrunAnaGrup,UrununKonteynerSayisi,TTarih,Gun,Ay,Yil,UrunKodu,MusteriKodu,GirilenNavlun,GirilenArmatorLokali,ToplamSiparisTonaji,MusteriTipi,YediyuzluKod,[UrunSadeFiyat],VadeCarpani,IhracKayitli) values(@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8,@p9,@p10,@p11,@p12,@p13,@p14,@p15,@p16,@p17,@p18,@p19,@p20,@p21,@p22,@p23,@p24,@p25,@p26,@p27,@p28,@p29,@p30,@p31,@p32,@p33,@p34,@p35,@p36,@p37,@p38,@p39,@p40,@p41,@p42,@p43,@p44,@p45,@p46,@p47,@p48,@p49,@p50,@p51,@p52,@p53,@p54,@p55,@p56,@p57)", con);
                    cmd2.Parameters.AddWithValue("@p1", Convert.ToString(UserData.Name + " " + UserData.SurName));
                    cmd2.Parameters.AddWithValue("@p2", urunadi);
                    cmd2.Parameters.AddWithValue("@p3", urunfiyat);
                    cmd2.Parameters.AddWithValue("@p4", torbatipi);
                    cmd2.Parameters.AddWithValue("@p5", torbaagirligi);
                    cmd2.Parameters.AddWithValue("@p6", bbtipi);
                    cmd2.Parameters.AddWithValue("@p7", bb1250);
                    cmd2.Parameters.AddWithValue("@p8", palet1250);
                    cmd2.Parameters.AddWithValue("@p9", inspection);
                    cmd2.Parameters.AddWithValue("@p10", komisyon);
                    cmd2.Parameters.AddWithValue("@p11", depolamaton);
                    cmd2.Parameters.AddWithValue("@p12", armatorlokali);
                    cmd2.Parameters.AddWithValue("@p13", navlunton);
                    cmd2.Parameters.AddWithValue("@p14", kalemsatisfiyati);
                    cmd2.Parameters.AddWithValue("@p15", tarih);
                    cmd2.Parameters.AddWithValue("@p16", yeniambalaj);
                    cmd2.Parameters.AddWithValue("@p17", icnakliyefiyat);
                    cmd2.Parameters.AddWithValue("@p18", gumrukleme);
                    cmd2.Parameters.AddWithValue("@p19", limandolumbedeli);
                    cmd2.Parameters.AddWithValue("@p20", yeniteslimseklimaliyet);
                    cmd2.Parameters.AddWithValue("@p21", tekliftipi);
                    cmd2.Parameters.AddWithValue("@p22", konteynerbulksecimi);
                    cmd2.Parameters.AddWithValue("@p23", sigortaTON);
                    cmd2.Parameters.AddWithValue("@p24", tonaj);
                    cmd2.Parameters.AddWithValue("@p25", teklifno);
                    cmd2.Parameters.AddWithValue("@p26", musteriismi);
                    cmd2.Parameters.AddWithValue("@p27", kita);
                    cmd2.Parameters.AddWithValue("@p28", ulke);
                    cmd2.Parameters.AddWithValue("@p29", varislimani);
                    cmd2.Parameters.AddWithValue("@p30", UserData.Id);
                    cmd2.Parameters.AddWithValue("@p31", "ONAY BEKLIYOR");
                    cmd2.Parameters.AddWithValue("@p32", EkipmanTuru);
                    cmd2.Parameters.AddWithValue("@p33", birKonteynerTonaji);
                    cmd2.Parameters.AddWithValue("@p34", siparistekikonteynersayisi);
                    cmd2.Parameters.AddWithValue("@p35", vade);
                    cmd2.Parameters.AddWithValue("@p36", kalkislimani);
                    cmd2.Parameters.AddWithValue("@p37", BuKaleminBuKonteynerdekiTonaji);
                    cmd2.Parameters.AddWithValue("@p38", siparistipi);
                    cmd2.Parameters.AddWithValue("@p39", birdenfazlabeyanname);
                    cmd2.Parameters.AddWithValue("@p40", fobmaliyet);
                    cmd2.Parameters.AddWithValue("@p41", parsiyel);
                    cmd2.Parameters.AddWithValue("@p42", anagrup);
                    cmd2.Parameters.AddWithValue("@p43", urununkonteynersayisi);
                    cmd2.Parameters.AddWithValue("@p44", ttarih);
                    cmd2.Parameters.AddWithValue("@p45", gun);
                    cmd2.Parameters.AddWithValue("@p46", ay);
                    cmd2.Parameters.AddWithValue("@p47", yil);
                    cmd2.Parameters.AddWithValue("@p48", urunkodu);
                    cmd2.Parameters.AddWithValue("@p49", musterikodu);
                    cmd2.Parameters.AddWithValue("@p50", girilennavlun);
                    cmd2.Parameters.AddWithValue("@p51", girilenarmatorlokali);
                    cmd2.Parameters.AddWithValue("@p52", toplamsiparistonaji);
                    cmd2.Parameters.AddWithValue("@p53", musteritipi);
                    cmd2.Parameters.AddWithValue("@p54", yediyuzlukod2);
                    cmd2.Parameters.AddWithValue("@p55", urunmaliyet);
                    cmd2.Parameters.AddWithValue("@p56", valorcarpani);
                    cmd2.Parameters.AddWithValue("@p57", ihtackayit);
                    cmd2.ExecuteNonQuery();
                    //SqlCommand cmd = new SqlCommand("OnaltiDort", con);









                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    } SqlConnection.ClearPool(con);
                    return 1;
                }
                catch
                {
                    con.Close();
                    return 0;
                }
            }
        }

        public int TeklifeUrunEkle(string urunadi, double urunfiyat, string torbatipi, int torbaagirligi, string bbtipi, int bbagirligi, string palet, double inspection, double komisyon, double depolamaton, double armatorlokali, double navlunton, double kalemsatisfiyati,  double ambalajmaliyeti, double icnakliyefiyat, double gumrukleme, double limandolumbedeli, double kalemmaliyet,  double buurununsiparistonaji,  string EkipmanTuru, double birKonteynerTonaji, string siparistekikonteynersayisi,  double BuKaleminBuKonteynerdekiTonaji, string siparistipi, string birdenfazlabeyanname, double fobmaliyet,  string anagrup, double urununkonteynersayisi,  string urunkodu,  double toplamsiparistonaji,  string yediyuzlukod, double urunmaliyet, double valorcarpani, string ihrackayit,string teklifno,string konteynerbulksecimi)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand urunekle = new SqlCommand("UrunEkle",con);
                    urunekle.CommandType = CommandType.StoredProcedure;
                    urunekle.ExecuteNonQuery();
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int TeklifeUrunEkle2(string urunadi, double urunfiyat, string torbatipi, int torbaagirligi, string bbtipi, int bbagirligi, string palet, double inspection, double komisyon, double depolamaton, double armatorlokali, double navlunton, double kalemsatisfiyati, double ambalajmaliyeti, double icnakliyefiyat, double gumrukleme, double limandolumbedeli, double kalemmaliyet, double buurununsiparistonaji, string EkipmanTuru, double birKonteynerTonaji, string siparistekikonteynersayisi, double BuKaleminBuKonteynerdekiTonaji, string siparistipi, string birdenfazlabeyanname, double fobmaliyet, string anagrup, double urununkonteynersayisi, string urunkodu, double toplamsiparistonaji, string yediyuzlukod, string yediyuzlukod2, double urunmaliyet, double valorcarpani, string ihrackayit, string teklifno, string konteynerbulksecimi)
        {
            try
            {
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int satisOnayiGonder(string teklifno, string metin)
        {

            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string location = "SatisOnayiBekleyen.aspx?islem=okundu";
                    SqlCommand cmd2 = new SqlCommand("insert into AdminNotification(Text,Location,Whom) values(@p1,@p2,@p3)", con);
                    cmd2.Parameters.AddWithValue("@p1", metin);
                    cmd2.Parameters.AddWithValue("@p2", location);
                    cmd2.Parameters.AddWithValue("@p3", UserData.Id);
                    cmd2.ExecuteNonQuery();
                    SqlCommand cmd = new SqlCommand("Update Orders Set Durum='SATIS ONAYI BEKLIYOR',SatisOnayiGondermeTarihi=@p2 where TeklifNo=@p1", con);
                    cmd.Parameters.AddWithValue("@p2", DateTime.Now);
                    cmd.Parameters.AddWithValue("@p1", teklifno);
                    cmd.ExecuteNonQuery();
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    } ////SqlConnection.ClearPool(con);
                    return 1;
                }
                catch
                {
                    con.Close();
                    return 0;
                }
            }

        }

        public int sepetSil(int id)
        {
            //DbConnection con = new DbConnection();
            using (SqlConnection con = new SqlConnection(strcon))
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("delete from Sepet where Id=@p1", con);
                    cmd.Parameters.AddWithValue("@p1", id);
                    cmd.ExecuteNonQuery();
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    } ////SqlConnection.ClearPool(con);
                    return 1;

                }
                catch
                {
                    con.Close();
                    return 0;
                }

        }
        public int bbAgirlikGuncelle(int id, int agirlik)
        {
            //DbConnection con = new DbConnection();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("update BBWeight set Weight=@p1 where Id=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", agirlik);
                    cmd.Parameters.AddWithValue("@p2", id);
                    cmd.ExecuteNonQuery();
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    } ////SqlConnection.ClearPool(con);
                    return 1;
                }
                catch
                {
                    con.Close();
                    return 0;
                }
            }

        }

        public int bbTipiGuncelle(int id, string isim, double fiyat)
        {
            //DbConnection con = new DbConnection();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("update BBType set bbType=@p1,Price=@p2 where Id=@p3", con);
                    cmd.Parameters.AddWithValue("@p1", isim);
                    cmd.Parameters.AddWithValue("@p2", fiyat);
                    cmd.Parameters.AddWithValue("@p3", id);
                    cmd.ExecuteNonQuery();
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    } ////SqlConnection.ClearPool(con);
                    return 1;
                }
                catch
                {
                    con.Close();
                    return 0;
                }

            }

        }
        public int bolgeGuncelle(int id, string isim)
        {
            //DbConnection con = new DbConnection();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("update Continent set ContinentName=@p1 where Id=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", isim);
                    cmd.Parameters.AddWithValue("@p2", id);

                    cmd.ExecuteNonQuery();
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    }
                    ////SqlConnection.ClearPool(con);
                    return 1;
                }
                catch
                {
                    con.Close();
                    return 0;
                }
            }

        }

        public int EkipmanGuncelle(int id, string isim)
        {
            // DbConnection con = new DbConnection();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("update EquipmentType set EkipmanTürü=@p1 where Id=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", isim);
                    cmd.Parameters.AddWithValue("@p2", id);

                    cmd.ExecuteNonQuery();
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    } ////SqlConnection.ClearPool(con);
                    return 1;
                }
                catch
                {
                    con.Close();
                    return 0;
                }
            }

        }


        public int GumrukGuncelle(int id, double bulkgumruk, double konteynergumruk, double konteynergumrukikidokuz, double konteynergumrukonuzeri, double karayolu, double karayoluiki, double demiryolu, double demiryoluiki)
        {
            // DbConnection con = new DbConnection();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("update Clearance set GumruklemeBULK=@p1,GumruklemeKONTEYNER=@p2,GumruklemeKONTEYNERikidokuz=@p3,GumruklemeKONTEYNERonuzeri=@p4,GumruklemeKonteynerKaraYolu=@p6,GumruklemeKonteynerKaraYoluikiuzeri=@p7,GumruklemeKonteynerDemirYolu=@p8,GumruklemeKonteynerDemirYoluikiuzeri=@p9 where Id=@p5", con);
                    cmd.Parameters.AddWithValue("@p1", bulkgumruk);
                    cmd.Parameters.AddWithValue("@p2", konteynergumruk);
                    cmd.Parameters.AddWithValue("@p3", konteynergumrukikidokuz);
                    cmd.Parameters.AddWithValue("@p4", konteynergumrukonuzeri);
                    cmd.Parameters.AddWithValue("@p5", id);
                    cmd.Parameters.AddWithValue("@p6", karayolu);
                    cmd.Parameters.AddWithValue("@p7", karayoluiki);
                    cmd.Parameters.AddWithValue("@p8", demiryolu);
                    cmd.Parameters.AddWithValue("@p9", demiryoluiki);
                    cmd.ExecuteNonQuery();
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    } //SqlConnection.ClearPool(con);
                    return 1;
                }
                catch
                {
                    con.Close();
                    return 0;
                }
            }

        }
        public int LimanGuncelle(int id, string limanadi, double fiyat, double insideport)
        {
            //DbConnection con = new DbConnection();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("update Port set PortName=@p1,Price=@p2,InsideTransport=@p3 where Id=@p4", con);
                    cmd.Parameters.AddWithValue("@p1", limanadi);
                    cmd.Parameters.AddWithValue("@p2", fiyat);
                    cmd.Parameters.AddWithValue("@p3", insideport);
                    cmd.Parameters.AddWithValue("@p4", id);
                    cmd.ExecuteNonQuery();
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    } //SqlConnection.ClearPool(con);
                    return 1;
                }
                catch
                {
                    con.Close();
                    return 0;
                }
            }

        }
        public int PaletGuncelle(int id, double fiyat)
        {
            //DbConnection con = new DbConnection();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("update Palette set Price=@p2 where Id=@p3", con);

                    cmd.Parameters.AddWithValue("@p2", fiyat);
                    cmd.Parameters.AddWithValue("@p3", id);
                    cmd.ExecuteNonQuery();
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    } //SqlConnection.ClearPool(con);
                    return 1;
                }
                catch
                {
                    con.Close();
                    return 0;
                }
            }

        }
        public int StrecGuncelle(int id, double fiyat)
        {
            //DbConnection con = new DbConnection();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("update Stretch set Price=@p2 where Id=@p3", con);

                    cmd.Parameters.AddWithValue("@p2", fiyat);
                    cmd.Parameters.AddWithValue("@p3", id);
                    cmd.ExecuteNonQuery();
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    } //SqlConnection.ClearPool(con);
                    return 1;
                }
                catch
                {
                    con.Close();
                    return 0;
                }
            }

        }

        public int torbaAgirligiGuncelle(int id, int agirlik)
        {
            //DbConnection con = new DbConnection();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("update BagWeight set Weight=@p1 where Id=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", agirlik);
                    cmd.Parameters.AddWithValue("@p2", id);

                    cmd.ExecuteNonQuery();
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    } //SqlConnection.ClearPool(con);
                    return 1;
                }
                catch
                {
                    con.Close();
                    return 0;
                }
            }

        }

        public int torbaTipiGuncelle(int id, string tip, double fiyat)
        {
            // DbConnection con = new DbConnection();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("update BagType set bagType=@p1,Price=@p2 where Id=@p3", con);
                    cmd.Parameters.AddWithValue("@p1", tip);
                    cmd.Parameters.AddWithValue("@p2", fiyat);
                    cmd.Parameters.AddWithValue("@p3", id);
                    cmd.ExecuteNonQuery();
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    } //SqlConnection.ClearPool(con);
                    return 1;
                }
                catch
                {
                    con.Close();
                    return 0;
                }
            }

        }

        public int UlkeGuncelle(int id, int UstId, string isim)
        {
            // DbConnection con = new DbConnection();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("update Country set UstId=@p1,CountryName=@p2 where Id=@p3", con);
                    cmd.Parameters.AddWithValue("@p1", UstId);
                    cmd.Parameters.AddWithValue("@p2", isim);
                    cmd.Parameters.AddWithValue("@p3", id);
                    cmd.ExecuteNonQuery();
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    } //SqlConnection.ClearPool(con);
                    return 1;
                }
                catch
                {
                    con.Close();
                    return 0;
                }
            }

        }
        public int UrunGuncelle(int id, string sinif, string isim, string kod, double fiyat, double fiyat_intercarb, double fiyat_roskim, double fiyat_ozer)
        {
            //DbConnection con = new DbConnection();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("update Product set MainClass=@p1,ProductName=@p2,Price=@p3,Code=@p5,Price_Intercarb=@p6,Price_Roskim=@p7,Price_Ozer=@p8 where Id=@p4", con);
                    cmd.Parameters.AddWithValue("@p1", sinif);
                    cmd.Parameters.AddWithValue("@p2", isim);
                    cmd.Parameters.AddWithValue("@p3", fiyat);
                    cmd.Parameters.AddWithValue("@p4", id);
                    cmd.Parameters.AddWithValue("@p5", kod);
                    cmd.Parameters.AddWithValue("@p6", fiyat_intercarb);
                    cmd.Parameters.AddWithValue("@p7", fiyat_roskim);
                    cmd.Parameters.AddWithValue("@p8", fiyat_ozer);
                    cmd.ExecuteNonQuery();
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    } //SqlConnection.ClearPool(con);
                    return 1;
                }
                catch
                {
                    con.Close();
                    return 0;
                }
            }

        }

        public int VadeGuncelle(int id, string vade, double fiyat)
        {
            // DbConnection con = new DbConnection();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("update Maturity set Maturity=@p1,Price=@p3 where Id=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", vade);
                    cmd.Parameters.AddWithValue("@p2", id);
                    cmd.Parameters.AddWithValue("@p3", fiyat);
                    cmd.ExecuteNonQuery();
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    } //SqlConnection.ClearPool(con);
                    return 1;
                }
                catch
                {
                    con.Close();
                    return 0;
                }
            }

        }
        public int DoldurBosalt(string metin, string konum)
        {
            //DbConnection con = new DbConnection();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    string[] bilgiler=new string[10];
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand bildirim = new SqlCommand("insert into AdminNotification(Text,Location,Whom) values(@p1,@p2,@p3)", con);
                    bildirim.Parameters.AddWithValue("@p1", metin);
                    bildirim.Parameters.AddWithValue("@p2", konum);
                    bildirim.Parameters.AddWithValue("@p3", UserData.Name + UserData.SurName);
                    bildirim.ExecuteNonQuery();

                    SqlCommand bilgicek = new SqlCommand("select distinct TeklifNo,Temsilci,MusteriIsmi,MusteriKodu    from Sepet where TemsilciKullaniciAdi='" + UserData.Id + "'", con);
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = bilgicek;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    foreach (DataRow dr in dt.Rows)
                    {
                        bilgiler[0] = dr["TeklifNo"].ToString();
                        bilgiler[1] = dr["Temsilci"].ToString();
                        bilgiler[2] = dr["MusteriIsmi"].ToString();
                        bilgiler[3] = dr["MusteriKodu"].ToString();
                    }
                    if (bilgiler[3] == "")
                    {
                        SqlCommand mailcek = new SqlCommand("select Email from Users where Id=13", con);
                        bilgiler[4] = Convert.ToString(mailcek.ExecuteScalar());
                        using (MailMessage mail = new MailMessage())
                        {
                            SmtpClient smtpServer = new SmtpClient(Properties.Settings.Default.SMTP_Server);
                            smtpServer.EnableSsl = Properties.Settings.Default.SSL;
                            smtpServer.Credentials = new System.Net.NetworkCredential(Properties.Settings.Default.SMTP_UserName, Properties.Settings.Default.SMTP_Password);
                            smtpServer.EnableSsl = Properties.Settings.Default.SSL;
                            mail.From = new MailAddress(Properties.Settings.Default.SMTP_UserName, "TRADE");
                            mail.To.Add(bilgiler[4]);
                            mail.Subject = "YENİ MÜŞTERİ TEKLİFİ";
                            mail.Body = "<!DOCTYPE html><html><head><title></title></head><body><div><b>Yeni Müşteri Teklifi Var</b></div><br />Teklifi Oluşturan:" + bilgiler[1] + "<div><br/>Teklif No:" + bilgiler[0] + "<br/><b>Müşteri :" + bilgiler[2] + "</b> </div><br /></div></body></html>";

                            mail.IsBodyHtml = true;
                            smtpServer.Send(mail);
                        }
                    }
                    SqlCommand cmd = new SqlCommand("SepetToOrders", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TemsilciKullaniciAdi", UserData.Id);
                    cmd.ExecuteNonQuery();
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    } //SqlConnection.ClearPool(con);
                    return 1;
                }
                catch
                {
                    con.Close();
                    return 0;
                }

            }

        }
        public int tekTeklifOnay(int id, string metin, string kimicin, int islemyapan)
        {
            //DbConnection con = new DbConnection();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string location = "OnaylananTeklifler.aspx?islem=okundu";
                    SqlCommand ekle = new SqlCommand("insert into UserNotifications(Text,Location,Whom) values(@p1,@p2,@p3)", con);
                    ekle.Parameters.AddWithValue("@p1", metin);
                    ekle.Parameters.AddWithValue("@p2", location);
                    ekle.Parameters.AddWithValue("@p3", kimicin);
                    ekle.ExecuteNonQuery();
                    SqlCommand cmd = new SqlCommand("update Orders set Durum='ONAYLANDI',TeklifiOnaylayan=@pp where Id=@p1", con);
                    cmd.Parameters.AddWithValue("@pp", islemyapan);
                    cmd.Parameters.AddWithValue("@p1", id);
                    cmd.ExecuteNonQuery();
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    } //SqlConnection.ClearPool(con);
                    return 1;
                }
                catch
                {
                    con.Close();
                    return 0;
                }
            }


        }
        public int tekSatisaDondur(int id, string metin, int islemyapan)
        {

            using (SqlConnection con = new SqlConnection(strcon))
            {

                try
                {
                    con.Open();
                    string location = "SatisiOnaylananTeklifler.aspx?islem=okundu";
                    SqlCommand ekle = new SqlCommand("insert into UserNotifications(Text,Location,Whom) values(@p1,@p2,@p3)", con);
                    ekle.Parameters.AddWithValue("@p1", metin);
                    ekle.Parameters.AddWithValue("@p2", location);
                    ekle.Parameters.AddWithValue("@p3", UserData.Id);
                    ekle.CommandTimeout = 10000;
                    ekle.ExecuteNonQuery();
                    SqlCommand cmd = new SqlCommand("update Orders set Durum='SATISA DONDU',SatisOnayiVeren=@pp where Id=@p1", con);
                    cmd.Parameters.AddWithValue("@pp", islemyapan);
                    cmd.Parameters.AddWithValue("@p1", id);
                    cmd.CommandTimeout = 10000;
                    cmd.ExecuteNonQuery();

                    con.Close();
                    //SqlConnection.ClearPool(con);
                    return 1;
                }
                catch
                {
                    con.Close();
                    return 0;
                }
            }

        }



        public int tekSatisaDondurSepet(string teklifno, string metin, int islemyapan)
        {

            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();

                try
                {
                    string location = "SatisiOnaylananTeklifler.aspx?islem=okundu";
                    SqlCommand ekle = new SqlCommand("insert into UserNotifications(Text,Location,Whom) values(@p1,@p2,@p3)", con);
                    ekle.Parameters.AddWithValue("@p1", metin);
                    ekle.Parameters.AddWithValue("@p2", location);
                    ekle.Parameters.AddWithValue("@p3", UserData.Id);
                    ekle.CommandTimeout = 10000;
                    ekle.ExecuteNonQuery();
                    SqlCommand cmd = new SqlCommand("update Orders set Durum='SATISA DONDU',SatisOnayiVeren=@pp where TeklifNo=@p1", con);
                    cmd.Parameters.AddWithValue("@pp", islemyapan);
                    cmd.Parameters.AddWithValue("@p1", teklifno);
                    cmd.CommandTimeout = 10000;
                    cmd.ExecuteNonQuery();
                    //Fiches.Orders(teklifno);
                    TumDokumler(teklifno);
                    con.Close(); //SqlConnection.ClearPool(con);
                    return 1;
                }
                catch
                {
                    return 0;
                }

            }
        }
        private DataTable GetData(string teklifNo)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("select TeklifNo as [Teklif Numarası], TeklifTipi as [Gönderim Şekli], Temsilci,MusteriIsmi as Cari,Kita as Kıta,Ulke as Ülke,UrunAnaGrup as [Ürün Ana Sınıfı],Urun as [Ürün],UrunFiyat as [Ürün Fiyatı],Ambalaj as [Ambalaj Maliyeti],GumruklemeTON as [Gümrükleme Maliyeti],Inspection,Komisyon as [Distribütör Komisyonu],AraNakliyeTON as [Ara Nakliye Maliyeti],DepolamaTON as [Depolama Maliyeti],ArmatorLokali as [Armatör Lokali],LimanIcDolumBedeliTON as [Liman Dolum Maliyeti],NavlunTON as [Navlun],SigortaTON as [Sigorta],KalemMaliyeti as [Toplam Maliyet],KalemSatisFiyati as [Satış Fiyatı],CAST(((KalemSatisFiyati-KalemMaliyeti)/KalemMaliyeti)*100 as decimal(18,2)) as [Kar Oranı(%)] from Orders where TeklifNo='" + teklifNo + "'"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                    con.Close();
                }
                ////SqlConnection.ClearPool(con);

            }
        }
        public int KullaniciGuncelle(int id, string kullaniciAdi, string sifre, string Adi, string soyadi, string yetki, string email, string aktiflik)
        {
            // DbConnection con = new DbConnection();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    bool activate = false;
                    if (aktiflik == "Aktif")
                    {
                        activate = true;
                    }
                    else if (aktiflik == "Pasif")
                    {
                        activate = false;
                    }
                    SqlCommand guncelle = new SqlCommand("update Users set UserName=@p1,Password=@p2,Name=@p3,SurName=@p4,Authority=@p5,Email=@p6,Active=@p7 where Id=@p8", con);
                    guncelle.Parameters.AddWithValue("@p1", kullaniciAdi);
                    guncelle.Parameters.AddWithValue("@p2", sifre);
                    guncelle.Parameters.AddWithValue("@p3", Adi);
                    guncelle.Parameters.AddWithValue("@p4", soyadi);
                    guncelle.Parameters.AddWithValue("@p5", yetki);
                    guncelle.Parameters.AddWithValue("@p6", email);
                    guncelle.Parameters.AddWithValue("@p7", activate);
                    guncelle.Parameters.AddWithValue("@p8", id);
                    guncelle.ExecuteNonQuery();
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    } //SqlConnection.ClearPool(con);

                    return 1;
                }
                catch
                {
                    con.Close();
                    return 0;
                }
            }

        }
        public int ProfilGuncelle(string kullaniciAdi, string sifre, int id)
        {
            // DbConnection con = new DbConnection();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand guncelle = new SqlCommand("update Users set UserName=@p1,Password=@p2 where Id=@p3", con);
                    guncelle.Parameters.AddWithValue("@p1", kullaniciAdi);
                    guncelle.Parameters.AddWithValue("@p2", sifre);
                    guncelle.Parameters.AddWithValue("@p3", id);
                    guncelle.ExecuteNonQuery();
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    }
                    //SqlConnection.ClearPool(con);

                    return 1;
                }
                catch
                {
                    con.Close();
                    return 0;
                }
            }

        }

        public int yuklemebedeliGucelle(int id, double cakilifiyat, double limak20, double limak40, double mip20, double mip40)
        {
            // DbConnection con = new DbConnection();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("update LoadingCharge set Price=@p1,ContainerFreeinLIMAK20=@p2,ContainerFreeinLIMAK40=@p3,ContainerFreeinMIP20=@p4,ContainerFreeinMIP40=@p5 where Id=@p6", con);
                    cmd.Parameters.AddWithValue("@p1", cakilifiyat);
                    cmd.Parameters.AddWithValue("@p2", limak20);
                    cmd.Parameters.AddWithValue("@p3", limak40);
                    cmd.Parameters.AddWithValue("@p4", mip20);
                    cmd.Parameters.AddWithValue("@p5", mip40);
                    cmd.Parameters.AddWithValue("@p6", id);
                    cmd.ExecuteNonQuery();
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    } //SqlConnection.ClearPool(con);

                    return 1;
                }
                catch
                {
                    con.Close();
                    return 0;

                }
            }

        }
        public int onayIptal(int id, string metin, string kimicin)
        {
            // DbConnection con = new DbConnection();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string location = "OnayBekleyenTeklifler.aspx?islem=okundu";
                    SqlCommand ekle = new SqlCommand("insert into UserNotifications(Text,Location,Whom) values(@p1,@p2,@p3)", con);
                    ekle.Parameters.AddWithValue("@p1", metin);
                    ekle.Parameters.AddWithValue("@p2", location);
                    ekle.Parameters.AddWithValue("@p3", kimicin);
                    ekle.ExecuteNonQuery();
                    SqlCommand cmd = new SqlCommand("Update Orders Set Durum='ONAY IPTALI' where Id=@p1", con);
                    cmd.Parameters.AddWithValue("@p1", id);
                    cmd.ExecuteNonQuery();

                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    } //SqlConnection.ClearPool(con);

                    return 1;
                }
                catch
                {
                    con.Close();
                    return 0;
                }
            }

        }
        public int SatisOnayIptal(int id, string metin, string kimicin)
        {
            // DbConnection con = new DbConnection();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string location = "SatisOnayiBekleyenTeklifler.aspx?islem=okundu";
                    SqlCommand ekle = new SqlCommand("insert into UserNotifications(Text,Location,Whom) values(@p1,@p2,@p3)", con);
                    ekle.Parameters.AddWithValue("@p1", metin);
                    ekle.Parameters.AddWithValue("@p2", location);
                    ekle.Parameters.AddWithValue("@p3", kimicin);
                    ekle.ExecuteNonQuery();
                    SqlCommand cmd = new SqlCommand("Update Orders set Durum='SATIS ONAY IPTALI' where Id=@p1", con);
                    cmd.Parameters.AddWithValue("@p1", id);
                    cmd.ExecuteNonQuery();

                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    } //SqlConnection.ClearPool(con);

                    return 1;

                }
                catch
                {
                    con.Close();
                    return 0;
                }
            }

        }
        public int BildirimOkundu(int id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand sil = new SqlCommand("delete from AdminNotification where Id=@p1", con);
                    sil.Parameters.AddWithValue("@p1", id);
                    sil.ExecuteNonQuery();
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }

                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int KullaniciBildirimOkundu(int id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand sil = new SqlCommand("delete from UserNotifications where Id=@p1", con);
                    sil.Parameters.AddWithValue("@p1", id);
                    sil.ExecuteNonQuery();
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        public int YeniTeklif(int kullanici)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand yeni = new SqlCommand("delete from Sepet where TemsilciKullaniciAdi=@p1", con);
                    yeni.Parameters.AddWithValue("@p1", kullanici);
                    yeni.ExecuteNonQuery();
                    SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        public int UserAciklamaEkle(string aciklama, int id, string metin, string konum)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Update Orders Set Aciklama=@p1 where Id=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", aciklama);
                    cmd.Parameters.AddWithValue("@p2", id);
                    cmd.ExecuteNonQuery();

                    SqlCommand ekle = new SqlCommand("insert into AdminNotification(Text,Location,Whom) values(@p1,@p2,@p3)", con);
                    ekle.Parameters.AddWithValue("@p1", metin);
                    ekle.Parameters.AddWithValue("@p2", konum);
                    ekle.Parameters.AddWithValue("@p3", UserData.Name + " " + UserData.SurName);
                    ekle.ExecuteNonQuery();
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int TeklifiRevizeyeGonder(string teklifno)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update Orders set Durum='REVIZE ISTENILEN TEKLIF' where TeklifNo='"+teklifno+"'",con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int AciklamaEkle(string aciklama, string teklifNo, string metin, string kimicin, string gelen, string durum, int islemyapan)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    string location = "";
                    if (gelen == "teklif")
                        location = "RevizeIstenenTeklifler.aspx?islem=okundu";
                    else
                        location = "RevizeİstenenSatislar.aspx?islem=okundu";
                    SqlCommand ekle = new SqlCommand("insert into UserNotifications(Text,Location,Whom) values(@p1,@p2,@p3)", con);
                    ekle.Parameters.AddWithValue("@p1", metin);
                    ekle.Parameters.AddWithValue("@p2", location);
                    ekle.Parameters.AddWithValue("@p3", kimicin);
                    ekle.ExecuteNonQuery();
                    SqlCommand cmd = new SqlCommand("update Orders set Aciklama=@p1, Durum=@p3,TeklifiRevizeyeGonderen=@pp where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@pp", islemyapan);
                    cmd.Parameters.AddWithValue("@p1", aciklama);
                    cmd.Parameters.AddWithValue("@p2", teklifNo);
                    cmd.Parameters.AddWithValue("@p3", durum);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    //SqlConnection.ClearPool(con);
                    return 1;
                }
            }
            catch
            {
                return 0;
            }
        }
        //public int AciklamaEkle(string aciklama, int id,string metin,string kimicin,string gelen,string durum)
        //{
        //    try
        //    {
        //        using (SqlConnection con = new SqlConnection(strcon))
        //        {
        //            con.Open();
        //            string location = "";
        //            if (gelen == "teklif")
        //                location = "RevizeIstenenTeklifler.aspx?islem=okundu";
        //            else if(gelen=="siparis")
        //            {
        //                location = "RevizeİstenenSatislar.aspx?islem=okundu";
        //            }
        //            SqlCommand ekle = new SqlCommand("insert into UserNotifications(Text,Location,Whom) values(@p1,@p2,@p3)",con);
        //            ekle.Parameters.AddWithValue("@p1",metin);
        //            ekle.Parameters.AddWithValue("@p2", location);
        //            ekle.Parameters.AddWithValue("@p3", kimicin);
        //            ekle.ExecuteNonQuery();
        //            SqlCommand cmd = new SqlCommand("update Orders set Aciklama=@p1, Durum=@p3 where Id=@p2", con);
        //            cmd.Parameters.AddWithValue("@p1", aciklama);
        //            cmd.Parameters.AddWithValue("@p2", id);
        //            cmd.Parameters.AddWithValue("@p3",durum);
        //            cmd.ExecuteNonQuery();
        //            con.Close();
        //        }
        //        return 1;
        //    }
        //    catch
        //    {
        //        return 0;
        //    }
        // }






        public int DeleteTeklif(int id, string kimicin, string metin)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    string location = "OnayBekleyenTeklifler.aspx?islem=okundu";
                    SqlCommand ekle = new SqlCommand("insert into UserNotifications(Text,Location,Whom) values(@p1,@p2,@p3)", con);
                    ekle.Parameters.AddWithValue("@p1", metin);
                    ekle.Parameters.AddWithValue("@p2", location);
                    ekle.Parameters.AddWithValue("@p3", kimicin);
                    ekle.ExecuteNonQuery();
                    SqlCommand cmd = new SqlCommand("delete from Orders where Id=@p1", con);
                    cmd.Parameters.AddWithValue("@p1", id);
                    cmd.ExecuteNonQuery();
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int DeleteSatis(int id, string kimicin, string metin)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    string location = "SatisOnayiBekleyenTeklifler.aspx?islem=okundu";
                    SqlCommand ekle = new SqlCommand("insert into UserNotifications(Text,Location,Whom) values(@p1,@p2,@p3)", con);
                    ekle.Parameters.AddWithValue("@p1", metin);
                    ekle.Parameters.AddWithValue("@p2", location);
                    ekle.Parameters.AddWithValue("@p3", kimicin);
                    ekle.ExecuteNonQuery();
                    SqlCommand cmd = new SqlCommand("delete from Orders where Id=@p1", con);
                    cmd.Parameters.AddWithValue("@p1", id);
                    cmd.ExecuteNonQuery();
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }


        public int SiparisNumarasiGirAdmin(int id, string siparisno, string metin, int kimicin)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    string location = "SatisiOnaylananTeklifler.aspx?islem=okundu";
                    SqlCommand ekle = new SqlCommand("insert into UserNotifications(Text,Location,Whom) values(@p1,@p2,@p3)", con);
                    ekle.Parameters.AddWithValue("@p1", metin);
                    ekle.Parameters.AddWithValue("@p3", kimicin);
                    ekle.Parameters.AddWithValue("@p2", location);
                    ekle.ExecuteNonQuery();
                    SqlCommand cmd = new SqlCommand("update Orders set SiparisNo=@p1 where Id=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", siparisno);
                    cmd.Parameters.AddWithValue("@p2", id);
                    cmd.ExecuteNonQuery();
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }














        public int SiparisNumarasiGir(int id, string siparisno, string metin)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    string location = "SatisOnaylanan.aspx?islem=okundu";
                    SqlCommand ekle = new SqlCommand("insert into AdminNotification(Text,Location,Whom) values(@p1,@p2,@p3)", con);
                    ekle.Parameters.AddWithValue("@p1", metin);
                    ekle.Parameters.AddWithValue("@p3", UserData.Name + " " + UserData.SurName);
                    ekle.Parameters.AddWithValue("@p2", location);
                    ekle.ExecuteNonQuery();
                    SqlCommand cmd = new SqlCommand("update Orders set SiparisNo=@p1 where Id=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", siparisno);
                    cmd.Parameters.AddWithValue("@p2", id);
                    cmd.ExecuteNonQuery();
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int SaticiHedefGir(string satici, string musterikodu, string musteriadi, string urunanasinifi, string urun, string urunkodu, double ocakhedef, double subathedef, double marthedef, double nisanhedef, double mayishedef, double haziranhedef, double temmuzhedef, double agustoshedef, double eylulhedef, double ekimhedef, double kasimhedef, double aralikhedef)
        {

            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    //Ocak Ayı
                    SqlCommand ocak = new SqlCommand("insert into SalesTarget(Satici,MusteriKodu,MusteriAdi,UrunAnaSinifi,Urun,UrunKodu,Ay,Hedef,AyId) values(@p1,@p2,@p3,@p4,@p6,@p7,@p8,@p9,@p10)", con);
                    ocak.Parameters.AddWithValue("@p1", satici);
                    ocak.Parameters.AddWithValue("@p2", musterikodu);
                    ocak.Parameters.AddWithValue("@p3", musteriadi);
                    ocak.Parameters.AddWithValue("@p4", urunanasinifi);

                    ocak.Parameters.AddWithValue("@p6", urun);
                    ocak.Parameters.AddWithValue("@p7", urunkodu);
                    ocak.Parameters.AddWithValue("@p8", "Ocak");
                    ocak.Parameters.AddWithValue("@p9", ocakhedef);
                    ocak.Parameters.AddWithValue("@p10", 1);
                    ocak.ExecuteNonQuery();
                    //Subat Ayı
                    SqlCommand subat = new SqlCommand("insert into SalesTarget(Satici,MusteriKodu,MusteriAdi,UrunAnaSinifi,Urun,UrunKodu,Ay,Hedef,AyId) values(@p1,@p2,@p3,@p4,@p6,@p7,@p8,@p9,@p10)", con);
                    subat.Parameters.AddWithValue("@p1", satici);
                    subat.Parameters.AddWithValue("@p2", musterikodu);
                    subat.Parameters.AddWithValue("@p3", musteriadi);
                    subat.Parameters.AddWithValue("@p4", urunanasinifi);

                    subat.Parameters.AddWithValue("@p6", urun);
                    subat.Parameters.AddWithValue("@p7", urunkodu);
                    subat.Parameters.AddWithValue("@p8", "Şubat");
                    subat.Parameters.AddWithValue("@p9", subathedef);
                    subat.Parameters.AddWithValue("@p10", 2);
                    subat.ExecuteNonQuery();

                    //Mart Ayı
                    SqlCommand mart = new SqlCommand("insert into SalesTarget(Satici,MusteriKodu,MusteriAdi,UrunAnaSinifi,Urun,UrunKodu,Ay,Hedef,AyId) values(@p1,@p2,@p3,@p4,@p6,@p7,@p8,@p9,@p10)", con);
                    mart.Parameters.AddWithValue("@p1", satici);
                    mart.Parameters.AddWithValue("@p2", musterikodu);
                    mart.Parameters.AddWithValue("@p3", musteriadi);
                    mart.Parameters.AddWithValue("@p4", urunanasinifi);

                    mart.Parameters.AddWithValue("@p6", urun);
                    mart.Parameters.AddWithValue("@p7", urunkodu);
                    mart.Parameters.AddWithValue("@p8", "Mart");
                    mart.Parameters.AddWithValue("@p9", marthedef);
                    mart.Parameters.AddWithValue("@p10", 3);
                    mart.ExecuteNonQuery();

                    //Nisan ayı

                    SqlCommand nisan = new SqlCommand("insert into SalesTarget(Satici,MusteriKodu,MusteriAdi,UrunAnaSinifi,Urun,UrunKodu,Ay,Hedef,AyId) values(@p1,@p2,@p3,@p4,@p6,@p7,@p8,@p9,@p10)", con);
                    nisan.Parameters.AddWithValue("@p1", satici);
                    nisan.Parameters.AddWithValue("@p2", musterikodu);
                    nisan.Parameters.AddWithValue("@p3", musteriadi);
                    nisan.Parameters.AddWithValue("@p4", urunanasinifi);

                    nisan.Parameters.AddWithValue("@p6", urun);
                    nisan.Parameters.AddWithValue("@p7", urunkodu);
                    nisan.Parameters.AddWithValue("@p8", "Nisan");
                    nisan.Parameters.AddWithValue("@p9", nisanhedef);
                    nisan.Parameters.AddWithValue("@p10", 4);
                    nisan.ExecuteNonQuery();

                    //Mayıs Ayı

                    SqlCommand mayis = new SqlCommand("insert into SalesTarget(Satici,MusteriKodu,MusteriAdi,UrunAnaSinifi,Urun,UrunKodu,Ay,Hedef,AyId) values(@p1,@p2,@p3,@p4,@p6,@p7,@p8,@p9,@p10)", con);
                    mayis.Parameters.AddWithValue("@p1", satici);
                    mayis.Parameters.AddWithValue("@p2", musterikodu);
                    mayis.Parameters.AddWithValue("@p3", musteriadi);
                    mayis.Parameters.AddWithValue("@p4", urunanasinifi);

                    mayis.Parameters.AddWithValue("@p6", urun);
                    mayis.Parameters.AddWithValue("@p7", urunkodu);
                    mayis.Parameters.AddWithValue("@p8", "Mayıs");
                    mayis.Parameters.AddWithValue("@p9", mayishedef);
                    mayis.Parameters.AddWithValue("@p10", 5);
                    mayis.ExecuteNonQuery();

                    //Haziran Ayı
                    SqlCommand haziran = new SqlCommand("insert into SalesTarget(Satici,MusteriKodu,MusteriAdi,UrunAnaSinifi,Urun,UrunKodu,Ay,Hedef,AyId) values(@p1,@p2,@p3,@p4,@p6,@p7,@p8,@p9,@p10)", con);
                    haziran.Parameters.AddWithValue("@p1", satici);
                    haziran.Parameters.AddWithValue("@p2", musterikodu);
                    haziran.Parameters.AddWithValue("@p3", musteriadi);
                    haziran.Parameters.AddWithValue("@p4", urunanasinifi);

                    haziran.Parameters.AddWithValue("@p6", urun);
                    haziran.Parameters.AddWithValue("@p7", urunkodu);
                    haziran.Parameters.AddWithValue("@p8", "Haziran");
                    haziran.Parameters.AddWithValue("@p9", haziranhedef);
                    haziran.Parameters.AddWithValue("@p10", 6);
                    haziran.ExecuteNonQuery();


                    //Temmuz Hedef
                    SqlCommand temmuz = new SqlCommand("insert into SalesTarget(Satici,MusteriKodu,MusteriAdi,UrunAnaSinifi,Urun,UrunKodu,Ay,Hedef,AyId) values(@p1,@p2,@p3,@p4,@p6,@p7,@p8,@p9,@p10)", con);
                    temmuz.Parameters.AddWithValue("@p1", satici);
                    temmuz.Parameters.AddWithValue("@p2", musterikodu);
                    temmuz.Parameters.AddWithValue("@p3", musteriadi);
                    temmuz.Parameters.AddWithValue("@p4", urunanasinifi);

                    temmuz.Parameters.AddWithValue("@p6", urun);
                    temmuz.Parameters.AddWithValue("@p7", urunkodu);
                    temmuz.Parameters.AddWithValue("@p8", "Temmuz");
                    temmuz.Parameters.AddWithValue("@p9", temmuzhedef);
                    temmuz.Parameters.AddWithValue("@p10", 7);
                    temmuz.ExecuteNonQuery();

                    //Ağustos Hedef
                    SqlCommand agustos = new SqlCommand("insert into SalesTarget(Satici,MusteriKodu,MusteriAdi,UrunAnaSinifi,Urun,UrunKodu,Ay,Hedef,AyId) values(@p1,@p2,@p3,@p4,@p6,@p7,@p8,@p9,@p10)", con);
                    agustos.Parameters.AddWithValue("@p1", satici);
                    agustos.Parameters.AddWithValue("@p2", musterikodu);
                    agustos.Parameters.AddWithValue("@p3", musteriadi);
                    agustos.Parameters.AddWithValue("@p4", urunanasinifi);

                    agustos.Parameters.AddWithValue("@p6", urun);
                    agustos.Parameters.AddWithValue("@p7", urunkodu);
                    agustos.Parameters.AddWithValue("@p8", "Ağustos");
                    agustos.Parameters.AddWithValue("@p9", agustoshedef);
                    agustos.Parameters.AddWithValue("@p10", 8);
                    agustos.ExecuteNonQuery();


                    //Eylül Hedef
                    SqlCommand eylul = new SqlCommand("insert into SalesTarget(Satici,MusteriKodu,MusteriAdi,UrunAnaSinifi,Urun,UrunKodu,Ay,Hedef,AyId) values(@p1,@p2,@p3,@p4,@p6,@p7,@p8,@p9,@p10)", con);
                    eylul.Parameters.AddWithValue("@p1", satici);
                    eylul.Parameters.AddWithValue("@p2", musterikodu);
                    eylul.Parameters.AddWithValue("@p3", musteriadi);
                    eylul.Parameters.AddWithValue("@p4", urunanasinifi);

                    eylul.Parameters.AddWithValue("@p6", urun);
                    eylul.Parameters.AddWithValue("@p7", urunkodu);
                    eylul.Parameters.AddWithValue("@p8", "Eylül");
                    eylul.Parameters.AddWithValue("@p9", eylulhedef);
                    eylul.Parameters.AddWithValue("@p10", 9);
                    eylul.ExecuteNonQuery();


                    //Ekim Hedef
                    SqlCommand ekim = new SqlCommand("insert into SalesTarget(Satici,MusteriKodu,MusteriAdi,UrunAnaSinifi,Urun,UrunKodu,Ay,Hedef,AyId) values(@p1,@p2,@p3,@p4,@p6,@p7,@p8,@p9,@p10)", con);
                    ekim.Parameters.AddWithValue("@p1", satici);
                    ekim.Parameters.AddWithValue("@p2", musterikodu);
                    ekim.Parameters.AddWithValue("@p3", musteriadi);
                    ekim.Parameters.AddWithValue("@p4", urunanasinifi);

                    ekim.Parameters.AddWithValue("@p6", urun);
                    ekim.Parameters.AddWithValue("@p7", urunkodu);
                    ekim.Parameters.AddWithValue("@p8", "Ekim");
                    ekim.Parameters.AddWithValue("@p9", ekimhedef);
                    ekim.Parameters.AddWithValue("@p10", 10);
                    ekim.ExecuteNonQuery();

                    //Kasım Hedef
                    SqlCommand kasim = new SqlCommand("insert into SalesTarget(Satici,MusteriKodu,MusteriAdi,UrunAnaSinifi,Urun,UrunKodu,Ay,Hedef,AyId) values(@p1,@p2,@p3,@p4,@p6,@p7,@p8,@p9,@p10)", con);
                    kasim.Parameters.AddWithValue("@p1", satici);
                    kasim.Parameters.AddWithValue("@p2", musterikodu);
                    kasim.Parameters.AddWithValue("@p3", musteriadi);
                    kasim.Parameters.AddWithValue("@p4", urunanasinifi);

                    kasim.Parameters.AddWithValue("@p6", urun);
                    kasim.Parameters.AddWithValue("@p7", urunkodu);
                    kasim.Parameters.AddWithValue("@p8", "Kasım");
                    kasim.Parameters.AddWithValue("@p9", kasimhedef);
                    kasim.Parameters.AddWithValue("@p10", 11);
                    kasim.ExecuteNonQuery();

                    //Aralık Hedef
                    SqlCommand aralik = new SqlCommand("insert into SalesTarget(Satici,MusteriKodu,MusteriAdi,UrunAnaSinifi,Urun,UrunKodu,Ay,Hedef,AyId) values(@p1,@p2,@p3,@p4,@p6,@p7,@p8,@p9,@p10)", con);
                    aralik.Parameters.AddWithValue("@p1", satici);
                    aralik.Parameters.AddWithValue("@p2", musterikodu);
                    aralik.Parameters.AddWithValue("@p3", musteriadi);
                    aralik.Parameters.AddWithValue("@p4", urunanasinifi);

                    aralik.Parameters.AddWithValue("@p6", urun);
                    aralik.Parameters.AddWithValue("@p7", urunkodu);
                    aralik.Parameters.AddWithValue("@p8", "Aralık");
                    aralik.Parameters.AddWithValue("@p9", aralikhedef);
                    aralik.Parameters.AddWithValue("@p10", 12);
                    aralik.ExecuteNonQuery();
                    //SqlConnection.ClearPool(con);

                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int KitaRaporlama(DateTime baslangictarihi, DateTime bitistarihi, string kita)
        {
            string Kita = "";
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    //SqlCommand temizle = new SqlCommand("truncate table ContinentReport", con);
                    //temizle.ExecuteNonQuery();
                    SqlCommand cmd = new SqlCommand("select DISTINCT Kita  from EditOrdersEnd", con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        Kita = dr["Kita"].ToString();
                        SqlCommand gonder = new SqlCommand("ContinentReporting", con);
                        gonder.CommandType = CommandType.StoredProcedure;
                        gonder.Parameters.AddWithValue("@kita", Kita);
                        gonder.Parameters.AddWithValue("@baslangictarihi", baslangictarihi);
                        gonder.Parameters.AddWithValue("@bitistarihi", bitistarihi);
                        gonder.CommandTimeout = 10000;

                        gonder.ExecuteNonQuery();
                        //SqlConnection.ClearPool(con);

                    }
                    dr.Close();
                    //SqlCommand kitacek = new SqlCommand("select ContinentName from Continent", con);
                    //kitacek.CommandTimeout = 10000;
                    //SqlDataReader dr = kitacek.ExecuteReader();
                    //while (dr.Read())
                    //{
                    //    SqlCommand cmd = new SqlCommand("ContinentReporting", con);
                    //    cmd.Parameters.AddWithValue("@kita", kita);
                    //    cmd.Parameters.AddWithValue("@baslangictarihi", baslangictarihi);
                    //    cmd.Parameters.AddWithValue("@bitistarihi", bitistarihi);
                    //    cmd.CommandType = CommandType.StoredProcedure;
                    //    cmd.CommandTimeout = 10000;
                    //    cmd.ExecuteNonQuery();
                    //}

                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        //public void YediYuzluKod()
        //{
        //    try
        //    {
        //        DateTime sevktarihi;
        //        string urun, urunkodu, torbatipi, torbaagirligi, bbtipi, bbagirligi, palet, siparisno, tamurun, yediyizlükod, specode, specode2, specode2_1, specode2_2 = "", specode2_3 = "", specode3 = "", specode4 = "";
        //        using (SqlConnection con = new SqlConnection(strcon))
        //        {
        //            con.Open();

        //            SqlCommand cmd = new SqlCommand("select REPLACE(UrunKodu,'','') as UrunKodu,REPLACE(Urun,'','') as Urun,REPLACE(TorbaTipi,'YOK','') as TorbaTipi ,REPLACE(TorbaAgirligi,0,'') as TorbaAgirligi,REPLACE(BBTipi,'YOK','') as  BBTipi,REPLACE(BBAgirligi,0,'') as BBAgirligi ,REPLACE(Palet,'YOK','') as Palet,ISNULL(SiparisNo,'') as SiparisNo from Orders where Durum='SATISA DONDU' and SevkDurumu IS NULL", con);
        //            cmd.CommandTimeout = 10000;
        //            SqlDataReader dr = cmd.ExecuteReader();
        //            while (dr.Read())
        //            {

        //            }
        //            con.Close();
        //        }
        //    }
        //    catch
        //    {

        //    }
        //}
        public void KILIT()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SIPARIS_KAPAT", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandTimeout = 10000;
                    cmd.ExecuteNonQuery();
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
            }
            catch
            {

            }
        }
        public int SaticiRaporlama(DateTime tar1, DateTime tar2)
        {

            try
            {
                int id;
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    SqlCommand idcek = new SqlCommand("select Id from Users where Authority='Admin' or Authority='User'", con);
                    SqlDataReader dr = idcek.ExecuteReader();
                    while (dr.Read())
                    {
                        id = Convert.ToInt32(dr["Id"]);
                        SqlCommand cmd = new SqlCommand("SalesReporting", con);
                        cmd.Parameters.AddWithValue("@satici", id);
                        cmd.Parameters.AddWithValue("@baslangictarihi", tar1);
                        cmd.Parameters.AddWithValue("@bitistarihi", tar2);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandTimeout = 10000;
                        cmd.ExecuteNonQuery();

                    }
                    //DepartmanMusterileriRaporlama(tar1,tar2);
                    dr.Close();
                    //SqlConnection.ClearPool(con);
                    con.Close();

                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int GonderimSekliRapor(string ttipi, DateTime tar1, DateTime tar2)
        {
            string gonderimsekli = "";
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cek = new SqlCommand("select DISTINCT TeklifTipi  from EditOrdersEnd", con);
                    SqlDataReader dr = cek.ExecuteReader();
                    while (dr.Read())
                    {
                        gonderimsekli = dr["TeklifTipi"].ToString();
                        SqlCommand cmd = new SqlCommand("SendTypeReporting", con);
                        cmd.Parameters.AddWithValue("@gonderimsekli", gonderimsekli);
                        cmd.Parameters.AddWithValue("@baslangictarihi", tar1);
                        cmd.Parameters.AddWithValue("@bitistarihi", tar2);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.CommandTimeout = 10000;
                        cmd.ExecuteNonQuery();
                    }
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int UrunRaporla(DateTime tar1, DateTime tar2, string ay, string ay2, int ayId, int ayId2)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand mainclass = new SqlCommand("ProductMainClassReporting", con);
                    mainclass.Parameters.AddWithValue("@baslangictarihi", tar1);
                    mainclass.Parameters.AddWithValue("@bitistarihi", tar2);
                    mainclass.Parameters.AddWithValue("@ayId", ayId);
                    mainclass.Parameters.AddWithValue("@ayId2", ayId2);
                    mainclass.Parameters.AddWithValue("@ay", ay);
                    mainclass.Parameters.AddWithValue("@ay2", ay2);
                    mainclass.CommandType = CommandType.StoredProcedure;
                    mainclass.CommandTimeout = 10000;
                    mainclass.ExecuteNonQuery();
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }

        }
        public DataTable GetDataTable(string command)
        {
            DataTable dt = new DataTable();
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(command, con);
                using (SqlDataAdapter Adapter = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    Adapter.SelectCommand = cmd;
                    Adapter.Fill(dt);
                }
                //SqlConnection.ClearPool(con);
                con.Close();
            }
            return dt;
        }
        public int MusteriKoduGir(string teklifno, string kod)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update Orders set MusteriKodu=@p1 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", kod);
                    cmd.Parameters.AddWithValue("@p2", teklifno);
                    cmd.ExecuteNonQuery();
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int RevizeTeklifOnayaSun(string teklifno)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update Orders set Durum=@p1 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", "ONAY BEKLIYOR");
                    cmd.Parameters.AddWithValue("@p2", teklifno);
                    cmd.ExecuteNonQuery();
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int RevizeTeklifOnayaSunUser(string teklifno, string metin, string location, string whom)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update Orders set Durum=@p1 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", "ONAY BEKLIYOR");
                    cmd.CommandTimeout = 10000;
                    cmd.Parameters.AddWithValue("@p2", teklifno);
                    cmd.ExecuteNonQuery();
                    SqlCommand ekle = new SqlCommand("insert into AdminNotification(Text,Location,Whom) values(@p1,@p2,@p3)", con);
                    ekle.Parameters.AddWithValue("@p1", metin);
                    ekle.Parameters.AddWithValue("@p2", location);
                    ekle.Parameters.AddWithValue("@p3", whom);
                    ekle.CommandTimeout = 10000;
                    ekle.ExecuteNonQuery();
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int RevizeSatisOnayaSun(string teklifno)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update Orders set Durum=@p1 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", "SATIS ONAYI BEKLIYOR");
                    cmd.Parameters.AddWithValue("@p2", teklifno);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int RevizeSatisOnayaSunUser(string teklifno, string metin, string location, string whom)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update Orders set Durum=@p1 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", "SATIS ONAYI BEKLIYOR");
                    cmd.Parameters.AddWithValue("@p2", teklifno);
                    cmd.ExecuteNonQuery();
                    SqlCommand ekle = new SqlCommand("insert into AdminNotification(Text,Location,Whom) values(@p1,@p2,@p3)", con);
                    ekle.Parameters.AddWithValue("@p1", metin);
                    ekle.Parameters.AddWithValue("@p2", location);
                    ekle.Parameters.AddWithValue("@p3", whom);
                    ekle.CommandTimeout = 10000;
                    ekle.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int TeklifFormu(string teklifno, string dilsecenegi, bool info, bool tds, bool msds, string contactperson, string contactemail, string phonenumber, string customclerance, string explanation, string metin, string konum, string parabirimi, int adim, bool fobvisible, string Company, double parite, string payment, double usd, double eur)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    if (adim == 1)
                    {
                        SqlCommand cmd = new SqlCommand("Update Orders set DilSecenegi=@p1,Info=@p2,Tds=@p3,Msds=@p4,CurrencyUnit=@p5,FobVisible=@p6,Company=@p7,Parite=@p8,USDKUR=@p9,EUROKUR=@p10 where TeklifNo=@tekno and Durum='ONAYLANDI'", con);
                        cmd.Parameters.AddWithValue("@tekno", teklifno);
                        cmd.Parameters.AddWithValue("@p1", dilsecenegi);
                        cmd.Parameters.AddWithValue("@p2", info);
                        cmd.Parameters.AddWithValue("@p3", tds);
                        cmd.Parameters.AddWithValue("@p4", msds);
                        cmd.Parameters.AddWithValue("@p5", parabirimi);
                        cmd.Parameters.AddWithValue("@p6", fobvisible);
                        cmd.Parameters.AddWithValue("@p7", Company);
                        cmd.Parameters.AddWithValue("@p8", parite);
                        cmd.Parameters.AddWithValue("@p9", usd);
                        cmd.Parameters.AddWithValue("@p10", eur);
                        cmd.ExecuteNonQuery();
                    }
                    else if (adim == 2)
                    {
                        SqlCommand cmd = new SqlCommand("Update Orders set IletisimeGecilecekKisi=@p1,MüşteriEmail=@p2,MüşteriTelNo=@p3 where TeklifNo=@tekno and Durum='ONAYLANDI'", con);
                        cmd.Parameters.AddWithValue("@tekno", teklifno);
                        cmd.Parameters.AddWithValue("@p1", contactperson);
                        cmd.Parameters.AddWithValue("@p2", contactemail);
                        cmd.Parameters.AddWithValue("@p3", phonenumber);


                        cmd.ExecuteNonQuery();
                    }
                    else if (adim == 3)
                    {
                        SqlCommand cmd = new SqlCommand("Update Orders set CustomClerance=@p2,Explanation=@p3,PaymentTerms=@pay where TeklifNo=@tekno and Durum='ONAYLANDI'", con);
                        cmd.Parameters.AddWithValue("@tekno", teklifno);

                        cmd.Parameters.AddWithValue("@p2", customclerance);
                        cmd.Parameters.AddWithValue("@p3", explanation);
                        cmd.Parameters.AddWithValue("@pay", payment);
                        cmd.ExecuteNonQuery();
                    }
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int DepartmanMusterileriRaporlama(DateTime baslangic, DateTime bitis)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand temizle = new SqlCommand("truncate table Department_Report", con);
                    temizle.ExecuteNonQuery();
                    SqlCommand rapor = new SqlCommand("DepartmentCustomersReports", con);
                    rapor.CommandType = CommandType.StoredProcedure;
                    rapor.Parameters.AddWithValue("@baslangictarihi", baslangic);
                    rapor.Parameters.AddWithValue("@bitistarihi", bitis);
                    rapor.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int MusteriRaporlama(DateTime tar1, DateTime tar2)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand temizle = new SqlCommand("truncate table CustomerReport", con);
                    temizle.ExecuteNonQuery();
                    SqlCommand gonder = new SqlCommand("CustomerReporting", con);
                    gonder.Parameters.AddWithValue("@baslangictarihi", tar1);
                    gonder.Parameters.AddWithValue("@bitistarihi", tar2);

                    gonder.CommandTimeout = 10000;
                    gonder.CommandType = CommandType.StoredProcedure;
                    gonder.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }

                return 1;
            }
            catch
            {
                return 0;
            }
        }

        public int UrunKarliligiRaporlama(DateTime tar1, DateTime tar2)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    double toplamton;
                    con.Open();
                    SqlCommand temizle = new SqlCommand("truncate table ProductProfit", con);
                    temizle.ExecuteNonQuery();
                    SqlCommand toplamtoncek = new SqlCommand("select SUM(SHIPPEDAMOUNT/1000) from EditOrdersEnd  where SevkTarihi between @p1 and @p2 and MusteriKodu not in(select MusteriKodu from DepartmentCustomers)", con);
                    toplamtoncek.Parameters.AddWithValue("@p1", tar1);
                    toplamtoncek.Parameters.AddWithValue("@p2", tar2);
                    //toplamtoncek.Parameters.AddWithValue("@p3", tar1);
                    //toplamtoncek.Parameters.AddWithValue("@p4", tar2);
                    toplamton = Convert.ToDouble(toplamtoncek.ExecuteScalar());

                    SqlCommand ekle = new SqlCommand("ProductProfitReport", con);
                    ekle.Parameters.AddWithValue("@baslangictarihi", Convert.ToDateTime(tar1));
                    ekle.Parameters.AddWithValue("@bitistarihi", Convert.ToDateTime(tar2));
                    ekle.CommandType = CommandType.StoredProcedure;
                    ekle.ExecuteNonQuery();

                    SqlCommand guncelle = new SqlCommand("update ProductProfit set TonDagilimi=Ton/@p1", con);
                    guncelle.Parameters.AddWithValue("@p1", toplamton);
                    guncelle.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {

                return 0;
            }
        }
        public int GonderimSekliKarlilik(DateTime tar1, DateTime tar2)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    double toplamton;
                    con.Open();
                    SqlCommand sifirla = new SqlCommand("truncate table SendTypeProfit", con);
                    sifirla.ExecuteNonQuery();
                    SqlCommand gonder = new SqlCommand("SendTypeProfitReport", con);
                    gonder.Parameters.AddWithValue("@baslangictarihi", tar1);
                    gonder.Parameters.AddWithValue("@bitistarihi", tar2);
                    gonder.CommandType = CommandType.StoredProcedure;
                    gonder.ExecuteNonQuery();
                    SqlCommand toplamtoncek = new SqlCommand("select SUM(SHIPPEDAMOUNT/1000) from EditOrdersEnd  where  SevkTarihi between @p1 and @p2 and MusteriKodu not in(select MusteriKodu from DepartmentCustomers)", con);
                    toplamtoncek.Parameters.AddWithValue("@p1", tar1);
                    toplamtoncek.Parameters.AddWithValue("@p2", tar2);
                    //toplamtoncek.Parameters.AddWithValue("@p3", tar1);
                    //toplamtoncek.Parameters.AddWithValue("@p4", tar2);
                    toplamton = Convert.ToDouble(toplamtoncek.ExecuteScalar());
                    SqlCommand guncelle = new SqlCommand("update SendTypeProfit set TonDagilimi=Ton/@p1", con);
                    guncelle.Parameters.AddWithValue("@p1", toplamton);
                    guncelle.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    return 1;
                }
            }
            catch
            {
                return 0;
            }
        }
        public int HayaletKayitSil(string teklifno, int islemyapan)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand sil = new SqlCommand("update Orders set Durum='ONAY IPTALI',Reddeden=@p2 where TeklifNo=@p1", con);
                    sil.Parameters.AddWithValue("@p2", islemyapan);
                    sil.Parameters.AddWithValue("@p1", teklifno);
                    sil.CommandTimeout = 10000;
                    sil.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int sepettentekTeklifOnay(string teklifNo, string metin, string kimicin, int islemyapan, string onaylayan, double karorani, string temsilci, string ulke, string musteri, double tonaj)
        {

            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    string location = "OnaylananTeklifler.aspx?islem=okundu";
                    SqlCommand ekle = new SqlCommand("insert into UserNotifications(Text,Location,Whom) values(@p1,@p2,@p3)", con);
                    ekle.Parameters.AddWithValue("@p1", metin);
                    ekle.Parameters.AddWithValue("@p2", location);
                    ekle.Parameters.AddWithValue("@p3", kimicin);
                    ekle.ExecuteNonQuery();
                    SqlCommand cmd = new SqlCommand("update Orders set Durum='ONAYLANDI',TeklifiOnaylayan=@pp where TeklifNo=@teklifno", con);
                    cmd.Parameters.AddWithValue("@pp", islemyapan);
                    cmd.Parameters.AddWithValue("@teklifno", teklifNo);
                    cmd.ExecuteNonQuery();
                    TumDokumler(teklifNo);

                    //if (karorani <= -0.10)
                    //{
                    //    karorani = karorani * 100;
                    //    DataTable dt = GetData(teklifNo);
                    //    dt.TableName = "GridView_Data";
                    //    using (XLWorkbook wb = new XLWorkbook())
                    //    {
                    //        wb.Worksheets.Add(dt);
                    //        using (MemoryStream memoryStream = new MemoryStream())
                    //        {
                    //            wb.SaveAs(memoryStream);
                    //            byte[] bytes = memoryStream.ToArray();
                    //            memoryStream.Close();
                    //            using (MailMessage mail = new MailMessage())
                    //            {
                    //                SmtpClient smtpServer = new SmtpClient(Properties.Settings.Default.SMTP_Server);
                    //                smtpServer.EnableSsl = Properties.Settings.Default.SSL;
                    //                smtpServer.Credentials = new System.Net.NetworkCredential(Properties.Settings.Default.SMTP_UserName, Properties.Settings.Default.SMTP_Password);
                    //                smtpServer.EnableSsl = Properties.Settings.Default.SSL;
                    //                mail.From = new MailAddress(Properties.Settings.Default.SMTP_UserName, "TRADE");
                    //                mail.To.Add("hayriaruk@nigtas.com");
                    //                mail.Subject = "Kar Oranı %-10 Altında Olan Yeni Sipariş Onayı";
                    //                mail.Body = "<!DOCTYPE html><html><head><title></title></head><body><div><b>SAYIN HAYRİ ARUK</b></div><br /><div><b>" + onaylayan + " TARAFINDAN SATIŞ ONAYI VERİLEN  SİPARİŞİN DETAYLARINI EKTE BULABİLİRSİNİZ.</b> </div><br /></div></body></html>";
                    //                mail.Attachments.Add(new Attachment(new MemoryStream(bytes), "siparis.xlsx"));
                    //                mail.IsBodyHtml = true;
                    //                smtpServer.Send(mail);
                    //            }
                    //        }
                    //    }

                    //}
                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    } //SqlConnection.ClearPool(con);
                    return 1;
                }
                catch
                {
                    con.Close();
                    return 0;
                }
            }


        }
        //public int InsertEditable(DateTime tar1,DateTime tar2)
        //{
        //    try
        //    {
        //        using(SqlConnection con=new SqlConnection(strcon))
        //        {
        //            con.Open();
        //            SqlCommand temizle = new SqlCommand("truncate table EditOrders",con);
        //            temizle.CommandTimeout = 10000;
        //            temizle.ExecuteNonQuery();
        //            SqlCommand doldur = new SqlCommand("insert into EditOrders(Id,TeklifTipi,KonteynerBulkSecimi,birdenfazlabeyanname,siparisTipi,Vade,TeklifNo,Temsilci,TemsilciKullaniciAdi,MusteriIsmi,Kita,Ulke,KalkisLimani,EkipmanTuru,VarisLimani,Urun,UrunAnaGrup,UrunFiyat,TorbaTipi,TorbaAgirligi,BBTipi,BBAgirligi,Palet,birKonteynerTonaji,BuKaleminBuKonteynerdekiTonaji,Ambalaj,buUrununSiparisTonaji,UrununKonteynerSayisi,SiparistekiKonteynerSayisi,GumruklemeTON,Inspection,Komisyon,AraNakliyeTON,DepolamaTON,ArmatorLokali,LimanIcDolumBedeliTON,NavlunTON,MaliyetTON,SatisFiyatiTON,TeklifTarihi,KalemMaliyeti,KalemSatisFiyati,SigortaTON,fobKarOrani,FobMaliyet,teslimsekliKarOrani,Durum,Parsiyel,TTarih,Gun,Ay,Yil,FobSatisFiyati,ReelKar,ReelKarOrani,UrunKodu,MusteriKodu,SevkTarihi) select Id,TeklifTipi,KonteynerBulkSecimi,birdenfazlabeyanname,siparisTipi,Vade,TeklifNo,Temsilci,TemsilciKullaniciAdi,MusteriIsmi,Kita,Ulke,KalkisLimani,EkipmanTuru,VarisLimani,Urun,UrunAnaGrup,UrunFiyat,TorbaTipi,TorbaAgirligi,BBTipi,BBAgirligi,Palet,birKonteynerTonaji,BuKaleminBuKonteynerdekiTonaji,Ambalaj,buUrununSiparisTonaji,UrununKonteynerSayisi,SiparistekiKonteynerSayisi,GumruklemeTON,Inspection,Komisyon,AraNakliyeTON,DepolamaTON,ArmatorLokali,LimanIcDolumBedeliTON,NavlunTON,MaliyetTON,SatisFiyatiTON,TeklifTarihi,KalemMaliyeti,KalemSatisFiyati,SigortaTON,fobKarOrani,FobMaliyet,teslimsekliKarOrani,Durum,Parsiyel,TTarih,Gun,Ay,Yil,FobSatisFiyati,ReelKar,ReelKarOrani,UrunKodu,MusteriKodu,SevkTarihi from Orders where SevkDurumu='SEVK EDILDI' and TTarih between @p1 and @p2 and Revize=0", con);
        //            doldur.Parameters.AddWithValue("@p1",tar1);
        //            doldur.Parameters.AddWithValue("@p2",tar2);
        //            doldur.CommandTimeout = 10000;
        //            doldur.ExecuteNonQuery();
        //            SqlCommand guncelle = new SqlCommand("update Orders set Revize=1 where TTarih between @p1 and @p2",con);
        //            guncelle.Parameters.AddWithValue("@p1",tar1);
        //            guncelle.Parameters.AddWithValue("@p2",tar2);
        //            guncelle.CommandTimeout = 10000;
        //            guncelle.ExecuteNonQuery();
        //            con.Close();
        //        }
        //        return 1;
        //    }
        //    catch
        //    {
        //        return 0;
        //    }

        //}


        public int InsertEditable(DateTime tar1, DateTime tar2)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand temizle = new SqlCommand("delete from EditOrders", con);
                    temizle.CommandTimeout = 10000;
                    temizle.ExecuteNonQuery();
                    SqlCommand ekle = new SqlCommand("OrdersToEditOrders", con);
                    ekle.Parameters.AddWithValue("@tar1", tar1);
                    ekle.Parameters.AddWithValue("@tar2", tar2);
                    ekle.CommandTimeout = 10000;
                    ekle.CommandType = CommandType.StoredProcedure;
                    ekle.ExecuteNonQuery();

                    con.Close(); //SqlConnection.ClearPool(con);
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        public int InsertEditableUser(DateTime tar1, DateTime tar2, int Id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand temizle = new SqlCommand("delete from EditOrders where TemsilciKullaniciAdi=@Temsilci", con);
                    temizle.Parameters.AddWithValue("@Temsilci", Id);
                    temizle.CommandTimeout = 10000;
                    temizle.ExecuteNonQuery();
                    SqlCommand ekle = new SqlCommand("OrdersToEditOrdersUser", con);
                    ekle.Parameters.AddWithValue("@tar1", tar1);
                    ekle.Parameters.AddWithValue("@tar2", tar2);
                    ekle.Parameters.AddWithValue("@Temsilci", Id);
                    ekle.CommandTimeout = 10000;
                    ekle.CommandType = CommandType.StoredProcedure;
                    ekle.ExecuteNonQuery();

                    con.Close(); //SqlConnection.ClearPool(con);
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int AllEditordersToEnd()
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    con.Open();
                    SqlCommand totalgonder = new SqlCommand("insert into EditOrdersEnd select *from EditOrders", con);
                    totalgonder.CommandTimeout = 10000;
                    totalgonder.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    return 1;
                }
                catch
                {
                    return 0;
                }
            }
        }
        public int EditOrders(int id, double KalemMaliyeti, double teslimsekliKarOrani, double UrunFiyat, double Ambalaj, double AraNakliyeTON, double DepolamaTON, double GumruklemeTON, double ArmatorLokali, double LimanIcDolumBedeliTON, double Inspection, double Komisyon, double FobSatisFiyati, double NavlunTON, double SigortaTON)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("OperationRealite", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandTimeout = 10000;
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Parameters.AddWithValue("@KalemMaliyeti", KalemMaliyeti);
                    cmd.Parameters.AddWithValue("@teslimsekliKarOrani", teslimsekliKarOrani);
                    cmd.Parameters.AddWithValue("@UrunFiyat", UrunFiyat);
                    cmd.Parameters.AddWithValue("@Ambalaj", Ambalaj);
                    cmd.Parameters.AddWithValue("@AraNakliyeTON", AraNakliyeTON);
                    cmd.Parameters.AddWithValue("@DepolamaTON", DepolamaTON);
                    cmd.Parameters.AddWithValue("@GumruklemeTON", GumruklemeTON);
                    cmd.Parameters.AddWithValue("@ArmatorLokali", ArmatorLokali);
                    cmd.Parameters.AddWithValue("@LimanIcDolumBedeliTON", LimanIcDolumBedeliTON);
                    cmd.Parameters.AddWithValue("@Inspection", Inspection);
                    cmd.Parameters.AddWithValue("@Komisyon", Komisyon);
                    cmd.Parameters.AddWithValue("@FobSatisFiyati", FobSatisFiyati);
                    cmd.Parameters.AddWithValue("@NavlunTON", NavlunTON);
                    cmd.Parameters.AddWithValue("@SigortaTON", SigortaTON);
                    cmd.ExecuteNonQuery();
                    SqlCommand ekle = new SqlCommand("insert into EditOrdersEnd select *from EditOrders where Id=@Id", con);
                    ekle.Parameters.AddWithValue("@Id", id);
                    ekle.CommandTimeout = 1000;
                    ekle.ExecuteNonQuery();
                    SqlCommand sil = new SqlCommand("delete from EditOrders where Id=@Id", con);

                    sil.Parameters.AddWithValue("@Id", id);
                    sil.CommandTimeout = 10000;
                    sil.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int EditOrdersRevize(int id, double KalemMaliyeti, double teslimsekliKarOrani, double UrunFiyat, double Ambalaj, double AraNakliyeTON, double DepolamaTON, double GumruklemeTON, double ArmatorLokali, double LimanIcDolumBedeliTON, double Inspection, double Komisyon, double FobSatisFiyati, double NavlunTON, double SigortaTON)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("OperationRealiteRevize", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.CommandTimeout = 10000;
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Parameters.AddWithValue("@KalemMaliyeti", KalemMaliyeti);
                    cmd.Parameters.AddWithValue("@teslimsekliKarOrani", teslimsekliKarOrani);
                    cmd.Parameters.AddWithValue("@UrunFiyat", UrunFiyat);
                    cmd.Parameters.AddWithValue("@Ambalaj", Ambalaj);
                    cmd.Parameters.AddWithValue("@AraNakliyeTON", AraNakliyeTON);
                    cmd.Parameters.AddWithValue("@DepolamaTON", DepolamaTON);
                    cmd.Parameters.AddWithValue("@GumruklemeTON", GumruklemeTON);
                    cmd.Parameters.AddWithValue("@ArmatorLokali", ArmatorLokali);
                    cmd.Parameters.AddWithValue("@LimanIcDolumBedeliTON", LimanIcDolumBedeliTON);
                    cmd.Parameters.AddWithValue("@Inspection", Inspection);
                    cmd.Parameters.AddWithValue("@Komisyon", Komisyon);
                    cmd.Parameters.AddWithValue("@FobSatisFiyati", FobSatisFiyati);
                    cmd.Parameters.AddWithValue("@NavlunTON", NavlunTON);
                    cmd.Parameters.AddWithValue("@SigortaTON", SigortaTON);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int tumSepetOnayla()
        {
            try
            {
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int Gonder(string sirano)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand("EditOrderstoEditOrdersEnd", con);
                    cmd.CommandTimeout = 10000;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TeklifNo", sirano);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);

                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        public int YediyuzluKodGir(int id, string kod)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update Orders set YediyuzluKod=@p1 where Id=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", kod);
                    cmd.Parameters.AddWithValue("@p2", id);
                    cmd.CommandTimeout = 10000;
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        public int HepsiniGonder()
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("AllDataEditOrdersToEditOrdersEnd", con);
                    cmd.CommandTimeout = 10000;
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int HepsiniGonder2(int id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("AllDataEditOrdersToEditOrdersEndUser", con);
                    cmd.CommandTimeout = 10000;
                    cmd.Parameters.AddWithValue("@temsilci", id);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int SEVKRAPORU(DateTime tar1, DateTime tar2)
        {
            string siparisno, yediyuzlukod;
            double toplam = 0;
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand temizle = new SqlCommand("truncate table SevkEdilenler", con);
                    temizle.ExecuteNonQuery();
                    SqlCommand ekle = new SqlCommand("OrdersToShipped", con);
                    ekle.Parameters.AddWithValue("@tar1", tar1);
                    ekle.Parameters.AddWithValue("@tar2", tar2);
                    ekle.CommandType = CommandType.StoredProcedure;
                    ekle.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                KILIT();
                return 1;
            }
            catch
            {
                return 0;
            }

        }
        public int SEVKRAPORU_USER(DateTime tar1, DateTime tar2, int temsilci)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand temizle = new SqlCommand("delete from SevkEdilenlerUser where TemsilciKullaniciAdi=@p1", con);
                    temizle.Parameters.AddWithValue("@p1", temsilci);
                    temizle.CommandTimeout = 10000;
                    temizle.ExecuteNonQuery();
                    SqlCommand cmd2 = new SqlCommand("OrdersToShippedUser", con);
                    cmd2.CommandType = CommandType.StoredProcedure;
                    cmd2.Parameters.AddWithValue("@temsilci", temsilci);
                    cmd2.Parameters.AddWithValue("@tar1", tar1);
                    cmd2.Parameters.AddWithValue("@tar2", tar2);
                    cmd2.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        public int EditPO_2(string teklifNo, string PO)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments Set PO=@p1 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", PO);
                    cmd.Parameters.AddWithValue("@p2", teklifNo);
                    cmd.CommandTimeout = 1000;
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();

                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int EditPO(string teklifNo, string PO, int BankId)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    TumDokumler(teklifNo);
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments Set BankId=@p6, PO=@p1 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", PO);
                    cmd.Parameters.AddWithValue("@p6", BankId);
                    cmd.Parameters.AddWithValue("@p2", teklifNo);

                    cmd.CommandTimeout = 1000;
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);

                    con.Close();

                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int EditSalesDocument(string teklifno, DateTime faturatarihi, int gelen)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    if (gelen == 1)
                    {
                        SqlCommand cmd = new SqlCommand("update AllOperationDocuments set ProformaInvoiceDate=@p2 where TeklifNo=@p3", con);

                        cmd.Parameters.AddWithValue("@p2", faturatarihi);
                        cmd.Parameters.AddWithValue("@p3", teklifno);
                        cmd.ExecuteNonQuery();
                    }
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }

                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int EditSalesDocument2(string teklifno, string faturano, DateTime faturatarihi, int gelen)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    if (gelen == 1)
                    {
                        SqlCommand cmd = new SqlCommand("update AllOperationDocuments set OperationInvoice=@p1,OperationInvoiceDate=@p2 where TeklifNo=@p3", con);
                        cmd.Parameters.AddWithValue("@p1", faturano);
                        cmd.Parameters.AddWithValue("@p2", faturatarihi);
                        cmd.Parameters.AddWithValue("@p3", teklifno);
                        cmd.ExecuteNonQuery();
                    }
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }

                return 1;
            }
            catch
            {
                return 0;
            }
        }

        public int MoneyTextUpdate(string teklifno, string metin)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set MoneyText=@p1 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", metin);
                    cmd.Parameters.AddWithValue("@p2", teklifno);
                    cmd.CommandTimeout = 1000;
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int HESCode(string teklifno, string metin, string metin2, string metin3, string metin4)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set HSCODE=@p1,HSCODE2=@p3,HSCODE3=@p4,HSCODE4=@p5 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", metin);
                    cmd.Parameters.AddWithValue("@p3", metin2);
                    cmd.Parameters.AddWithValue("@p4", metin3);
                    cmd.Parameters.AddWithValue("@p5", metin4);
                    cmd.Parameters.AddWithValue("@p2", teklifno);
                    cmd.CommandTimeout = 1000;
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int HESCode2(string specode, string metin, string metin2, string metin3, string metin4)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set HSCODE=@p1,HSCODE2=@p3,HSCODE3=@p4,HSCODE4=@p5 where SPECODE=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", metin);
                    cmd.Parameters.AddWithValue("@p2", specode);
                    cmd.Parameters.AddWithValue("@p3", metin2);
                    cmd.Parameters.AddWithValue("@p4", metin3);
                    cmd.Parameters.AddWithValue("@p5", metin4);
                    cmd.CommandTimeout = 1000;
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int CleanOnBoard(string teklifno, string metin)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set CLEANONBOARD=@p1 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", metin);
                    cmd.Parameters.AddWithValue("@p2", teklifno);
                    cmd.CommandTimeout = 1000;
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int BookingEditing(string TeklifNo, string Booking, int id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set BOOKINGNUMBER=@p1,BookingEdit=@p2 where TeklifNo=@p3", con);
                    cmd.Parameters.AddWithValue("@p1", Booking);
                    cmd.Parameters.AddWithValue("@p2", id);
                    cmd.Parameters.AddWithValue("@p3", TeklifNo);
                    cmd.CommandTimeout = 1000;
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        public int BookingEditing2(string kod, string Booking, int id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set BOOKINGNUMBER=@p1,BookingEdit=@p2 where SPECODE=@p3", con);
                    cmd.Parameters.AddWithValue("@p1", Booking);
                    cmd.Parameters.AddWithValue("@p2", id);
                    cmd.Parameters.AddWithValue("@p3", kod);
                    cmd.CommandTimeout = 1000;
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int CommercialInvoiceSpecialNote(string teklifno, string note, int id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set CommercialInvoiceSpecialNote=@p1,PackingListSpecialNote=@p4,CommercialInvoiceOlusturan=@p3 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", note);
                    cmd.Parameters.AddWithValue("@p2", teklifno);
                    cmd.Parameters.AddWithValue("@p3", id);
                    cmd.Parameters.AddWithValue("@p4", note);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int CommerciAlInvoice(string teklifno, int Id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set CommercialInvoiceOlusturan=@p3 where TeklifNo=@p2", con);
                    //cmd.Parameters.AddWithValue("@p1", note);
                    cmd.Parameters.AddWithValue("@p2", teklifno);
                    cmd.Parameters.AddWithValue("@p3", Id);
                    //cmd.Parameters.AddWithValue("@p4", note);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int KonsimentoDuzenle(string teklifNo, string kelime)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set KonsimentoEdit=@p1 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", kelime);
                    cmd.Parameters.AddWithValue("@p2", teklifNo);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        public int KonsimentoDuzenle2(string specode, string kelime)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set KonsimentoEdit=@p1 where SPECODE=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", kelime);
                    cmd.Parameters.AddWithValue("@p2", specode);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int CreatePackingList(string teklifo, int id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set PackingListOlusturan=@p1 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", id);
                    cmd.Parameters.AddWithValue("@p2", teklifo);

                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int KonsimentoOlusturan(int id, string teklifNo)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set KonsimentoOlusturan=@p5 where TeklifNo=@p2", con);
                    //cmd.Parameters.AddWithValue("@p1", freeTime);
                    cmd.Parameters.AddWithValue("@p2", teklifNo);

                    cmd.Parameters.AddWithValue("@p5", id);
                    cmd.ExecuteNonQuery();

                    SqlCommand up = new SqlCommand("Update Orders set AllOperationDocuments=1 where TeklifNo=@p2", con);
                    // up.Parameters.AddWithValue("@p1", gelen);
                    up.Parameters.AddWithValue("@p2", teklifNo);
                    up.ExecuteNonQuery();
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int KonsimentoOlusturan2(int id, string kod)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set KonsimentoOlusturan=@p5 where SPECODE=@p2", con);
                    //cmd.Parameters.AddWithValue("@p1", freeTime);
                    cmd.Parameters.AddWithValue("@p2", kod);

                    cmd.Parameters.AddWithValue("@p5", id);
                    cmd.ExecuteNonQuery();

                    SqlCommand up = new SqlCommand("Update Orders set AllOperationDocuments=1 where SPECODE=@p2", con);
                    // up.Parameters.AddWithValue("@p1", gelen);
                    up.Parameters.AddWithValue("@p2", kod);
                    up.ExecuteNonQuery();
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int UpdateFreeTime(string teklifNo, string freeTime, bool gelen)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set FreeTime=@p1 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", freeTime);
                    cmd.Parameters.AddWithValue("@p2", teklifNo);

                    //cmd.Parameters.AddWithValue("@p5",Id);
                    //cmd.ExecuteNonQuery();


                    //SqlDataAdapter da = new SqlDataAdapter();

                    //SqlCommand cek = new SqlCommand("insert into KonsimentoProduct(OrderId,TeklifNo) select Id,TeklifNo from Orders where TeklifNo=@p1", con);
                    //cek.Parameters.AddWithValue("@p1",teklifNo);

                    //SqlCommand delete = new SqlCommand("delete from KonsimentoProduct where TeklifNo=@p1",con);
                    //delete.Parameters.AddWithValue("@p1",teklifNo);
                    //delete.ExecuteNonQuery();
                    //da.InsertCommand = cek;
                    //da.InsertCommand.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                    //TumDokumler(teklifNo);
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int BankEdit(int id, string bankaadi, string iban, string account, string swiftcode)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update Banks set BankName=@p1,IBAN=@p2,Account=@p3,SwiftCode=@p4 where Id=@p5", con);
                    cmd.Parameters.AddWithValue("@p1", bankaadi);
                    cmd.Parameters.AddWithValue("@p2", iban);
                    cmd.Parameters.AddWithValue("@p3", account);
                    cmd.Parameters.AddWithValue("@p4", swiftcode);
                    cmd.Parameters.AddWithValue("@p5", id);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int SaveProforma(string teklifNo, int id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set ProformaSalesEdit=1,ProformaOlusturan=@p2 where TeklifNo=@p1", con);
                    cmd.Parameters.AddWithValue("@p1", teklifNo);
                    cmd.Parameters.AddWithValue("@p2", id);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int DokumleriRevizeyeGonder(string teklifno, int gelen)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    if (gelen == 1 || gelen == 2)
                    {
                        SqlCommand cmd = new SqlCommand("update Orders set AllOperationDocuments=0,FCLNO=NULL where TeklifNo=@p1", con);
                        cmd.Parameters.AddWithValue("@p1", teklifno);
                        cmd.ExecuteNonQuery();
                        SqlCommand sil = new SqlCommand("delete from AllOperationDocuments where TeklifNo=@p1", con);
                        sil.Parameters.AddWithValue("@p1", teklifno);
                        sil.ExecuteNonQuery();
                        SqlCommand sil2 = new SqlCommand("delete from KonsimentoProduct where TeklifNo=@p1", con);
                        sil2.Parameters.AddWithValue("@p1", teklifno);
                        sil2.ExecuteNonQuery();
                    }
                    else if (gelen == 3)
                    {
                        SqlCommand cmd = new SqlCommand("update Orders set AllOperationDocuments=0,FCLNO=NULL where TeklifNo=@p1", con);
                        cmd.Parameters.AddWithValue("@p1", teklifno);
                        cmd.ExecuteNonQuery();
                        SqlCommand cmd2 = new SqlCommand("Update AllOperationDocuments set CommercialInvoice=0,CommercialInvoicePath=NULL,PackingList=0,PackingListPath=NULL,Konsimento=0,KonsimentoPath=NULL where TeklifNo=@p1", con);
                        cmd2.Parameters.AddWithValue("@p1", teklifno);
                        cmd2.ExecuteNonQuery();
                        SqlCommand sil2 = new SqlCommand("delete from KonsimentoProduct where TeklifNo=@p1", con);
                        sil2.Parameters.AddWithValue("@p1", teklifno);
                        sil2.ExecuteNonQuery();
                    }
                    else if (gelen == 4)
                    {
                        SqlCommand cmd = new SqlCommand("update Orders set AllOperationDocuments=0,FCLNO=NULL where TeklifNo=@p1", con);
                        cmd.Parameters.AddWithValue("@p1", teklifno);
                        cmd.ExecuteNonQuery();
                        SqlCommand cmd2 = new SqlCommand("Update AllOperationDocuments set PackingList=0,PackingListPath=NULL,Konsimento=0,KonsimentoPath=NULL where TeklifNo=@p1", con);
                        cmd2.Parameters.AddWithValue("@p1", teklifno);
                        cmd2.ExecuteNonQuery();
                        SqlCommand sil2 = new SqlCommand("delete from KonsimentoProduct where TeklifNo=@p1", con);
                        sil2.Parameters.AddWithValue("@p1", teklifno);
                        sil2.ExecuteNonQuery();
                    }
                    else if (gelen == 5)
                    {
                        SqlCommand cmd = new SqlCommand("update Orders set AllOperationDocuments=0,FCLNO=NULL where TeklifNo=@p1", con);
                        cmd.Parameters.AddWithValue("@p1", teklifno);
                        cmd.ExecuteNonQuery();
                        SqlCommand cmd2 = new SqlCommand("Update AllOperationDocuments set ,Konsimento=0,KonsimentoPath=NULL where TeklifNo=@p1", con);
                        cmd2.Parameters.AddWithValue("@p1", teklifno);
                        cmd2.ExecuteNonQuery();
                        SqlCommand sil2 = new SqlCommand("delete from KonsimentoProduct where TeklifNo=@p1", con);
                        sil2.Parameters.AddWithValue("@p1", teklifno);
                        sil2.ExecuteNonQuery();
                    }
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        public int TumDokumler(string TeklifNo)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("TumOperasyonDokumleri", con);
                    cmd.Parameters.AddWithValue("@teklifno", TeklifNo);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int CreateInsuranceDocument(string teklifno)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("CreateInsuranceDocument", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TeklifNo", teklifno);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int SigortaDokumu(string teklifno, string numara, int gelen)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SigortaGonderimTipi", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@gelen", gelen);
                    cmd.Parameters.AddWithValue("@numara", numara);
                    cmd.Parameters.AddWithValue("@teklifno", teklifno);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int DokumanYukle(string TeklifNo, string belge, string adsoyad)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set ProformaPath=@p1,Proforma=1,ProformaYukleyen=@p3,ProformaYuklemeTarihi=@p4,CommercialInvoicePath=@p5,CommercialInvoice=1,CommercialInvoiceYukleyen=@p6,CommercialInvoiceYuklemetarihi=@p7,PackingListPath=@p8,PackingList=1,PackingListYukleyen=@p9,PackingListYuklemeTarihi=@p10,KomsimentoPath=@p11,Konsimento=1,KonsimentoYukleyen=@p12,KonsimentoYuklemeTarihi=@p13,SigortaDokumuPath=@p17,SigortaDokumu=1,SigortaDokumuYukleyen=@p18,SigortaYuklemeTarihi=@p19 ,UlkeSertifikasiPath=@p20,UlkeSertifikasi=1,UlkeSertifikasiYukleyen=@p21,UlkeSertifikasiYuklemeTarihi=@p22,DolasimBelgesiPath=@p23,DolasimBelgesi=1,DolasimBelgesiYukleyen=@p24,DolasimBelgesiYuklemeTarihi=@p25 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", "~/OperationDocuments/" + TeklifNo + "/" + belge);
                    cmd.Parameters.AddWithValue("@p2", TeklifNo);
                    cmd.Parameters.AddWithValue("@p3", adsoyad);
                    cmd.Parameters.AddWithValue("@p4", DateTime.Now);
                    cmd.Parameters.AddWithValue("@p5", "~/OperationDocuments/" + TeklifNo + "/" + belge);
                    cmd.Parameters.AddWithValue("@p6", adsoyad);
                    cmd.Parameters.AddWithValue("@p7", DateTime.Now);
                    cmd.Parameters.AddWithValue("@p8", "~/OperationDocuments/" + TeklifNo + "/" + belge);
                    cmd.Parameters.AddWithValue("@p9", adsoyad);
                    cmd.Parameters.AddWithValue("@p10", DateTime.Now);
                    cmd.Parameters.AddWithValue("@p11", "~/OperationDocuments/" + TeklifNo + "/" + belge);
                    cmd.Parameters.AddWithValue("@p12", adsoyad);
                    cmd.Parameters.AddWithValue("@p13", DateTime.Now);
                    cmd.Parameters.AddWithValue("@p17", "~/OperationDocuments/" + TeklifNo + "/" + belge);
                    cmd.Parameters.AddWithValue("@p18", adsoyad);
                    cmd.Parameters.AddWithValue("@p19", DateTime.Now);
                    cmd.Parameters.AddWithValue("@p20", "~/OperationDocuments/" + TeklifNo + "/" + belge);
                    cmd.Parameters.AddWithValue("@p21", adsoyad);
                    cmd.Parameters.AddWithValue("@p22", DateTime.Now);
                    cmd.Parameters.AddWithValue("@p23", "~/OperationDocuments/" + TeklifNo + "/" + belge);
                    cmd.Parameters.AddWithValue("@p24", adsoyad);
                    cmd.Parameters.AddWithValue("@p25", DateTime.Now);
                    cmd.ExecuteNonQuery();







                    //SqlConnection.ClearPool(con);
                    con.Close();

                }

                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int KonsimentoKonteyner(string mamulkodu, string teklifno, string fclno, double konteynerdakitonaj, string gelen, string siparisno, int paletsayisi)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand("insert into KonsimentoProduct(MamulKodu,TeklifNo,KonteynerdakiTonaj,FCLNO,SiparisTipi,SiparisNo,PaletSayisi) values(@p1,@p2,@p3,@p4,@p5,@p6,@p7)", con);
                    cmd.Parameters.AddWithValue("@p1", mamulkodu);
                    cmd.Parameters.AddWithValue("@p2", teklifno);
                    cmd.Parameters.AddWithValue("@p3", konteynerdakitonaj);
                    cmd.Parameters.AddWithValue("@p4", fclno);
                    cmd.Parameters.AddWithValue("@p5", gelen);
                    cmd.Parameters.AddWithValue("@p6", siparisno);
                    cmd.Parameters.AddWithValue("@p7", paletsayisi);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }



        public int KonsimentoKonteyner2(string mamulkodu, string specode, string fclno, double konteynerdakitonaj, string gelen, string siparisno, int paletsayisi)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();

                    SqlCommand cmd = new SqlCommand("insert into KonsimentoProduct(MamulKodu,SPECODE,KonteynerdakiTonaj,FCLNO,SiparisTipi,SiparisNo,PaletSayisi) values(@p1,@p2,@p3,@p4,@p5,@p6,@p7)", con);
                    cmd.Parameters.AddWithValue("@p1", mamulkodu);
                    cmd.Parameters.AddWithValue("@p2", specode);
                    cmd.Parameters.AddWithValue("@p3", konteynerdakitonaj);
                    cmd.Parameters.AddWithValue("@p4", fclno);
                    cmd.Parameters.AddWithValue("@p5", gelen);
                    cmd.Parameters.AddWithValue("@p6", siparisno);
                    cmd.Parameters.AddWithValue("@p7", paletsayisi);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }


        public int CariBilgileriGuncelle(string adres1, string adres2, string vergino, string telno1, string ilgilikisi, string fax, string email, string website, string teklifno)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update CustomerAddress set Adres1=@p1,Adres2=@p2,VergiNo=@p3,Telno1=@p4,IlgiliKisi=@p5,Fax=@p6,Mail=@p7,WebSite=@p8 where TeklifNo=@p9", con);
                    cmd.Parameters.AddWithValue("@p1", adres1);
                    cmd.Parameters.AddWithValue("@p2", adres2);
                    cmd.Parameters.AddWithValue("@p3", vergino);
                    cmd.Parameters.AddWithValue("@p4", telno1);
                    cmd.Parameters.AddWithValue("@p5", ilgilikisi);
                    cmd.Parameters.AddWithValue("@p6", fax);
                    cmd.Parameters.AddWithValue("@p7", email);
                    cmd.Parameters.AddWithValue("@p8", website);
                    cmd.Parameters.AddWithValue("@p9", teklifno);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int CariBilgileriGuncelle_2(string adres1, string adres2, string vergino, string telno1, string ilgilikisi, string fax, string email, string website, string kod)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update CustomerAddress set Adres1=@p1,Adres2=@p2,VergiNo=@p3,Telno1=@p4,IlgiliKisi=@p5,Fax=@p6,Mail=@p7,WebSite=@p8 where SPECODE=@p9", con);
                    cmd.Parameters.AddWithValue("@p1", adres1);
                    cmd.Parameters.AddWithValue("@p2", adres2);
                    cmd.Parameters.AddWithValue("@p3", vergino);
                    cmd.Parameters.AddWithValue("@p4", telno1);
                    cmd.Parameters.AddWithValue("@p5", ilgilikisi);
                    cmd.Parameters.AddWithValue("@p6", fax);
                    cmd.Parameters.AddWithValue("@p7", email);
                    cmd.Parameters.AddWithValue("@p8", website);
                    cmd.Parameters.AddWithValue("@p9", kod);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int ProformaYukle(string teklifNo, string dosyayolu, int Id)
        {
            int UserTypeId;
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("UploadProforma", con);
                    cmd.Parameters.AddWithValue("@TeklifNo", teklifNo);
                    cmd.Parameters.AddWithValue("@DosyaYolu", dosyayolu);
                    cmd.Parameters.AddWithValue("@UserId", Id);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@x", SqlDbType.TinyInt).Direction = ParameterDirection.Output;


                    cmd.ExecuteNonQuery();
                    UserTypeId = Convert.ToInt32(cmd.Parameters["@x"].Value);
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return UserTypeId;
            }
            catch
            {
                return 0;
            }
        }

        public int UpdateCommercialNote(string TeklifNo, string note)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Update AllOperationDocuments set CommercialInvoiceSpecialNote=@p1,PackingListSpecialNote=@p3,KonsimentoSpecialNote=@p4 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", note);
                    cmd.Parameters.AddWithValue("@p3", note);
                    cmd.Parameters.AddWithValue("@p4", note);
                    cmd.Parameters.AddWithValue("@p2", TeklifNo);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int UpdatePurchaseOrder(string TeklifNo, string UpdatePurchaseOrder)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Update AllOperationDocuments set ProformaSpecialNote=@p1,CommercialInvoiceSpecialNote=@p2,PackingListSpecialNote=@p3,KonsimentoSpecialNote=@p4 where TeklifNo=@p5", con);
                    cmd.Parameters.AddWithValue("@p1", UpdatePurchaseOrder);
                    cmd.Parameters.AddWithValue("@p2", UpdatePurchaseOrder);
                    cmd.Parameters.AddWithValue("@p3", UpdatePurchaseOrder);
                    cmd.Parameters.AddWithValue("@p4", UpdatePurchaseOrder);
                    cmd.Parameters.AddWithValue("@p5", TeklifNo);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int updatePO(string TeklifNo, string UpdatePurchaseOrder)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Update AllOperationDocuments set PO=@p1 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", UpdatePurchaseOrder);
                    cmd.Parameters.AddWithValue("@p2", TeklifNo);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int UpdatePackingListSpecialNote(string teklifno, string specialnote)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Update AllOperationDocuments set PackingListSpecialNote=@p1,KonsimentoSpecialNote=@p3 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", specialnote);
                    cmd.Parameters.AddWithValue("@p2", teklifno);
                    cmd.Parameters.AddWithValue("@p3", specialnote);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int UpdateKonsimentoSpecialNote(string teklifno, string specialnote)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Update AllOperationDocuments set KonsimentoSpecialNote=@p1 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", specialnote);
                    cmd.Parameters.AddWithValue("@p2", teklifno);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int UpdateKonsimentoSpecialNote2(string specode, string specialnote)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Update AllOperationDocuments set KonsimentoSpecialNote=@p1 where SPECODE=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", specialnote);
                    cmd.Parameters.AddWithValue("@p2", specode);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int UpdateKonsimentoFreeTime(string teklifno, string specialnote)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Update AllOperationDocuments set FreeTime=@p1 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", specialnote);
                    cmd.Parameters.AddWithValue("@p2", teklifno);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int UpdateKonsimentoFreeTime2(string specode, string specialnote)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Update AllOperationDocuments set FreeTime=@p1 where SPECODE=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", specialnote);
                    cmd.Parameters.AddWithValue("@p2", specode);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int ProformaOnayaGonder(string TeklifNo)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set ProformaOnayi=1 where TeklifNo='" + TeklifNo + "'", con);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                    return 1;
                }
                catch
                {
                    return 0;
                }
            }
        }
        public int ProformaOnayla(string TeklifNo, int Id)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set ProformaOnayi=2,ProformayiOnaylayan='" + Id + "' where TeklifNo='" + TeklifNo + "'", con);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                    return 1;
                }
                catch
                {
                    return 0;
                }
            }
        }
        public int ProformaReddet(string TeklifNo, int Id)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set ProformaOnayi=3,ProformayiReddeden=@p1 where TeklifNo='" + TeklifNo + "'", con);
                    cmd.Parameters.AddWithValue("@p1", Id);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                    return 1;
                }
                catch
                {
                    return 0;
                }
            }
        }
        public int ProformaRevizeyeGonder(string TeklifNo, int Id)
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set ProformaOnayi=4,ProformayiRevizeyeGonderen=@p1 where TeklifNo='" + TeklifNo + "'", con);

                    cmd.Parameters.AddWithValue("@p1", Id);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                    return 1;
                }
                catch
                {
                    return 0;
                }
            }
        }
        public int LogoUstBilgiler(string TeklifNo, string isyeri, string bolum, string fabrika, string ambar)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("LogoUst", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TeklifNo", TeklifNo);
                    cmd.Parameters.AddWithValue("@isyeri", isyeri);
                    cmd.Parameters.AddWithValue("@bolum", bolum);
                    cmd.Parameters.AddWithValue("@ambar", ambar);
                    cmd.Parameters.AddWithValue("@fabrika", fabrika);

                    cmd.ExecuteNonQuery();

                    //SqlConnection.ClearPool(con);
                    con.Close();

                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }


        public int LogoUstBilgilerGuncelle(string TeklifNo, string isyeri, string bolum, string fabrika, string ambar)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("LogoUstGuncelle", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TeklifNo", TeklifNo);
                    cmd.Parameters.AddWithValue("@isyeri", isyeri);
                    cmd.Parameters.AddWithValue("@bolum", bolum);
                    cmd.Parameters.AddWithValue("@ambar", ambar);
                    cmd.Parameters.AddWithValue("@fabrika", fabrika);

                    cmd.ExecuteNonQuery();

                    //SqlConnection.ClearPool(con);
                    con.Close();

                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int NavlunRaporu(DateTime baslangic, DateTime bitis)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("NavlunRaporu", con);
                    cmd.Parameters.AddWithValue("@BaslangicTarihi", baslangic);
                    cmd.Parameters.AddWithValue("@BitisTarihi", bitis);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int RevizeyeGonder(string TeklifNo, bool bolge, bool ulke, bool musteri, bool varislimani, bool vade, bool konteynerbulk, bool gonderimsekli, bool psippkon, bool urun, bool ttipi, bool tagirlik, bool bbtipi, bool bbagirlik, bool palet, bool inspection, bool komisyon, bool konteynertipi, bool kalkislimani, bool birekipmantonaji, bool buurununbuekipmandakitonaji, bool buUrununToplamTonaji, bool armatorlokali, bool navlun, bool siparisEkipmanSayisi)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SendToRevised", con);
                    cmd.Parameters.AddWithValue("@TeklifNo", TeklifNo);
                    cmd.Parameters.AddWithValue("@Bolge", bolge);
                    cmd.Parameters.AddWithValue("@Ulke", ulke);
                    cmd.Parameters.AddWithValue("@Musteri", musteri);
                    cmd.Parameters.AddWithValue("@VarisLimani", varislimani);
                    cmd.Parameters.AddWithValue("@Vade", vade);
                    cmd.Parameters.AddWithValue("@KonteynerBulk", konteynerbulk);
                    cmd.Parameters.AddWithValue("@GonderimSekli", gonderimsekli);
                    cmd.Parameters.AddWithValue("@psippkon", psippkon);
                    cmd.Parameters.AddWithValue("@urun", urun);
                    cmd.Parameters.AddWithValue("@ttipi", ttipi);
                    cmd.Parameters.AddWithValue("@tagirlik", tagirlik);
                    cmd.Parameters.AddWithValue("@bbtipi", bbtipi);
                    cmd.Parameters.AddWithValue("@bbagirlik", bbagirlik);
                    cmd.Parameters.AddWithValue("@palet", palet);
                    cmd.Parameters.AddWithValue("@inspection", inspection);
                    cmd.Parameters.AddWithValue("@Komisyon", komisyon);
                    cmd.Parameters.AddWithValue("@konteynertipi", konteynertipi);
                    cmd.Parameters.AddWithValue("@KalkisLimani", kalkislimani);
                    cmd.Parameters.AddWithValue("@birEkipmanTonaji", birekipmantonaji);
                    cmd.Parameters.AddWithValue("@buUrununbuEkipmandakiTonaji", buurununbuekipmandakitonaji);
                    cmd.Parameters.AddWithValue("@SiparisEkipmanSayisi", siparisEkipmanSayisi);
                    cmd.Parameters.AddWithValue("@ArmatorLokali", armatorlokali);
                    cmd.Parameters.AddWithValue("@Navlun", navlun);
                    cmd.Parameters.AddWithValue("@buUrununToplamTonaji", buUrununToplamTonaji);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int NotifiyUpdate(string TeklifNo, string Name, string adres, string ulke, string rut, string telno, string contact, string mailadres, string website, string responsibleperson, string rut_Text, string telno_text, string contact_text, string mailadres_text, string website_text, string responsible_text)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set NotifiyName=@p1,NotifiyAdres=@p2,NotifiyUlke=@p3,NotifiyRut=@p4,NotifiyTelNo=@p16,NotifiyContact=@p5,NotifyMailAdress=@p7,NotifyWebSite=@p8,NotifyResponsiblePerson=@p9,NotifiyRut_Text=@p10,NotifiyTelNo_Text=@p11,NotifiyContact_Text=@p12,NotifyMailAdress_Text=@p13,NotifyWebSite_Text=@p14,NotifyResponsiblePerson_Text=@p15 where TeklifNo=@p6", con);
                    cmd.CommandTimeout = 1000;
                    cmd.Parameters.AddWithValue("@p1", Name);
                    cmd.Parameters.AddWithValue("@p2", adres);
                    cmd.Parameters.AddWithValue("@p3", ulke);
                    cmd.Parameters.AddWithValue("@p4", rut);
                    cmd.Parameters.AddWithValue("@p16", contact);
                    cmd.Parameters.AddWithValue("@p5", telno);
                    cmd.Parameters.AddWithValue("@p6", TeklifNo);
                    cmd.Parameters.AddWithValue("@p7", mailadres);
                    cmd.Parameters.AddWithValue("@p8", website);
                    cmd.Parameters.AddWithValue("@p9", responsibleperson);
                    cmd.Parameters.AddWithValue("@p10", rut_Text);
                    cmd.Parameters.AddWithValue("@p11", telno_text);
                    cmd.Parameters.AddWithValue("@p12", contact_text);
                    cmd.Parameters.AddWithValue("@p13", mailadres_text);
                    cmd.Parameters.AddWithValue("@p14", website_text);
                    cmd.Parameters.AddWithValue("@p15", responsible_text);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }



        public int NotifiyUpdate2(string specode, string Name, string adres, string ulke, string rut, string telno, string contact, string mailadres, string website, string responsibleperson, string rut_Text, string telno_text, string contact_text, string mailadres_text, string website_text, string responsible_text)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set NotifiyName=@p1,NotifiyAdres=@p2,NotifiyUlke=@p3,NotifiyRut=@p4,NotifiyTelNo=@p16,NotifiyContact=@p5,NotifyMailAdress=@p7,NotifyWebSite=@p8,NotifyResponsiblePerson=@p9,NotifiyRut_Text=@p10,NotifiyTelNo_Text=@p11,NotifiyContact_Text=@p12,NotifyMailAdress_Text=@p13,NotifyWebSite_Text=@p14,NotifyResponsiblePerson_Text=@p15 where SPECODE=@p6", con);
                    cmd.CommandTimeout = 1000;
                    cmd.Parameters.AddWithValue("@p1", Name);
                    cmd.Parameters.AddWithValue("@p2", adres);
                    cmd.Parameters.AddWithValue("@p3", ulke);
                    cmd.Parameters.AddWithValue("@p4", rut);
                    cmd.Parameters.AddWithValue("@p16", contact);
                    cmd.Parameters.AddWithValue("@p5", telno);
                    cmd.Parameters.AddWithValue("@p6", specode);
                    cmd.Parameters.AddWithValue("@p7", mailadres);
                    cmd.Parameters.AddWithValue("@p8", website);
                    cmd.Parameters.AddWithValue("@p9", responsibleperson);
                    cmd.Parameters.AddWithValue("@p10", rut_Text);
                    cmd.Parameters.AddWithValue("@p11", telno_text);
                    cmd.Parameters.AddWithValue("@p12", contact_text);
                    cmd.Parameters.AddWithValue("@p13", mailadres_text);
                    cmd.Parameters.AddWithValue("@p14", website_text);
                    cmd.Parameters.AddWithValue("@p15", responsible_text);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        public int NotifiyAyni(string TeklifNo)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select c.Cari as CARİADI,c.Adres1 as ADRES1,c.Adres2 as ADRES2,c.VergiNo,c.Telno1,c.Fax,c.Mail,c.WebSite,c.TeklifNo,c.IlgiliKisi,c.TaxId_Text,c.TelNo_Text,c.Fax_Text,c.Mail_Text,c.WebSite_Text,c.ResponsinblePerson_Text  from CustomerAddress c inner join Orders o on c.CariKodu=o.MusteriKodu where o.TeklifNo='" + TeklifNo + "' group by c.Id,c.Cari,c.Adres1,c.Adres2,c.VergiNo,c.Telno1,c.Fax,c.Mail,c.WebSite,c.TeklifNo,c.IlgiliKisi,c.TaxId_Text,c.TelNo_Text,c.Fax_Text,c.Mail_Text,c.WebSite_Text,c.ResponsinblePerson_Text ", con);
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    foreach (DataRow dr in dt.Rows)
                    {
                        SqlCommand guncelle = new SqlCommand("update AllOperationDocuments set NotifiyName=@p1,NotifiyAdres=@p2,NotifiyUlke=@p3,NotifiyRut=@p4,NotifiyTelNo=@p5,NotifiyContact=@p6,NotifyMailAdress=@p7,NotifyWebSite=@p8,NotifyResponsiblePerson=@p9,NotifiyRut_Text=@p10,NotifiyTelNo_Text=@p11,NotifiyContact_Text=@p12,NotifyMailAdress_Text=@p13,NotifyWebSite_Text=@p14,NotifyResponsiblePerson_Text=@p15 where TeklifNo=@p16", con);
                        guncelle.Parameters.AddWithValue("@p1", dr["CARİADI"].ToString());
                        guncelle.Parameters.AddWithValue("@p2", dr["ADRES1"].ToString());
                        guncelle.Parameters.AddWithValue("@p3", dr["ADRES2"].ToString());
                        guncelle.Parameters.AddWithValue("@p4", dr["VergiNo"].ToString());
                        guncelle.Parameters.AddWithValue("@p5", dr["Telno1"].ToString());
                        guncelle.Parameters.AddWithValue("@p6", dr["Fax"].ToString());
                        guncelle.Parameters.AddWithValue("@p7", dr["Mail"].ToString());
                        guncelle.Parameters.AddWithValue("@p8", dr["WebSite"].ToString());
                        guncelle.Parameters.AddWithValue("@p9", dr["IlgiliKisi"].ToString());
                        guncelle.Parameters.AddWithValue("@p10", dr["TaxId_Text"].ToString());
                        guncelle.Parameters.AddWithValue("@p11", dr["TelNo_Text"].ToString());
                        guncelle.Parameters.AddWithValue("@p12", dr["Fax_Text"].ToString());
                        guncelle.Parameters.AddWithValue("@p13", dr["Mail_Text"].ToString());
                        guncelle.Parameters.AddWithValue("@p14", dr["WebSite_Text"].ToString());
                        guncelle.Parameters.AddWithValue("@p15", dr["ResponsinblePerson_Text"].ToString());
                        guncelle.Parameters.AddWithValue("@p16", TeklifNo);
                        guncelle.ExecuteNonQuery();
                    }
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }

        public int NotifiyAyni2(string SPECODE)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select c.Cari as CARİADI,c.Adres1 as ADRES1,c.Adres2 as ADRES2,c.VergiNo,c.Telno1,c.Fax,c.Mail,c.WebSite,c.TeklifNo,c.IlgiliKisi,c.TaxId_Text,c.TelNo_Text,c.Fax_Text,c.Mail_Text,c.WebSite_Text,c.ResponsinblePerson_Text  from CustomerAddress c inner join Orders o on c.CariKodu=o.MusteriKodu where o.SPECODE='" + SPECODE + "' group by c.Id,c.Cari,c.Adres1,c.Adres2,c.VergiNo,c.Telno1,c.Fax,c.Mail,c.WebSite,c.TeklifNo,c.IlgiliKisi,c.TaxId_Text,c.TelNo_Text,c.Fax_Text,c.Mail_Text,c.WebSite_Text,c.ResponsinblePerson_Text ", con);
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    foreach (DataRow dr in dt.Rows)
                    {
                        SqlCommand guncelle = new SqlCommand("update AllOperationDocuments set NotifiyName=@p1,NotifiyAdres=@p2,NotifiyUlke=@p3,NotifiyRut=@p4,NotifiyTelNo=@p5,NotifiyContact=@p6,NotifyMailAdress=@p7,NotifyWebSite=@p8,NotifyResponsiblePerson=@p9,NotifiyRut_Text=@p10,NotifiyTelNo_Text=@p11,NotifiyContact_Text=@p12,NotifyMailAdress_Text=@p13,NotifyWebSite_Text=@p14,NotifyResponsiblePerson_Text=@p15 where SPECODE=@p16", con);
                        guncelle.Parameters.AddWithValue("@p1", dr["CARİADI"].ToString());
                        guncelle.Parameters.AddWithValue("@p2", dr["ADRES1"].ToString());
                        guncelle.Parameters.AddWithValue("@p3", dr["ADRES2"].ToString());
                        guncelle.Parameters.AddWithValue("@p4", dr["VergiNo"].ToString());
                        guncelle.Parameters.AddWithValue("@p5", dr["Telno1"].ToString());
                        guncelle.Parameters.AddWithValue("@p6", dr["Fax"].ToString());
                        guncelle.Parameters.AddWithValue("@p7", dr["Mail"].ToString());
                        guncelle.Parameters.AddWithValue("@p8", dr["WebSite"].ToString());
                        guncelle.Parameters.AddWithValue("@p9", dr["IlgiliKisi"].ToString());
                        guncelle.Parameters.AddWithValue("@p10", dr["TaxId_Text"].ToString());
                        guncelle.Parameters.AddWithValue("@p11", dr["TelNo_Text"].ToString());
                        guncelle.Parameters.AddWithValue("@p12", dr["Fax_Text"].ToString());
                        guncelle.Parameters.AddWithValue("@p13", dr["Mail_Text"].ToString());
                        guncelle.Parameters.AddWithValue("@p14", dr["WebSite_Text"].ToString());
                        guncelle.Parameters.AddWithValue("@p15", dr["ResponsinblePerson_Text"].ToString());
                        guncelle.Parameters.AddWithValue("@p16", SPECODE);
                        guncelle.ExecuteNonQuery();
                    }
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int EkipmanGuncelle(string TeklifNo, string ekipman)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update Orders set EkipmanTuru=@p1 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", ekipman);
                    cmd.Parameters.AddWithValue("@p2", TeklifNo);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int EkipmanGuncelle2(string specode, string ekipman)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update Orders set EkipmanTuru=@p1 where SPECODE=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", ekipman);
                    cmd.Parameters.AddWithValue("@p2", specode);
                    cmd.ExecuteNonQuery(); //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int bilgidegis(string TaxId_Text, string TelNo_Text, string Fax_Text, string Mail_Text, string WebSite_Text, string ResponsinblePerson_Text, string TeklifNo)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update CustomerAddress set TaxId_Text=@p1,TelNo_Text=@p2,Fax_Text=@p3,Mail_Text=@p4,WebSite_Text=@p5,ResponsinblePerson_Text=@p6 where TeklifNo=@p7", con);
                    cmd.Parameters.AddWithValue("@p1", TaxId_Text);
                    cmd.Parameters.AddWithValue("@p2", TelNo_Text);
                    cmd.Parameters.AddWithValue("@p3", Fax_Text);
                    cmd.Parameters.AddWithValue("@p4", Mail_Text);
                    cmd.Parameters.AddWithValue("@p5", WebSite_Text);
                    cmd.Parameters.AddWithValue("@p6", ResponsinblePerson_Text);
                    cmd.Parameters.AddWithValue("@p7", TeklifNo);
                    cmd.ExecuteNonQuery();
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int TAxIddegis(string bilgi, string TeklifNo)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update CustomerAddress set TaxId_Text=@p1 where TeklifNo=@p7", con);
                    cmd.Parameters.AddWithValue("@p1", bilgi);

                    cmd.Parameters.AddWithValue("@p7", TeklifNo);
                    cmd.ExecuteNonQuery();
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int TAxIddegis_2(string bilgi, string kod)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update CustomerAddress set TaxId_Text=@p1 where SPECODE=@p7", con);
                    cmd.Parameters.AddWithValue("@p1", bilgi);

                    cmd.Parameters.AddWithValue("@p7", kod);
                    cmd.ExecuteNonQuery();
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int TelNodegis(string bilgi, string TeklifNo)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update CustomerAddress set TelNo_Text=@p1 where TeklifNo=@p7", con);
                    cmd.Parameters.AddWithValue("@p1", bilgi);

                    cmd.Parameters.AddWithValue("@p7", TeklifNo);
                    cmd.ExecuteNonQuery();
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int TelNodegis_2(string bilgi, string kod)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update CustomerAddress set TelNo_Text=@p1 where SPECODE=@p7", con);
                    cmd.Parameters.AddWithValue("@p1", bilgi);

                    cmd.Parameters.AddWithValue("@p7", kod);
                    cmd.ExecuteNonQuery();
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int Maildegis(string bilgi, string TeklifNo)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update CustomerAddress set Mail_Text=@p1 where TeklifNo=@p7", con);
                    cmd.Parameters.AddWithValue("@p1", bilgi);

                    cmd.Parameters.AddWithValue("@p7", TeklifNo);
                    cmd.ExecuteNonQuery();
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int Maildegis_2(string bilgi, string kod)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update CustomerAddress set Mail_Text=@p1 where SPECODE=@p7", con);
                    cmd.Parameters.AddWithValue("@p1", bilgi);

                    cmd.Parameters.AddWithValue("@p7", kod);
                    cmd.ExecuteNonQuery();
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int WebSitedegis(string bilgi, string TeklifNo)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update CustomerAddress set WebSite_Text=@p1 where TeklifNo=@p7", con);
                    cmd.Parameters.AddWithValue("@p1", bilgi);

                    cmd.Parameters.AddWithValue("@p7", TeklifNo);
                    cmd.ExecuteNonQuery();
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int WebSitedegis_2(string bilgi, string kod)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update CustomerAddress set WebSite_Text=@p1 where SPECODE=@p7", con);
                    cmd.Parameters.AddWithValue("@p1", bilgi);

                    cmd.Parameters.AddWithValue("@p7", kod);
                    cmd.ExecuteNonQuery();
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int ResponsiblePersondegis(string bilgi, string TeklifNo)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update CustomerAddress set ResponsinblePerson_Text=@p1 where TeklifNo=@p7", con);
                    cmd.Parameters.AddWithValue("@p1", bilgi);

                    cmd.Parameters.AddWithValue("@p7", TeklifNo);
                    cmd.ExecuteNonQuery();
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int ResponsiblePersondegis_2(string bilgi, string kod)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update CustomerAddress set ResponsinblePerson_Text=@p1 where SPECODE=@p7", con);
                    cmd.Parameters.AddWithValue("@p1", bilgi);

                    cmd.Parameters.AddWithValue("@p7", kod);
                    cmd.ExecuteNonQuery();
                    //SqlConnection.ClearPool(con);
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int SiparisBirlestir(string TeklifNo, string Specode, string freetime, int Id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update Orders set SPECODE=@p1 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", Specode);
                    cmd.Parameters.AddWithValue("@p2", TeklifNo);
                    cmd.ExecuteNonQuery();

                    SqlCommand cmd2 = new SqlCommand("update AllOperationDocuments set FreeTime=@p1,KonsimentoOlusturan=@p2,SPECODE=@p4 where TeklifNo=@p3", con);
                    cmd2.Parameters.AddWithValue("@p1", freetime);
                    cmd2.Parameters.AddWithValue("@p2", Id);
                    cmd2.Parameters.AddWithValue("@p3", TeklifNo);
                    cmd2.Parameters.AddWithValue("@p4", Specode);
                    cmd2.ExecuteNonQuery();
                    SqlCommand cmd3 = new SqlCommand("update CustomerAddress set SPECODE=@p1 where TeklifNo=@p2", con);
                    cmd3.Parameters.AddWithValue("@p1", Specode);
                    cmd3.Parameters.AddWithValue("@p2", TeklifNo);
                    cmd3.ExecuteNonQuery();
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int ProformaNoOlustur(string TeklifNo)
        {
            try
            {
                string PO;
                PO = "PI" + TeklifNo;
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set ProformaInvoiceNo=@p1 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", PO);
                    cmd.Parameters.AddWithValue("@p2", TeklifNo);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int BankaGuncelle(string TeklifNo, int banka)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set BankId=@p1 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", banka);
                    cmd.Parameters.AddWithValue("@p2", TeklifNo);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }

        }
        public int TeklifRevize(int id, string kalkislimani, double birekipmantonaji, double buurununtoplamtonaji, double bukaleminbuekipmandakitonaji, int siparisekipmansayisi, double armatorlokali, double navlun, double aranakliye, double depolama, double gumrukleme, double limandolum, double vadecarpani,double inspection,double komisyon,string yediyuzlukod,string torbatipi,int torbaagirligi,string bbtipi,int bbagirligi,string palet,double ambalaj)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Revize", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Id", id);
                    cmd.Parameters.AddWithValue("@KalkisLimani", kalkislimani);
                    cmd.Parameters.AddWithValue("@birekipmantonaji", birekipmantonaji);
                    cmd.Parameters.AddWithValue("@buurununtoplamtonaji", buurununtoplamtonaji);
                    cmd.Parameters.AddWithValue("@bukaleminbuekipmandakitonaji", bukaleminbuekipmandakitonaji);
                    cmd.Parameters.AddWithValue("@siparisekipmansayisi", siparisekipmansayisi);
                   
                    cmd.Parameters.AddWithValue("@armatorlokali", armatorlokali);
                    cmd.Parameters.AddWithValue("@navlun", navlun);
                    cmd.Parameters.AddWithValue("@aranakliye", aranakliye);
                    cmd.Parameters.AddWithValue("@depolama", depolama);
                    cmd.Parameters.AddWithValue("@gumrukleme", gumrukleme);
                    cmd.Parameters.AddWithValue("@limandolum", limandolum);
                    cmd.Parameters.AddWithValue("@vadecarpani", vadecarpani);
                    cmd.Parameters.AddWithValue("@inspection",inspection);
                    cmd.Parameters.AddWithValue("@komisyon",komisyon);
                    cmd.Parameters.AddWithValue("@yediyuzlukod",yediyuzlukod);
                    cmd.Parameters.AddWithValue("@torbatipi", torbatipi);
                    cmd.Parameters.AddWithValue("@torbaagirligi", torbaagirligi);
                    cmd.Parameters.AddWithValue("@bbtipi", bbtipi);
                    cmd.Parameters.AddWithValue("@bbagirligi",bbagirligi);
                    cmd.Parameters.AddWithValue("@palet", palet);
                    cmd.Parameters.AddWithValue("@ambalaj", ambalaj);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int KayirGonder(string TeklifNo, string durum)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update Orders set Durum=@p1,KILIT=0 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", durum);
                    cmd.Parameters.AddWithValue("@p2", TeklifNo);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }

        }




        public int KayirGonder_Proforma(string TeklifNo, int durum)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set ProformaOnayi=@p1 where TeklifNo=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", durum);
                    cmd.Parameters.AddWithValue("@p2", TeklifNo);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }

        }
        public int OperasyonOnayinaGonder(string TeklifNo)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set OperationAllow=1 where TeklifNo='" + TeklifNo + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int OperasyonOnayiVer(string TeklifNo, int Id, string MusteriKodu)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("OperationAllow", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@TeklifNo", TeklifNo);
                    cmd.Parameters.AddWithValue("@User", Id);
                    cmd.Parameters.AddWithValue("@MusteriKodu", MusteriKodu);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int OperasyonReddet(string TeklifNo, int Id)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set OperationAllow=3,OperationAllowUser='" + Id + "' where TeklifNo='" + TeklifNo + "'", con);
                    cmd.ExecuteNonQuery();
                    SqlCommand cmd2 = new SqlCommand("Update Orders set Durum='ONAY IPTALI' where TeklifNo='" + TeklifNo + "'");
                    cmd2.ExecuteNonQuery();
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int OdemeSekliEkle(string tip)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("insert into Payment(PaymentTerms) values(@p1)", con);
                    cmd.Parameters.AddWithValue("@p1", tip);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int OdemeSekliGuncelle(int Id, string tip)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update Payment set PaymentTerms=@p1 where Id=@p2", con);
                    cmd.Parameters.AddWithValue("@p1", tip);
                    cmd.Parameters.AddWithValue("@p2", Id);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int UrunEkle(string anasinif, string urunkodu, string urun, double fiyat, double intercarb, double roskim, double ozer)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("insert into Product(MainClass,Code,ProductName,Price,Price_Intercarb,Price_Roskim,Price_Ozer) values(@p1,@p2,@p3,@p4,@p5,@p6,@p7)", con);
                    cmd.Parameters.AddWithValue("@p1", anasinif);
                    cmd.Parameters.AddWithValue("@p2", urunkodu);
                    cmd.Parameters.AddWithValue("@p3", urun);
                    cmd.Parameters.AddWithValue("@p4", fiyat);
                    cmd.Parameters.AddWithValue("@p5", intercarb);
                    cmd.Parameters.AddWithValue("@p6", roskim);
                    cmd.Parameters.AddWithValue("@p7", ozer);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int TeklifTipiAciklama(string TeklifNo, string Aciklama)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update AllOperationDocuments set TeklifTipiAciklama='"+Aciklama+"' where TeklifNo='"+TeklifNo+"'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int OdemeTipiGuncelle(string odeme,string teklifno)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand guncelle = new SqlCommand("update Orders set PaymentTerms='"+odeme+"' where TeklifNo='"+teklifno+"'",con);
                    guncelle.ExecuteNonQuery();
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int VarisLimaniGuncelle(string TeklifNo,string liman)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update Orders set VarisLimani='"+liman+"' where TeklifNo='"+TeklifNo+"'",con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
        public int TeklifFormuConsigneGuncelle(string teklifno,string contactperson,string contactemail,string phonenumber)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("update Orders set IletisimeGecilecekKisi='" + contactperson + "',MüşteriEmail='" + contactemail + "', MüşteriTelNo='"+phonenumber+"'   where TeklifNo='" + teklifno + "'", con);
                    cmd.ExecuteNonQuery();
                    con.Close();

                }
                return 1;
            }
            catch
            {
                return 0;
            }
        }
    }
}