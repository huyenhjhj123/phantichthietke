using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MvcBanHang.Models
{
    public class BanHangLogic
    {
        #region Lấy về User đăng nhập
        public static nhanvien UserLogOn()
        {
            BanHangEntities db = new BanHangEntities();
            return db.nhanviens.FirstOrDefault(m => m.tenDN.Contains(System.Web.HttpContext.Current.User.Identity.Name));
        }
        #endregion

        #region Check UserLogOnNhanvien
        public static nhanvien CheckUser(string UserName, string Password)
        {
            var passMD5 = Password.GetMD5();
            BanHangEntities db = new BanHangEntities();
            var nv=db.nhanviens;
            var UserLogOn = (from a in nv where a.tenDN.Contains(UserName) && a.matkhau.Contains(passMD5) select a).SingleOrDefault();
            return UserLogOn;
        }
        #endregion

        #region Check UserLogOnKhachHang
        public static khachhang CheckKhachHang(string UserName, string Password)
        {
            var passMD5 = Password.GetMD5();
            BanHangEntities db = new BanHangEntities();
            var kh = db.khachhangs;
            var khachhang = (from a in kh where a.tenDN.Contains(UserName) && a.matkhau.Contains(passMD5) select a).SingleOrDefault();
            return khachhang;
        }
        #endregion
    }
}