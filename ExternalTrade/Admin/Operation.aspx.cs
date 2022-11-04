using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class Operation : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnTeklifOnay_Click(object sender, EventArgs e)
        {
            string teklifno, musterikodu;
            try
            {
                try
                {
                    if (ASPxGridView1.VisibleRowCount == 1)
                    {
                        ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);
                        var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                        teklifno = Convert.ToString(teklif_no[0]);
                        var m_k = ASPxGridView1.GetSelectedFieldValues("MusteriKodu");
                        musterikodu = Convert.ToString(m_k[0]);
                        if (db.OperasyonOnayiVer(teklifno, UserData.Id, musterikodu) == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "", "successAlert()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "", "errorAlert()", true);
                        }
                    }
                    else
                    {
                        List<object> id = ASPxGridView1.GetSelectedFieldValues(new string[] { "TeklifNo" });
                        List<object> mk = ASPxGridView1.GetSelectedFieldValues(new string[] { "MusteriKodu" });
                        for (int i = 0; i < id.Count; i++)
                        {
                            db.OperasyonOnayiVer(id[i].ToString(), UserData.Id, mk[i].ToString());


                        }
                        ClientScript.RegisterStartupScript(this.GetType(), "", "successAlert()", true);
                    }
                }
                catch
                {

                }
                //if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }


            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string teklifno;
            try
            {
                try
                {
                    if (ASPxGridView1.VisibleRowCount == 1)
                    {
                        ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);
                        var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                        teklifno = Convert.ToString(teklif_no[0]);

                        if (db.OperasyonReddet(teklifno, UserData.Id) == 1)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "", "successAlert2()", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "", "errorAlert2()", true);
                        }
                    }
                    else
                    {
                        List<object> id = ASPxGridView1.GetSelectedFieldValues(new string[] { "TeklifNo" });

                        for (int i = 0; i < id.Count; i++)
                        {
                            db.OperasyonReddet(id[i].ToString(), UserData.Id);


                        }
                        ClientScript.RegisterStartupScript(this.GetType(), "", "successAlert2()", true);
                    }
                }
                catch
                {

                }
                //if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }


            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }

        protected void btnRapor_Click(object sender, EventArgs e)
        {
            string teklifno;
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1)
                {
                    ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);
                    var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                    teklifno = Convert.ToString(teklif_no[0]);
                    Response.Redirect("OperationDetay.aspx?TeklifNo=" + teklifno + "");


                }

            }
            catch
            {

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsToResponse("Operasyon_Onay_Bekleyen_" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString());
        }
    }
}