using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MvcBanHang.Models;

namespace MvcBanHang.ViewModel
{
    public class ProductViewModel
    {
        public int maloai { get; set; }
        public sanpham sanpham { get; set; }
        public int soluongsp { get; set; }
        public IEnumerable<sanpham> sanphams{ get; set; }
    }
}