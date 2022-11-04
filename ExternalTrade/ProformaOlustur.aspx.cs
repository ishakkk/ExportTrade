using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade
{
    public partial class ProformaOlustur : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        DbConnection con = new DbConnection();
        DBLogoConnection logo = new DBLogoConnection();
        string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
        protected void Page_Load(object sender, EventArgs e)
        {
            if (UserData.Authority == "SuperAdmin" || UserData.Authority == "SuperAdmın" || UserData.Authority == "Operation")
            {
                Response.Redirect("Home.aspx");
            }
            if (!Page.IsPostBack)
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select *from Payment order by Id desc", con);
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    drpPayment.DataSource = dt;
                    drpPayment.DataValueField = "PaymentTerms";
                    drpPayment.DataTextField = "PaymentTerms";
                    drpPayment.DataBind();
                    SqlConnection.ClearPool(con);
                    con.Close();
                }
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@temsilci"].Value = Convert.ToInt32(UserData.Id);
        }
        protected void btnRapor_Click(object sender, EventArgs e)
        {
            string teklifno;
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                teklifno = Convert.ToString(teklif_no[0]);

                Response.Redirect("ProformaOlusturDetay.aspx?teklifno=" + teklifno + "");


            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }

        protected void btn1_Click(object sender, EventArgs e)
        {
            string teklifno;
            double[] kur = new double[3];
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                teklifno = Convert.ToString(teklif_no[0]);
                if (db.EditPO(teklifno, Convert.ToString(txtPO.Text), Convert.ToInt32(Request.Form["bank"])) == 1)
                {
                    SqlCommand orderdata = new SqlCommand("select distinct ISNULL(USDKUR,0) as USDKUR,ISNULL(EUROKUR,0) as EUROKUR,ISNULL(Parite,0) as Parite from Orders where TeklifNo='" + teklifno + "'", con.baglanti());
                    SqlDataReader dr = orderdata.ExecuteReader();
                    while (dr.Read())
                    {
                        kur[0] = Convert.ToDouble(dr["Parite"]);
                        kur[1] = Convert.ToDouble(dr["USDKUR"]);
                        kur[2] = Convert.ToDouble(dr["EUROKUR"]);
                    }
                    if (kur[0] == 0)
                    {
                        SqlCommand USDKUR = new SqlCommand("SET dateformat DMY select dbo.DOVIZKURU_GETIR(1,GETDATE())", logo.LogoConnection());
                        SqlCommand EUROKURCEK = new SqlCommand("SET dateformat DMY select dbo.DOVIZKURU_GETIR(20,GETDATE())", logo.LogoConnection());
                        kur[1] = Convert.ToDouble(USDKUR.ExecuteScalar());
                        kur[2] = Convert.ToDouble(EUROKURCEK.ExecuteScalar());
                    }


                    SqlCommand paritekontrol = new SqlCommand("PariteKontrol", con.baglanti());
                    paritekontrol.Parameters.AddWithValue("@TeklifNo", teklifno);
                    paritekontrol.Parameters.AddWithValue("@USDKUR", kur[1]);
                    paritekontrol.Parameters.AddWithValue("@EUROKUR", kur[2]);

                    paritekontrol.Parameters.AddWithValue("@FobVisible", Convert.ToBoolean(Request.Form["fob"]));
                    paritekontrol.Parameters.AddWithValue("@Company", Convert.ToString(Request.Form["sirket"]));
                    paritekontrol.Parameters.AddWithValue("@Parabirimi", Convert.ToString(Request.Form["para"]));
                    paritekontrol.Parameters.AddWithValue("@payment", Convert.ToString(drpPayment.SelectedItem.Text));
                    paritekontrol.Parameters.AddWithValue("@contactperson", Convert.ToString(txtContactPerson.Text));
                    paritekontrol.CommandType = CommandType.StoredProcedure;
                    paritekontrol.ExecuteNonQuery();
                    con.baglanti().Close();
                    if (!Directory.Exists(Server.MapPath("~/OperationDocuments/" + teklifno + "")))
                    {
                        Directory.CreateDirectory(Server.MapPath("~/OperationDocuments/" + teklifno + ""));
                    }
                    SqlCommand cmd = new SqlCommand("CariKontrol", con.baglanti());
                    cmd.Parameters.AddWithValue("@TeklifNo", teklifno);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.ExecuteNonQuery();
                    if (db.ProformaNoOlustur(teklifno) == 1)
                    {
                        Response.Redirect("Proforma.aspx?teklifno=" + teklifno + "");
                    }

                }
                else
                {

                }

            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }

       
    }
}