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
    public partial class gumruklemeguncelle : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("select *from Clearance where Id=@p1", con.baglanti());
                cmd.Parameters.AddWithValue("@p1", id);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtbulkgumruk.Text = dr["GumruklemeBULK"].ToString();
                    txtkonteynergumruk.Text = dr["GumruklemeKONTEYNER"].ToString();
                    txtkonteynerikidokuz.Text = dr["GumruklemeKONTEYNERikidokuz"].ToString();
                    txtonuzeri.Text = dr["GumruklemeKONTEYNERonuzeri"].ToString();
                    txtkarayolu.Text = dr["GumruklemeKonteynerKaraYolu"].ToString();
                    txtkarayoluikiüzeri.Text = dr["GumruklemeKonteynerKaraYoluikiuzeri"].ToString();
                    txtdemiryolu.Text = dr["GumruklemeKonteynerDemirYolu"].ToString();
                    txtdemiryoluikiüzeri.Text = dr["GumruklemeKonteynerDemirYoluikiuzeri"].ToString();
                } SqlConnection.ClearPool(con.baglanti());
                con.baglanti().Close();
            }
        }

        protected void btnguncelle_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["Id"]);
            if (db.GumrukGuncelle(id, Convert.ToDouble(txtbulkgumruk.Text), Convert.ToDouble(txtkonteynergumruk.Text), Convert.ToDouble(txtkonteynerikidokuz.Text), Convert.ToDouble(txtonuzeri.Text), Convert.ToDouble(txtkarayolu.Text), Convert.ToDouble(txtkarayoluikiüzeri.Text), Convert.ToDouble(txtdemiryolu.Text), Convert.ToDouble(txtdemiryoluikiüzeri.Text)) == 1)
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