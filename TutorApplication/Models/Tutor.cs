//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace TutorApplication.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Tutor
    {
        public Tutor()
        {
            this.Hires = new HashSet<Hire>();
        }
    
        public int TutorId { get; set; }
        public string Name { get; set; }
        public Nullable<System.DateTime> DOB { get; set; }
        public string Nationality { get; set; }
        public Nullable<decimal> HourlyRate { get; set; }
        public string Contact { get; set; }
        public string EmailId { get; set; }
        public string Photo { get; set; }
        public string Address { get; set; }
        public Nullable<int> SubjectId { get; set; }
    
        public virtual ICollection<Hire> Hires { get; set; }
        public virtual Subject Subject { get; set; }
    }
}
