using ExternalTrade.Classes;
using Ionic.Zip;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class AllOperation : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ASPxGridView1_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            try
            {
                if (e.DataColumn.FieldName == "ProformaYukleyen")
                {
                    if (Convert.ToString(e.GetValue("ProformaYukleyen").ToString()) != "")
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;

                    }
                    else if (Convert.ToString(e.GetValue("ProformaYukleyen").ToString()) == "")
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;

                    }

                }


                if (e.DataColumn.FieldName == "CommercialInvoiceYukleyen")
                {
                    if (Convert.ToString(e.GetValue("CommercialInvoiceYukleyen").ToString()) != "")
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;

                    }
                    else if (Convert.ToString(e.GetValue("CommercialInvoiceYukleyen").ToString()) == "")
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;

                    }

                }

                if (e.DataColumn.FieldName == "PackingListYukleyen")
                {
                    if (Convert.ToString(e.GetValue("PackingListYukleyen").ToString()) != "")
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;

                    }
                    else if (Convert.ToString(e.GetValue("PackingListYukleyen").ToString()) == "")
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;

                    }

                }
                if (e.DataColumn.FieldName == "KonsimentoYukleyen")
                {
                    if (Convert.ToString(e.GetValue("KonsimentoYukleyen").ToString()) != "")
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;

                    }
                    else if (Convert.ToString(e.GetValue("KonsimentoYukleyen").ToString()) == "")
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;

                    }

                }
                if (e.DataColumn.FieldName == "SigortaDokumuYukleyen")
                {
                    if (Convert.ToString(e.GetValue("SigortaDokumuYukleyen").ToString()) != "")
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;

                    }
                    else if (Convert.ToString(e.GetValue("SigortaDokumuYukleyen").ToString()) == "")
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;

                    }

                }
                if (e.DataColumn.FieldName == "UlkeSertifikasiYukleyen")
                {
                    if (Convert.ToString(e.GetValue("UlkeSertifikasiYukleyen").ToString()) != "")
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;

                    }
                    else if (Convert.ToString(e.GetValue("UlkeSertifikasiYukleyen").ToString()) == "")
                    {
                        e.Cell.BackColor = Color.Red;
                        e.Cell.ForeColor = Color.White;

                    }

                }
                if (e.DataColumn.FieldName == "DolasimBelgesiYukleyen")
                {
                    if (Convert.ToString(e.GetValue("DolasimBelgesiYukleyen").ToString()) != "")
                    {

                        e.Cell.BackColor = Color.Green;
                        e.Cell.ForeColor = Color.White;

                    }
                    else if (Convert.ToString(e.GetValue("DolasimBelgesiYukleyen").ToString()) == "")
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
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }

        protected void btnIptal_Click(object sender, EventArgs e)
        {
            //string teklifno;
            //try
            //{
            //    if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
            //    var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
            //    teklifno = Convert.ToString(teklif_no[0]);

            //   //if(db.DokumleriRevizeyeGonder(teklifno)==1)
            //   //{
            //   //    Directory.Delete(Server.MapPath("~/OperationDocuments/" + teklifno + ""), true);
            //   //    ClientScript.RegisterStartupScript(this.GetType(), "", "successAlert()", true);
            //   //}


            //}
            //catch
            //{
            //    ClientScript.RegisterStartupScript(this.GetType(), "", "errorAlert()", true);
            //}
        }
    
    }
}