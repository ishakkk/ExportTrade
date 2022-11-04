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
    public partial class OnayBekleyenProformalar : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@Durum"].Value = "ONAYLANDI";

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

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            try
            {
                if (e.DataColumn.FieldName == "KAR ORANI")
                {
                    if (Convert.ToDouble(e.GetValue("KAR ORANI").ToString()) >= 0.10)
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;
                        //e.Cell.BackColor = Color.Green;
                        //e.Cell.ForeColor = Color.Black;
                    }
                    else if (Convert.ToDouble(e.GetValue("KAR ORANI").ToString()) < 0)
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;
                        //e.Cell.ForeColor = Color.White;
                    }
                    else if (Convert.ToDouble(e.GetValue("KAR ORANI").ToString()) >= 0 && Convert.ToDouble(e.GetValue("KAR ORANI").ToString()) < 0.10)
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

        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1)
                {
                    ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0);
                    string teklifno = "";
                    var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                    teklifno = Convert.ToString(teklif_no[0]);

                    if (db.ProformaRevizeyeGonder(teklifno, Convert.ToInt32(UserData.Id)) == 1)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "SuccessAlertRevize()", true);
                    }
                    else
                    {

                        ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "ErrorAlertRevize()", true);
                    }

                }
                else
                {
                    List<object> id = ASPxGridView1.GetSelectedFieldValues(new string[] { "TeklifNo" });

                    for (int i = 0; i < id.Count; i++)
                    {
                        db.ProformaRevizeyeGonder(id[i].ToString(), Convert.ToInt32(UserData.Id));

                    }
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "SuccessAlertRevize()", true);
                }
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "warningAlert()", true);
            }
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