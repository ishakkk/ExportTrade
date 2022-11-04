﻿using ExternalTrade.Classes;
using QRCoder;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade
{
    public partial class CommercialInvoiceOperation : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (UserData.Authority != "SuperAdmın" && UserData.Authority != "Operation")
            //    Response.Redirect("Home.aspx");
            using (MemoryStream ms = new MemoryStream())
            {
                QRCodeGenerator koduret = new QRCodeGenerator();
                QRCodeGenerator.QRCode kod = koduret.CreateQrCode("https://www.nigtas.com/", QRCodeGenerator.ECCLevel.Q);
                using (Bitmap bmp = kod.GetGraphic(5))
                {
                    bmp.Save(ms, ImageFormat.Png);
                    img_yeri.ImageUrl = "data:imge/png;base64," + Convert.ToBase64String(ms.ToArray());
                    // Image1.ImageUrl = "data:imge/png;base64," + Convert.ToBase64String(ms.ToArray());
                    Image2.ImageUrl = "data:imge/png;base64," + Convert.ToBase64String(ms.ToArray());
                }
            }
            using (SqlConnection con2 = new SqlConnection(strcon))
            {
                //int sayac = 0;
                //con2.Open();
                //SqlCommand cmd = new SqlCommand("select  UrunKodu,UrunFiyat,MusteriKodu   from Orders where TeklifNo='" + Request.QueryString["teklifno"] + "'", con2);
                //SqlDataReader dr = cmd.ExecuteReader();
                //while (dr.Read())
                //{
                //    //if (dr["MusteriKodu"].ToString() == "120.02.00003")
                //    //{
                //    //    SqlCommand cmd2 = new SqlCommand("select Price_Intercarb from Product where Code='" + dr["UrunKodu"].ToString() + "'", con2);
                //    //    SqlDataReader dr2 = cmd2.ExecuteReader();
                //    //    while (dr2.Read())
                //    //    {
                //    //        if (Convert.ToDouble(dr["UrunFiyat"]) != Convert.ToDouble(dr2["Price_Intercarb"]))
                //    //        {
                //    //            sayac = sayac + 1;
                //    //        }
                //    //    }
                //    //}
                //    //else if (dr["MusteriKodu"].ToString() == "120.02.00004")
                //    //{
                //    //    SqlCommand cmd2 = new SqlCommand("select Price_Roskim from Product where Code='" + dr["UrunKodu"].ToString() + "'", con2);
                //    //    SqlDataReader dr2 = cmd2.ExecuteReader();
                //    //    while (dr2.Read())
                //    //    {
                //    //        if (Convert.ToDouble(dr["UrunFiyat"]) != Convert.ToDouble(dr2["Price_Roskim"]))
                //    //        {
                //    //            sayac = sayac + 1;
                //    //        }
                //    //    }
                //    //}
                //    //else if (dr["MusteriKodu"].ToString() == "120.02.00121")
                //    //{

                //    //    SqlCommand cmd2 = new SqlCommand("select Price_Ozer from Product where Code='" + dr["UrunKodu"].ToString() + "'", con2);
                //    //    SqlDataReader dr2 = cmd2.ExecuteReader();
                //    //    while (dr2.Read())
                //    //    {
                //    //        if (Convert.ToDouble(dr["UrunFiyat"]) != Convert.ToDouble(dr2["Price_Ozer"]))
                //    //        {
                //    //            sayac = sayac + 1;
                //    //        }
                //    //    }
                //    //}
                //    //else
                //    //{

                //    //    SqlCommand cmd2 = new SqlCommand("select Price from Product where Code='" + dr["UrunKodu"].ToString() + "'", con2);
                //    //    SqlDataReader dr2 = cmd2.ExecuteReader();
                //    //    while (dr2.Read())
                //    //    {
                //    //        if (Convert.ToDouble(dr["UrunFiyat"]) != Convert.ToDouble(dr2["Price"]))
                //    //        {
                //    //            sayac = sayac + 1;
                //    //        }
                //    //    }
                //    //}
                //    //if (sayac != 0)
                //    //{
                //    //    Response.Redirect("OperationCommercialInvoice.aspx");
                //    //}

                //}
                con2.Close();
                if (!Page.IsPostBack)
                {
                    using (SqlConnection con = new SqlConnection(strcon))
                    {
                        con.Open();
                        SqlCommand baslikdetaycek = new SqlCommand("select c.Cari as CARİADI ,c.Adres1 as ADRES1,c.Adres2 as ADRES2,c.VergiNo as VERGINO,c.Telno1,c.IlgiliKisi,c.Fax as FAX,c.Mail as EMAIL,c.WebSite as WEBSITE  from CustomerAddress c left outer join Orders o on c.CariKodu=o.MusteriKodu where c.TeklifNo='" + Request.QueryString["teklifno"] + "' group by c.Cari, c.Cari ,c.Adres1,c.Adres2 ,c.VergiNo,c.Telno1,c.IlgiliKisi,c.Fax,c.Mail ,c.WebSite,c.TeklifNo", con);
                        baslikdetaycek.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
                        SqlDataReader baslikdetayoku = baslikdetaycek.ExecuteReader();
                        while (baslikdetayoku.Read())
                        {
                            txtAdres1.Text = baslikdetayoku["ADRES1"].ToString();
                            txtAdres2.Text = baslikdetayoku["ADRES2"].ToString();
                            txtEmail.Text = baslikdetayoku["EMAIL"].ToString();
                            //txtFax.Text = baslikdetayoku["FAX"].ToString();
                            txtWebSite.Text = baslikdetayoku["WEBSITE"].ToString();
                            txtTelNo1.Text = baslikdetayoku["TelNo1"].ToString();
                            txtResponsiblePerson.Text = baslikdetayoku["IlgiliKisi"].ToString();




                        }

                        baslikdetayoku.Close();

                        SqlCommand taxidtextcek = new SqlCommand("select TaxId_Text from CustomerAddress where TeklifNo='" + Request.QueryString["teklifno"] + "' union all select  HeadText from OperationDocumentsHeads where HeadText <> (select TaxId_Text from CustomerAddress where TeklifNo='" + Request.QueryString["teklifno"] + "')", con);
                        SqlDataAdapter da = new SqlDataAdapter();
                        da.SelectCommand = taxidtextcek;
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        drp1.DataSource = dt;
                        drp1.DataTextField = "TaxId_Text";
                        drp1.DataValueField = "TaxId_Text";
                        drp1.DataBind();


                        SqlCommand telnotextcek = new SqlCommand("select TelNo_Text from CustomerAddress where TeklifNo='" + Request.QueryString["teklifno"] + "' union all select  HeadText from OperationDocumentsHeads where HeadText <> (select TelNo_Text from CustomerAddress where TeklifNo='" + Request.QueryString["teklifno"] + "')", con);
                        SqlDataAdapter da2 = new SqlDataAdapter();
                        da2.SelectCommand = telnotextcek;
                        DataTable dt2 = new DataTable();
                        da2.Fill(dt2);

                        drp2.DataSource = dt2;
                        drp2.DataTextField = "TelNo_Text";
                        drp2.DataValueField = "TelNo_Text";
                        drp2.DataBind();



                        SqlCommand ilgilikisicek = new SqlCommand("select ResponsinblePerson_Text from CustomerAddress where TeklifNo='" + Request.QueryString["teklifno"] + "' union all select  HeadText from OperationDocumentsHeads where HeadText <> (select ResponsinblePerson_Text from CustomerAddress where TeklifNo='" + Request.QueryString["teklifno"] + "')", con);
                        SqlDataAdapter da3 = new SqlDataAdapter();
                        da3.SelectCommand = ilgilikisicek;
                        DataTable dt3 = new DataTable();
                        da3.Fill(dt3);
                        drp5.DataSource = dt3;


                        drp5.DataTextField = "ResponsinblePerson_Text";
                        drp5.DataValueField = "ResponsinblePerson_Text";
                        drp5.DataBind();











                        SqlCommand mailTextCek = new SqlCommand("select Mail_Text from CustomerAddress where TeklifNo='" + Request.QueryString["teklifno"] + "' union all select  HeadText from OperationDocumentsHeads where HeadText <> (select Mail_Text from CustomerAddress where TeklifNo='" + Request.QueryString["teklifno"] + "')", con);
                        SqlDataAdapter da5 = new SqlDataAdapter();
                        da5.SelectCommand = mailTextCek;
                        DataTable dt5 = new DataTable();
                        da5.Fill(dt5);
                        drp3.DataSource = dt5;
                        drp3.DataTextField = "Mail_Text";
                        drp3.DataValueField = "Mail_Text";
                        drp3.DataBind();


                        SqlCommand webTextCek = new SqlCommand("select WebSite_Text from CustomerAddress where TeklifNo='" + Request.QueryString["teklifno"] + "' union all select  HeadText from OperationDocumentsHeads where HeadText <> (select WebSite_Text from CustomerAddress where TeklifNo='" + Request.QueryString["teklifno"] + "')", con);
                        SqlDataAdapter da6 = new SqlDataAdapter();
                        da6.SelectCommand = webTextCek;
                        DataTable dt6 = new DataTable();
                        da6.Fill(dt6);
                        drp4.DataSource = dt6;
                        drp4.DataTextField = "WebSite_Text";
                        drp4.DataValueField = "WebSite_Text";
                        drp4.DataBind();


                        SqlCommand h = new SqlCommand("select *from HSCODES order by Id desc", con);
                        SqlDataAdapter dah = new SqlDataAdapter();
                        dah.SelectCommand = h;
                        DataTable dtt = new DataTable();
                        dah.Fill(dtt);
                        drpHSCode.DataSource = dtt;
                        drpHSCode.DataValueField = "Id";
                        drpHSCode.DataTextField = "Code";
                        drpHSCode.DataBind();


                        drpHSCode2.DataSource = dtt;
                        drpHSCode2.DataValueField = "Id";
                        drpHSCode2.DataTextField = "Code";
                        drpHSCode2.DataBind();


                        drpHSCode3.DataSource = dtt;
                        drpHSCode3.DataValueField = "Id";
                        drpHSCode3.DataTextField = "Code";
                        drpHSCode3.DataBind();

                        drpHSCode4.DataSource = dtt;
                        drpHSCode4.DataValueField = "Id";
                        drpHSCode4.DataTextField = "Code";
                        drpHSCode4.DataBind();
                        baslikdetayoku.Close();
                        con.Close();
                    }
                }
            }
        }
        protected void btnCari_Click(object sender, EventArgs e)
        {
            if (db.CariBilgileriGuncelle(txtAdres1.Text, txtAdres2.Text, txtVergiNo.Text, txtTelNo1.Text, txtResponsiblePerson.Text, "", txtEmail.Text, txtWebSite.Text, Convert.ToString(Request.QueryString["teklifno"])) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "successCari()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "errorCari()", true);
            }
        }
        protected void btn_Click(object sender, EventArgs e)
        {
            if (txtFaturaNo.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "InvoiceNo()", true);
            }
            if (txtFaturaTarihi.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "InvoiceDate()", true);
            }
            else
            {
                if (db.EditSalesDocument2(Convert.ToString(Request.QueryString["teklifno"]), Convert.ToString(txtFaturaNo.Text), Convert.ToDateTime(txtFaturaTarihi.Text), 1) == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "successAlert()", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "errorAlert()", true);
                }
            }

        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            if (txtPO.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "PO()", true);
            }
            else
            {
                if (db.EditPO_2(Convert.ToString(Request.QueryString["teklifno"]), Convert.ToString(txtPO.Text)) == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "successAlert()", true);
                }
            }

        }

        protected void btnMoneyText_Click(object sender, EventArgs e)
        {
            if (txtMoneyText.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "MoneyText()", true);
            }
            else
            {
                if (db.MoneyTextUpdate(Convert.ToString(Request.QueryString["teklifno"]), Convert.ToString(txtMoneyText.Text)) == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "successAlert()", true);
                }
            }

        }

        protected void btnPDF2_Click(object sender, EventArgs e)
        {
            string[] bilgiler = new string[4];
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select OperationInvoice,OperationInvoiceDate,PO,MoneyText  from AllOperationDocuments where TeklifNo=@p1", con);
                cmd.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    bilgiler[0] = dr["OperationInvoice"].ToString();
                    bilgiler[1] = dr["OperationInvoiceDate"].ToString();
                    bilgiler[2] = dr["PO"].ToString();
                    bilgiler[3] = dr["MoneyText"].ToString();
                }
                SqlConnection.ClearPool(con);
                dr.Close();
                con.Close();
            }
            //if (bilgiler[0] == null || bilgiler[0] == "")
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "", "InvoiceNo()", true);
            //}
            //if (bilgiler[1] == null || bilgiler[1] == "")
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "", "InvoiceDate()", true);
            //}
            //if (bilgiler[2] == null || bilgiler[2] == "")
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "", "PO()", true);
            //}
            if (bilgiler[3] == null || bilgiler[3] == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "MoneyText()", true);
            }
            else
            {

                pnl1.Visible = false;
                pnl2.Visible = false;
                ClientScript.RegisterStartupScript(this.GetType(), "", "printDiv()", true);
                pnl1.Visible = false;
                pnl2.Visible = false;

            }
        }
        protected void btnPONoteUpdate_Click(object sender, EventArgs e)
        {
            if (db.UpdatePurchaseOrder(Request.QueryString["teklifno"], txtUpdateSpecialNote.Text) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "UpdatePOSuccess()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "UpdatePOError()", true);
            }
        }
        protected void btnSpecialNoteUpdate_Click(object sender, EventArgs e)
        {
            if (db.UpdateCommercialNote(Request.QueryString["teklifno"], txtUpdateSpecialNote.Text) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "UpdatePOSuccess()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "UpdatePOError()", true);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (db.EkipmanGuncelle(Request.QueryString["teklifno"], drpEkipman.SelectedItem.Text) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "UpdateEkipmanSuccess()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "UpdateEkipmanError()", true);
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (db.HESCode(Request.QueryString["teklifno"], drpHSCode.SelectedItem.Text, drpHSCode2.SelectedItem.Text, drpHSCode3.SelectedItem.Text, drpHSCode4.SelectedItem.Text) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "UpdateHSSuccess()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "UpdateHSError()", true);
            }
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            if (db.TAxIddegis(drp1.SelectedItem.Text, Request.QueryString["teklifno"]) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "Baslik()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "BaslikError()", true);
            }

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            if (db.TelNodegis(drp2.SelectedItem.Text, Request.QueryString["teklifno"]) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "Baslik()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "BaslikError()", true);
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            if (db.Maildegis(drp3.SelectedItem.Text, Request.QueryString["teklifno"]) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "Baslik()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "BaslikError()", true);

            }
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            if (db.WebSitedegis(drp4.SelectedItem.Text, Request.QueryString["teklifno"]) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "Baslik()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "BaslikError()", true);

            }
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            if (db.ResponsiblePersondegis(drp5.SelectedItem.Text, Request.QueryString["teklifno"]) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "Baslik()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "BaslikError()", true);

            }
        }

        protected void btnPacking_Click(object sender, EventArgs e)
        {
            if (db.CreatePackingList(Request.QueryString["teklifno"], Convert.ToInt32(UserData.Id)) == 1)
            {
                Response.Redirect("PckingListOperation.aspx?teklifno=" + Request.QueryString["teklifno"] + "");
            }
        }
        protected void Button9_Click(object sender, EventArgs e)
        {
            if (db.BankaGuncelle(Request.QueryString["teklifno"], Convert.ToInt32(Request.Form["bank"])) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "Banka()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "BankaError()", true);
            }
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            if (db.TeklifTipiAciklama(Request.QueryString["teklifno"], txtTeklifTipiAciklama.Text) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "successTeklifTipi()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "errorTeklifTipi()", true);
            }
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            if (db.OdemeTipiGuncelle(Convert.ToString(Request.Form["odemetipi"]), Request.QueryString["teklifno"]) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "paymentSuccess()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "paymentError()", true);
            }
        }

        protected void Button12_Click(object sender, EventArgs e)
        {
            if (db.VarisLimaniGuncelle(Request.QueryString["teklifno"], txtVarisLimani.Text) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "varisSuccess()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "varisError()", true);
            }
        }
    }
}