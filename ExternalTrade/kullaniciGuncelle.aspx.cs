using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade
{
    public partial class kullaniciGuncelle : System.Web.UI.Page
    {
        DbConnection con = new DbConnection();
        DBIslemler db = new DBIslemler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (UserData.Authority != "SuperAdmın")
                {
                    Response.Redirect("Home.aspx");
                }
                else
                {
                    SqlCommand cmd = new SqlCommand("select distinct Authority from Users", con.baglanti());
                    SqlDataReader dr2 = cmd.ExecuteReader();
                    drpYetki.DataSource = dr2;
                    drpYetki.DataValueField = "Authority";
                    drpYetki.DataTextField = "Authority";
                    drpYetki.DataBind();
                    dr2.Close();
                    int PersonelId = Convert.ToInt32(Request.QueryString["Kullanici"]);
                    if (Page.IsPostBack == false)
                    {
                        SqlCommand kisicek = new SqlCommand("select *from Users where Id=@p1", con.baglanti());
                        kisicek.Parameters.AddWithValue("@p1", PersonelId);
                        SqlDataReader dr = kisicek.ExecuteReader();
                        while (dr.Read())
                        {
                            txtAdi.Text = dr["Name"].ToString();
                            txtSoyadi.Text = dr["SurName"].ToString();
                            txtKullaniciAdi.Text = dr["UserName"].ToString();
                            txtSifre.Text = dr["Password"].ToString();
                            txtMail.Text = dr["Email"].ToString();
                            //drpYetki.SelectedItem.Text = dr["Authority"].ToString();
                        }
                    }
                }
            }
            SqlConnection.ClearPool(con.baglanti());

        }

        protected void BtnProfil_Click(object sender, EventArgs e)
        {
            int PersonelId = Convert.ToInt32(Request.QueryString["Kullanici"]);
            if (UserData.UserName == txtKullaniciAdi.Text && UserData.Password == txtSifre.Text && UserData.Name == txtAdi.Text && UserData.SurName == txtSoyadi.Text && UserData.Email == txtMail.Text && UserData.Authority == "SuperAdmın")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "warningAlert()", true);
            }
            else if (db.KullaniciGuncelle(PersonelId, txtKullaniciAdi.Text, txtSifre.Text, txtAdi.Text, txtSoyadi.Text, Convert.ToString(drpYetki.SelectedItem.Text), txtMail.Text, Convert.ToString(drpAktiflik.Text)) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "successAlert()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "errorAlert()", true);
            }
        }
    }
}