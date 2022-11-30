using MvcBanHang.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcBanHang.Controllers
{
    public class ProductController : Controller
    {
        BanHangEntities db = new BanHangEntities();

        #region Hiển thị SP
        public ActionResult Index()
        {
            ViewBag.BestSellsers = db.sanphams.OrderByDescending(x => x.solanxem).Take(8);
            var sanpham = db.sanphams.OrderByDescending(x => x.ngaycapnhat).Take(12);
            return View(sanpham);
        }
        public ActionResult ProductId(int id)
        {
            return View(db.sanphams.Where(m => m.maloai == id));
        }
        public ActionResult Details(int id)
        {
            var currentProduct = db.sanphams.Find(id);
            ViewBag.SPcungLoai = db.sanphams.Where(x => x.maloai == currentProduct.maloai);

            // Cap nhat so lan xem
            currentProduct.solanxem = currentProduct.solanxem + 1;
            db.Entry(currentProduct).State = EntityState.Modified;
            db.SaveChanges();

            return View(db.sanphams.Find(id));
        }        
        #endregion

        #region Thêm SP
        public ActionResult Create()
        {
            ViewBag.maloai = new SelectList(db.loais, "maloai", "tenloai");
            ViewBag.macn = new SelectList(db.congnghes, "macn", "loaicn");
            ViewBag.madl = new SelectList(db.dungluongs, "madl", "loaidl");
            ViewBag.mahsx = new SelectList(db.hangsanxuats, "mahsx", "tenhsx");            
            ViewBag.mancc = new SelectList(db.nhacungcaps, "mancc", "tenncc");
            return View();
        }

        [HttpPost]
        public ActionResult Create(sanpham sanpham, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {                
                sanpham.hinhsp = Path.GetFileName(file.FileName);
                sanpham.ngaycapnhat = DateTime.Now;
                sanpham.donvitinh = "Cái";                
                sanpham.solanxem = 0;
                db.sanphams.Add(sanpham);
                db.SaveChanges();
                if (file.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(file.FileName);
                    var path = Path.Combine(Server.MapPath("~/Content/Sanpham"), fileName);
                    file.SaveAs(path);
                }
                return RedirectToAction("Index");
            }

            ViewBag.macn = new SelectList(db.congnghes, "macn", "loaicn", sanpham.macn);
            ViewBag.madl = new SelectList(db.dungluongs, "madl", "loaidl", sanpham.madl);
            ViewBag.mahsx = new SelectList(db.hangsanxuats, "mahsx", "tenhsx", sanpham.mahsx);
            ViewBag.maloai = new SelectList(db.loais, "maloai", "tenloai", sanpham.maloai);
            ViewBag.mancc = new SelectList(db.nhacungcaps, "mancc", "tenncc", sanpham.mancc);
            return View(sanpham);
        }
        #endregion

        #region Sửa SP
        public ActionResult Edit(int id)
        {
            var product = db.sanphams.Find(id);
            ViewBag.maloai = new SelectList(db.loais, "maloai", "tenloai", product.maloai);
            ViewBag.mancc = new SelectList(db.nhacungcaps, "mancc", "tenncc", product.mancc);
            ViewBag.mahsx = new SelectList(db.hangsanxuats, "mahsx", "tenhsx", product.mahsx);
            return View(product);
        }
        [HttpPost]
        public ActionResult Edit(sanpham model, HttpPostedFileBase file)
        {
            if (ModelState.IsValid)
            {
                model.hinhsp = Path.GetFileName(file.FileName);
                db.Entry(model).State = EntityState.Modified;
                db.SaveChanges();

                if (file.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(file.FileName);
                    var path = Path.Combine(Server.MapPath("~/Content/Sanpham"), fileName);
                    file.SaveAs(path);
                }

                return RedirectToAction("Details", new { id = model.masp });
            }
            ViewBag.maloai = new SelectList(db.loais, "maloai", "tenloai", model.maloai);
            ViewBag.mancc = new SelectList(db.nhacungcaps, "mancc", "tenncc", model.mancc);
            ViewBag.mahsx = new SelectList(db.hangsanxuats, "mahsx", "tenhsx", model.mahsx);
            return View(model);
        }
        #endregion

        #region Xóa SP
        [HttpPost]
        public JsonResult Delete(int id)
        {
            var product = db.sanphams.Find(id);
            db.sanphams.Remove(product);
            db.SaveChanges();
            return Json(new { Status = 1 }, JsonRequestBehavior.AllowGet);
        }
        #endregion
        
    }
}
