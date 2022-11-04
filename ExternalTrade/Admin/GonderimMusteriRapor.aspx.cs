using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class GonderimMusteriRapor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

            e.Command.Parameters["@baslangic"].Value = Session["gonderimbaslangic"];
            e.Command.Parameters["@bitis"].Value = Session["gonderimbitis"];
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            ASPxGridView1.Columns["ToplamTonaj"].Caption = "TOPLAM" + "\n" + "TONAJ";
            ASPxGridView1.Columns["TeklifTipi"].Caption = "GÖNDERİM" + "\n" + "ŞEKLİ";
            ASPxGridView1.Columns["KarOrani"].Caption = "KAR" + "\n" + "ORANI(%)";
            ASPxGridViewExporter1.WriteXlsToResponse("Gonderim_Musteri_Raporlama_" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString());
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