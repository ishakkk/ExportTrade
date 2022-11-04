using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ExternalTrade.Classes
{
    public class DBLogoConnection
    {
        public SqlConnection LogoConnection()
        {
            string connectionstring = ConfigurationManager.ConnectionStrings["LogoDB_ConnectionString"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
            SqlConnection con = new SqlConnection(connectionstring);//sqlConnection sınıfından con adında nesne türet ve içine strcon adresini referas et.Böylelikle veritabanı bağlantısı gerçekleşmiş olsun
            con.Open();//bağlantıyı aç
            return con;//bağlantıyı sonuç olarak geri döndür
        }
    }
}