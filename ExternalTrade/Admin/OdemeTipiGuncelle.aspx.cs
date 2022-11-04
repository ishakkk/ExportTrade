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
    public partial class OdemeTipiGuncelle : System.Web.UI.Page
    {
        DbConnection c = new DbConnection();
        DBIslemler db = new DBIslemler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                SqlCommand cmd = new SqlCommand("select PaymentTerms from Payment where Id='" + Request.QueryString["Id"] + "'", c.baglanti());
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtOdemeTipi.Text = dr["PaymentTerms"].ToString();
                }
                dr.Close();
                c.baglanti().Close();
            }
        }

        protected void btnEkle_Click(object sender, EventArgs e)
        {
            if (db.OdemeSekliGuncelle(Convert.ToInt32(Request.QueryString["Id"]), txtOdemeTipi.Text) == 1)
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