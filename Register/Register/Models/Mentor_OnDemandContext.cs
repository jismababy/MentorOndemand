using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace Register.Models
{
    public partial class Mentor_OnDemandContext : DbContext
    {
        public Mentor_OnDemandContext()
        {
        }

        public Mentor_OnDemandContext(DbContextOptions<Mentor_OnDemandContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Admin> Admin { get; set; }
        public virtual DbSet<Mentor> Mentor { get; set; }
        public virtual DbSet<MentorSkills> MentorSkills { get; set; }
        public virtual DbSet<TechnologySkills> TechnologySkills { get; set; }
        public virtual DbSet<Trainings> Trainings { get; set; }
        public virtual DbSet<Users> Users { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=(local);Database=Mentor_OnDemand;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Admin>(entity =>
            {
                entity.ToTable("admin");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Password)
                    .HasColumnName("password")
                    .HasMaxLength(25)
                    .IsUnicode(false);

                entity.Property(e => e.Username)
                    .HasColumnName("username")
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Mentor>(entity =>
            {
                entity.HasKey(e => e.MtId);

                entity.ToTable("mentor");

                entity.HasIndex(e => e.MtContactNumber)
                    .HasName("UQ__mentor__7AAD9C7254AA19F1")
                    .IsUnique();

                entity.HasIndex(e => e.MtLinkedinUrl)
                    .HasName("UQ__mentor__9F49C30A90CB546D")
                    .IsUnique();

                entity.HasIndex(e => e.MtUsername)
                    .HasName("UQ__mentor__D40B05D144D31A36")
                    .IsUnique();

                entity.Property(e => e.MtId).HasColumnName("mt_id");

                entity.Property(e => e.MtActive).HasColumnName("mt_active");

                entity.Property(e => e.MtContactNumber).HasColumnName("mt_contactNumber");

                entity.Property(e => e.MtFirstName)
                    .HasColumnName("mt_firstName")
                    .HasMaxLength(25)
                    .IsUnicode(false);

                entity.Property(e => e.MtLastName)
                    .HasColumnName("mt_lastName")
                    .HasMaxLength(25)
                    .IsUnicode(false);

                entity.Property(e => e.MtLinkedinUrl)
                    .HasColumnName("mt_linkedin_url")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.MtPassword)
                    .HasColumnName("mt_password")
                    .HasMaxLength(40)
                    .IsUnicode(false);

                entity.Property(e => e.MtRegCode).HasColumnName("mt_reg_code");

                entity.Property(e => e.MtRegDatetime)
                    .HasColumnName("mt_reg_datetime")
                    .HasColumnType("date");

                entity.Property(e => e.MtUsername)
                    .HasColumnName("mt_username")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.MtYearsOfExperience).HasColumnName("mt_years_of_experience");
            });

            modelBuilder.Entity<MentorSkills>(entity =>
            {
                entity.HasKey(e => e.MsId);

                entity.ToTable("mentor_skills");

                entity.Property(e => e.MsId).HasColumnName("ms_id");

                entity.Property(e => e.FacilitiesOffered)
                    .HasColumnName("facilities_offered")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Mid).HasColumnName("mid");

                entity.Property(e => e.SelfRating).HasColumnName("self_rating");

                entity.Property(e => e.Sid).HasColumnName("sid");

                entity.Property(e => e.TrainingsDelivered).HasColumnName("trainings_delivered");

                entity.Property(e => e.YearsOfExp).HasColumnName("years_of_exp");

                entity.HasOne(d => d.M)
                    .WithMany(p => p.MentorSkills)
                    .HasForeignKey(d => d.Mid)
                    .HasConstraintName("FK__mentor_skil__mid__1CF15040");

                entity.HasOne(d => d.S)
                    .WithMany(p => p.MentorSkills)
                    .HasForeignKey(d => d.Sid)
                    .HasConstraintName("FK__mentor_skil__sid__1DE57479");
            });

            modelBuilder.Entity<TechnologySkills>(entity =>
            {
                entity.HasKey(e => e.SkId);

                entity.ToTable("technology_skills");

                entity.Property(e => e.SkId).HasColumnName("sk_id");

                entity.Property(e => e.SkDuration).HasColumnName("sk_duration");

                entity.Property(e => e.SkName)
                    .HasColumnName("sk_name")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.SkPrerequites)
                    .HasColumnName("sk_prerequites")
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.SkToc)
                    .HasColumnName("sk_toc")
                    .HasMaxLength(50)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Trainings>(entity =>
            {
                entity.HasKey(e => e.TrId);

                entity.ToTable("trainings");

                entity.Property(e => e.TrId).HasColumnName("tr_id");

                entity.Property(e => e.AmountReceived).HasColumnName("amount_received");

                entity.Property(e => e.MentorId).HasColumnName("mentor_id");

                entity.Property(e => e.Progress)
                    .HasColumnName("progress")
                    .HasMaxLength(25)
                    .IsUnicode(false);

                entity.Property(e => e.Rating).HasColumnName("rating");

                entity.Property(e => e.SkillId).HasColumnName("skill_id");

                entity.Property(e => e.StartDate)
                    .HasColumnName("start_date")
                    .HasColumnType("date");

                entity.Property(e => e.Status)
                    .HasColumnName("status")
                    .HasMaxLength(25)
                    .IsUnicode(false);

                entity.Property(e => e.UserId).HasColumnName("user_id");

                entity.HasOne(d => d.Mentor)
                    .WithMany(p => p.Trainings)
                    .HasForeignKey(d => d.MentorId)
                    .HasConstraintName("FK__trainings__mento__21B6055D");

                entity.HasOne(d => d.Skill)
                    .WithMany(p => p.Trainings)
                    .HasForeignKey(d => d.SkillId)
                    .HasConstraintName("FK__trainings__skill__22AA2996");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Trainings)
                    .HasForeignKey(d => d.UserId)
                    .HasConstraintName("FK__trainings__user___20C1E124");
            });

            modelBuilder.Entity<Users>(entity =>
            {
                entity.HasKey(e => e.UsId);

                entity.ToTable("users");

                entity.HasIndex(e => e.UsContactNumber)
                    .HasName("UQ__users__05F9FF1DC929BA72")
                    .IsUnique();

                entity.HasIndex(e => e.UsUsername)
                    .HasName("UQ__users__07AF65FA50AB6585")
                    .IsUnique();

                entity.Property(e => e.UsId).HasColumnName("us_id");

                entity.Property(e => e.UsActive).HasColumnName("us_active");

                entity.Property(e => e.UsContactNumber).HasColumnName("us_contactNumber");

                entity.Property(e => e.UsFirstName)
                    .HasColumnName("us_firstName")
                    .HasMaxLength(25)
                    .IsUnicode(false);

                entity.Property(e => e.UsForceResetPassword).HasColumnName("us_force_reset_password");

                entity.Property(e => e.UsLastName)
                    .HasColumnName("us_lastName")
                    .HasMaxLength(25)
                    .IsUnicode(false);

                entity.Property(e => e.UsPassword)
                    .HasColumnName("us_password")
                    .HasMaxLength(40)
                    .IsUnicode(false);

                entity.Property(e => e.UsRegDatetime)
                    .HasColumnName("us_reg_datetime")
                    .HasColumnType("date");

                entity.Property(e => e.UsRegcode).HasColumnName("us_regcode");

                entity.Property(e => e.UsUsername)
                    .HasColumnName("us_username")
                    .HasMaxLength(40)
                    .IsUnicode(false);
            });
        }
    }
}
