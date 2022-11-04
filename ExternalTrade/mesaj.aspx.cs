using ExternalTrade.Classes.MesajYolla;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExternalTrade
{
    public partial class mesaj : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            SMS sms = new SMS();
            SMS.SendOton(txtTelNo.Text, txtMesaj.Text);
            //string metin = "Yeni Teklif";
            //string telno = txtTelNo.Text;
            ////Response.Redirect("mesaj.aspx?mesaj="+metin+"");
            //string url = "http://10.51.0.24:8888/SendSMS.aspx?Numara="+txtTelNo.Text+"&Mesaj=" + metin + "";
            //var request = (HttpWebRequest)WebRequest.Create(url);


            //request.Method = "POST";
            //request.ContentType = "application/x-www-form-urlencoded";
            ////request.ContentLength = data.Length;

            //using (var stream = request.GetRequestStream())
            //{
            //    //stream.Write(data, 0, data.Length);
            //}

            //var response = (HttpWebResponse)request.GetResponse();
            ClientScript.RegisterStartupScript(this.GetType(), "", "success()", true);
        }
    }
}