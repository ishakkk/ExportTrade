using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class urunguncelle : System.Web.UI.Page
    {
        DbConnection con = new DbConnection();
        DBIslemler db = new DBIslemler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (UserData.Authority != "SuperAdmın" && UserData.Authority != "Admin2")
                Response.Redirect("Admin.aspx");
            int id = Convert.ToInt32(Request.QueryString["Id"]);
            if (Page.IsPostBack == false)
            {
                SqlCommand cmd = new SqlCommand("select *from Product where Id='" + id + "'", con.baglanti());
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtFiyat.Text = dr["Price"].ToString();
                    txtIntercarb.Text = dr["Price_Intercarb"].ToString();
                    txtRoskim.Text = dr["Price_Roskim"].ToString();
                    tztOzer.Text = dr["Price_Ozer"].ToString();
                    txtUstSinifKodu.Text = dr["Code"].ToString();
                    txtUrunAdi.Text = dr["ProductName"].ToString();
                }
                dr.Close();
                SqlCommand cmd2 = new SqlCommand("select  MainClass from Product where Id='" + id + "' union all select distinct MainClass from Product where Id <> '" + id + "' ", con.baglanti());
                SqlDataReader dr2 = cmd2.ExecuteReader();
                drpAnaSinif.DataSource = dr2;
                drpAnaSinif.DataTextField = "MainClass";
                drpAnaSinif.DataValueField = "MainClass";
                drpAnaSinif.DataBind();
                dr2.Close();
                SqlConnection.ClearPool(con.baglanti());
                con.baglanti().Close();
            }
        }

        protected void btnguncelle_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["Id"]);
            if (db.UrunGuncelle(id, drpAnaSinif.SelectedItem.Text, txtUrunAdi.Text, txtUstSinifKodu.Text, Convert.ToDouble(txtFiyat.Text), Convert.ToDouble(txtIntercarb.Text), Convert.ToDouble(txtRoskim.Text), Convert.ToDouble(tztOzer.Text)) == 1)
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