using MvcBanHang.Models;
using MvcBanHang.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcBanHang.Controllers
{
    public class ShoppingController : Controller
    {
        BanHangEntities db = new BanHangEntities();

        public ActionResult Index()
        {
            return View(db.donhangs);
        }

        #region Thêm Đơn Hàng
        public ActionResult Create()
        {
            if (Session["KhachHang"] == null)
            {
                return RedirectToAction("Index", "Customer");
            }
            else
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult Create([Bind(Exclude = "madh")]donhang model)
        {
            var GioHang_List = (List<CartViewModel>)Session["Cart"];
            var ChiTietDonHang_List = new List<chitiet_donhang>();
            GioHang_List.ForEach(m =>
            {
                var _sanpham = db.sanphams.Find(m.Product.masp);
                ChiTietDonHang_List.Add(new chitiet_donhang
                {
                    masp = _sanpham.masp,
                    soluong = m.Quantity
                });
            });
            model.dagiao = false;
            model.chitiet_donhang = ChiTietDonHang_List;
            db.donhangs.Add(model);
            db.SaveChanges();
            Session["Cart"] = null;
            return RedirectToAction("CreateSuccess");
        }

        public ActionResult CreateSuccess()
        {
            return View();
        }
        #endregion

        #region Chi Tiết Đơn Hàng
        public ActionResult Details(int id)
        {
            return View(db.donhangs.Find(id));
        }
        #endregion

        #region Xóa Đơn Hàng
        [HttpPost]
        public ActionResult Delete(int id)
        {
            var _donhang = db.donhangs.Find(id);
            _donhang.chitiet_donhang.ToList().ForEach(m => db.chitiet_donhang.Remove(m));
            db.donhangs.Remove(_donhang);
            db.SaveChanges();
            return new EmptyResult();
        }
        #endregion

        #region Giỏ Hàng
        public ActionResult ShowCart()
        {
            return View();
        }
        public ActionResult AddToCart(int id)
        {
            var _sanpham = db.sanphams.Find(id);
            var GioHang_List = new List<CartViewModel>();
            if (Session["Cart"] != null)
            {
                GioHang_List = (List<CartViewModel>)Session["Cart"];
                var OldCart = GioHang_List.Find(m => m.Product.masp == id);
                if (OldCart != null)
                {
                    var NewCart = new CartViewModel { Product = _sanpham, Quantity = OldCart.Quantity + 1 };
                    GioHang_List.Remove(OldCart);
                    GioHang_List.Add(NewCart);
                }
                else
                {
                    GioHang_List.Add(new CartViewModel { Product = _sanpham, Quantity = 1 });
                }
            }
            else
            {
                GioHang_List.Add(new CartViewModel { Product = _sanpham, Quantity = 1 });
            }
            Session["Cart"] = GioHang_List;
            return RedirectToAction("ShowCart");
        }

        public ActionResult RemoveCart(int id)
        {
            var GioHang_List = (List<CartViewModel>)Session["Cart"];
            var _GioHang = GioHang_List.SingleOrDefault(m => m.Product.masp == id);
            GioHang_List.Remove(_GioHang);
            Session["Cart"] = GioHang_List;
            return new EmptyResult();
        }
        #endregion
    }
}
