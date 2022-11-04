using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade
{
    public partial class User : System.Web.UI.MasterPage
    {
        string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Timeout = 10000;
            if (UserData.UserName == null || UserData.UserName == "")
            {
                FormsAuthentication.SignOut();
                Response.Redirect("~/Giris.aspx");
            }
            if (UserData.Authority == "SuperAdmın" || UserData.Authority == "Admin2" || UserData.Authority == "SuperAdmin")
            {
                
                    Response.Redirect("/Admin/Admin.aspx");
               
            }
            else
            {


                using (SqlConnection con = new SqlConnection(strcon))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select COUNT(Id) from UserNotifications where Whom='" + UserData.Id + "'", con);
                    lblbildirim.Text = Convert.ToString(cmd.ExecuteScalar());
                    SqlCommand cek = new SqlCommand("select *from UserNotifications where Whom='" + UserData.Id + "' order by Id desc", con);
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cek;
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    dtbildirim.DataSource = dt;
                    dtbildirim.DataBind();
                    // SqlConnection.ClearPool(con);
                    con.Close();
                }

            }



        }

        protected void btnYeniTeklif_Click(object sender, EventArgs e)
        {
            DBIslemler db = new DBIslemler();
            db.YeniTeklif(UserData.Id);
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "YeniTeklif()", true);

        }

        protected void btnIptal_Click(object sender, EventArgs e)
        {
            this.Page.ClientScript.RegisterStartupScript(this.GetType(), "", "Iptal()", true);
        }
    }
}