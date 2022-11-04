using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ExternalTrade.Classes
{
    public class DbConnection
    {
        public SqlConnection baglanti()
        {
            string strcon = ConfigurationManager.ConnectionStrings["ExternalTradeDB"].ConnectionString;//web.config dosyasında bulunan bağlantı adresini strcon adındaki değişkene ata
            SqlConnection con = new SqlConnection(strcon);//sqlConnection sınıfından con adında nesne türet ve içine strcon adresini referas et.Böylelikle veritabanı bağlantısı gerçekleşmiş olsun
            con.Open();//bağlantıyı aç
            return con;//bağlantıyı sonuç olarak geri döndür
        }
    }
}