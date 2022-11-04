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
    public partial class OnayBekleyenTekliflerDetay : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
        protected void Page_Load(object sender, EventArgs e)
        {
            string islem = Request.QueryString["islem"];
            if (islem == "okundu")
            {
                if (UserData.Authority != "SuperAdmın")
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    db.BildirimOkundu(id);
                }

            }
        }


        protected void btnRapor_Click(object sender, EventArgs e)
        {
            ASPxGridView1.Columns["SigortaTON"].Visible = false;
            ASPxGridViewExporter1.WriteXlsxToResponse("Teklif_Listesi_" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString());
            ASPxGridView1.Columns["SigortaTON"].Visible = true;
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@Durum"].Value = "ONAY BEKLIYOR";
            e.Command.Parameters["@teklifno"].Value = Request.QueryString["teklifno"];

        }
        //protected void btnTekOnay_Click(object sender, EventArgs e)
        //{
        //    string teklifno;
        //    string metin;
        //    try
        //    {
        //        if (ASPxGridView1.VisibleRowCount == 1)
        //        {
        //            ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);
        //        }
        //        int id;
        //        var kayit_id = ASPxGridView1.GetSelectedFieldValues("Id");
        //        id = Convert.ToInt32(kayit_id[0]);
        //        using (SqlConnection con = new SqlConnection(strcon))
        //        {
        //            con.Open();
        //            SqlCommand teklifnocek = new SqlCommand("select TeklifNo from Orders where Id=@p1", con);
        //            teklifnocek.Parameters.AddWithValue("@p1", id);
        //            teklifno = Convert.ToString(teklifnocek.ExecuteScalar());
        //            metin = UserData.Name + " " + UserData.SurName + " " + teklifno + "Numaralı Teklif İçin Satış Onayı İstiyor";
        //            SqlCommand kayitcek = new SqlCommand("select *from Orders where Id=@p1", con);
        //            kayitcek.Parameters.AddWithValue("@p1", id);
        //            string durum = "";

        //            SqlDataReader dr = kayitcek.ExecuteReader();
        //            while (dr.Read())
        //            {
        //                durum = dr["Durum"].ToString();

        //                if (durum == "SATISA DONDU")
        //                {
        //                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "warningAlert2()", true);
        //                }
        //                else if (durum == "ONAYLANDI")
        //                {

        //                    if (db.satisOnayiGonder(id, teklifno, metin) == 1)
        //                    {
        //                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
        //                    }
        //                    else
        //                    {
        //                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
        //                    }
        //                }
        //                else
        //                {
        //                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "warningAlert()", true);
        //                }
        //            }
        //            dr.Close();
        //            con.Close();
        //        }
        //    }
        //    catch
        //    {
        //        ClientScript.RegisterStartupScript(this.GetType(),"randomtext","sec()",true);
        //    }

        //}

        protected void btnAciklama_Click(object sender, EventArgs e)
        {
            string teklifno;
            string metin;
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1)
                {
                    ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);
                }
                int id;
                var kayit_id = ASPxGridView1.GetSelectedFieldValues("Id");
                id = Convert.ToInt32(kayit_id[0]);
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand teklifnocek = new SqlCommand("select TeklifNo from Orders where Id=@p1", con);
                    teklifnocek.Parameters.AddWithValue("@p1", id);
                    teklifno = Convert.ToString(teklifnocek.ExecuteScalar());
                    metin = UserData.Name + " " + UserData.SurName + " " + teklifno + "Numaralı Teklife Açıklama Girdi";
                    string konum = "Teklifler.aspx?islem=okundu";
                    con.Close();

                    if (db.UserAciklamaEkle(Convert.ToString(txtAcikalam.Text), id, metin, konum) == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "explanationSuccess()", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "explanationError()", true);
                    }

                }
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }

        protected void btnUrunKodu_Click(object sender, EventArgs e)
        {

            try
            {
                if (ASPxGridView1.VisibleRowCount == 1)
                {
                    ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);
                }
                int id;
                var kayit_id = ASPxGridView1.GetSelectedFieldValues("Id");
                id = Convert.ToInt32(kayit_id[0]);



                if (db.YediyuzluKodGir(id, Convert.ToString(txturunkodu.Text)) == 1)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "codeSuccess()", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "codeError()", true);
                }


            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }
        
    }
}