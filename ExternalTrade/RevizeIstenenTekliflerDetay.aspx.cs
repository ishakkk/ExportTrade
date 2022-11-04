using DevExpress.Web;
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
    public partial class RevizeIstenenTekliflerDetay : System.Web.UI.Page
    {

       
        const string bugun = "https://www.tcmb.gov.tr/kurlar/today.xml";
        static string[] bilgiler = new string[20];
        static double[] rakamlar = new double[20];
        static double[] degerler = new double[3];
        DBIslemler db = new DBIslemler();
        DbConnection bag = new DbConnection();
        DBLogoConnection logoo = new DBLogoConnection();
        string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
        string logo = ConfigurationManager.ConnectionStrings["LogoDB_ConnectionString"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
        static string teklino;
        protected void Page_Load(object sender, EventArgs e)
        {
            string islem = Request.QueryString["islem"];
            teklino = Request.QueryString["teklifno"];
            if (islem == "okundu")
            {
                if (UserData.Authority != "SuperAdmın")
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    db.KullaniciBildirimOkundu(id);
                }

            }
          


        }

        protected void btnRapor_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsxToResponse("Teklif_Listesi_" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString());
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

            e.Command.Parameters["@Durum"].Value = "REVIZE ISTENILEN TEKLIF";

            e.Command.Parameters["@teklifno"].Value = Request.QueryString["teklifno"];
        }

        protected void btnAciklama_Click(object sender, EventArgs e)
        {
            string teklifno;
            string metin;
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1)
                {
                    ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);
                }
                int id;
                var kayit_id = ASPxGridView1.GetSelectedFieldValues("Id");
                id = Convert.ToInt32(kayit_id[0]);
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand teklifnocek = new SqlCommand("select TeklifNo from Orders where Id=@p1", con);
                    teklifnocek.Parameters.AddWithValue("@p1", id);
                    teklifno = Convert.ToString(teklifnocek.ExecuteScalar());
                    metin = UserData.Name + " " + UserData.SurName + " " + teklifno + "Numaralı Teklife Açıklama Girdi";
                    string konum = "RevizeIstenilenler.aspx?islem=okundu";
                    con.Close();

                    if (db.UserAciklamaEkle(Convert.ToString(txtAcikalam.Text), id, metin, konum) == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "explanationSuccess()", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "explanationError()", true);
                    }

                }
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "sec()", true);

            }

        }

        protected void btnRevize_Click(object sender, EventArgs e)
        {
            try
            {
                //if (ASPxGridView1.VisibleRowCount <= 0)
                //{
                //    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);

                //}
                //else
                //{
                //    if (ASPxGridView1.VisibleRowCount >= 1)
                //    {
                //        ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);
                //    }
                int id;
                var kayit_id = ASPxGridView1.GetSelectedFieldValues("Id");
                id = Convert.ToInt32(kayit_id[0]);
                //    if (Convert.ToInt32(drpSecim.SelectedItem.Value) == 1)
                //        Response.Redirect("RevizeEt.aspx?Id=" + id + "");
                //    else if (Convert.ToInt32(drpSecim.SelectedItem.Value) == 2)
                //    {
                //        string teklifno = "";
                //        using (SqlConnection con = new SqlConnection(strcon))
                //        {
                //            con.Open();
                //            SqlCommand sc = new SqlCommand("select TeklifNo from Orders where Id='" + id + "'", con);
                //            teklifno = Convert.ToString(sc.ExecuteScalar());
                //            con.Close();
                //        }
                //        Response.Redirect("KalemEkle.aspx?teklifno=" + teklifno + "");
                //    }

                pnlKayitEkle.Visible =
                pnlHider.Visible = true;








                double kalemsatisfiyati, fobsatisfiyati, navlun, armator;
                double[] kurlar = new double[3];
                SqlConnection con = new SqlConnection(strcon);
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select ISNULL(USDKUR,0) as Dolar,ISNULL(EUROKUR,0) as Euro,ISNULL(Parite,0) as Parite, *from Orders where Id=@p1", con);
                    cmd.Parameters.AddWithValue("@p1", id);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        kurlar[0] = Convert.ToDouble(dr["Dolar"]); kurlar[1] = Convert.ToDouble(dr["Euro"]); kurlar[2] = Convert.ToDouble(dr["Parite"]);
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
                        if (dr["NavlunTON"].ToString() == null || dr["NavlunTON"].ToString() == "")
                        {
                            navlun = 0;
                        }
                        else
                        {
                            navlun = Convert.ToDouble(dr["NavlunTON"]);
                        }
                        if (dr["ArmatorLokali"].ToString() == null || dr["ArmatorLokali"].ToString() == "")
                        {
                            armator = 0;
                        }
                        else
                        {
                            armator = Convert.ToDouble(dr["ArmatorLokali"]);
                        }
                        lblfobmaliyet.Text = dr["FobSatisFiyati"].ToString();
                        lblKalemMaliyet.Text = dr["KalemSatisFiyati"].ToString();
                        //lblNavlun.Text = navlun.ToString();
                        //lblArmatorLokali.Text = dr["ArmatorLokali"].ToString();
                    }
                    if (kurlar[0] == 0)
                    {
                        using (SqlConnection conn = new SqlConnection(logo))
                        {

                            conn.Open();
                            SqlCommand cmdd = new SqlCommand("select CAST(dbo.DOVIZKURU_GETIR(1,GETDATE()) as decimal(18,3)) as DOLAR,CAST(dbo.DOVIZKURU_GETIR(20,GETDATE()) as decimal(18,3)) as EURO,CAST(dbo.DOVIZKURU_GETIR(20,GETDATE())/dbo.DOVIZKURU_GETIR(1,GETDATE()) as decimal(18,3)) as PARITE", conn);
                            SqlDataAdapter daa = new SqlDataAdapter();
                            daa.SelectCommand = cmdd;
                            DataTable dtt = new DataTable();
                            daa.Fill(dtt);
                            foreach (DataRow drr in dtt.Rows)
                            {
                                kurlar[0] = Math.Round(Convert.ToDouble(drr["DOLAR"]), 3);
                                kurlar[1] = Math.Round(Convert.ToDouble(drr["EURO"]), 3);
                                kurlar[2] = Math.Round(Convert.ToDouble(drr["PARITE"]), 3);
                            }
                            lbldolar2.Text = kurlar[0].ToString();
                            lbleuro2.Text = kurlar[1].ToString();
                            lblparite2.Text = kurlar[2].ToString();
                            conn.Close();
                        }
                    }
                    else
                    {
                        lbldolar2.Text = Math.Round(kurlar[0], 3).ToString();
                        lbleuro2.Text = Math.Round(kurlar[1], 3).ToString();
                        lblparite2.Text = Math.Round(kurlar[2], 3).ToString();
                    }
                    dr.Close();

                    con.Close();
                }
                catch
                {

                }
            }
            //}
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "sec()", true);
            }
        }

        protected void btnEkle2_Click(object sender, EventArgs e)
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
                double kalemsatisfiyati, fobsatisfiyati;
                string tekliftipi;

                SqlConnection con = new SqlConnection(strcon);
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select KalemSatisFiyati,FobSatisFiyati,TeklifTipi from Orders where Id=@p1", con);
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
                            fobsatisfiyati = Convert.ToDouble(txtFobSatisFiyati.Text);
                        }
                        if (dr["TeklifTipi"].ToString() == null || dr["TeklifTipi"].ToString() == "")
                        {
                            tekliftipi = "YOK";
                        }
                        else
                        {
                            tekliftipi = Convert.ToString(dr["TeklifTipi"]);
                        }






                        SqlCommand gonder = new SqlCommand("UpdateOrders", con);
                        gonder.CommandTimeout = 10000;
                        gonder.CommandType = CommandType.StoredProcedure;

                        gonder.Parameters.AddWithValue("@KalemSatisFiyati", Convert.ToDouble(txtTeslimSekliSatisFİyati.Text));
                        gonder.Parameters.AddWithValue("@Id", id);

                        gonder.Parameters.AddWithValue("@TeklifTipi", tekliftipi);



                        gonder.Parameters.AddWithValue("@FobSatisFiyati", fobsatisfiyati);


                        gonder.ExecuteNonQuery();

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

            pnlKayitEkle.Visible =
           pnlHider.Visible = false;
            Response.Redirect("RevizeIstenenTekliflerDetay.aspx?teklifno=" + Request.QueryString["teklifno"] + "");


        }

        protected void lbModalPopupKapat_Click(object sender, EventArgs e)
        {
            pnlKayitEkle.Visible =
            pnlHider.Visible = false;
            Response.Redirect("RevizeIstenenTekliflerDetay.aspx?teklifno=" + Request.QueryString["teklifno"] + "");
        }

        protected void btnModalPopupGoster_Click(object sender, EventArgs e)
        {

        }

        //protected void ASPxGridView1_BeforeGetCallbackResult(object sender, EventArgs e)
        //{
        //    var grid = sender as ASPxGridView;
        //    grid.DataColumns["TeklifTipi"].EditFormSettings.Visible = grid.IsNewRowEditing ? DefaultBoolean.True : DefaultBoolean.False;
        //    grid.DataColumns["TeklifNo"].EditFormSettings.Visible = grid.IsNewRowEditing ? DefaultBoolean.True : DefaultBoolean.False;
        //}

        protected void Button1_Click(object sender, EventArgs e)
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

                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand torbacek = new SqlCommand("select  TorbaTipi   from Orders where  Id='" + id + "' union all  select    bagType  COLLATE SQL_Latin1_General_CP1_CI_AS  from BagType where bagType <> (select  TorbaTipi COLLATE SQL_Latin1_General_CP1_CI_AS  from Orders where  Id='" + id + "')", con);
                    SqlDataReader torbaoku = torbacek.ExecuteReader();
                    drpTorbaTipi.DataSource = torbaoku;
                    drpTorbaTipi.DataTextField = "TorbaTipi";
                    drpTorbaTipi.DataValueField = "TorbaTipi";
                    drpTorbaTipi.DataBind();
                    torbaoku.Close();
                    SqlCommand torbaagirligicek = new SqlCommand("select  CONVERT(nvarchar(50),REPLACE(TorbaAgirligi,0,'YOK')) as  TorbaAgirligi  from Orders where  Id='"+id+"' union all  select    Weight    from BagWeight where Weight <> (select  CONVERT(nvarchar(50),REPLACE(TorbaAgirligi,0,'YOK')) as  TorbaAgirligi   from Orders where  Id='"+id+"')", con);
                    SqlDataReader torbaagirligioku = torbaagirligicek.ExecuteReader();
                    drpTorbaAgirligi.DataSource = torbaagirligioku;
                    drpTorbaAgirligi.DataTextField = "TorbaAgirligi";
                    drpTorbaAgirligi.DataValueField = "TorbaAgirligi";
                    drpTorbaAgirligi.DataBind();
                    torbaagirligioku.Close();
                    SqlCommand bbtipicek = new SqlCommand("select BBTipi    from Orders where  Id='"+id+"' union all  select  bbType COLLATE SQL_Latin1_General_CP1_CI_AS  from BBType where bbType <> (select  BBTipi COLLATE SQL_Latin1_General_CP1_CI_AS  from Orders where  Id='"+id+"')", con);
                    SqlDataReader bbtipioku = bbtipicek.ExecuteReader();
                    drpBigBagTipi.DataSource = bbtipioku;
                    drpBigBagTipi.DataTextField = "BBTipi";
                    drpBigBagTipi.DataValueField = "BBTipi";

                    drpBigBagTipi.DataBind();
                    SqlCommand bbaigligicek = new SqlCommand("select  CONVERT(nvarchar(50),BBAgirligi) as  BBAgirligi  from Orders where  Id='" + id + "' union all  select    Weight    from BBWeight where Weight <> (select  CONVERT(nvarchar(50),BBAgirligi) as  BBAgirligi   from Orders where  Id='" + id + "')", con);
                    SqlDataReader bbagirligioku = bbaigligicek.ExecuteReader();
                    drpBigBagAgirligi.DataSource = bbagirligioku;
                    drpBigBagAgirligi.DataTextField = "BBAgirligi";
                    drpBigBagAgirligi.DataValueField = "BBAgirligi";
                    drpBigBagAgirligi.DataBind();
                    SqlCommand palettipicek = new SqlCommand("select *from Palette", con);
                    SqlDataReader palettipioku = palettipicek.ExecuteReader();
                    drpPaletTipi.DataSource = palettipioku;
                    drpPaletTipi.DataTextField = "Name";
                    drpPaletTipi.DataValueField = "Id";
                    drpPaletTipi.DataBind();
                    palettipioku.Close();
                    bbagirligioku.Close();

                    SqlCommand paletagirligicek = new SqlCommand("select  Palet as  PaletAgiligili  from Orders where  Id='"+id+"' union all  select    Name    from PaletteFormul where Name  <> (select  Palet   from Orders where  Id='"+id+"')", con);
                    SqlDataReader paletagirligioku = paletagirligicek.ExecuteReader();
                    drpPaletAgirligi.DataSource = paletagirligioku;
                    drpPaletAgirligi.DataTextField = "PaletAgiligili";
                    drpPaletAgirligi.DataValueField = "PaletAgiligili";
                    drpPaletAgirligi.DataBind();
                    paletagirligioku.Close();
                    con.Close();
                }
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select ISNULL(USDKUR,0) as dolar,ISNULL(EUROKUR,0) as Euro,ISNULL(Parite,0) as Parite, Vade, TeklifTipi,siparisTipi,KonteynerBulkSecimi, Urun,KalkisLimani,birKonteynerTonaji,BuKaleminBuKonteynerdekiTonaji, buUrununSiparisTonaji,SiparistekiKonteynerSayisi,SigortaTON,birdenfazlabeyanname,EkipmanTuru,case when KonteynerBulkSecimi='KONTEYNER' then birKonteynerTonaji*NavlunTON when KonteynerBulkSecimi='BULK' then NavlunTON   end AS NavlunTON,case when KonteynerBulkSecimi='KONTEYNER' then birKonteynerTonaji*ArmatorLokali when KonteynerBulkSecimi='BULK' then ArmatorLokali   end AS ARMATOR,IhracKayitli,Inspection,Komisyon,UrunKodu,YediyuzluKod from Orders where Id='" + id + "'", con);
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    foreach (DataRow dr in dt.Rows)
                    {
                        bilgiler[0] = dr["Urun"].ToString();
                        bilgiler[1] = dr["KalkisLimani"].ToString();
                        bilgiler[2] = dr["KonteynerBulkSecimi"].ToString();
                        bilgiler[3] = dr["siparisTipi"].ToString();
                        bilgiler[4] = dr["TeklifTipi"].ToString();
                        bilgiler[5] = dr["birdenfazlabeyanname"].ToString();
                        bilgiler[6] = dr["EkipmanTuru"].ToString();
                        bilgiler[7] = dr["Vade"].ToString();
                        bilgiler[8] = dr["IhracKayitli"].ToString();
                        bilgiler[9] = dr["UrunKodu"].ToString();
                        bilgiler[10] = dr["YediyuzluKod"].ToString();
                        rakamlar[0] = Convert.ToDouble(dr["birKonteynerTonaji"]);
                        rakamlar[1] = Convert.ToDouble(dr["BuKaleminBuKonteynerdekiTonaji"]);
                        rakamlar[2] = Convert.ToDouble(dr["buUrununSiparisTonaji"]);
                        rakamlar[3] = Convert.ToInt32(dr["SiparistekiKonteynerSayisi"]);
                        rakamlar[4] = Convert.ToDouble(dr["SigortaTon"]);
                        rakamlar[5] = Convert.ToDouble(dr["NavlunTON"]);
                        rakamlar[6] = Convert.ToDouble(dr["ARMATOR"]);
                        rakamlar[7] = Convert.ToDouble(dr["dolar"]);
                        rakamlar[8] = Convert.ToDouble(dr["Euro"]);
                        rakamlar[9] = Convert.ToDouble(dr["Parite"]);
                        rakamlar[10] = Convert.ToDouble(dr["Inspection"]);
                        rakamlar[11] = Convert.ToDouble(dr["Komisyon"]);
                    }
                    if (rakamlar[7] == 0)
                    {
                        using (SqlConnection conn = new SqlConnection(logo))
                        {

                            conn.Open();
                            SqlCommand cmdd = new SqlCommand("select CAST(dbo.DOVIZKURU_GETIR(1,GETDATE()) as decimal(18,3)) as DOLAR,CAST(dbo.DOVIZKURU_GETIR(20,GETDATE()) as decimal(18,3)) as EURO,CAST(dbo.DOVIZKURU_GETIR(20,GETDATE())/dbo.DOVIZKURU_GETIR(1,GETDATE()) as decimal(18,3)) as PARITE", conn);
                            SqlDataAdapter daa = new SqlDataAdapter();
                            daa.SelectCommand = cmdd;
                            DataTable dtt = new DataTable();
                            daa.Fill(dtt);
                            foreach (DataRow dr in dtt.Rows)
                            {
                                degerler[0] = Math.Round(Convert.ToDouble(dr["DOLAR"]), 3);
                                degerler[1] = Math.Round(Convert.ToDouble(dr["EURO"]), 3);
                                degerler[2] = Math.Round(Convert.ToDouble(dr["PARITE"]), 3);
                            }
                            lblDolar.Text = degerler[0].ToString();
                            lblEuro.Text = degerler[1].ToString();
                            lblParite.Text = degerler[2].ToString();
                            conn.Close();
                        }
                    }
                    else
                    {
                        lblDolar.Text = Math.Round(rakamlar[7], 3).ToString();
                        lblEuro.Text = Math.Round(rakamlar[8], 3).ToString();
                        lblParite.Text = Math.Round(rakamlar[9], 3).ToString();
                    }
                    lblUrun.Text = bilgiler[0];
                    txtbirEkipmanTonaji.Text = rakamlar[0].ToString();
                    txtbuUrununBuEkipmandakiTonaji.Text = rakamlar[1].ToString();
                    txtbuUrununToplamTonaji.Text = rakamlar[2].ToString();
                    txtSiparisEkipmanSayisi.Text = rakamlar[3].ToString();
                    //txtSigorta.Text = rakamlar[4].ToString();
                    txtInspection.Text = rakamlar[10].ToString();
                    txtKomiston.Text = rakamlar[11].ToString();
                    SqlCommand kl = new SqlCommand("select '" + bilgiler[1] + "' as Liman union all select PortName from Port where PortName <> '" + bilgiler[1] + "'", con);
                    SqlDataReader dr2 = kl.ExecuteReader();
                    drpKalkisLimani.DataSource = dr2;
                    drpKalkisLimani.DataValueField = "Liman";
                    drpKalkisLimani.DataTextField = "Liman";
                    drpKalkisLimani.DataBind();

                    

                    txtNavlunRevize.Text = rakamlar[5].ToString();
                    txtArmatorLokaliRevize.Text = rakamlar[6].ToString();

                    SqlCommand uruncek = new SqlCommand("select mam.CODE,mam.NAME  from Orders o inner join DTBSSRVR.TIGERDB.dbo.[219_MAMULLER] mam on o.YediyuzluKod=mam.CODE where o.Id='" + id + "' union all select CODE,NAME from  DTBSSRVR.TIGERDB.dbo.[219_MAMULLER] where UST_SINIF_KODU='" + bilgiler[9] + "' and CODE <> (select mam.CODE  from Orders o inner join DTBSSRVR.TIGERDB.dbo.[219_MAMULLER] mam on o.YediyuzluKod=mam.CODE where o.Id='" + id + "')", con);
                    SqlDataAdapter urunoku = new SqlDataAdapter();
                    urunoku.SelectCommand = uruncek;
                    DataTable uru = new DataTable();
                    urunoku.Fill(uru);
                    drpUrunLogo.DataSource = uru;
                    drpUrunLogo.DataTextField = "NAME";
                    drpUrunLogo.DataValueField = "CODE";
                    drpUrunLogo.DataBind();
                    con.Close();
                }
                //string a = bilgiler[4];
          
                if (bilgiler[2] == "BULK")
                {
                    PNLbirekipmantonji.Visible = Panel1.Visible = pnlEkipmanSayisi.Visible = false;
                }

                if (bilgiler[3] != "parcalikonteyner" || bilgiler[3] != "onaltidort")
                {
                    Panel1.Visible = false;
                }
                if (bilgiler[4] == "EXW" || bilgiler[4] == "FAS" || bilgiler[4] == "FCA" || bilgiler[4] == "FOB")
                {
                    pnlNavlun.Visible = false;
                }
                if (bilgiler[4] == "EXW")
                {
                    pnlArmator.Visible = false;
                }
            }
            catch
            {

            }
            ClientScript.RegisterStartupScript(this.GetType(), "", "openModal()", true);

        }

        protected void btnRevizeEt2_Click(object sender, EventArgs e)
        {
            if (ASPxGridView1.VisibleRowCount == 1)
            {
                ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);
            }
            double depolamaton = 0, aranakliye = 0, gumrukleme = 0, limandolumbedeli, navlun, armatorlokali, birekipmantonaji, bukaleminbukonteynerdekitonaji, ambalaj = 0, bfiyat, bigbagfiyat;
            int sipariskonteynersayisi, urununkonteynersayisi, torbaagirligi, bbagirligi;
            double pfiyat2=0, bigbagfiyat2=0, yeniambalaj1375=0, yeniambalaj1250=0;
            double[] aranakliyedepolama = new double[2];
            double USD, pfiyat, sfiyat, tfiyat, torbaf;
            string torbatipi,bbtipi,palet;
            SqlCommand paletfiyat = new SqlCommand("select Price from Palette where Id='"+Convert.ToInt32(drpPaletTipi.SelectedItem.Value)+"'",bag.baglanti());
            SqlCommand bbfiyat = new SqlCommand("select Price from BBType where bbType='"+Convert.ToString(drpBigBagTipi.SelectedItem.Text)+"'",bag.baglanti());
            SqlCommand sfiyatcek = new SqlCommand("select Price from Stretch", bag.baglanti());
            SqlCommand torbafiyat = new SqlCommand("select Price from BagType  where bagType='"+drpTorbaTipi.SelectedItem.Text+"'", bag.baglanti());
            sfiyat = Convert.ToDouble(sfiyatcek.ExecuteScalar());
            if (bilgiler[3] != "onaltidort")
            {
                if (drpTorbaAgirligi.SelectedItem.Text == "YOK")
                {
                    torbaagirligi = 0;
                }
                else
                {
                    torbaagirligi = Convert.ToInt32(drpTorbaAgirligi.SelectedItem.Text);
                }
                if (drpBigBagAgirligi.SelectedItem.Text == "YOK")
                {
                    bbagirligi = 0;
                }
                else
                {
                    bbagirligi = Convert.ToInt32(drpBigBagAgirligi.SelectedItem.Text);
                }
                palet = drpPaletAgirligi.SelectedItem.Text;

                if (drpPaletAgirligi.SelectedItem.Text == "YOK")
                { pfiyat = 0; }
                else
                {

                    if (Convert.ToInt32(drpPaletTipi.SelectedItem.Value) == 2)
                    {

                        pfiyat = (Convert.ToDouble(paletfiyat.ExecuteScalar()) / Convert.ToDouble(drpPaletAgirligi.SelectedItem.Text)) * 1000 * Convert.ToDouble(lblParite.Text);

                    }
                    else
                    {
                        pfiyat = (Convert.ToDouble(paletfiyat.ExecuteScalar()) / Convert.ToDouble(drpPaletAgirligi.SelectedItem.Text)) * 1000;
                    }

                }
                if (drpBigBagTipi.SelectedItem.Text == "YOK" || drpBigBagAgirligi.SelectedItem.Text == "YOK")
                {
                    bfiyat = 0;
                    bbagirligi = 0;
                    bigbagfiyat = 0;
                }

                else
                {
                    bfiyat = Convert.ToDouble(bbfiyat.ExecuteScalar());
                    bbagirligi = Convert.ToInt32(drpBigBagAgirligi.SelectedItem.Text);
                    bigbagfiyat = (bfiyat / bbagirligi) * 1000;
                }
                if (drpTorbaTipi.SelectedItem.Text == "YOK" || drpTorbaAgirligi.SelectedItem.Text == "YOK")
                {
                    tfiyat = 0;
                    torbaagirligi = 0;
                    torbaf = 0;
                }
                else
                {
                    tfiyat = Convert.ToDouble(torbafiyat.ExecuteScalar());
                    torbaagirligi = Convert.ToInt32(drpTorbaAgirligi.SelectedItem.Text);
                    torbaf = (1000 / torbaagirligi) * tfiyat;
                }
                if (torbaagirligi == 0 && bbagirligi == 0 && drpPaletAgirligi.SelectedItem.Text == "YOK")
                {
                    ambalaj = 0;
                }
                else if (torbaagirligi == 0 && bbagirligi == 0 && drpPaletAgirligi.SelectedItem.Text != "YOK")
                {
                    ambalaj = pfiyat + sfiyat;
                }
                else if (torbaagirligi != 0 && bbagirligi != 0 && drpPaletAgirligi.SelectedItem.Text != "YOK")
                {
                    ambalaj = ((tfiyat) * (1000 / torbaagirligi)) + ((bfiyat / bbagirligi) * (1000)) + ((pfiyat)) + sfiyat;
                }
                else if (torbaagirligi != 0 && bbagirligi != 0 && drpPaletAgirligi.SelectedItem.Text == "YOK")
                {
                    ambalaj = ((tfiyat) * (1000 / torbaagirligi)) + ((bfiyat / bbagirligi) * (1000)) + sfiyat;
                }
                else if (torbaagirligi == 0 && bbagirligi != 0 && drpPaletAgirligi.SelectedItem.Text != "YOK")
                {
                    ambalaj = ((bfiyat / bbagirligi) * (1000)) + (pfiyat) + sfiyat;
                }

                else if (torbaagirligi == 0 && bbagirligi != 0 && drpPaletAgirligi.SelectedItem.Text == "YOK")
                {
                    ambalaj = ((bfiyat / bbagirligi) * (1000)) + sfiyat;
                }

                else if (torbaagirligi != 0 && bbagirligi == 0 && drpPaletAgirligi.SelectedItem.Text == "YOK")
                {
                    ambalaj = ((tfiyat) * (1000 / torbaagirligi)) + sfiyat;
                }
                else if (torbaagirligi != 0 && bbagirligi == 0 && drpPaletAgirligi.SelectedItem.Text != "YOK")
                {
                    ambalaj = ((tfiyat) * (1000 / torbaagirligi)) + sfiyat + pfiyat;
                }
            }

            else
            {
               
                if (drpTorbaAgirligi.SelectedItem.Text == "YOK")
                {
                    torbaagirligi = 0;
                }
                else
                {
                    torbaagirligi = Convert.ToInt32(drpTorbaAgirligi.SelectedItem.Text);
                }
                if (drpBigBagAgirligi.SelectedItem.Text == "YOK")
                {
                    bbagirligi = 0;
                }
                else
                {
                    bbagirligi = Convert.ToInt32(drpBigBagAgirligi.SelectedItem.Text);
                }
                palet = drpPaletAgirligi.SelectedItem.Text;

                if (drpPaletAgirligi.SelectedItem.Text == "YOK")
                { pfiyat = 0; }
                else
                {

                    if (Convert.ToInt32(drpPaletTipi.SelectedItem.Value) == 2)
                    {

                        pfiyat = (Convert.ToDouble(paletfiyat.ExecuteScalar()) / 1375) * 1000 * Convert.ToDouble(lblParite.Text);
                        pfiyat2 = (Convert.ToDouble(paletfiyat.ExecuteScalar()) / 1250) * 1000 * Convert.ToDouble(lblParite.Text);
                    }
                    else
                    {
                        pfiyat = (Convert.ToDouble(paletfiyat.ExecuteScalar()) / 1375) * 1000;
                        pfiyat2 = (Convert.ToDouble(paletfiyat.ExecuteScalar()) / 1250) * 1000;
                    }

                }
                if (drpBigBagTipi.SelectedItem.Text == "YOK" || drpBigBagAgirligi.SelectedItem.Text == "YOK")
                {
                    bfiyat = 0;
                    bbagirligi = 0;
                    bigbagfiyat = 0;
                }

                else
                {
                    bfiyat = Convert.ToDouble(bbfiyat.ExecuteScalar());
                   
                    bigbagfiyat = (bfiyat / 1375) * 1000;
                    bigbagfiyat2 = (bfiyat / 1250) * 1000;
                }
                if (drpTorbaTipi.SelectedItem.Text == "YOK" || drpTorbaAgirligi.SelectedItem.Text == "YOK")
                {
                    tfiyat = 0;
                    torbaagirligi = 0;
                    torbaf = 0;
                }
                else
                {
                    tfiyat = Convert.ToDouble(torbafiyat.ExecuteScalar());
                    torbaagirligi = Convert.ToInt32(drpTorbaAgirligi.SelectedItem.Text);
                    torbaf = (1000 / torbaagirligi) * tfiyat;
                }
                if (torbaagirligi == 0 && bbagirligi == 0 && drpPaletAgirligi.SelectedItem.Text == "YOK")
                {
                    ambalaj = 0;
                }
                else if (torbaagirligi == 0 && bbagirligi == 0 && drpPaletAgirligi.SelectedItem.Text != "YOK")
                {
                    yeniambalaj1375 = (pfiyat + sfiyat) * 5;
                    yeniambalaj1250 = (pfiyat2 + sfiyat) * 22;
                    ambalaj = (yeniambalaj1375 + yeniambalaj1250)/27;
                }
                else if (torbaagirligi != 0 && bbagirligi != 0 && drpPaletAgirligi.SelectedItem.Text != "YOK")

                {
                    if (drpBigBagTipi.SelectedItem.Text == "SLINGBAG")
                    {
                        bfiyat = Convert.ToDouble(bbfiyat.ExecuteScalar());

                        bigbagfiyat = (bfiyat * 1375) / 1000;
                        bigbagfiyat2 = (bfiyat * 1250) / 1000;
                        yeniambalaj1375 = (((tfiyat) * (1000 / torbaagirligi)) + bigbagfiyat+sfiyat)*22;
                        yeniambalaj1375 = (((tfiyat) * (1000 / torbaagirligi)) + bigbagfiyat2 + sfiyat) * 5;
                        ambalaj = (yeniambalaj1250 + yeniambalaj1375)/27;

                    }
                    else
                    {
                        bfiyat = Convert.ToDouble(bbfiyat.ExecuteScalar());

                        bigbagfiyat = (bfiyat * 1375) / 1000;
                        bigbagfiyat2 = (bfiyat * 1250) / 1000;
                      
                      
                        yeniambalaj1375 = (((tfiyat) * (1000 / torbaagirligi)) + bigbagfiyat + sfiyat+pfiyat) * 22;
                        yeniambalaj1375 = (((tfiyat) * (1000 / torbaagirligi)) + bigbagfiyat2 + sfiyat+pfiyat2) * 5;
                        ambalaj = (yeniambalaj1250 + yeniambalaj1375) / 27;

                    }
                   
                }
                else if (torbaagirligi != 0 && bbagirligi != 0 && drpPaletAgirligi.SelectedItem.Text == "YOK")
                {
                    bigbagfiyat = (bfiyat * 1375) / 1000;
                    bigbagfiyat2 = (bfiyat * 1250) / 1000;
                    yeniambalaj1375 = (((tfiyat) * (1000 / torbaagirligi)) + bigbagfiyat + sfiyat)*22;
                    yeniambalaj1250 = (((tfiyat) * (1000 / torbaagirligi)) + bigbagfiyat2 + sfiyat)*5;
                    ambalaj = (yeniambalaj1375 + yeniambalaj1250) / 27;
                   
                }
                else if (torbaagirligi == 0 && bbagirligi != 0 && drpPaletAgirligi.SelectedItem.Text != "YOK")
                {
                    if (drpBigBagTipi.SelectedItem.Text == "SLINGBAG")
                    {
                        bigbagfiyat = (bfiyat * 1375) / 1000;
                        bigbagfiyat2 = (bfiyat * 1250) / 1000;
                        yeniambalaj1375 = (bigbagfiyat  + sfiyat)*22;
                        yeniambalaj1250 = (bigbagfiyat2  + sfiyat)*5;
                        ambalaj = (yeniambalaj1250 + yeniambalaj1375) / 27;

                    }
                    else
                    {
                        bigbagfiyat = (bfiyat * 1375) / 1000;
                        bigbagfiyat2 = (bfiyat * 1250) / 1000;
                        yeniambalaj1375 = (bigbagfiyat + pfiyat + sfiyat) * 22;
                        yeniambalaj1250 = (bigbagfiyat2 + pfiyat2 + sfiyat) * 5;
                        ambalaj = (yeniambalaj1250 + yeniambalaj1375) / 27;
                    }
                  
                   
                }

                else if (torbaagirligi == 0 && bbagirligi != 0 && drpPaletAgirligi.SelectedItem.Text == "YOK")
                {
                    bigbagfiyat = (bfiyat * 1375) / 1000;
                    bigbagfiyat2 = (bfiyat * 1250) / 1000;
                    yeniambalaj1375 = (bigbagfiyat + pfiyat + sfiyat) * 22;
                    yeniambalaj1250 = (bigbagfiyat2 + pfiyat2 + sfiyat) * 5;
                    ambalaj = (yeniambalaj1250 + yeniambalaj1375) / 27;
                }

                else if (torbaagirligi != 0 && bbagirligi == 0 && drpPaletAgirligi.SelectedItem.Text == "YOK")
                {
                  
                    ambalaj = ((tfiyat) * (1000 / torbaagirligi)) + sfiyat;
                }
                else if (torbaagirligi != 0 && bbagirligi == 0 && drpPaletAgirligi.SelectedItem.Text != "YOK")
                {
                    yeniambalaj1375 = (((tfiyat) * (1000 / torbaagirligi)) + sfiyat + pfiyat)*22;
                    yeniambalaj1250 = (((tfiyat) * (1000 / torbaagirligi)) + sfiyat + pfiyat2) * 5;

                    ambalaj = (yeniambalaj1375 + yeniambalaj1250) / 27;
          
                }
            }
            int id;
            var kayit_id = ASPxGridView1.GetSelectedFieldValues("Id");
            id = Convert.ToInt32(kayit_id[0]);
            double vadecarpani = 0;
            
            SqlCommand vadecarpanicek = new SqlCommand("select  Price  from Maturity where Maturity='" + bilgiler[7] + "'", bag.baglanti());
            vadecarpani = Convert.ToDouble(vadecarpanicek.ExecuteScalar());
           
            using (SqlConnection con = new SqlConnection(logo))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SET dateformat DMY select dbo.DOVIZKURU_GETIR(1,GETDATE())", con);
                USD = Convert.ToDouble(cmd.ExecuteScalar());
                con.Close();
            }
            if (bilgiler[8] == "HAYIR")
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select Price,InsideTransport from Port where PortName='" + drpKalkisLimani.SelectedItem.Text + "'", con);
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    foreach (DataRow dr in dt.Rows)
                    {
                        aranakliyedepolama[0] = Convert.ToDouble(dr["Price"]);
                        aranakliyedepolama[1] = Convert.ToDouble(dr["InsideTransport"]);
                    }
                    
                    con.Close();
                }
            }
            else
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select Price,InsideTransport from Port where PortName='" + drpKalkisLimani.SelectedItem.Text + "'", con);
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    foreach (DataRow dr in dt.Rows)
                    {
                        aranakliyedepolama[0] = 0;
                        aranakliyedepolama[1] = Convert.ToDouble(dr["InsideTransport"]);
                    }
                    con.Close();
                }
            }


            if (bilgiler[2] == "BULK")
            {

                birekipmantonaji = 0;
                bukaleminbukonteynerdekitonaji = 0;
                sipariskonteynersayisi = 0;
                urununkonteynersayisi = 0;
                depolamaton = aranakliyedepolama[0];

                aranakliye = aranakliyedepolama[1];
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    if (bilgiler[8] == "HAYIR")
                    {
                        SqlCommand bulkgumrukcek = new SqlCommand("select GumruklemeBULK from Clearance", con);
                        if (bilgiler[5] == "Birden Fazla Beyanname")
                        {
                            gumrukleme = (Convert.ToDouble(bulkgumrukcek.ExecuteScalar()) * 2) / Convert.ToDouble(txtToplamSiparisTonajı.Text) / USD;
                        }
                        else
                        {
                            gumrukleme = (Convert.ToDouble(bulkgumrukcek.ExecuteScalar())) / Convert.ToDouble(txtToplamSiparisTonajı.Text) / USD;
                        }
                        SqlCommand limandolumcek = new SqlCommand("select Price LoadingCharge", bag.baglanti());
                        limandolumbedeli = Convert.ToDouble(limandolumcek.ExecuteScalar());
                        Session["limandolumbedeli"] = limandolumbedeli;

                    }
                    else
                    {


                        gumrukleme = 0;


                        limandolumbedeli = 0;
                        Session["limandolumbedeli"] = limandolumbedeli;
                    }
                    con.Close();
                }
                if (bilgiler[8] == "HAYIR")
                {
                    if (bilgiler[4] == "EXW" || bilgiler[4] == "FAS" || bilgiler[4] == "FCA" || bilgiler[4] == "FOB")
                    {
                        navlun = 0;
                    }
                    else
                    {
                        navlun = Convert.ToDouble(txtNavlunRevize.Text);
                    }
                    if (bilgiler[4] == "EXW")
                    {
                        armatorlokali = 0;
                    }
                    else
                    {
                        armatorlokali = Convert.ToDouble(txtArmatorLokaliRevize.Text);
                    }
                }
                else
                {
                    navlun = 0; armatorlokali = 0;

                }


            }
            else
            {
                sipariskonteynersayisi = Convert.ToInt32(txtSiparisEkipmanSayisi.Text);
                birekipmantonaji = Convert.ToDouble(txtbirEkipmanTonaji.Text);
                if (bilgiler[8] == "HAYIR")
                {
                    if (bilgiler[4] == "EXW" || bilgiler[4] == "FAS" || bilgiler[4] == "FCA" || bilgiler[4] == "FOB")
                    {
                        navlun = 0;
                    }
                    else
                    {
                        navlun = Convert.ToDouble(txtNavlunRevize.Text) / Convert.ToDouble(txtbirEkipmanTonaji.Text);
                    }
                    if (bilgiler[4] == "EXW")
                    {
                        armatorlokali = 0;
                    }
                    else
                    {
                        armatorlokali = Convert.ToDouble(txtArmatorLokaliRevize.Text) / Convert.ToDouble(txtbirEkipmanTonaji.Text);
                    }
                    if (bilgiler[3] == "parcalikonteyner" || bilgiler[3] == "onaltidort")
                    {
                        bukaleminbukonteynerdekitonaji = Convert.ToDouble(txtbuUrununBuEkipmandakiTonaji.Text);
                        //urununkonteynersayisi = Convert.ToInt32(txtbuUrununToplamTonaji.Text) / Convert.ToInt32(txtbuUrununBuEkipmandakiTonaji.Text);
                    }
                    else
                    {
                        bukaleminbukonteynerdekitonaji = 0;

                        //urununkonteynersayisi = Convert.ToInt32( Convert.ToDouble(txtbuUrununToplamTonaji.Text) / Convert.ToDouble(txtbirEkipmanTonaji.Text));
                    }

                }
                else
                {

                    if (bilgiler[4] == "EXW" || bilgiler[4] == "FAS" || bilgiler[4] == "FCA" || bilgiler[4] == "FOB")
                    {
                        navlun = 0;
                        armatorlokali = 0;
                    }
                    else
                    {
                        navlun = Convert.ToDouble(txtNavlunRevize.Text) / Convert.ToDouble(txtbirEkipmanTonaji.Text);
                        armatorlokali = Convert.ToDouble(txtArmatorLokaliRevize.Text) / Convert.ToDouble(txtbirEkipmanTonaji.Text);
                    }
                    if (bilgiler[3] == "parcalikonteyner" || bilgiler[3] == "onaltidort")
                    {
                        bukaleminbukonteynerdekitonaji = Convert.ToDouble(txtbuUrununBuEkipmandakiTonaji.Text);
                        //urununkonteynersayisi = Convert.ToInt32(txtbuUrununToplamTonaji.Text) / Convert.ToInt32(txtbuUrununBuEkipmandakiTonaji.Text);
                    }
                    else
                    {
                        bukaleminbukonteynerdekitonaji = 0;

                        //urununkonteynersayisi = Convert.ToInt32( Convert.ToDouble(txtbuUrununToplamTonaji.Text) / Convert.ToDouble(txtbirEkipmanTonaji.Text));
                    }
                }



                aranakliye = aranakliyedepolama[1];
                depolamaton = 0;
                if (bilgiler[8] == "HAYIR")
                {
                    if (bilgiler[6] == "Kara Yolu")
                    {
                        limandolumbedeli = 0;
                        Session["limandolumbedeli"] = limandolumbedeli;
                        if (Convert.ToInt32(txtSiparisEkipmanSayisi.Text) == 1)
                        {
                            SqlCommand karayolu = new SqlCommand("select GumruklemeKonteynerKaraYolu from Clearance", bag.baglanti());
                            gumrukleme = Convert.ToDouble(karayolu.ExecuteScalar()) / Convert.ToDouble(txtToplamSiparisTonajı.Text) / Convert.ToDouble(USD);
                            Session["gumruk"] = gumrukleme;
                        }
                        else if (Convert.ToInt32(txtSiparisEkipmanSayisi.Text) > 1)
                        {
                            SqlCommand karayolu = new SqlCommand("select GumruklemeKonteynerKaraYolu from Clearance", bag.baglanti());
                            SqlCommand karayoluikiuzeri = new SqlCommand("select GumruklemeKonteynerKaraYoluikiuzeri from Clearance", bag.baglanti());
                            int ikiuzeri = Convert.ToInt32(txtSiparisEkipmanSayisi.Text) - 1;
                            gumrukleme = (Convert.ToDouble(karayolu.ExecuteScalar()) + Convert.ToDouble(karayoluikiuzeri.ExecuteScalar()) * ikiuzeri) / Convert.ToDouble(txtToplamSiparisTonajı.Text) / Convert.ToDouble(USD);
                            Session["gumruk"] = gumrukleme;
                        }
                    }
                    else if (bilgiler[6] == "Demir Yolu")
                    {
                        limandolumbedeli = 0;
                        Session["limandolumbedeli"] = limandolumbedeli;
                        if (Convert.ToInt32(txtSiparisEkipmanSayisi.Text) == 1)
                        {
                            SqlCommand karayolu = new SqlCommand("select GumruklemeKonteynerDemirYolu from Clearance", bag.baglanti());
                            gumrukleme = Convert.ToDouble(karayolu.ExecuteScalar()) / Convert.ToDouble(txtToplamSiparisTonajı.Text) / Convert.ToDouble(USD);
                            Session["gumruk"] = gumrukleme;
                            }
                        else if (Convert.ToInt32(txtSiparisEkipmanSayisi.Text) > 1)
                        {
                            SqlCommand karayolu = new SqlCommand("select GumruklemeKonteynerKaraYolu from Clearance", bag.baglanti());
                            SqlCommand karayoluikiuzeri = new SqlCommand("select GumruklemeKonteynerDemirYoluikiuzeri from Clearance", bag.baglanti());
                            int ikiuzeri = Convert.ToInt32(txtSiparisEkipmanSayisi.Text) - 1;
                            gumrukleme = (Convert.ToDouble(karayolu.ExecuteScalar()) + Convert.ToDouble(karayoluikiuzeri.ExecuteScalar()) * ikiuzeri) / Convert.ToDouble(txtToplamSiparisTonajı.Text) / Convert.ToDouble(USD);
                            Session["gumruk"] = gumrukleme;
                        }
                    }
                    else if (bilgiler[6] == "20 DV")
                    {
                        if (bilgiler[1] == "MIP")
                        {
                            SqlCommand mip20 = new SqlCommand("select  ContainerFreeinMIP20  from LoadingCharge", bag.baglanti());
                            limandolumbedeli = Convert.ToDouble(mip20.ExecuteScalar()) / Convert.ToDouble(txtbirEkipmanTonaji.Text);
                            Session["limandolumbedeli"] = limandolumbedeli;
                            
                        }
                        else if (bilgiler[1] == "Limak")
                        {
                            SqlCommand limak20 = new SqlCommand("select  ContainerFreeinLIMAK20  from LoadingCharge", bag.baglanti());
                            limandolumbedeli = Convert.ToDouble(limak20.ExecuteScalar()) / Convert.ToDouble(txtbirEkipmanTonaji.Text);
                            Session["limandolumbedeli"] = limandolumbedeli;
                        }
                        if (Convert.ToInt32(txtSiparisEkipmanSayisi.Text) == 1)
                        {

                            SqlCommand konteynergumruk = new SqlCommand("select GumruklemeKONTEYNER from Clearance", bag.baglanti());
                            gumrukleme = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtToplamSiparisTonajı.Text)) / Convert.ToDouble(USD);
                            Session["gumruk"] = gumrukleme;
                        }

                        else if (Convert.ToInt32(txtSiparisEkipmanSayisi.Text) >= 2 && Convert.ToInt32(txtSiparisEkipmanSayisi.Text) < 10)
                        {
                            SqlCommand konteynergumruk = new SqlCommand("select GumruklemeKONTEYNER from Clearance", bag.baglanti());
                            SqlCommand konteynergumrukikidokuz = new SqlCommand("select GumruklemeKONTEYNERikidokuz from Clearance", bag.baglanti());
                            int ikion = Convert.ToInt32(txtSiparisEkipmanSayisi.Text) - 1;
                            gumrukleme = ((ikion * Convert.ToDouble(konteynergumrukikidokuz.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtToplamSiparisTonajı.Text)) / Convert.ToDouble(USD);
                            Session["gumruk"] = gumrukleme;
                        }
                        else if (Convert.ToInt32(txtSiparisEkipmanSayisi.Text) >= 10)
                        {
                            SqlCommand konteynergumruk = new SqlCommand("select GumruklemeKONTEYNER from Clearance", bag.baglanti());
                            SqlCommand konteynergumrukikion = new SqlCommand("select GumruklemeKONTEYNERikidokuz from Clearance", bag.baglanti());
                            SqlCommand konteyneronuzeri = new SqlCommand("select GumruklemeKONTEYNERikidokuz from Clearance", bag.baglanti());
                            int ikion = Convert.ToInt32(txtSiparisEkipmanSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(txtSiparisEkipmanSayisi.Text) - 1 - ikion;
                            gumrukleme = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtToplamSiparisTonajı.Text)) / Convert.ToDouble(USD);
                            Session["gumruk"] = gumrukleme;
                        }

                    }
                    else if (bilgiler[6] == "40 DV")
                    {
                        if (bilgiler[1] == "MIP")
                        {
                            SqlCommand mip40 = new SqlCommand("select  ContainerFreeinMIP40  from LoadingCharge", bag.baglanti());
                            limandolumbedeli = Convert.ToDouble(mip40.ExecuteScalar()) / Convert.ToDouble(txtbirEkipmanTonaji.Text);
                            Session["limandolumbedeli"] = limandolumbedeli;
                            Session["gumruk"] = gumrukleme;
                        }
                        else if (bilgiler[1] == "Limak")
                        {
                            SqlCommand limak40 = new SqlCommand("select  ContainerFreeinLIMAK40  from LoadingCharge", bag.baglanti());
                            limandolumbedeli = Convert.ToDouble(limak40.ExecuteScalar()) / Convert.ToDouble(txtbirEkipmanTonaji.Text);
                            Session["limandolumbedeli"] = limandolumbedeli;
                            Session["gumruk"] = gumrukleme;
                        }
                        if (Convert.ToInt32(txtSiparisEkipmanSayisi.Text) == 1)
                        {

                            SqlCommand konteynergumruk = new SqlCommand("select GumruklemeKONTEYNER from Clearance", bag.baglanti());
                            gumrukleme = ((Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtToplamSiparisTonajı.Text)) / Convert.ToDouble(USD);
                            Session["gumruk"] = gumrukleme;
                        }

                        else if (Convert.ToInt32(txtSiparisEkipmanSayisi.Text) >= 2 && Convert.ToInt32(txtSiparisEkipmanSayisi.Text) < 10)
                        {
                            SqlCommand konteynergumruk = new SqlCommand("select GumruklemeKONTEYNER from Clearance", bag.baglanti());
                            SqlCommand konteynergumrukikidokuz = new SqlCommand("select GumruklemeKONTEYNERikidokuz from Clearance", bag.baglanti());
                            int ikion = Convert.ToInt32(txtSiparisEkipmanSayisi.Text) - 1;
                            gumrukleme = ((ikion * Convert.ToDouble(konteynergumrukikidokuz.ExecuteScalar()) + Convert.ToDouble(konteynergumruk.ExecuteScalar())) / Convert.ToDouble(txtToplamSiparisTonajı.Text)) / Convert.ToDouble(USD);
                            Session["gumruk"] = gumrukleme;
                        }
                        else if (Convert.ToInt32(txtSiparisEkipmanSayisi.Text) >= 10)
                        {
                            SqlCommand konteynergumruk = new SqlCommand("select GumruklemeKONTEYNER from Clearance", bag.baglanti());
                            SqlCommand konteynergumrukikion = new SqlCommand("select GumruklemeKONTEYNERikidokuz from Clearance", bag.baglanti());
                            SqlCommand konteyneronuzeri = new SqlCommand("select GumruklemeKONTEYNERikidokuz from Clearance", bag.baglanti());
                            int ikion = Convert.ToInt32(txtSiparisEkipmanSayisi.Text) - 1;
                            int onuzeri = Convert.ToInt32(txtSiparisEkipmanSayisi.Text) - 1 - ikion;
                            gumrukleme = (((ikion * Convert.ToDouble(konteynergumrukikion.ExecuteScalar())) + (Convert.ToDouble(konteyneronuzeri.ExecuteScalar()) * onuzeri) + (Convert.ToDouble(konteynergumruk.ExecuteScalar()))) / Convert.ToDouble(txtToplamSiparisTonajı.Text)) / Convert.ToDouble(USD);
                            Session["gumruk"] = gumrukleme;
                        }


                    }
                    else
                    {
                        gumrukleme = 0; limandolumbedeli = 0;
                        Session["gumruk"] = gumrukleme;
                        Session["limandolumbedeli"] = limandolumbedeli;
                    }
                }




            }
            if (db.TeklifRevize(id, drpKalkisLimani.SelectedItem.Text, birekipmantonaji, Convert.ToDouble(txtbuUrununToplamTonaji.Text), bukaleminbukonteynerdekitonaji, sipariskonteynersayisi, armatorlokali, navlun, aranakliye, depolamaton, Convert.ToDouble(Session["gumruk"]), Convert.ToDouble(Session["limandolumbedeli"]), vadecarpani, Convert.ToDouble(txtInspection.Text), Convert.ToDouble(txtKomiston.Text), drpUrunLogo.SelectedItem.Value, drpTorbaTipi.SelectedItem.Text, torbaagirligi, drpBigBagTipi.SelectedItem.Text, bbagirligi, palet, ambalaj) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "revizesuccess()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "revizeerror()", true);
            }



        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            double eurocfr, eurofob, tlcfr, tlfob;

            eurocfr = Math.Round(Convert.ToDouble(txtTeslimSekliSatisFİyati.Text) / Convert.ToDouble(lblparite2.Text), 3);
            eurofob = Math.Round(Convert.ToDouble(txtFobSatisFiyati.Text) / Convert.ToDouble(lblparite2.Text), 3);

            tlcfr = Math.Round(Convert.ToDouble(txtTeslimSekliSatisFİyati.Text) * Convert.ToDouble(lbldolar2.Text), 3);
            tlfob = Math.Round(Convert.ToDouble(txtFobSatisFiyati.Text) * Convert.ToDouble(lbldolar2.Text), 3);
            lbleurocfr.Text = eurocfr.ToString();
            lbleurofob.Text = eurofob.ToString();
            lbltlcfr.Text = tlcfr.ToString();
            lbltlfob.Text = tlfob.ToString();
        }

       
       

    }

}
