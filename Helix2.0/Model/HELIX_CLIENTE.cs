//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Helix2._0.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class HELIX_CLIENTE
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HELIX_CLIENTE()
        {
            this.HELIX_TICKET = new HashSet<HELIX_TICKET>();
        }
    
        public int ID_CLIENTE { get; set; }
        public Nullable<int> ID_CIUDAD { get; set; }
        public Nullable<int> ID_TIPOINDUSTRIA { get; set; }
        public string DIRECCION { get; set; }
        public string TELEFONO { get; set; }
        public string EMAIL { get; set; }
        public string NOMBRES { get; set; }
    
        public virtual HELIX_CIUDAD HELIX_CIUDAD { get; set; }
        public virtual HELIX_TIPO_INDUSTRIA HELIX_TIPO_INDUSTRIA { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HELIX_TICKET> HELIX_TICKET { get; set; }
    }
}
