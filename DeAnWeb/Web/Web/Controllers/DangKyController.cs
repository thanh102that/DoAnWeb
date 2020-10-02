using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Models;

namespace Web.Controllers
{
    public class DangKyController : Controller
    {
        //
        // GET: /DangKy/

        QLShopDataContext db = new QLShopDataContext();
        public ActionResult DangKy()
        {
            return View();
        }

        [HttpPost]
        public ActionResult XLDangKy(FormCollection c, KhachHang kh)
        {
            kh.tenKH = c["txtHoTen"];
            kh.TaiKhoan = c["txtTenDN"];
            kh.MatKhau = c["txtMatKhau"];
            var ngaysinh = string.Format("{0:dd/MM/YYYY}", c["txtNgaySinh"]);
            //kh.Ngayinh = DateTime.Parse(ngaysinh);
            //kh.NgaySinh = string.Format("{0: dd/MM/YYYY}", c["txtNgaySinh"]);
            kh.sdtKhach = c["txtDienThoai"];
            kh.diachi = c["txtDiaChi"];
            kh.Email = c["txtEmail"];
            var nhaplaimk = c["txtNhapLaiMK"];
            db.KhachHangs.InsertOnSubmit(kh);
            db.SubmitChanges();
            return RedirectToAction("DangNhap");
        }
        public ActionResult DangNhap()
        {
            return View();
        }

        //public ActionResult XLDangNhap(FormCollection c)
        //{
        //    var tendn = c["txtTenDN"];
        //    var mk = c["txtMatKhau"];
        //    if (string.IsNullOrEmpty(tendn))
        //    {
        //        ViewBag["loi1"] = "Phải nhập tên đăng nhập !!";
        //    }
        //    else if (string.IsNullOrEmpty(mk))
        //    {
        //        ViewBag["loi2"] = "Phải nhập mật khẩu !!";
        //    }
        //    else
        //    {
        //        //gan gia tri cho doi tuong duoc tao moi
        //        KhachHang k = db.KhachHangs.SingleOrDefault(t => t.TaiKhoan == tendn && t.MatKhau == mk);

        //        if (k != null)
        //        {
        //            Session["kh"] = k;
        //            Session["dn"] = tendn;
        //            ViewBag.ThongBao = "Đăng nhâp thành công";
        //            return RedirectToAction("TrangChu","TrangChu");
        //        }
        //        else
        //        {
        //            ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng !!";

        //        }
        //    }
           
        //    return RedirectToAction("DangNhap");
        //}

        public ActionResult XLDangNhap(FormCollection c)
        {
            var tendn = c["txtTenDN"];
            var mk = c["txtMatKhau"];
            if (string.IsNullOrEmpty(tendn))
            {
                ViewBag["loi1"] = "Phải nhập tên đăng nhập !!";
            }
            else if (string.IsNullOrEmpty(mk))
            {
                ViewBag["loi2"] = "Phải nhập mật khẩu !!";
            }
            else
            {
                //gan gia tri cho doi tuong duoc tao moi
                KhachHang k = db.KhachHangs.SingleOrDefault(t => t.TaiKhoan == tendn && t.MatKhau == mk);
                Administrator ad = db.Administrators.SingleOrDefault(t => t.taikhoan == tendn && t.matkhau == mk);
                if (k != null)
                {
                    Session["kh"] = k;
                    Session["dn"] = tendn;
                    ViewBag.ThongBao = "Đăng nhâp thành công";
                    return RedirectToAction("TrangChu", "TrangChu");
                }
                else if (ad != null)
                {
                    Session["dn"] = ad;

                    ViewBag.ThongBao = "Đăng nhâp thành công";
                    return RedirectToAction("TrangQuanLy", "QuanLy");
                }
                else
                {
                    ViewBag.ThongBao = "Tên đăng nhập hoặc mật khẩu không đúng !!";

                }
            }
            
            return RedirectToAction("DangNhap");
        }

        public ActionResult XLDangXuat()
        {
            Session["dn"] = null;
            return RedirectToAction("TrangChu", "TrangChu");
        }

    }
}
