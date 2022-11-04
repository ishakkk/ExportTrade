using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class SaticiMusteriRaporlama : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            //e.Command.Parameters["@satici"].Value = Request.QueryString["id"];
            e.Command.Parameters["@baslangic"].Value = Session["saticibaslangic"];
            e.Command.Parameters["@bitis"].Value = Session["saticibitis"];
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            ASPxGridView1.Columns["TorbaTipi"].Caption = "TORBA" + "\n" + "TİPİ";
            ASPxGridView1.Columns["TorbaAgirligi"].Caption = "TORBA" + "\n" + "AĞIRLIĞI";
            ASPxGridView1.Columns["BBTipi"].Caption = "BB" + "\n" + "TİPİ";
            ASPxGridView1.Columns["BBAgirligi"].Caption = "BB" + "\n" + "AĞIRLIĞI";
            ASPxGridView1.Columns["TeklifTipi"].Caption = "TESLİM" + "\n" + "ŞEKLİ";
            ASPxGridView1.Columns["SATISFIYATI"].Caption = "SATIŞ" + "\n" + "FİYATI($)";
            ASPxGridView1.Columns["URUNFIYAT"].Caption = "ÜRÜN" + "\n" + "SADE" + "\n" + "MALİYETİ($)";
            ASPxGridView1.Columns["ARANAKLIYE"].Caption = "ARA" + "\n" + "NAKLİYE($)";
            ASPxGridView1.Columns["ARMATORLOKALI"].Caption = "ARMATÖR" + "\n" + "LOKALİ($)";
            ASPxGridView1.Columns["LIMANDOLUM"].Caption = "LİMAN" + "\n" + "DOLUM" + "\n" + "BEDELİ($)";
            ASPxGridView1.Columns["KarOrani"].Caption = "KAR" + "\n" + "ORANI(%)";
            ASPxGridView1.Columns["UrunAnaGrup"].Caption = "ÜRÜN ANA" + "\n" + "SINIFI";
            ASPxGridViewExporter1.WriteXlsToResponse("Satıcı_Müşteri_Raporlama" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString());
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            try
            {
                if (e.DataColumn.FieldName == "KarOrani")
                {
                    if (Convert.ToDouble(e.GetValue("KarOrani").ToString()) >= 0.10)
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;
                        //e.Cell.BackColor = Color.Green;
                        //e.Cell.ForeColor = Color.Black;
                    }
                    else if (Convert.ToDouble(e.GetValue("KarOrani").ToString()) < 0)
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;
                        //e.Cell.ForeColor = Color.White;
                    }
                    else if (Convert.ToDouble(e.GetValue("KarOrani").ToString()) >= 0 && Convert.ToDouble(e.GetValue("KarOrani").ToString()) < 0.10)
                    {
                        e.Cell.BackColor = Color.Orange;
                        e.Cell.ForeColor = Color.Black;
                    }
                }
            }
            catch
            {

            }
        }
    }
}