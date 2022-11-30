using MvcBanHang.Models;
using MvcBanHang.ViewModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
namespace MvcBanHang.Controllers
{
    public class AccountController : Controller
    {

        BanHangEntities db = new BanHangEntities();
        public ActionResult Index()
        {
            return View(db.nhanviens);
        }
        #region Đăng Nhập
        [HttpGet]
        public ActionResult LogOn()
        {
            return View();
        }

        [HttpPost]
        public ActionResult LogOn(LogOnModel model)
        {
            BanHangEntities db=new BanHangEntities();
            if (ModelState.IsValid)
            {
                var UserLogOn = BanHangLogic.CheckUser(model.tenDN, model.matkhau);
                if (UserLogOn != null)
                {
                    FormsAuthentication.SetAuthCookie(UserLogOn.tenDN, true);
                    return RedirectToAction("Index");
                }              
                return View("LogOn", model);
            }
            return View("LogOn", model);
        }
        #endregion

        #region Đăng Xuất
        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Product");
        }
        #endregion

        #region Tạo Tài Khoản
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(UserModel model)
        {            
            var _OldUserName = (from kh in db.khachhangs where kh.tenDN.Contains(model.tenDN) select kh).FirstOrDefault();
            if (_OldUserName == null)
            {
                var _User = new khachhang
                {
                    tenkh = model.tenkh,
                    phai = model.phai,
                    diachi = model.diachi,
                    email = model.email,
                    dienthoai = model.dienthoai,
                    tenDN = model.tenDN,
                    matkhau = model.matkhau.GetMD5()
                };

                db.khachhangs.Add(_User);
                db.SaveChanges();
                return RedirectToAction("Index", "Customer");
            }           
            ViewBag.Message = "Tên đăng nhập đã tồn tại";
            return View(model);
        }
        #endregion

        #region Đổi mật khẩu
        public ActionResult ChangePass()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ChangePass(ChangePassModel model)
        {           
            if (ModelState.IsValid)
            {                
                var UserLogOn = BanHangLogic.UserLogOn();
                if (UserLogOn.matkhau == model.OldPassword.GetMD5())
                {
                    UserLogOn.matkhau = model.NewPassword.GetMD5();                    
                    db.Entry(UserLogOn).State = EntityState.Modified;
                    db.SaveChanges();
                    ViewBag.Message = "Đổi mật khẩu thành công";
                }
                else
                {
                    ViewBag.Message = "Mật Khẩu cũ không đúng";
                }
                return View();
            }
            return View();
        }
        #endregion

    }
}
