using ExternalTrade.Classes;
using QRCoder;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class Proforma : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
        protected void Page_Load(object sender, EventArgs e)
        {
            if (UserData.Authority == "User")
                Response.Redirect("/Home.aspx");
            if (Request.QueryString["teklifno"] == null)
                Response.Redirect("Admin.aspx");
            else
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    string[] bb = new string[2];
                    SqlCommand cmd = new SqlCommand("select ProformaSalesEdit from AllOperationDocuments where TeklifNo=@p1", con);
                    cmd.Parameters.AddWithValue("@p1", Convert.ToString(Request.QueryString["teklifno"]));
                    int edit = Convert.ToInt32(cmd.ExecuteScalar());
                    Session["edit"] = edit;
                    SqlCommand proformaonayi = new SqlCommand("select a.ProformaOnayi,o.Company from AllOperationDocuments a left outer join Orders o on a.TeklifNo=o.TeklifNo where a.TeklifNo='" + Request.QueryString["teklifno"] + "'", con);
                    SqlDataReader dr = proformaonayi.ExecuteReader();
                    while (dr.Read())
                    {
                        bb[0] = dr["ProformaOnayi"].ToString();
                        bb[1] = dr["Company"].ToString();
                    }
                    dr.Close();

                    if (Convert.ToInt32(bb[0]) == 2)
                    {

                        if (bb[1] == "NİĞTAŞ")
                        {
                            Image1.ImageUrl = "/imzakase/nigtaskase.png";
                            // Image3.ImageUrl = "/imzakase/nigtaskase.png";
                            Image5.ImageUrl = "/imzakase/nigtaskase.png";

                        }
                        else if (bb[1] == "MİKROKAL")
                        {
                            Image1.ImageUrl = "/imzakase/mikrokalkase.png";
                            //Image3.ImageUrl = "/imzakase/mikrokalkase.png";
                            Image5.ImageUrl = "/imzakase/mikrokalkase.png";
                        }
                        else if (bb[1] == "ASKAL")
                        {
                            Image1.ImageUrl = "/imzakase/askalkase.png";
                            //Image3.ImageUrl = "/imzakase/askalkase.png";
                            Image5.ImageUrl = "/imzakase/askalkase.png";
                        }

                    } SqlConnection.ClearPool(con);
                    con.Close();
                }
                using (MemoryStream ms = new MemoryStream())
                {
                    QRCodeGenerator koduret = new QRCodeGenerator();
                    QRCodeGenerator.QRCode kod = koduret.CreateQrCode("https://www.nigtas.com/", QRCodeGenerator.ECCLevel.Q);
                    using (Bitmap bmp = kod.GetGraphic(5))
                    {
                        bmp.Save(ms, ImageFormat.Png);
                        img_yeri.ImageUrl = "data:imge/png;base64," + Convert.ToBase64String(ms.ToArray());
                        //Image2.ImageUrl = "data:imge/png;base64," + Convert.ToBase64String(ms.ToArray());
                        Image4.ImageUrl = "data:imge/png;base64," + Convert.ToBase64String(ms.ToArray());
                    }
                }

            }
        }
        protected void btnMoneyText_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["Edit"]) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "warningAlert()", true);
            }
            else
            {
                if (txtMoneyText.Text == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "MoneyText()", true);
                }
                else
                {
                    if (db.MoneyTextUpdate(Request.QueryString["teklifno"], Convert.ToString(txtMoneyText.Text)) == 1)
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
        protected void btnPrintDiv_Click(object sender, EventArgs e)
        {
            string[] bilgiler = new string[4];
            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select ProformaInvoiceNo,ProformaInvoiceDate,PO,MoneyText  from AllOperationDocuments where TeklifNo=@p1", con);
                cmd.Parameters.AddWithValue("@p1", Request.QueryString["teklifno"]);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    bilgiler[0] = dr["ProformaInvoiceNo"].ToString();
                    bilgiler[1] = dr["ProformaInvoiceDate"].ToString();
                    bilgiler[2] = dr["PO"].ToString();
                    bilgiler[3] = dr["MoneyText"].ToString();
                }
                SqlConnection.ClearPool(con);
                dr.Close();
                con.Close();
            }
            if (bilgiler[0] == null || bilgiler[0] == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "InvoiceNo()", true);
            }
            if (bilgiler[1] == null || bilgiler[1] == "")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "InvoiceDate()", true);
            }
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
                if (db.SaveProforma(Convert.ToString(Request.QueryString["teklifno"]), Convert.ToInt32(UserData.Id)) == 1)
                {
                    pnl1.Visible = false;
                    PANEL.Visible = false;
                    ClientScript.RegisterStartupScript(this.GetType(), "", "printDiv()", true);
                    pnl1.Visible = false;
                    PANEL.Visible = false;
                }
            }

        }

        protected void btnCari_Click(object sender, EventArgs e)
        {
            //if (db.CariBilgileriGuncelle(txtAdres1.Text, txtAdres2.Text, txtVergiNo.Text, txtTelNo1.Text, txtResponsiblePerson.Text, txtFax.Text, txtEmail.Text, txtWebSite.Text, Convert.ToString(Request.QueryString["teklifno"])) == 1)
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "", "successCari()", true);
            //}
            //else
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "", "errorCari()", true);
            //}
        }

        protected void btnProformaDate_No_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["Edit"]) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "warningAlert()", true);
            }
            else
            {
                if (txtProformaNo.Text == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "InvoiceNo()", true);
                }
                if (txtProformaDate.Text == "")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "InvoiceDate()", true);
                }
                else
                {
                    if (db.EditSalesDocument(Convert.ToString(Request.QueryString["teklifno"]), Convert.ToDateTime(txtProformaDate.Text), 1) == 1)
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

        protected void btnSpecialNoteUpdate_Click(object sender, EventArgs e)
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (db.ProformaOnayla(Convert.ToString(Request.QueryString["teklifno"]), Convert.ToInt32(UserData.Id)) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "OnayaGitti()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "OnayaGitmedi()", true);
            }
        }
    }
}