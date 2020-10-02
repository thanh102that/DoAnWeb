using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using Web.Models;

namespace Web.Controllers
{
    public class QuanLyLoaiController : Controller
    {
        //
        // GET: /QuanLyLoai/

        QLShopDataContext db = new QLShopDataContext();

        public ActionResult TrangQuanLyLoai()
        {
            //List<sanPham> lst = db.sanPhams.ToList();
            //return View(lst);
            return View(db.Loais.ToList());
        }


        //xóa Nhóm
        public ActionResult xoaLoai(string ms)
        {
            int t = int.Parse(ms);
            Loai sp = db.Loais.SingleOrDefault(n => n.maLoai == t);
            ViewBag.maloai = sp.maLoai;
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            return View(sp);
        }
        [HttpPost, ActionName("xoaLoai")]
        public ActionResult XNxoaLoai(string ms)
        {
            int t = int.Parse(ms);
            Loai sp = db.Loais.SingleOrDefault(n => n.maLoai == t);
            Session["h"] = ms;
            if (sp == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            db.Loais.DeleteOnSubmit(sp);
            db.SubmitChanges();
            return RedirectToAction("TrangQuanLyLoai", "QuanLyloai");
        }

        //Thêm laoij
        [HttpGet]
        public ActionResult ThemLoai()
        {
            ViewBag.MaLoai = new SelectList(db.Loais.ToList().OrderBy(n => n.tenloai), "maLoai", "tenloai");
            ViewBag.MaNhom = new SelectList(db.Nhoms.ToList().OrderBy(n => n.tenNhom), "maNhom", "tenNhom");
            ViewBag.MaNCC = new SelectList(db.nhaCungCaps.ToList().OrderBy(n => n.tenNCC), "maNCC", "tenNCC");
            return View();
        }
        [HttpPost, ActionName("ThemLoai")]
        public ActionResult themloai(HttpPostedFileBase fileUpLoad, FormCollection c)
        {
           Loai s = new Loai();
            ViewBag.MaLoai = new SelectList(db.Loais.ToList().OrderBy(n => n.tenloai), "maLoai", "tenloai");
            ViewBag.MaNhom = new SelectList(db.Nhoms.ToList().OrderBy(n => n.tenNhom), "maNhom", "tenNhom");
            ViewBag.MaNCC = new SelectList(db.nhaCungCaps.ToList().OrderBy(n => n.tenNCC), "maNCC", "tenNCC");
            if (fileUpLoad == null)
            {

            }
            if (ModelState.IsValid)
            {
                
                s.tenloai = c["txtTenLoai"];
              
                //s.maLoai = int.Parse(c["maLoai"]);
                s.maNhom= int.Parse(c["maNhom"]);
               
                db.Loais.InsertOnSubmit(s);
                db.SubmitChanges();
            }
            return RedirectToAction("TrangQuanLyLoai", "QuanLyLoai");
        }

        //sửa nhóm
        [HttpGet]
        public ActionResult SuaLoai(string id)
        {

            int t = int.Parse(id);
            Loai s = db.Loais.SingleOrDefault(n => n.maLoai == t);
            if (s == null)
            {
                Response.StatusCode = 404;
                return null;
            }
            ViewBag.MaNhom = new SelectList(db.Nhoms.ToList(), "maNhom", "tenNhom", s.maNhom);
            ViewBag.MaLoai = new SelectList(db.Loais.ToList(), "maLoai", "tenloai", s.maLoai);
            //ViewBag.MaNCC = new SelectList(db.nhaCungCaps.ToList(), "maNCC", "tenNCC", s.maNCC);

            return View(s);
        }
        [HttpPost, ActionName("SuaLoai")]
        public ActionResult sua(string id, HttpPostedFileBase fileUpLoad, FormCollection c)
        {
            int t = int.Parse(id);
            Session["l"] = id;
            Loai s = db.Loais.SingleOrDefault(n => n.maLoai == t);

            ViewBag.MaLoai = new SelectList(db.Loais.ToList().OrderBy(n => n.tenloai), "maLoai", "tenloai");
            ViewBag.MaNhom = new SelectList(db.Nhoms.ToList().OrderBy(n => n.tenNhom), "maNhom", "tenNhom");
            //ViewBag.MaNCC = new SelectList(db.nhaCungCaps.ToList().OrderBy(n => n.tenNCC), "maNCC", "tenNCC");
            if (fileUpLoad == null)
            {

            }
            if (ModelState.IsValid)
            {
                s.maNhom = int.Parse(c["MaNhom"]);
                //s.maLoai = int.Parse(c["txtMaLoai"]);
                s.tenloai = c["txtTenLoai"];

                //if (fileUpLoad != null)
                //{
                //    var fileName = Path.GetFileName(fileUpLoad.FileName);
                //    var path = Path.Combine(Server.MapPath("~/Content"), fileName);
                //    fileUpLoad.SaveAs(path);
                //    s.hinhanhdaidien = fileName;
                //}
                UpdateModel(s);
                db.SubmitChanges();
            }
            return RedirectToAction("TrangQuanLyLoai", "QuanLyLoai");
        }

    }
}
