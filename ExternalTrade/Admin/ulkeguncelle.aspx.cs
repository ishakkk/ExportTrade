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
    public partial class ulkeguncelle : System.Web.UI.Page
    {
        int id;
        int ustid;
        DbConnection con = new DbConnection();
        DBIslemler db = new DBIslemler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (UserData.Authority != "SuperAdmın" && UserData.Authority != "Admin2")
                Response.Redirect("Admin.aspx");
            id = Convert.ToInt32(Request.QueryString["Id"]);
            ustid = Convert.ToInt32(Request.QueryString["UstId"]);
            if (Page.IsPostBack == false)
            {
                SqlCommand bolge = new SqlCommand("select *from Continent where Id=@p1 union all select *from Continent where Id <> @p2", con.baglanti());
                bolge.Parameters.AddWithValue("@p1", ustid);
                bolge.Parameters.AddWithValue("@p2", ustid);
                SqlDataReader dr3 = bolge.ExecuteReader();
                drpBolge.DataSource = dr3;
                drpBolge.DataTextField = "ContinentName";
                drpBolge.DataValueField = "Id";
                drpBolge.DataBind();
                SqlCommand cmd = new SqlCommand("select *from Country where Id=@p1", con.baglanti());
                cmd.Parameters.AddWithValue("@p1", id);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtÜlke.Text = dr["CountryName"].ToString();
                }


            }
        }
        protected void btnguncelle_Click(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Request.QueryString["Id"]);
            if (db.UlkeGuncelle(id, Convert.ToInt32(drpBolge.SelectedItem.Value), txtÜlke.Text) == 1)
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