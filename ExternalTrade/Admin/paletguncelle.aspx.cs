using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class paletguncelle : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
        protected void Page_Load(object sender, EventArgs e)
        {
            if (UserData.Authority != "SuperAdmın" && UserData.Authority != "Admin2")
                Response.Redirect("Admin.aspx");
            int id = Convert.ToInt32(Request.QueryString["Id"]);
            if (Page.IsPostBack == false)
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select *from Palette where Id='" + id + "'", con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        txtfiyat.Text = dr["Price"].ToString();


                    }
                    SqlConnection.ClearPool(con);
                    con.Close();
                }

                //SqlCommand cmd = new SqlCommand("select *from Palette where Id='" + id + "'", con.baglanti());
                //SqlDataReader dr = cmd.ExecuteReader();
                //while (dr.Read())
                //{
                //    txtfiyat.Text = dr["Price"].ToString();


                //}
            }
        }

        protected void btnguncelle_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["Id"]);
            if (db.PaletGuncelle(id, Convert.ToDouble(txtfiyat.Text)) == 1)
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