using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Models;

namespace Web.Controllers
{
    public class QuanLyController : Controller
    {
        //
        // GET: /QuanLy/
        QLShopDataContext db = new QLShopDataContext();


        public ActionResult TrangQuanLy()
        {
            //List<sanPham> lst = db.sanPhams.ToList();
            //return View(lst);
            return View(db.sanPhams.ToList());
        }

        //xóa sản phẩm
        public ActionResult xoaSanPham(string ms)
        {
            sanPham sp = db.sanPhams.SingleOrDefault(n => n.maSP == ms);
            ViewBag.maSp = sp.maSP;
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sp);
        }
        [HttpPost, ActionName("xoaSanPham")]
        public ActionResult XNxoaSanPham(string ms)
        {
            sanPham sp = db.sanPhams.SingleOrDefault(n => n.maSP == ms);
            Session["h"] = ms;
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.sanPhams.DeleteOnSubmit(sp);
            db.SubmitChanges();
            return RedirectToAction("TrangQuanLy", "QuanLy");
        }

        //Thêm sản phẩm
        [HttpGet]
        public ActionResult Them()
        {
            ViewBag.MaLoai = new SelectList(db.Loais.ToList().OrderBy(n => n.tenloai), "maLoai", "tenloai");
            ViewBag.MaNhom = new SelectList(db.Nhoms.ToList().OrderBy(n => n.tenNhom), "maNhom", "tenNhom");
            ViewBag.MaNCC = new SelectList(db.nhaCungCaps.ToList().OrderBy(n => n.tenNCC), "maNCC", "tenNCC");
            return View();
        }
        [HttpPost, ActionName("Them")]
        public ActionResult themSP(HttpPostedFileBase fileUpLoad, FormCollection c)
        {
            sanPham s = new sanPham();
            ViewBag.MaLoai = new SelectList(db.Loais.ToList().OrderBy(n => n.tenloai), "maLoai", "tenloai");
            ViewBag.MaNhom = new SelectList(db.Nhoms.ToList().OrderBy(n => n.tenNhom), "maNhom", "tenNhom");
            ViewBag.MaNCC = new SelectList(db.nhaCungCaps.ToList().OrderBy(n => n.tenNCC), "maNCC", "tenNCC");
            if (fileUpLoad == null)
            {

            }
            if (ModelState.IsValid)
            {
                s.maSP = c["txtMaSP"];
                s.tenSP = c["txtTenSP"];
                s.mota = c["txtMoTa"];
                //decimal a = decimal.Parse("txtDonGia");
                s.dongia = Decimal.Parse(c["txtDonGia"]);
                //s.NgayCapNhat = DateTime.Parse(string.Format("{0:dd/MM/yyyy}", c["txtNgayCapNhat"]));
                //s.SoLuongTon = int.Parse(c["txtSL"]);
                s.maLoai = int.Parse(c["maLoai"]);
                s.maNCC = int.Parse(c["maNCC"]);
                var fileName = Path.GetFileName(fileUpLoad.FileName);
                var path = Path.Combine(Server.MapPath("~/Content"), fileName);
                fileUpLoad.SaveAs(path);
                s.hinhanh = fileName;
                db.sanPhams.InsertOnSubmit(s);
                db.SubmitChanges();
            }
            return RedirectToAction("TrangQuanLy", "QuanLy");
        }


        [HttpGet]
        public ActionResult suaSP(string id)
        {

            sanPham s = db.sanPhams.SingleOrDefault(n => n.maSP == id);
            if (s == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaLoai = new SelectList(db.Loais.ToList(), "maLoai", "tenloai" , s.maLoai);
            ViewBag.MaNCC = new SelectList(db.nhaCungCaps.ToList(), "maNCC", "tenNCC", s.maNCC);
 
            return View(s);
        }
        [HttpPost, ActionName("suaSP")]
        public ActionResult sua(string id, HttpPostedFileBase fileUpLoad, FormCollection c)
        {
            Session["l"] = id;
            sanPham s = db.sanPhams.SingleOrDefault(n => n.maSP == id);
       
            ViewBag.MaLoai = new SelectList(db.Loais.ToList().OrderBy(n => n.tenloai), "maLoai", "tenloai");
            ViewBag.MaNhom = new SelectList(db.Nhoms.ToList().OrderBy(n => n.tenNhom), "maNhom", "tenNhom");
            ViewBag.MaNCC = new SelectList(db.nhaCungCaps.ToList().OrderBy(n => n.tenNCC), "maNCC", "tenNCC");
            if (fileUpLoad == null)
            {

            }
            if (ModelState.IsValid)
            {
               

                s.tenSP = c["txtTenSP"];
                s.mota = c["txtMoTa"];
                s.dongia = Decimal.Parse(c["txtDonGia"]);
                //s.NgayCapNhat = DateTime.Parse(string.Format("{0:dd/MM/yyyy}", c["txtNgayCapNhat"]));
                //s.SoLuongTon = int.Parse(c["txtSL"]);
                s.maLoai = int.Parse(c["maLoai"]);
                s.maNCC = int.Parse(c["maNCC"]);

                if (fileUpLoad != null)
                {                    
                    var fileName = Path.GetFileName(fileUpLoad.FileName);
                    var path = Path.Combine(Server.MapPath("~/Content"), fileName);
                    fileUpLoad.SaveAs(path);
                    s.hinhanh = fileName;
                }
                //db.Saches.InsertOnSubmit(s);
                UpdateModel(s);
                db.SubmitChanges();
            }
            return RedirectToAction("TrangQuanLy", "QuanLy");
        }

    }
}
