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
    public partial class OnaylananTeklifler : System.Web.UI.Page
    {
        DBLogoConnection logo = new DBLogoConnection();
        const string bugun = "https://www.tcmb.gov.tr/kurlar/today.xml";
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
            if (!Page.IsPostBack)
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select *from Payment", con);
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    drpPayment.DataSource = dt;
                    drpPayment.DataValueField = "Id";
                    drpPayment.DataTextField = "PaymentTerms";
                    drpPayment.DataBind();
                    SqlConnection.ClearPool(con);
                    con.Close();
                    txtCustomClerance.Text = "Included in Turkey/Excluded elsewhere";
                }
            }
        }

        protected void btnRapor_Click(object sender, EventArgs e)
        {
            string teklifno;
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                teklifno = Convert.ToString(teklif_no[0]);


                Response.Redirect("OnaylananTekliflerDetay.aspx?teklifno=" + teklifno + "");
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@Durum"].Value = "ONAYLANDI";
            e.Command.Parameters["@temsilci"].Value = UserData.Id;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string teklifno;
            string metin;
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1)
                {
                    ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);

                    var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                    teklifno = Convert.ToString(teklif_no[0]);
                    using (SqlConnection con = new SqlConnection(strcon))
                    {
                        con.Open();

                        metin = UserData.Name + " " + UserData.SurName + " " + teklifno + "Numaralı Teklif İçin Satış Onayı İstiyor";
                        SqlCommand kayitcek = new SqlCommand("select *from Orders where TeklifNo=@p1", con);
                        kayitcek.Parameters.AddWithValue("@p1", teklifno);
                        string durum = "";
                        //string satisonayi = "";
                        SqlDataReader dr = kayitcek.ExecuteReader();
                        while (dr.Read())
                        {
                            durum = dr["Durum"].ToString();

                            if (durum == "SATISA DONDU")
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "warningAlert2()", true);
                            }
                            else if (durum == "ONAYLANDI")
                            {

                                if (db.satisOnayiGonder(teklifno, metin) == 1)
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
                                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "warningAlert()", true);
                            }
                        }
                        dr.Close();
                        con.Close();
                    }

                }
                else
                {
                    List<object> id = ASPxGridView1.GetSelectedFieldValues(new string[] { "TeklifNo" });

                    for (int i = 0; i < id.Count; i++)
                    {
                        using (SqlConnection con = new SqlConnection(strcon))
                        {
                            con.Open();

                            metin = UserData.Name + " " + UserData.SurName + " " + id[i].ToString() + "Numaralı Teklif İçin Satış Onayı İstiyor";
                            SqlCommand kayitcek = new SqlCommand("select *from Orders where TeklifNo=@p1", con);
                            kayitcek.Parameters.AddWithValue("@p1", id[i].ToString());
                            string durum = "";
                            //string satisonayi = "";
                            SqlDataReader dr = kayitcek.ExecuteReader();
                            while (dr.Read())
                            {
                                durum = dr["Durum"].ToString();

                                if (durum == "SATISA DONDU")
                                {
                                    //ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "warningAlert2()", true);
                                }
                                else if (durum == "ONAYLANDI")
                                {

                                    db.satisOnayiGonder(id[i].ToString(), metin);




                                }
                            }
                            dr.Close();
                            con.Close();
                        }

                    }
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
                }

            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsToResponse("Onaylanan_Teklifler" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString());
        }

        protected void btnTeklifFormuOlustur_Click(object sender, EventArgs e)
        {

            string teklifno;
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1)
                {
                    ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);
                }

                var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                teklifno = Convert.ToString(teklif_no[0]);
                Session["teklifno"] = teklifno;
                pnlKayitEkle.Visible =
            pnlHider.Visible = true;
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }



        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {


            bool info, tds, msds, fobPriceVisible;




            if (checkInfo.Checked == true)
            {
                info = true;
            }
            else
            {
                info = false;
            }
            if (checkFobVisible.Checked == true)
            {
                fobPriceVisible = true;
            }
            else
            {
                fobPriceVisible = false;
            }
            if (checkTDS.Checked == true)
            {
                tds = true;
            }
            else
            {
                tds = false;
            }
            if (checkMSDS.Checked == true)
            {
                msds = true;
            }
            else
            {
                msds = false;
            }

            string metin;

            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();


                metin = UserData.Name + " " + UserData.SurName + " " + Session["teklifno"] + "Numaralı Teklif İçin Teklif Formu Oluşturdu";
                string konum = "Siparisler.aspx?islem=okundu";
                con.Close();
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
                if (db.TeklifFormu(Convert.ToString(Session["teklifno"]), Request.Form["dilsecenegi"], info, tds, msds, txtcontactperson.Text, txtcontactemail.Text, txtphonenumber.Text, txtCustomClerance.Text, txtaciklama.Text, metin, konum, Request.Form["parabirimi"], 1, Convert.ToBoolean(fobPriceVisible), Request.Form["sirket"], parite, drpPayment.SelectedItem.Text, USD, EUR) == 1)
                {

                    pnlKayitEkle2.Visible =
                                     pnlHider2.Visible = true;

                }

                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Errorteklifno()", true);
                }
            }






        }
        protected void btnEkle2_Click(object sender, EventArgs e)
        {
            bool info, tds, msds, fobPriceVisible;




            if (checkInfo.Checked == true)
            {
                info = true;
            }
            else
            {
                info = false;
            }
            if (checkTDS.Checked == true)
            {
                tds = true;
            }
            else
            {
                tds = false;
            }
            if (checkMSDS.Checked == true)
            {
                msds = true;
            }
            else
            {
                msds = false;
            }
            if (checkFobVisible.Checked == true)
            {
                fobPriceVisible = true;
            }
            else
            {
                fobPriceVisible = false;
            }

            string metin;
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
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();

                metin = UserData.Name + " " + UserData.SurName + " " + Session["teklifno"] + "Numaralı Teklif İçin Teklif Formu Oluşturdu";
                string konum = "Siparisler.aspx?islem=okundu";
                con.Close();

                if (db.TeklifFormu(Convert.ToString(Session["teklifno"]), Request.Form["dilsecenegi"], info, tds, msds, txtcontactperson.Text, txtcontactemail.Text, txtphonenumber.Text, txtCustomClerance.Text, txtaciklama.Text, metin, konum, Request.Form["parabirimi"], 2, Convert.ToBoolean(fobPriceVisible), Request.Form["sirket"], parite, drpPayment.SelectedItem.Text, USD, EUR) == 1)
                {
                    pnlKayitEkle3.Visible =
                        pnlHider3.Visible = true;
                    //Response.Redirect("TeklifFormu.aspx?teklifno=" + teklifno + "");
                }

                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Errorteklifno()", true);
                }
            }


        }

        protected void lbModalPopupKapat_Click(object sender, EventArgs e)
        {
            pnlKayitEkle.Visible =
            pnlHider.Visible = false;
        }
        protected void lbModalPopupKapat2_Click(object sender, EventArgs e)
        {
            pnlKayitEkle2.Visible =
         pnlHider2.Visible = false;
        }
        protected void lbModalPopupKapat3_Click(object sender, EventArgs e)
        {
            pnlKayitEkle3.Visible =
         pnlHider3.Visible = false;
        }

        protected void FormOlustur(object sender, EventArgs e)
        {
            bool info, tds, msds, fobPriceVisible;




            if (checkInfo.Checked == true)
            {
                info = true;
            }
            else
            {
                info = false;
            }
            if (checkTDS.Checked == true)
            {
                tds = true;
            }
            else
            {
                tds = false;
            }
            if (checkMSDS.Checked == true)
            {
                msds = true;
            }
            else
            {
                msds = false;
            }
            if (checkFobVisible.Checked == true)
            {
                fobPriceVisible = true;
            }
            else
            {
                fobPriceVisible = false;
            }

            string metin;

            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();

                metin = UserData.Name + " " + UserData.SurName + " " + Session["teklifno"] + "Numaralı Teklif İçin Teklif Formu Oluşturdu";
                string konum = "Siparisler.aspx?islem=okundu";
                con.Close();
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
                if (db.TeklifFormu(Convert.ToString(Session["teklifno"]), Request.Form["dilsecenegi"], info, tds, msds, txtcontactperson.Text, txtcontactemail.Text, txtphonenumber.Text, txtCustomClerance.Text, txtaciklama.Text, metin, konum, Request.Form["parabirimi"], 3, Convert.ToBoolean(fobPriceVisible), Request.Form["sirket"], parite, drpPayment.SelectedItem.Text, USD, EUR) == 1)
                {
                    if (db.TumDokumler(Convert.ToString(Session["teklifno"])) == 1)
                    {
                        Response.Redirect("TeklifFormu.aspx?teklifno=" + Convert.ToString(Session["teklifno"]) + "");
                    }


                }

                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "Errorteklifno()", true);
                }
            }
        }

        protected void btnProformaOnayiGonder_Click(object sender, EventArgs e)
        {

        }

        protected void Button6_Click(object sender, EventArgs e)
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