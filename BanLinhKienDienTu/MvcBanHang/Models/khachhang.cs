//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MvcBanHang.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class khachhang
    {
        public khachhang()
        {
            this.hoadons = new HashSet<hoadon>();
        }
    
        public int makh { get; set; }
        public string tenkh { get; set; }
        public string phai { get; set; }
        public string diachi { get; set; }
        public string email { get; set; }
        public string dienthoai { get; set; }
        public string tenDN { get; set; }
        public string matkhau { get; set; }
    
        public virtual ICollection<hoadon> hoadons { get; set; }
    }
}