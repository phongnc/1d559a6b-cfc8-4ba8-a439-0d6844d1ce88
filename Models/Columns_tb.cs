namespace SSISApplication.Generator.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Columns_tb
    {
        public int Id { get; set; }

        [Required]
        [StringLength(50)]
        public string Table_Name { get; set; }

        [Required]
        [StringLength(50)]
        public string Column_Name { get; set; }

        [StringLength(50)]
        public string Display_Name { get; set; }

        [StringLength(1000)]
        public string Use_As { get; set; }
    }
}
