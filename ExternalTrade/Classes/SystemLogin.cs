using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ExternalTrade.Classes
{
    public class SystemLogin
    {
        public bool UserControl(string KullaniciAdi, string Sifre)//Giriş yapmaya çalışan kişilerin bilgilerini veritabanından kontrol etmeye yarayan UserControl fonksiyonunu oluşturuyoruz. bu fonksiyon dışardan parametre alabilmektedir.
        {

            bool kontrol = false;//bool tipinde (yani 1 veya 0,true veya false değeri alabilen) kontrol adında değişkenimizi oluşturuyoruz
            DbConnection con = new DbConnection();//veritabanı bağlantısı için DBConnection sınıfından con adında nesne türetiyoruz
            SqlCommand cmd = new SqlCommand("select *from Users where UserName='" + KullaniciAdi + "' and Password='" + Sifre + "'", con.baglanti());//SqlCommand sınıfından cmd adında nesne türet ve bu nesnenin içine Giriş sayfasına yazılan Kullanıcı adı ve Şifre değerinin veritabanında olup olmadığını kontrol et
            SqlDataReader dr = cmd.ExecuteReader();//SqlDataReader nesnesinden dr adında instance değişkeni oluşturup cmd instance değişkeninde bulunan sql sorguunu okuyabilmesi için ExecuteReader() metodunu kullanıyoruz. Böylelikle veri okumayı başlatıyoruz.
            while (dr.Read())//burada okumaya başladığımız değerlerin tekrarı için dr instancesini döngüye sokuyoruz.
            {
                if (KullaniciAdi == dr["UserName"].ToString() && Sifre == dr["Password"].ToString() && dr["Active"].ToString() == "True")//Girilen değerlerin veritabanındaki bilgilerle uyuşup uyuşmadığını kontrol ediyoruz
                {
                    kontrol = true;//bilgiler uyuştuğu için kontrol değerini true olarak ayarlıyoruz 
                    //UserData.KullaniciAdi = dr["UserName"].ToString();//UserData classında bulunan UserName metoduna veritabanında bulunan Kullanıcı Adı nı atıyoruz
                    //UserData.Sifre = dr["Password"].ToString();//UserData classında bulunan Password metoduna veritabanında bulunan Şifre yi atıyoruz
                    //UserData.Ad = dr["Name"].ToString();//UserData classında bulunan Name metoduna veritabanında bulunan  Adı nı atıyoruz
                    //UserData.Soyad = dr["SurName"].ToString();//UserData classında bulunan SurName metoduna veritabanında bulunan Soyadı nı atıyoruz
                    //UserData.Yetki = dr["Authority"].ToString();//UserData classında bulunan Authority metoduna veritabanında bulunan Yetki yi atıyoruz
                    //UserData.Resim = dr["Image"].ToString();//UserData classında bulunan Image metoduna veritabanında bulunan Resim i atıyoruz
                    //UserData.Eposta = dr["Email"].ToString();
                    //UserData.id = Convert.ToInt32(dr["Id"]);
                    //UserData.Pozisyon = dr["Position"].ToString();
                    //UserData.TelNo = dr["Contact"].ToString();
                    //UserData.logoid = Convert.ToInt32(dr["LogoId"]);
                    UserData.UserName = dr["UserName"].ToString();//UserData classında bulunan UserName metoduna veritabanında bulunan Kullanıcı Adı nı atıyoruz
                    UserData.Password = dr["Password"].ToString();//UserData classında bulunan Password metoduna veritabanında bulunan Şifre yi atıyoruz
                    UserData.Name = dr["Name"].ToString();//UserData classında bulunan Name metoduna veritabanında bulunan  Adı nı atıyoruz
                    UserData.SurName = dr["SurName"].ToString();//UserData classında bulunan SurName metoduna veritabanında bulunan Soyadı nı atıyoruz
                    UserData.Authority = dr["Authority"].ToString();//UserData classında bulunan Authority metoduna veritabanında bulunan Yetki yi atıyoruz
                    UserData.Image = dr["Image"].ToString();//UserData classında bulunan Image metoduna veritabanında bulunan Resim i atıyoruz
                    UserData.Email = dr["Email"].ToString();
                    UserData.Id = Convert.ToInt32(dr["Id"]);
                    UserData.Position = dr["Position"].ToString();
                    UserData.Contact = dr["Contact"].ToString();
                    UserData.LogoId = Convert.ToInt32(dr["LogoId"]);
                }
                else//Girilen veriler uyuşmadıysa eğer
                {
                    kontrol = false;//kontrol değişkenine false 
                }

            }
            //SqlConnection.ClearPool(con.baglanti());
            con.baglanti().Close();//baglantıyı kapat
            dr.Close();
            return kontrol;//kontrol değerini geri gönder
        }
        
    }
}