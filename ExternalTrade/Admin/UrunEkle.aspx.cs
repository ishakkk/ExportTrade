using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class UrunEkle : System.Web.UI.Page
    {

        DBIslemler db = new DBIslemler();
        DbConnection con = new DbConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SqlCommand cmd = new SqlCommand("select distinct MainClass from Product", con.baglanti());
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                drpAnaSinif.DataSource = dt;
                drpAnaSinif.DataTextField = "MainClass";
                drpAnaSinif.DataValueField = "MainClass";
                drpAnaSinif.DataBind();
                con.baglanti().Close();
            }
        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {
            if (db.UrunEkle(drpAnaSinif.SelectedItem.Text, txtUstSinifKodu.Text, txtUrun.Text, Convert.ToDouble(txtFiyat.Text), Convert.ToDouble(txtintercarb.Text), Convert.ToDouble(txtRoskimtorg.Text), Convert.ToDouble(txtOzer.Text)) == 1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "successAlert()", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "errorAlert()", true);
            }
        }
    }
}