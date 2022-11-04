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

namespace ExternalTrade.Admin
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
        protected void Page_Load(object sender, EventArgs e)
        {
            if (UserData.UserName == null || UserData.UserName == "")
            {
                FormsAuthentication.SignOut();
                Response.Redirect("~/Giris.aspx");
            }
            
            Session.Timeout = 10000;
            if (UserData.Authority == "User" || UserData.Authority == "OperationChef" || UserData.Authority == "Operation")
            {
                Response.Redirect("/Home.aspx");
            }

            using (SqlConnection con = new SqlConnection(strcon))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select *from AdminNotification order by Id desc", con);
                //SqlDataReader dr = cmd.ExecuteReader();
                //dtbildirim.DataSource = dr;
                //dtbildirim.DataBind();
                //dr.Close();
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                dtbildirim.DataSource = dt;
                dtbildirim.DataBind();
                SqlCommand say = new SqlCommand("select Count(Id) from AdminNotification", con);
                lblbildirimsayisi.Text = Convert.ToString(say.ExecuteScalar());
                //SqlConnection.ClearPool(con);
                con.Close();
            }
        }
    }
}