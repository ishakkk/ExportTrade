using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class UrunRaporlama : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void btnCek_Click(object sender, EventArgs e)
        {
            //string yil, yil2, ay, ay2,metin,metin2;
            //int ayId=0, ayId2=0;
            //metin = txttar1.Text;
            //metin2 = txttar2.Text;
            //ay=metin.Substring(5);
            //ay=ay.Substring(0,2);
            //yil = metin.Substring(2, 3);
            //yil = yil.Substring(0, 3);
            //yil = yil.Replace("-", "");



            //ay2 = metin2.Substring(5);
            //ay2 = ay2.Substring(0,2);
            //yil2 = metin2.Substring(2, 3);
            //yil2 = yil2.Substring(0, 3);
            //yil2 = yil2.Replace("-", "");
            //switch (ay)
            //{
            //    case "01": ay = "Ocak"; ayId = 1; break;
            //    case "02": ay = "Şubat"; ayId = 2; break;
            //    case "03": ay = "Mart"; ayId = 3; break;
            //    case "04": ay = "Nisan"; ayId = 4; break;
            //    case "05": ay = "Mayıs"; ayId = 5; break;
            //    case "06": ay = "Haziran"; ayId = 6; break;
            //    case "07": ay = "Hemmuz"; ayId = 7; break;
            //    case "08": ay = "Ağustos"; ayId = 8; break;
            //    case "09": ay = "Eylül"; ayId = 9; break;
            //    case "10": ay = "Ekim"; ayId = 10; break;
            //    case "11": ay = "Kasım"; ayId = 11; break;
            //    case "12": ay = "Aralık"; ayId = 12; break;
            //}
            //switch (ay2)
            //{
            //    case "01": ay2 = "Ocak"; ayId2 = 1; break;
            //    case "02": ay2 = "Şubat"; ayId2 = 2; break;
            //    case "03": ay2 = "Mart"; ayId2 = 3; break;
            //    case "04": ay2 = "Nisan"; ayId2 = 4; break;
            //    case "05": ay2 = "Mayıs"; ayId2 = 5; break;
            //    case "06": ay2 = "Haziran"; ayId2 = 6; break;
            //    case "07": ay2 = "Hemmuz"; ayId2 = 7; break;
            //    case "08": ay2 = "Ağustos"; ayId2 = 8; break;
            //    case "09": ay2 = "Eylül"; ayId2 = 9; break;
            //    case "10": ay2 = "Ekim"; ayId2 = 10; break;
            //    case "11": ay2 = "Kasım"; ayId2 = 11; break;
            //    case "12": ay2 = "Aralık"; ayId2 = 12; break;
            //}
            //if (db.UrunRaporla(Convert.ToDateTime(txttar1.Text), Convert.ToDateTime(txttar2.Text), ay, ay2, ayId, ayId2) == 1)
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
            //}
            //else
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
            //}
            Session["urunbaslangic"] = txttar1.Text;
            Session["urunbitis"] = txttar2.Text;
            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {


        }
    }
}