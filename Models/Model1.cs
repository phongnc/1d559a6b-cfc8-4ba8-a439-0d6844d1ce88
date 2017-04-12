namespace SSISApplication.Generator.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=Model1")
        {
        }

        public virtual DbSet<Columns_tb> Columns_tb { get; set; }
        public virtual DbSet<Tables_tb> Tables_tb { get; set; }
        public virtual DbSet<Templates_tb> Templates_tb { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Columns_tb>()
                .Property(e => e.Table_Name)
                .IsUnicode(false);

            modelBuilder.Entity<Columns_tb>()
                .Property(e => e.Column_Name)
                .IsUnicode(false);

            modelBuilder.Entity<Columns_tb>()
                .Property(e => e.Use_As)
                .IsUnicode(false);

            modelBuilder.Entity<Tables_tb>()
                .Property(e => e.Use_As)
                .IsUnicode(false);

            modelBuilder.Entity<Templates_tb>()
                .Property(e => e.Template_Name)
                .IsUnicode(false);
        }
    }
}
