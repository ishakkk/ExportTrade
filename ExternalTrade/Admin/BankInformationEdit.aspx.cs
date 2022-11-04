using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class BankInformationEdit : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (UserData.Authority != "SuperAdmın")
                Response.Redirect("Admin.aspx");
            else
            {
                string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
                int id = Convert.ToInt32(Request.QueryString["Id"]);
                if (Page.IsPostBack == false)
                {
                    using (SqlConnection con = new SqlConnection(strcon))
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("select *from Banks where Id=@p1", con);
                        cmd.Parameters.AddWithValue("@p1", id);
                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            txtbankaadi.Text = dr["BankName"].ToString();
                            txtAccount.Text = dr["Account"].ToString();
                            txtIban.Text = dr["IBAN"].ToString();
                            txtSwiftCode.Text = dr["SwiftCode"].ToString();
                        }
                        dr.Close(); //SqlConnection.ClearPool(con);
                        con.Close();
                    }
                }
            }
        }

        protected void btnguncelle_Click(object sender, EventArgs e)
        {
            if (db.BankEdit(Convert.ToInt32(Request.QueryString["Id"]), Convert.ToString(txtbankaadi.Text), Convert.ToString(txtIban.Text), Convert.ToString(txtAccount.Text), Convert.ToString(txtSwiftCode.Text)) == 1)
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