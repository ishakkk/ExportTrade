using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ExternalTrade.Classes.MesajYolla;
namespace ExternalTrade
{
    public partial class sil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //if (Global.UnityApp.LoggedIn == true)
            //{
            //    UnityObjects.Data order = Global.UnityApp.NewDataObject(UnityObjects.DataObjectType.doSalesOrderSlip);
            //    order.New();
            //    if (order.Delete(Convert.ToInt32(TextBox1.Text)))
            //    {
            //        Response.Write("KAYIT SİLİNDİ");
            //    }
            //}
            //else
            //{
            //    Global.UnityApp.Login("mr", "1244244", 219);
            //    UnityObjects.Data order = Global.UnityApp.NewDataObject(UnityObjects.DataObjectType.doSalesOrderSlip);
            //    order.New();
            //    if (order.Delete(Convert.ToInt32(TextBox1.Text)))
            //    {
            //        Response.Write("KAYIT SİLİNDİ");
            //    }
            //}
            SMS.SendOton("5307067668", "deneme");
           
        }
    }
}