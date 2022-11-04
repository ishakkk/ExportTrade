using ExternalTrade.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class RevizeIstenilenProformalar : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnDetay_Click(object sender, EventArgs e)
        {
            string teklifno;
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                teklifno = Convert.ToString(teklif_no[0]);

                Response.Redirect("SatisiOnaylananDetay.aspx?teklifno=" + teklifno + "");


            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }

        protected void btnProformaGor_Click(object sender, EventArgs e)
        {
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1)
                {
                    ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);
                }
                string teklifno = "";
                var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                teklifno = Convert.ToString(teklif_no[0]);

                Response.Redirect("Proforma.aspx?teklifno=" + teklifno + "");
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "warningAlert()", true);
            }
        }

        protected void btnTeklifOnay_Click(object sender, EventArgs e)
        {
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1)
                {
                    ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);

                    string teklifno = "";
                    var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                    teklifno = Convert.ToString(teklif_no[0]);

                    if (db.ProformaOnayla(teklifno, Convert.ToInt32(UserData.Id)) == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "SuccessAlert()", true);
                    }
                    else
                    {

                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "ErrorAlert()", true);
                    }

                }
                else
                {
                    List<object> id = ASPxGridView1.GetSelectedFieldValues(new string[] { "TeklifNo" });

                    for (int i = 0; i < id.Count; i++)
                    {
                        db.ProformaOnayla(id[i].ToString(), Convert.ToInt32(UserData.Id));

                    }
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "SuccessAlert()", true);
                }
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "warningAlert()", true);
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1)
                {
                    ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);

                    string teklifno = "";
                    var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                    teklifno = Convert.ToString(teklif_no[0]);

                    if (db.ProformaReddet(teklifno, Convert.ToInt32(UserData.Id)) == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "SuccessAlertRed()", true);
                    }
                    else
                    {

                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "ErrorAlertRed()", true);
                    }
                }
                else
                {
                    List<object> id = ASPxGridView1.GetSelectedFieldValues(new string[] { "TeklifNo" });

                    for (int i = 0; i < id.Count; i++)
                    {
                        db.ProformaReddet(id[i].ToString(), Convert.ToInt32(UserData.Id));

                    }
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "SuccessAlertRed()", true);
                }
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "warningAlert()", true);
            }
        }
        protected void btn_Click(object sender, EventArgs e)
        {
            string teklifno;
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1)
                {
                    ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);


                    var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                    teklifno = Convert.ToString(teklif_no[0]);
                    if (db.KayirGonder_Proforma(teklifno, Convert.ToInt32(drp.SelectedItem.Value)) == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "success()", true);
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "error()", true);
                    }
                }
                else
                {
                    List<object> id = ASPxGridView1.GetSelectedFieldValues(new string[] { "TeklifNo" });
                    for (int i = 0; i < id.Count; i++)
                    {
                        db.KayirGonder_Proforma(id[i].ToString(), Convert.ToInt32(drp.SelectedItem.Value));

                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "success()", true);
                    }
                }
            }
            catch
            {
            }
        }
    }
}