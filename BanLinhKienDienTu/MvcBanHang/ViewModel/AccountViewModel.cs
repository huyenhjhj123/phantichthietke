using System.ComponentModel.DataAnnotations;
namespace MvcBanHang.ViewModel
{
    #region LogOnModel
    public class LogOnModel
    {
        [Required, Display(Name = "Tên Đăng Nhập")]
        public string tenDN { get; set; }
        [Required, DataType(DataType.Password), Display(Name = "Mật Khẩu")]
        public string matkhau { get; set; }

        [Display(Name = "Ghi nhớ đăng nhập")]
        public bool RememberMe { get; set; }
    }
    #endregion

    #region Register UserModel
    public class UserModel
    {        
        [Required, Display(Name = "Ten Khach Hang")]
        public string tenkh { get; set; }

        [Required, Display(Name = "Gioi tinh")]
        public string phai { get; set; }

        [Required, Display(Name = "Dia chi")]
        public string diachi { get; set; }

        [Required, Display(Name = "Email")]
        public string email { get; set; }

        [Required, Display(Name = "Dien thoai")]
        public string dienthoai { get; set; }

        [Required, Display(Name = "Tên Đăng Nhập")]
        public string tenDN { get; set; }

        [Required, Display(Name = "Mật Khẩu"), DataType(DataType.Password)]
        public string matkhau { get; set; }

        [Display(Name = "Nhập Lại Mật Khẩu"), DataType(DataType.Password), System.Web.Mvc.Compare("matkhau", ErrorMessage = "Mật khẩu mới và xác nhận mật khẩu không khớp")]
        public string ConfirmPassword { get; set; }
    }
    #endregion

    #region ChangePassModel
    public class ChangePassModel
    {
        [Required, DataType(DataType.Password), Display(Name = "Mật Khẩu Hiện Tại")]
        public string OldPassword { get; set; }
        [Required, DataType(DataType.Password), Display(Name = "Mật Khẩu Mới")]
        public string NewPassword { get; set; }
        [DataType(DataType.Password), Display(Name = "Nhập Lại Mật Khẩu Mới"), Compare("NewPassword", ErrorMessage = "Mật khẩu mới và xác nhận mật khẩu không khớp")]
        public string ConfirmPassword { get; set; }
    }
    #endregion

}