using MvcBanHang.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcBanHang.Controllers
{
    public class CategoryController : Controller
    {
        BanHangEntities db = new BanHangEntities();

        public ActionResult Index()
        {
            return View(db.loais);
        }

        #region Lấy SP theo loại
        public ActionResult CategoryByID(int id)
        {
            ViewBag.Tenloai = db.sanphams.Where(x => x.maloai == id).FirstOrDefault().loai.tenloai;
            return View(db.sanphams.Where(a => a.maloai == id));
        }
        #endregion

        #region menu loạiSP
        public ActionResult GetCategory()
        {
            return PartialView("CategoryPartial", db.loais);
        }
        #endregion

        #region Thêm LoạiSP
        [HttpGet]
        public ActionResult Create()
        {            
            return View();
        }
        [HttpPost]
        public ActionResult Create([Bind(Exclude = "maloai")]loai model)
        {
            if (ModelState.IsValid)
            {
                db.loais.Add(model);
                db.SaveChanges();
                return RedirectToAction("Index");
            }            
            return View(model);
        }
        #endregion

        #region Sửa LoạiSP
        [HttpGet]
        public ActionResult Edit(int id)
        {           
            return View(db.loais.Find(id));
        }

        [HttpPost]
        public ActionResult Edit(loai model)
        {
            if (ModelState.IsValid)
            {
                db.Entry(model).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }           
            return View(model);
        }
        #endregion

        #region Xóa LoạiSP
        [HttpPost]
        public ActionResult Delete(int id)
        {
            var _Category = db.loais.Find(id);           
            _Category.sanphams.ToList().ForEach(m=>db.sanphams.Remove(m));
            db.loais.Remove(_Category);
            db.SaveChanges();
            return new EmptyResult();
        }
        #endregion
    }
}
