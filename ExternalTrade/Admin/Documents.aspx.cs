using ExternalTrade.Classes;
using QRCoder;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade.Admin
{
    public partial class Documents : System.Web.UI.Page
    {
        DBIslemler db = new DBIslemler();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (UserData.Authority != "SuperAdmın" && UserData.Authority != "SuperAdmin" && UserData.Authority != "Admin2")
                Response.Redirect("Admin.aspx");
            using (MemoryStream ms = new MemoryStream())
            {
                QRCodeGenerator koduret = new QRCodeGenerator();
                QRCodeGenerator.QRCode kod = koduret.CreateQrCode("https://www.nigtas.com/", QRCodeGenerator.ECCLevel.Q);
                using (Bitmap bmp = kod.GetGraphic(5))
                {
                    bmp.Save(ms, ImageFormat.Png);
                    img_yeri.ImageUrl = "data:imge/png;base64," + Convert.ToBase64String(ms.ToArray());
                    img_yeri2.ImageUrl = "data:imge/png;base64," + Convert.ToBase64String(ms.ToArray());
                    img_yeri3.ImageUrl = "data:imge/png;base64," + Convert.ToBase64String(ms.ToArray());
                    img_yeri4.ImageUrl = "data:imge/png;base64," + Convert.ToBase64String(ms.ToArray());
                }
            }
        }

        protected void btnrevize_Click(object sender, EventArgs e)
        {
            if (Convert.ToInt32(drpDokumler.SelectedItem.Value) == 1)
            {
                if (db.DokumleriRevizeyeGonder(Convert.ToString(Request.QueryString["teklifno"]), 1) == 1)
                {
                    Directory.Delete(Server.MapPath("~/OperationDocuments/" + Convert.ToString(Request.QueryString["teklifno"]) + ""), true);
                    ClientScript.RegisterStartupScript(this.GetType(), "", "revizeAlertSuccess()", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "revizeAlertError()", true);
                }
            }
            else if (Convert.ToInt32(drpDokumler.SelectedItem.Value) == 5)
            {
                if (db.DokumleriRevizeyeGonder(Convert.ToString(Request.QueryString["teklifno"]), 5) == 1)
                {
                    Directory.Delete(Server.MapPath("~/OperationDocuments/" + Convert.ToString(Request.QueryString["teklifno"]) + ""), true);
                    ClientScript.RegisterStartupScript(this.GetType(), "", "revizeAlertSuccess()", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "revizeAlertError()", true);
                }
            }
            else if (Convert.ToInt32(drpDokumler.SelectedItem.Value) == 2)
            {
                if (db.DokumleriRevizeyeGonder(Convert.ToString(Request.QueryString["teklifno"]), 2) == 1)
                {

                    ClientScript.RegisterStartupScript(this.GetType(), "", "revizeAlertSuccess()", true);
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "revizeAlertError()", true);
                }
            }
        }

        protected void btnrevize_Click1(object sender, EventArgs e)
        {

        }
    }
}