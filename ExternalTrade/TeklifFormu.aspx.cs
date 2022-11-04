using ExternalTrade.Classes;
using QRCoder;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
namespace ExternalTrade
{
    public partial class TeklifFormu : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
        protected void Page_Load(object sender, EventArgs e)
        {
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
                    SqlCommand cmd = new SqlCommand("select distinct IletisimeGecilecekKisi,MüşteriEmail,MüşteriTelNo  from Orders where TeklifNo='" + Request.QueryString["teklifno"] + "'", con);
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    foreach (DataRow dr in dt.Rows)
                    {
                        txtContactEmail.Text = dr["MüşteriEmail"].ToString();
                        txtContactPerson.Text = dr["IletisimeGecilecekKisi"].ToString();
                        txtPhoneNumber.Text = dr["MüşteriTelNo"].ToString();
                    }
                    con.Close();
                }
            }
        }

        protected void btnMoneyText_Click(object sender, EventArgs e)
        {
            if (db.MoneyTextUpdate(Request.QueryString["teklifno"], Convert.ToString(txtMoneyText.Text)) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "MoneyText()", true);
            }
        }

        protected void btnPDF_Click(object sender, EventArgs e)
        {
            pnl1.Visible = false;
            pnl2.Visible = false;
            ClientScript.RegisterStartupScript(this.GetType(), "", "printDiv()", true);
            pnl1.Visible = false;
            pnl2.Visible = false;
        }

        protected void Button10_Click(object sender, EventArgs e)
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

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (db.VarisLimaniGuncelle(Request.QueryString["teklifno"],txtVarisLimani.Text) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "varisSuccess()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "varisError()", true);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (db.TeklifFormuConsigneGuncelle(Request.QueryString["teklifno"],txtContactPerson.Text,txtContactEmail.Text,txtPhoneNumber.Text) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "cSuccess()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "cSuccess()", true);
            }
        }
    }
}