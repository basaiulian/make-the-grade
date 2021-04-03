﻿// <auto-generated />
using System;
using MakeTheGradeAPI.Model;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace MakeTheGradeAPI.Data.Migrations
{
    [DbContext(typeof(DataContext))]
    partial class DataContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "6.0.0-preview.2.21154.2");

            modelBuilder.Entity("MakeTheGradeAPI.Entities.Test", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<int?>("AssignerId")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Discriminator")
                        .IsRequired()
                        .HasColumnType("TEXT");

                    b.Property<string>("Question")
                        .HasColumnType("TEXT");

                    b.Property<float>("Score")
                        .HasColumnType("REAL");

                    b.HasKey("Id");

                    b.HasIndex("AssignerId");

                    b.ToTable("Test");

                    b.HasDiscriminator<string>("Discriminator").HasValue("Test");
                });

            modelBuilder.Entity("MakeTheGradeAPI.Entities.User", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("Address")
                        .HasColumnType("TEXT");

                    b.Property<string>("Discriminator")
                        .IsRequired()
                        .HasColumnType("TEXT");

                    b.Property<string>("Email")
                        .HasColumnType("TEXT");

                    b.Property<string>("Password")
                        .HasColumnType("TEXT");

                    b.Property<string>("PhoneNumber")
                        .HasColumnType("TEXT");

                    b.Property<string>("Username")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("User");

                    b.HasDiscriminator<string>("Discriminator").HasValue("User");
                });

            modelBuilder.Entity("MakeTheGradeAPI.Entities.EssayTest", b =>
                {
                    b.HasBaseType("MakeTheGradeAPI.Entities.Test");

                    b.Property<string>("EssayText")
                        .HasColumnType("TEXT");

                    b.Property<int?>("StudentId")
                        .HasColumnType("INTEGER")
                        .HasColumnName("EssayTest_StudentId");

                    b.HasIndex("StudentId");

                    b.HasDiscriminator().HasValue("EssayTest");
                });

            modelBuilder.Entity("MakeTheGradeAPI.Entities.MultipleChoiceTest", b =>
                {
                    b.HasBaseType("MakeTheGradeAPI.Entities.Test");

                    b.Property<string>("CorrectAnswer")
                        .HasColumnType("TEXT");

                    b.Property<int?>("StudentId")
                        .HasColumnType("INTEGER")
                        .HasColumnName("MultipleChoiceTest_StudentId");

                    b.HasIndex("StudentId");

                    b.HasDiscriminator().HasValue("MultipleChoiceTest");
                });

            modelBuilder.Entity("MakeTheGradeAPI.Entities.ShortAnswerTest", b =>
                {
                    b.HasBaseType("MakeTheGradeAPI.Entities.Test");

                    b.Property<string>("Answer")
                        .HasColumnType("TEXT");

                    b.Property<int?>("StudentId")
                        .HasColumnType("INTEGER");

                    b.HasIndex("StudentId");

                    b.HasDiscriminator().HasValue("ShortAnswerTest");
                });

            modelBuilder.Entity("MakeTheGradeAPI.Entities.Administrator", b =>
                {
                    b.HasBaseType("MakeTheGradeAPI.Entities.User");

                    b.HasDiscriminator().HasValue("Administrator");
                });

            modelBuilder.Entity("MakeTheGradeAPI.Entities.Grader", b =>
                {
                    b.HasBaseType("MakeTheGradeAPI.Entities.User");

                    b.HasDiscriminator().HasValue("Grader");
                });

            modelBuilder.Entity("MakeTheGradeAPI.Entities.Student", b =>
                {
                    b.HasBaseType("MakeTheGradeAPI.Entities.User");

                    b.Property<float>("Grade")
                        .HasColumnType("REAL");

                    b.Property<string>("NumarMatricol")
                        .HasColumnType("TEXT");

                    b.HasDiscriminator().HasValue("Student");
                });

            modelBuilder.Entity("MakeTheGradeAPI.Entities.Test", b =>
                {
                    b.HasOne("MakeTheGradeAPI.Entities.Grader", "Assigner")
                        .WithMany("GradedTests")
                        .HasForeignKey("AssignerId");

                    b.Navigation("Assigner");
                });

            modelBuilder.Entity("MakeTheGradeAPI.Entities.EssayTest", b =>
                {
                    b.HasOne("MakeTheGradeAPI.Entities.Student", null)
                        .WithMany("SubmitedEssayTests")
                        .HasForeignKey("StudentId");
                });

            modelBuilder.Entity("MakeTheGradeAPI.Entities.MultipleChoiceTest", b =>
                {
                    b.HasOne("MakeTheGradeAPI.Entities.Student", null)
                        .WithMany("SubmitedMultipleChoiceTests")
                        .HasForeignKey("StudentId");
                });

            modelBuilder.Entity("MakeTheGradeAPI.Entities.ShortAnswerTest", b =>
                {
                    b.HasOne("MakeTheGradeAPI.Entities.Student", null)
                        .WithMany("SubmitedShortAnswerTests")
                        .HasForeignKey("StudentId");
                });

            modelBuilder.Entity("MakeTheGradeAPI.Entities.Grader", b =>
                {
                    b.Navigation("GradedTests");
                });

            modelBuilder.Entity("MakeTheGradeAPI.Entities.Student", b =>
                {
                    b.Navigation("SubmitedEssayTests");

                    b.Navigation("SubmitedMultipleChoiceTests");

                    b.Navigation("SubmitedShortAnswerTests");
                });
#pragma warning restore 612, 618
        }
    }
}