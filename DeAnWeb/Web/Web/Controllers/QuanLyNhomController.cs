using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Models;

namespace Web.Controllers
{
    public class QuanLyNhomController : Controller
    {
        //
        // GET: /QuanLyNhom/
        QLShopDataContext db = new QLShopDataContext();

        public ActionResult TrangQuanLyNhom()
        {
            //List<sanPham> lst = db.sanPhams.ToList();
            //return View(lst);
            return View(db.Nhoms.ToList());
        }


        //xóa Nhóm
        public ActionResult xoaNhom(string ms)
        {
            int t = int.Parse(ms);
            Nhom sp = db.Nhoms.SingleOrDefault(n => n.maNhom == t);
            ViewBag.maNhom = sp.maNhom;
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sp);
        }
        [HttpPost, ActionName("xoaNhom")]
        public ActionResult XNxoaNhom(string ms)
        {
            int t = int.Parse(ms);
            Nhom sp = db.Nhoms.SingleOrDefault(n => n.maNhom == t);
            Session["h"] = ms;
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.Nhoms.DeleteOnSubmit(sp);
            db.SubmitChanges();
            return RedirectToAction("TrangQuanLyNhom", "QuanLyNhom");
        }

        //Thêm sản phẩm
        [HttpGet]
        public ActionResult ThemNhom()
        {
            //ViewBag.MaLoai = new SelectList(db.Loais.ToList().OrderBy(n => n.tenloai), "maLoai", "tenloai");
            ViewBag.MaNhom = new SelectList(db.Nhoms.ToList().OrderBy(n => n.tenNhom), "maNhom", "tenNhom");
            //ViewBag.MaNCC = new SelectList(db.nhaCungCaps.ToList().OrderBy(n => n.tenNCC), "maNCC", "tenNCC");
            return View();
        }
        [HttpPost, ActionName("ThemNhom")]
        public ActionResult themNhom(HttpPostedFileBase fileUpLoad, FormCollection c)
        {
            Nhom s = new Nhom();
            //ViewBag.MaLoai = new SelectList(db.Loais.ToList().OrderBy(n => n.tenloai), "maLoai", "tenloai");
            ViewBag.MaNhom = new SelectList(db.Nhoms.ToList().OrderBy(n => n.tenNhom), "maNhom", "tenNhom");
            //ViewBag.MaNCC = new SelectList(db.nhaCungCaps.ToList().OrderBy(n => n.tenNCC), "maNCC", "tenNCC");
            if (fileUpLoad == null)
            {

            }
            if (ModelState.IsValid)
            {

                s.tenNhom = c["txtTenNhom"];        
                var fileName = Path.GetFileName(fileUpLoad.FileName);
                var path = Path.Combine(Server.MapPath("~/Content"), fileName);
                fileUpLoad.SaveAs(path);
                s.hinhanhdaidien = fileName;
                db.Nhoms.InsertOnSubmit(s);
                db.SubmitChanges();
            }
            return RedirectToAction("TrangQuanLyNhom", "QuanLyNhom");
        }

        //sửa nhóm
        [HttpGet]
        public ActionResult SuaNhom(string id)
        {

            int t = int.Parse(id);
            Nhom s = db.Nhoms.SingleOrDefault(n => n.maNhom == t);
            if (s == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaNhom = new SelectList(db.Nhoms.ToList(), "maNhom", "tenNhom" , s.maNhom);
            //ViewBag.MaLoai = new SelectList(db.Loais.ToList(), "maLoai", "tenloai", s.maLoai);
            //ViewBag.MaNCC = new SelectList(db.nhaCungCaps.ToList(), "maNCC", "tenNCC", s.maNCC);

            return View(s);
        }
        [HttpPost, ActionName("SuaNhom")]
        public ActionResult sua(string id, HttpPostedFileBase fileUpLoad, FormCollection c)
        {
            int t = int.Parse(id);
            Session["l"] = id;
           Nhom s = db.Nhoms.SingleOrDefault(n => n.maNhom == t);

            //ViewBag.MaLoai = new SelectList(db.Loais.ToList().OrderBy(n => n.tenloai), "maLoai", "tenloai");
            ViewBag.MaNhom = new SelectList(db.Nhoms.ToList().OrderBy(n => n.tenNhom), "maNhom", "tenNhom");
            //ViewBag.MaNCC = new SelectList(db.nhaCungCaps.ToList().OrderBy(n => n.tenNCC), "maNCC", "tenNCC");
            if (fileUpLoad == null)
            {

            }
            if (ModelState.IsValid)
            {
                s.tenNhom = c["txtTenNhom"];           

                if (fileUpLoad != null)
                {
                    var fileName = Path.GetFileName(fileUpLoad.FileName);
                    var path = Path.Combine(Server.MapPath("~/Content"), fileName);
                    fileUpLoad.SaveAs(path);
                    s.hinhanhdaidien = fileName;
                }
                UpdateModel(s);
                db.SubmitChanges();
            }
            return RedirectToAction("TrangQuanLyNhom", "QuanLyNhom");
        }
    }
}
