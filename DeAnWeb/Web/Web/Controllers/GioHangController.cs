using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Models;
namespace Web.Controllers
{
    public class GioHangController : Controller
    {
        QLShopDataContext db = new QLShopDataContext();
        //
        // GET: /GioHang/

        public ActionResult XemGioHang()
        {
            //lay gio hang
            List<GioHang> lst = Session["gh"] as List<GioHang>;

            ViewBag.TongSoLuong = TongSoLuong();
            ViewBag.ThanhTien = ThanhTien();
            return View(lst);
        }
        public ActionResult ChiTietGioHang(string ma)
        {
            // lay gio hang cua minh
            List<GioHang> lst = LayGioHang();


            GioHang a = lst.FirstOrDefault(t => t.masp == ma);

            return View(a);
        }

        public ActionResult XoaGioHang(string ma)
        {
            //// lay gio hang cua minh
            //List<GioHang> lst = LayGioHang();


            //GioHang a = lst.FirstOrDefault(t => t.masp == ma);
            //if (a != null) {
            //    lst.Remove(a);
            //    //lst.RemoveAll(t => t.masach == m);
            //}

            //return RedirectToAction("XemGioHang");

            //lay gio hang
            List<GioHang> GH = LayGioHang();
            //them 1 item vao gio

            GioHang s = GH.FirstOrDefault(t => t.masp == ma);
            //xoa
            if (s != null)
            {
                GH.RemoveAll(t => t.masp == ma);

            }
            if (GH.Count == 0)
            {
                return RedirectToAction("SanPham", "TrangChu");
            }
            return RedirectToAction("XemGioHang");
        }

        public List<GioHang> LayGioHang()
        {
            List<GioHang> lstGH = Session["gh"] as List<GioHang>;
            if (lstGH == null)
            {
                lstGH = new List<GioHang>();
                Session["gh"] = lstGH;
            }
            return lstGH;
        }

        public ActionResult ThemGioHang(string ms)
        {
            //lay gio hang
            List<GioHang> GH = LayGioHang();

            //them 1 item vao

            GioHang s = GH.FirstOrDefault(t => t.masp == ms);

            if (s == null)
            {// chua co sach nay

                GioHang a = new GioHang(ms);
                GH.Add(a);
            }
            else
            {
                s.soluong++;
            }

            //xem gio hang
            return RedirectToAction("XemGioHang");
        }

        //tong so luong
        private int TongSoLuong()
        {
            int iSumTongSL = 0;
            List<GioHang> lstGH = LayGioHang();
            if (lstGH != null)
            {
                iSumTongSL = lstGH.Sum(n => n.soluong);
            }

            return iSumTongSL;
        }

        //thanh tien
        private int ThanhTien()
        {
            int iSumTT = 0;
            List<GioHang> lstGH = LayGioHang();
            if (lstGH != null)
            {
                iSumTT = lstGH.Sum(n => n.thanhtien);
            }

            return iSumTT;
        }
        public ActionResult DatHang()
        {
            if (Session["dn"] == null)
                return RedirectToAction("DangNhap", "DangKy");

            KhachHang kh = Session["kh"] as KhachHang;
            return View(kh);
        }

        [HttpPost]
        public ActionResult XLDatHang(FormCollection c)
        {
            //var ngiao = c["txtNgayGiao"];

            List<GioHang> lstGH = Session["gh"] as List<GioHang>;
            if (lstGH == null)
                return RedirectToAction("TrangChu", "TrangChu");
            //tao don dat hang , luu don dh

            KhachHang x = Session["kh"] as KhachHang;
            HoaDon hd = new HoaDon();
            hd.maKH = x.maKH;
            hd.ngaymua = DateTime.Now;
            var ng = String.Format("{0:MM/dd/yyyy}", c["txtNgayGiao"]);
            hd.ngaygiao = DateTime.Parse(ng);
            hd.trangthaiHD = null;
            hd.DaThanhToan = null;
            db.HoaDons.InsertOnSubmit(hd);
            db.SubmitChanges();
            // lan luot lay 1 item trong gh va luu vao chi don dh
            foreach (var i in lstGH)
            {
                chiTietHoaDon ct = new chiTietHoaDon();
                ct.maHD = hd.maHD;
                ct.maSP = i.masp;
                ct.soluong = i.soluong;
                ct.ThanhTien = i.dongia;
                db.chiTietHoaDons.InsertOnSubmit(ct);

            }
            db.SubmitChanges();
            Session["gh"] = null;
            return RedirectToAction("XacNhanDonHang", "GioHang");
        }

        public ActionResult XacNhanDonHang()
        {

            return View();
        }
       
    }
}
