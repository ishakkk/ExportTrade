using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class RevizeIstenilenler : System.Web.UI.Page
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
                    db.BildirimOkundu(id);
                }

            }
         if(UserData.Authority!="SuperAdmın" && UserData.Authority!="SuperAdmin")
         {
             ASPxGridView1.Columns["RevizeyeGonderen"].Visible = false;
         }
        }

        protected void btnRapor_Click(object sender, EventArgs e)
        {
            try
            {
                string teklifno;

                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");

                teklifno = Convert.ToString(teklif_no[0]);

                Response.Redirect("RevizeDetay.aspx?teklifno=" + teklifno + "");
            }
            catch
            {

                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }   
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            
            e.Command.Parameters["@Durum"].Value = "REVIZE ISTENILEN TEKLIF";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                try
                {
                    string teklifno;

                    if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);


                    var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");


                    teklifno = Convert.ToString(teklif_no[0]);
                    if (db.HayaletKayitSil(teklifno, UserData.Id) == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "SepetSil()", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "SepetSilHata()", true);
                    }
               }
                    else
                    {
                        List<object> id = ASPxGridView1.GetSelectedFieldValues(new string[] { "TeklifNo" });

                        for (int i = 0; i < id.Count; i++)
                        {
                            db.HayaletKayitSil(id[i].ToString(), UserData.Id);

                        }

                        ClientScript.RegisterStartupScript(this.GetType(), "", "SepetSil()", true);
                    }
                }
                catch
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
                }
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsToResponse("Revize_İstenilen_Teklifler_Listesi_" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString());
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
                    if (db.RevizeTeklifOnayaSun(teklifno) == 1)
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
                        db.HayaletKayitSil(id[i].ToString(), UserData.Id);

                    }

                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "reOnayAlert()", true);
                }
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            try
            {
                if (e.DataColumn.FieldName == "CFR KAR ORANI")
                {
                    if (Convert.ToDouble(e.GetValue("CFR KAR ORANI").ToString()) >= 0.10)
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;
                        //e.Cell.BackColor = Color.Green;
                        //e.Cell.ForeColor = Color.Black;
                    }
                    else if (Convert.ToDouble(e.GetValue("CFR KAR ORANI").ToString()) < 0)
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;
                        //e.Cell.ForeColor = Color.White;
                    }
                    else if (Convert.ToDouble(e.GetValue("CFR KAR ORANI").ToString()) >= 0 && Convert.ToDouble(e.GetValue("CFR KAR ORANI").ToString()) < 0.10)
                    {
                        e.Cell.BackColor = Color.Orange;
                        e.Cell.ForeColor = Color.Black;
                    }
                }
            }
            catch
            {

            }
        }

       
    
    }
}