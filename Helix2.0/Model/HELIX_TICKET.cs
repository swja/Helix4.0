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
    
    public partial class HELIX_TICKET
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HELIX_TICKET()
        {
            this.HELIX_COMENTARIO = new HashSet<HELIX_COMENTARIO>();
        }
    
        public int ID_CLIENTE { get; set; }
        public int ID_USUARIO { get; set; }
        public int ID_TICKET { get; set; }
        public Nullable<int> ID_FLUJO { get; set; }
        public Nullable<int> ID_FORMAPAGO { get; set; }
        public Nullable<int> ID_ETAPAFLUJO { get; set; }
        public string NOMBRE_TICKET { get; set; }
        public string DESCRIPCION_TICKET { get; set; }
        public Nullable<System.DateTime> FECHA_ENTREGA { get; set; }
        public Nullable<System.DateTime> FECHA_FACTURA { get; set; }
    
        public virtual HELIX_CLIENTE HELIX_CLIENTE { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HELIX_COMENTARIO> HELIX_COMENTARIO { get; set; }
        public virtual HELIX_ETAPA_FLUJO HELIX_ETAPA_FLUJO { get; set; }
        public virtual HELIX_FLUJO HELIX_FLUJO { get; set; }
        public virtual HELIX_FORMA_PAGO HELIX_FORMA_PAGO { get; set; }
        public virtual HELIX_USUARIO HELIX_USUARIO { get; set; }
    }
}