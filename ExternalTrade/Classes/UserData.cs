using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ExternalTrade.Classes
{
    public class UserData
    {
        //public static string KullaniciAdi, Sifre, Ad, Soyad, Resim, Yetki, Eposta, Pozisyon, TelNo;
        //public static int id, logoid;

        public static string UserName//UserName adında Method oluştur
        {
            //get ve set komutları ile Kullanıcının Giriş yaptıktan sonra Kullanıcı Adı nı al
            get { return (string)HttpContext.Current.Session["UserName"]; }
            set { HttpContext.Current.Session["UserName"] = value; }
            //get { return KullaniciAdi; }
            //set { KullaniciAdi = value; }
        }
        public static string Password
        {
            //get ve set komutları ile Kullanıcının Giriş yaptıktan sonra Şifresini al
            get { return (string)HttpContext.Current.Session["Password"]; }
            set { HttpContext.Current.Session["Password"] = value; }
            //get { return Sifre; }
            //set { Sifre = value; }
        }
        public static string Name
        {
            //get ve set komutları ile Kullanıcının Giriş yaptıktan sonra Adını al
            get { return (string)HttpContext.Current.Session["Name"]; }
            set { HttpContext.Current.Session["Name"] = value; }
            //get { return Ad; }
            //set { Ad = value; }
        }
        public static string SurName
        {
            //get ve set komutları ile Kullanıcının Giriş yaptıktan sonra Soyadını al
            get { return (string)HttpContext.Current.Session["SurName"]; }
            set { HttpContext.Current.Session["SurName"] = value; }
            //get { return Soyad; }
            //set { Soyad = value; }
        }
        public static string Authority
        {
            //get ve set komutları ile Kullanıcının Giriş yaptıktan sonra Yetkisini Adı nı al
            get { return (string)HttpContext.Current.Session["Authority"]; }
            set { HttpContext.Current.Session["Authority"] = value; }
            //get { return Yetki; }
            //set { Yetki = value; }
        }
        public static string Image
        {
            //get { return Resim; }
            //set { Resim = value; }
            //get ve set komutları ile Kullanıcının Giriş yaptıktan sonra Resmini Adı nı al
            get { return (string)HttpContext.Current.Session["Image"]; }
            set { HttpContext.Current.Session["Image"] = value; }
        }
        public static string Email
        {
            //get { return Eposta; }
            //set { Eposta = value; }
            //get ve set komutları ile Kullanıcının Giriş yaptıktan sonra Resmini Adı nı al
            get { return (string)HttpContext.Current.Session["Email"]; }
            set { HttpContext.Current.Session["Email"] = value; }
        }
        public static int Id
        {
            //get { return id; }
            //set { id = value; }
            get { return (int)HttpContext.Current.Session["Id"]; }
            set { HttpContext.Current.Session["Id"] = value; }


        }
        public static string Position
        {
            //get { return Pozisyon; }
            //set { Pozisyon = value; }
            get { return (string)HttpContext.Current.Session["Position"]; }
            set { HttpContext.Current.Session["Position"] = value; }
        }
        public static string Contact
        {
            //get { return TelNo; }
            //set { TelNo = value; }
            get { return (string)HttpContext.Current.Session["Contact"]; }
            set { HttpContext.Current.Session["Contact"] = value; }
        }
        public static int LogoId
        {
            //get { return logoid; }
            //set { logoid = value; }
            get { return (int)HttpContext.Current.Session["LogoId"]; }
            set { HttpContext.Current.Session["LogoId"] = value; }
        }
    }
}