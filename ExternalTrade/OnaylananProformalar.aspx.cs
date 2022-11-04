using ExternalTrade.Classes;
using Ionic.Zip;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade
{
    public partial class OnaylananProformalar : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.Parameters["@temsilci"].Value = Convert.ToInt32(UserData.Id);
        }

        protected void btnProformaGor_Click(object sender, EventArgs e)
        {
            string teklifno;
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                teklifno = Convert.ToString(teklif_no[0]);


                Response.Redirect("Proforma.aspx?teklifno=" + teklifno + "");
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
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
                Response.Redirect("ProformaOlusturDetay.aspx?teklifno=" + teklifno + "");
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }
        protected void btnProforma_Click(object sender, EventArgs e)
        {
            string teklifno;
            try
            {
                if (ASPxGridView1.VisibleRowCount == 1) { ASPxGridView1.FocusedRowIndex = 0; ASPxGridView1.Selection.SelectRow(0); }
                var teklif_no = ASPxGridView1.GetSelectedFieldValues("TeklifNo");
                teklifno = Convert.ToString(teklif_no[0]);
                if (fl1.HasFile)
                {

                    if (!Directory.Exists(Server.MapPath("~/Proformalar/" + teklifno + "")))
                    {
                        Directory.CreateDirectory(Server.MapPath("~/Proformalar/" + teklifno + ""));
                        string belgeyolu = fl1.FileName;

                        fl1.SaveAs(Server.MapPath("~/Proformalar/" + teklifno + "/" + belgeyolu));

                        belgeyolu = "~Proformalar/" + teklifno + "/" + belgeyolu;
                        if (db.ProformaYukle(teklifno, belgeyolu, UserData.Id) == 1)
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
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "sec()", true);
            }
        }

        protected void btnIndır_Click(object sender, EventArgs e)
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