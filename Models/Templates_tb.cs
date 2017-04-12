namespace SSISApplication.Generator.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;
    using System.Web.Mvc;

    public partial class Templates_tb
    {
        [Key]
        [StringLength(50)]
        public string Template_Name { get; set; }

        [Column(TypeName = "ntext")]
        [AllowHtml]
        [DataType(DataType.MultilineText)]
        public string Template_Content { get; set; }
    }
}
