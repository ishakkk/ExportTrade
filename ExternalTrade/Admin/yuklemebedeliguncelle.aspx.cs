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
    public partial class yuklemebedeliguncelle : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        DbConnection con = new DbConnection();
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (UserData.Authority != "SuperAdmın" && UserData.Authority != "Admin2")
                Response.Redirect("Admin.aspx");
            id = Convert.ToInt32(Request.QueryString["Id"]);
            if (Page.IsPostBack == false)
            {
                SqlCommand cmd = new SqlCommand("select *from LoadingCharge where Id=@p1", con.baglanti());
                cmd.Parameters.AddWithValue("@p1", id);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtcakilifiyat.Text = dr["Price"].ToString();
                    txtlimak20.Text = dr["ContainerFreeinLIMAK20"].ToString();
                    txtlimak40.Text = dr["ContainerFreeinLIMAK40"].ToString();
                    txtmip20.Text = dr["ContainerFreeinMIP20"].ToString();
                    txtmip40.Text = dr["ContainerFreeinMIP40"].ToString();
                } //SqlConnection.ClearPool(con.baglanti());
                con.baglanti().Close();
            }
        }

        protected void btnguncelle_Click(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Request.QueryString["Id"]);
            if (db.yuklemebedeliGucelle(id, Convert.ToDouble(txtcakilifiyat.Text), Convert.ToDouble(txtlimak40.Text), Convert.ToDouble(txtlimak40.Text), Convert.ToDouble(txtmip20.Text), Convert.ToDouble(txtmip40.Text)) == 1)
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