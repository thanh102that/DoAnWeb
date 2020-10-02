using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Web.Models;
namespace Web.Models
{
    public class GioHang
    {
        QLShopDataContext db = new QLShopDataContext();
        public string masp { get; set; }
        public string tensp { get; set; }
        public string hinhanh { get; set; }
        public int mancc { get; set; }
        public int maloai { get; set; }
        public string size { get; set; }
        public int dongia { get; set; }
        public int soluong { get; set; }
        public int thanhtien
        {
            get { return soluong * dongia; }
        }

        public GioHang(string ms)
        {

            sanPham a = db.sanPhams.FirstOrDefault(t => t.maSP == ms);

            masp = ms;
            tensp = a.tenSP;
            mancc = (int)a.maNCC;
            maloai = (int)a.maLoai;
            size = a.Size;
            hinhanh = a.hinhanh;
            dongia = (int)a.dongia;
            soluong = 1;
        }
        //    --maSP varchar(50) ,
        //--maNCC int ,
        //--maLoai int ,
        //--tenSP Nvarchar(200),
        //--Size varchar(10),
        //--dongia money,	
        //--hinhanh Nvarchar(MAX),
        //--mota Nvarchar(MAX),
    }
}