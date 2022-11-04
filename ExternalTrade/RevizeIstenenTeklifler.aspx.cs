using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade
{
    public partial class RevizeIstenenTeklifler : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        protected void Page_Load(object sender, EventArgs e)
        {
            string islem = Request.QueryString["islem"];
            if (islem == "okundu")
            {
                if (UserData.Authority != "SuperAdmın")
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    db.KullaniciBildirimOkundu(id);
                }

            }

        }

        protected void btnRapor_Click(object sender, EventArgs e)
        {
            string teklifno;
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                teklifno = Convert.ToString(teklif_no[0]);

                Response.Redirect("RevizeIstenenTekliflerDetay.aspx?teklifno=" + teklifno + "");
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@Durum"].Value = "REVIZE ISTENILEN TEKLIF";
            e.Command.Parameters["@temsilci"].Value = UserData.Id;

        }

        protected void OnayaSun_Click(object sender, EventArgs e)
        {
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1)
                {
                    ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);

                    string teklifno;
                    var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                    teklifno = Convert.ToString(teklif_no[0]);
                    string metin = UserData.Name + " " + UserData.SurName + " " + "Adlı Kullanıcı" + " " + Request.QueryString["teklifno"] + " " + "numaralı teklifi revize etti ve onay istiyor";
                    string location = "Teklifler.aspx?islem=okundu";
                    string whom = UserData.Name + " " + UserData.SurName;
                    if (db.RevizeTeklifOnayaSunUser(teklifno, metin, location, whom) == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "reOnayAlert()", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "reAlert()", true);

                    }

                }
                else
                {
                    List<object> id = ASPxGridView1.GetSelectedFieldValues(new string[] { "TeklifNo" });

                    for (int i = 0; i < id.Count; i++)
                    {

                        string metin = UserData.Name + " " + UserData.SurName + " " + "Adlı Kullanıcı" + " " + Request.QueryString["teklifno"] + " " + "numaralı teklifi revize etti ve onay istiyor";
                        string location = "Teklifler.aspx?islem=okundu";
                        string whom = UserData.Name + " " + UserData.SurName;
                        db.RevizeTeklifOnayaSunUser(id[i].ToString(), metin, location, whom);


                    }
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "reOnayAlert()", true);
                }

            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "sec()", true);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsToResponse("RevizeIstenen_Teklif_Listesi_" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString());
        }
    }
}