using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using Web.Models;namespace Web.Controllers
{
    public class TrangChuController : Controller
    {
        //
        // GET: /TrangChu/
        QLShopDataContext db = new QLShopDataContext();

        public ActionResult TrangChu()
        {
            //List<sanPham> lst = db.sanPhams.ToList();
            //return View(lst);
            return View();
        }
       
        public ActionResult SanPham()
        {
            List<sanPham> lst = db.sanPhams.ToList();
            return View(lst);
        }
        public ActionResult ChiTietSanPham(string ms)
        {          
            List<sanPham> lst = db.sanPhams.ToList();
            sanPham a = lst.FirstOrDefault(t => t.maSP == ms);
            return View(a);
        }

        public ActionResult HienThiNhom() {
            List<Nhom> lst = db.Nhoms.ToList();
            return PartialView(lst);
        }
        public ActionResult HienThiLoai(string ms)
        {
            int m = int.Parse(ms);
            List<Loai> lst = db.Loais.ToList();
            List<Loai> a = lst.Where(t => t.maNhom == m).ToList();
            return View(a);
        }

        public ActionResult SanPhamLoai(string ms)
        {
            int m = int.Parse(ms);
            List<sanPham> lst = db.sanPhams.ToList();
            List<sanPham> a = lst.Where(t => t.maLoai == m).ToList();
            return View(a);
        }

        public ActionResult SanPhamAll()
        {
            List<sanPham> lst = db.sanPhams.ToList();
            return PartialView(lst);
        }

        public ActionResult NhaCungCap()
        {
            List<nhaCungCap> lst = db.nhaCungCaps.ToList();
            return View(lst);
        }
        public ActionResult ChiTietNCC(string ms)
        {
            int m = int.Parse(ms);
            List<nhaCungCap> lst = db.nhaCungCaps.ToList();
            nhaCungCap a = lst.FirstOrDefault(t => t.maNCC == m);
            return View(a);
        }

        public ActionResult HienThiNhomView()
        {
            List<Nhom> lst = db.Nhoms.ToList();
            return View(lst);
        }

        [HttpPost]
        public ActionResult TimKiem(FormCollection c)
        {
            var tukhoa = c["txtSearch"];
            List<sanPham> lst = db.sanPhams.ToList();
            List<sanPham> lst2 = lst.Where(t => t.tenSP.Contains(tukhoa) == true).ToList();

            return View(lst2);
        }

        //public ActionResult SanPhamLoai(string masp)
        //{
        //    int m = int.Parse(masp);
        //    List<Loai> lst = db.Loais.ToList();
        //    List<Loai> lst2 = lst.Find(n => n.maLoai == m);
        //    return PartialView(lst);
        //}
    }
}
