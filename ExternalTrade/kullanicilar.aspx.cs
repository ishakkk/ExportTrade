using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade
{
    public partial class kullanicilar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (UserData.Authority != "SuperAdmın")
            {
                Response.Redirect("Home.aspx");
            }
        }

        protected void btnkisiguncelle_Click(object sender, EventArgs e)
        {
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                int PersonelId;
                var Personel_Id = ASPxGridView1.GetSelectedFieldValues("Id");

                PersonelId = Convert.ToInt32(Personel_Id[0]);

                Response.Redirect("kullaniciGuncelle.aspx?Kullanici=" + PersonelId.ToString() + "");
            }
            catch { }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}