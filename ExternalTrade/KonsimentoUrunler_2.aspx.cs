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
    public partial class KonsimentoUrunler_2 : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select o.YediyuzluKod ,mamul.NAME from Orders o left outer join DTBSSRVR.TIGERDB.dbo.[219_MAMULLER] mamul on o.YediyuzluKod=mamul.CODE where o.SPECODE='" + Request.QueryString["kod"] + "'", con);
                    //cmd.Parameters.AddWithValue("@p1", Request.QueryString["kod"]);
                    SqlDataReader dr = cmd.ExecuteReader();
                    drpUrun.DataSource = dr;
                    drpUrun.DataValueField = "YediyuzluKod";
                    drpUrun.DataTextField = "NAME";
                    drpUrun.DataBind();
                    dr.Close(); SqlConnection.ClearPool(con);
                    con.Close();
                }
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@kod"].Value = Convert.ToString(Request.QueryString["kod"]);
        }

        protected void btnKaydet_Click(object sender, EventArgs e)
        {
            double totalagirlik = 0;
            double[] urunagirlik = new double[2];
            using (SqlConnection con = new SqlConnection(strcon))
            {





                if (Request.Form["chk"] == "1")
                {
                    if (db.KonsimentoKonteyner2(Convert.ToString(drpUrun.SelectedItem.Value), Convert.ToString(Request.QueryString["kod"]), Convert.ToString(txtFCL.Text), Convert.ToDouble(txtTorbaSayisi.Text) * Convert.ToDouble(txtPaletTipi.Text), "Çoklu", txtSipNo.Text, Convert.ToInt32(txtTorbaSayisi.Text)) == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "successAlert()", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "errorAlert()", true);
                    }
                }

                else
                {
                    if (db.KonsimentoKonteyner2(Convert.ToString(drpUrun.SelectedItem.Value), Convert.ToString(Request.QueryString["kod"]), Convert.ToString(txtFCL.Text), Convert.ToDouble(txtPaletSayisi.Text) * Convert.ToDouble(txtPaletTipi.Text), "Çoklu", txtSipNo.Text, Convert.ToInt32(txtPaletSayisi.Text)) == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "successAlert()", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "errorAlert()", true);
                    }
                }
                //SqlConnection.ClearPool(con);
                con.Close();
            }
        } 
    }
}