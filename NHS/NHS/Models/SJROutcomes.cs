//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace NHS.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class SJROutcomes
    {
        public int SJROutcome_ID { get; set; }
        public Nullable<int> PatientID { get; set; }
        public Nullable<bool> Stage2SJRRequired { get; set; }
        public string Stage2SJRDateSent { get; set; }
        public string Stage2SJRSentTo { get; set; }
        public string ReferenceNumber { get; set; }
        public Nullable<System.DateTime> DateReceived { get; set; }
        public string Comments { get; set; }
        public string CreatedBy { get; set; }
        public Nullable<System.DateTime> CreateDate { get; set; }
        public string UpdatedBy { get; set; }
        public Nullable<System.DateTime> UpdatedDate { get; set; }
    
        public virtual PatientDetails PatientDetails { get; set; }
    }
}
