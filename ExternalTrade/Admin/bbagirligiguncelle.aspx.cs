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
    public partial class bbagirligiguncelle : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        DbConnection con = new DbConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (UserData.Authority != "SuperAdmın")
                Response.Redirect("Admin.aspx");
            int Id = Convert.ToInt32(Request.QueryString["Id"]);
            if (Page.IsPostBack == false)
            {
                SqlCommand cmd = new SqlCommand("select *from BBWeight where Id='" + Id + "'", con.baglanti());
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtbbagirligi.Text = dr["Weight"].ToString();
                }
            }

            //SqlConnection.ClearPool(con.baglanti());
            con.baglanti().Close();
        }

        protected void btnguncelle_Click(object sender, EventArgs e)
        {
            int Id = Convert.ToInt32(Request.QueryString["Id"]);
            if (db.bbAgirlikGuncelle(Id, Convert.ToInt32(txtbbagirligi.Text)) == 1)
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