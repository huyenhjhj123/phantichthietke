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
    
    public partial class donhang
    {
        public donhang()
        {
            this.chitiet_donhang = new HashSet<chitiet_donhang>();
        }
    
        public int madh { get; set; }
        public string tennguoinhan { get; set; }
        public string diachinhan { get; set; }
        public string dienthoainhan { get; set; }
        public Nullable<bool> dagiao { get; set; }
    
        public virtual ICollection<chitiet_donhang> chitiet_donhang { get; set; }
    }
}
