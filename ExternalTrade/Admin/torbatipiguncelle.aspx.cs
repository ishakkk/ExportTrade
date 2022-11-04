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
    public partial class torbatipiguncelle : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        DbConnection con = new DbConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (UserData.Authority != "SuperAdmın" && UserData.Authority != "Admin2")
                Response.Redirect("Admin.aspx");
            int Id = Convert.ToInt32(Request.QueryString["Id"]);
            if (Page.IsPostBack == false)
            {
                SqlCommand cmd = new SqlCommand("select *from BagType where Id='" + Id + "'", con.baglanti());
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txttorbatipi.Text = dr["bagType"].ToString();
                    txtfiyat.Text = dr["Price"].ToString();
                }
            }
        }

        protected void btnguncelle_Click(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32(Request.QueryString["Id"]);
            if (db.torbaTipiGuncelle(Id, Convert.ToString(txttorbatipi.Text), Convert.ToDouble(txtfiyat.Text)) == 1)
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