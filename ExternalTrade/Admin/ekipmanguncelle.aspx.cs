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
    public partial class ekipmanguncelle : System.Web.UI.Page
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
                SqlCommand cmd = new SqlCommand("select *from EquipmentType where Id='" + id + "'", con.baglanti());
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtekipman.Text = dr["EkipmanTürü"].ToString();
                } SqlConnection.ClearPool(con.baglanti());
                con.baglanti().Close();
            }
        }

        protected void btnguncelle_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["Id"]);
            if (db.EkipmanGuncelle(id, Convert.ToString(txtekipman.Text)) == 1)
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