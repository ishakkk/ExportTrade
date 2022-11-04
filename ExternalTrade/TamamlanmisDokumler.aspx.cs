using Ionic.Zip;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade
{
    public partial class TamamlanmisDokumler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            try
            {
                if (e.DataColumn.FieldName == "SigortaDokumu")
                {
                    if (Convert.ToBoolean(e.GetValue("SigortaDokumu").ToString()) == true)
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;

                    }
                    else if (Convert.ToBoolean(e.GetValue("SigortaDokumu").ToString()) == false)
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;

                    }

                }


                if (e.DataColumn.FieldName == "UlkeSertifikasi")
                {
                    if (Convert.ToBoolean(e.GetValue("UlkeSertifikasi").ToString()) == true)
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;

                    }
                    else if (Convert.ToBoolean(e.GetValue("UlkeSertifikasi").ToString()) == false)
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;

                    }

                }

                if (e.DataColumn.FieldName == "DolasimBelgesi")
                {
                    if (Convert.ToBoolean(e.GetValue("DolasimBelgesi").ToString()) == true)
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;

                    }
                    else if (Convert.ToBoolean(e.GetValue("DolasimBelgesi").ToString()) == false)
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;

                    }

                }
                if (e.DataColumn.FieldName == "UlkeSertifikasi")
                {
                    if (Convert.ToBoolean(e.GetValue("UlkeSertifikasi").ToString()) == true)
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;

                    }
                    else if (Convert.ToBoolean(e.GetValue("UlkeSertifikasi").ToString()) == false)
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;

                    }

                }
                if (e.DataColumn.FieldName == "Proforma")
                {
                    if (Convert.ToBoolean(e.GetValue("Proforma").ToString()) == true)
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;

                    }
                    else if (Convert.ToBoolean(e.GetValue("Proforma").ToString()) == false)
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;

                    }

                }
                if (e.DataColumn.FieldName == "CommercialInvoice")
                {
                    if (Convert.ToBoolean(e.GetValue("CommercialInvoice").ToString()) == true)
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;

                    }
                    else if (Convert.ToBoolean(e.GetValue("CommercialInvoice").ToString()) == false)
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;

                    }

                }
                if (e.DataColumn.FieldName == "PackingList")
                {
                    if (Convert.ToBoolean(e.GetValue("PackingList").ToString()) == true)
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;

                    }
                    else if (Convert.ToBoolean(e.GetValue("PackingList").ToString()) == false)
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;

                    }

                }
                if (e.DataColumn.FieldName == "Konsimento")
                {
                    if (Convert.ToBoolean(e.GetValue("Konsimento").ToString()) == true)
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;

                    }
                    else if (Convert.ToBoolean(e.GetValue("Konsimento").ToString()) == false)
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;

                    }

                }
            }
            catch
            {

            }
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            string teklifno;

            try
            {
                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                teklifno = Convert.ToString(teklif_no[0]);
                using (ZipFile zip = new ZipFile())
                {
                    zip.AlternateEncodingUsage = ZipOption.AsNecessary;
                    zip.AddDirectoryByName(teklifno);

                    string filePath = Server.MapPath("~/OperationDocuments/" + teklifno + "");
                    zip.AddDirectory(filePath, teklifno);
                    Response.Clear();
                    Response.BufferOutput = false;
                    string zipName = String.Format("Zip_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
                    Response.ContentType = "application/zip";
                    Response.AddHeader("content-disposition", "attachment; filename=" + zipName);
                    zip.Save(Response.OutputStream);
                    Response.End();
                }

            }
            catch
            {
                //ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }
    }
}