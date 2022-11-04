using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade
{
    public partial class popup : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string teklifno;


            SqlConnection con = new SqlConnection(strcon);
            con.Open();
            SqlCommand cmd = new SqlCommand("select TOP 1 TeklifNo from Sepet where TemsilciKullaniciAdi='" + UserData.Id + "' order by Id desc", con);

            teklifno = Convert.ToString(cmd.ExecuteScalar());
            con.Close();
            string text = UserData.Name + " " + UserData.SurName + " " + teklifno + " " + "Numaralı Yeni Teklif Gönderdi";
            string konum = "Teklifler.aspx?islem=okundu";
            if (db.DoldurBosalt(text, konum) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@temsilci"].Value = Convert.ToString(UserData.Name + " " + UserData.SurName);
        }
    }
}