using ExternalTrade.Classes;
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
    public partial class KonsimentoOperation : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Timeout = 90000;
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
                }
            }
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
                    //Müşteri
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


                    //Notify


                    SqlCommand notifyRutcek = new SqlCommand("select NotifiyRut_Text from AllOperationDocuments where TeklifNo='" + Request.QueryString["teklifno"] + "' union all select  HeadText from OperationDocumentsHeads where HeadText <> (select NotifiyRut_Text from AllOperationDocuments where TeklifNo='" + Request.QueryString["teklifno"] + "')", con);
                    SqlDataAdapter n1 = new SqlDataAdapter();
                    n1.SelectCommand = notifyRutcek;
                    DataTable not1 = new DataTable();
                    n1.Fill(not1);
                    drpNotifyRut_Text.DataSource = not1;
                    drpNotifyRut_Text.DataTextField = "NotifiyRut_Text";
                    drpNotifyRut_Text.DataValueField = "NotifiyRut_Text";
                    drpNotifyRut_Text.DataBind();


                    SqlCommand notifyRutcek2 = new SqlCommand("select NotifiyTelNo_Text from AllOperationDocuments where TeklifNo='" + Request.QueryString["teklifno"] + "' union all select  HeadText from OperationDocumentsHeads where HeadText <> (select NotifiyTelNo_Text from AllOperationDocuments where TeklifNo='" + Request.QueryString["teklifno"] + "')", con);
                    SqlDataAdapter n2 = new SqlDataAdapter();
                    n2.SelectCommand = notifyRutcek2;
                    DataTable not2 = new DataTable();
                    n2.Fill(not2);

                    drpNotifyTelNo.DataSource = not2;
                    drpNotifyTelNo.DataTextField = "NotifiyTelNo_Text";
                    drpNotifyTelNo.DataValueField = "NotifiyTelNo_Text";
                    drpNotifyTelNo.DataBind();



                    SqlCommand notifyRutcek3 = new SqlCommand("select NotifiyContact_Text from AllOperationDocuments where TeklifNo='" + Request.QueryString["teklifno"] + "' union all select  HeadText from OperationDocumentsHeads where HeadText <> (select NotifiyContact_Text from AllOperationDocuments where TeklifNo='" + Request.QueryString["teklifno"] + "')", con);
                    SqlDataAdapter n3 = new SqlDataAdapter();
                    n3.SelectCommand = notifyRutcek3;
                    DataTable not3 = new DataTable();
                    n3.Fill(not3);

                    drpNotifiyFax_Text.DataSource = not3;
                    drpNotifiyFax_Text.DataTextField = "NotifiyContact_Text";
                    drpNotifiyFax_Text.DataValueField = "NotifiyContact_Text";
                    drpNotifiyFax_Text.DataBind();



                    SqlCommand notifyRutcek4 = new SqlCommand("select NotifyMailAdress_Text from AllOperationDocuments where TeklifNo='" + Request.QueryString["teklifno"] + "' union all select  HeadText from OperationDocumentsHeads where HeadText <> (select NotifyMailAdress_Text from AllOperationDocuments where TeklifNo='" + Request.QueryString["teklifno"] + "')", con);
                    SqlDataAdapter n4 = new SqlDataAdapter();
                    n4.SelectCommand = notifyRutcek4;
                    DataTable not4 = new DataTable();
                    n4.Fill(not4);

                    drpNotifyMailAddress_Text.DataSource = not4;
                    drpNotifyMailAddress_Text.DataTextField = "NotifyMailAdress_Text";
                    drpNotifyMailAddress_Text.DataValueField = "NotifyMailAdress_Text";
                    drpNotifyMailAddress_Text.DataBind();


                    SqlCommand notifyRutcek5 = new SqlCommand("select NotifyWebSite_Text from AllOperationDocuments where TeklifNo='" + Request.QueryString["teklifno"] + "' union all select  HeadText from OperationDocumentsHeads where HeadText <> (select NotifyWebSite_Text from AllOperationDocuments where TeklifNo='" + Request.QueryString["teklifno"] + "')", con);
                    SqlDataAdapter n5 = new SqlDataAdapter();
                    n5.SelectCommand = notifyRutcek5;
                    DataTable not5 = new DataTable();
                    n5.Fill(not5);

                    drpNotifyWebSite_Text.DataSource = not5;
                    drpNotifyWebSite_Text.DataTextField = "NotifyWebSite_Text";
                    drpNotifyWebSite_Text.DataValueField = "NotifyWebSite_Text";
                    drpNotifyWebSite_Text.DataBind();



                    SqlCommand notifyRutcek6 = new SqlCommand("select NotifyResponsiblePerson_Text from AllOperationDocuments where TeklifNo='" + Request.QueryString["teklifno"] + "' union all select  HeadText from OperationDocumentsHeads where HeadText <> (select NotifyResponsiblePerson_Text from AllOperationDocuments where TeklifNo='" + Request.QueryString["teklifno"] + "')", con);
                    SqlDataAdapter n6 = new SqlDataAdapter();
                    n6.SelectCommand = notifyRutcek6;
                    DataTable not6 = new DataTable();
                    n6.Fill(not6);

                    drpNotifyResponsiblePerson_Text.DataSource = not6;
                    drpNotifyResponsiblePerson_Text.DataTextField = "NotifyResponsiblePerson_Text";
                    drpNotifyResponsiblePerson_Text.DataValueField = "NotifyResponsiblePerson_Text";
                    drpNotifyResponsiblePerson_Text.DataBind();


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

                    con.Close();
                }
            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            if (txtBooking.Text == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "booking()", true);
            }
            else
            {
                if (db.BookingEditing(Request.QueryString["teklifno"], Convert.ToString(txtBooking.Text), Convert.ToInt32(UserData.Id)) == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "successAlert()", true);
                }
            }

        }

        protected void btnKonsimento_Click(object sender, EventArgs e)
        {

            if (db.KonsimentoDuzenle(Request.QueryString["teklifno"], Convert.ToString(drpKonsimentoTipi.SelectedItem.Text)) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "successAlert()", true);
            }
        }

        protected void btnclean_Click(object sender, EventArgs e)
        {

            //if (db.CleanOnBoard(Convert.ToString(Request.QueryString["teklifno"]), Convert.ToString(drpClean.Text)) == 1)
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "", "successAlert()", true);
            //}
            //else
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "", "errorAlert()", true);
            //}
        }

        protected void btnMoneyText_Click(object sender, EventArgs e)
        {
            //if (db.HESCode(Convert.ToString(Request.QueryString["teklifno"]), Convert.ToString(txtHSCode.Text)) == 1)
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "", "successAlert()", true);
            //}
            //else
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "", "errorAlert()", true);
            //}
        }

        protected void btnPDF_Click(object sender, EventArgs e)
        {
            string[] bilgiler = new string[10];
            int bosfclsayisi = 0;
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select  ISNULL(CLEANONBOARD,'') as CLEANONBOARD ,ISNULL(HSCODE,'') as HSCODE,ISNULL(BOOKINGNUMBER,'') as BOOKINGNUMBER,ISNULL(KonsimentoEdit,'') as NotifyName , KonsimentoEdit from AllOperationDocuments where TeklifNo='" + Request.QueryString["teklifno"] + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    //bilgiler[0] = dr["CLEANONBOARD"].ToString();
                    bilgiler[1] = dr["HSCODE"].ToString();
                    bilgiler[2] = dr["BOOKINGNUMBER"].ToString();
                    bilgiler[3] = dr["KonsimentoEdit"].ToString();
                    bilgiler[4] = dr["NotifyName"].ToString();
                }
                dr.Close();
                SqlCommand cmd2 = new SqlCommand("select COUNT(FCLNO) from Orders where TeklifNo='" + Request.QueryString["teklifno"] + "' and FCLNO is null", con);
                bosfclsayisi = Convert.ToInt32(cmd2.ExecuteScalar());
                SqlConnection.ClearPool(con);

                con.Close();
                //if (bilgiler[0] == "")
                //{
                //    ClientScript.RegisterStartupScript(this.GetType(), "", "CleanOnBoard()", true);
                //}
                if (bilgiler[1] == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "HSCODE()", true);
                }
                if (bilgiler[2] == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "booking()", true);
                }
                if (bilgiler[3] == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "duzenleme()", true);
                }
                if (bosfclsayisi > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "FCLNO()", true);
                }
                if (bilgiler[4] == "" || bilgiler[4] == null)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "Not()", true);
                }
                else
                {
                    pnl1.Visible = false;
                    pnl2.Visible = false;
                    if (db.KonsimentoOlusturan(UserData.Id, Request.QueryString["teklifno"]) == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "printDiv()", true);
                    }

                    pnl1.Visible = false;
                    pnl2.Visible = false;
                }
            }
        }

        protected void btnKonsimentoSpecialNote_Click(object sender, EventArgs e)
        {
            if (db.UpdateKonsimentoSpecialNote(Request.QueryString["teklifno"], txtKonsimentoSpecialNote.Text) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "UpdatePOSuccess()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "UpdatePOError(", true);
            }
        }

        protected void btnFreeTime_Click(object sender, EventArgs e)
        {
            if (db.UpdateKonsimentoFreeTime(Request.QueryString["teklifno"], txtFreeTime.Text) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "UpdatePOSuccess()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "UpdatePOError(", true);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (chkAyni.Checked == false)
            {
                if (db.NotifiyUpdate(Request.QueryString["teklifno"], txtNotifyName.Text, txtNofifyAdres.Text, txtNotifyUlke.Text, txtNotifyRut.Text, txtNotifyTelNo.Text, txtNotifyFax.Text, txtNotifyMailAddress.Text, txtNotifyWebSite.Text, txtNotifyResponsiblePerson.Text, drpNotifyRut_Text.SelectedItem.Text, drpNotifyTelNo.SelectedItem.Text, drpNotifiyFax_Text.SelectedItem.Text, drpNotifyMailAddress_Text.SelectedItem.Text, drpNotifyWebSite_Text.SelectedItem.Text, drpNotifyResponsiblePerson_Text.SelectedItem.Text) == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "successNotify()", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "errorNotify()", true);
                }
            }
            else if (chkAyni.Checked == true)
            {
                if (db.NotifiyAyni(Request.QueryString["teklifno"]) == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "successNotify()", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "errorNotify()", true);
                }
            }

        }

        protected void Button3_Click(object sender, EventArgs e)
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

        protected void Button4_Click(object sender, EventArgs e)
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
        protected void Button41_Click(object sender, EventArgs e)
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

        protected void Button5_Click1(object sender, EventArgs e)
        {
            if (db.CariBilgileriGuncelle(txtAdres1.Text, txtAdres2.Text, txtVergiNo.Text, txtTelNo1.Text, txtResponsiblePerson.Text, "", txtEmail.Text, txtWebSite.Text, Request.QueryString["teklifno"]) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "cari()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "carierror()", true);
            }
        }
    }
}