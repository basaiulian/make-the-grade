﻿// <auto-generated />
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

            modelBuilder.Entity("MakeTheGradeAPI.Entities.EssayTest", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER")
                        .HasColumnName("id");

                    b.Property<int>("AssignerId")
                        .HasColumnType("int")
                        .HasColumnName("assigner_id");

                    b.Property<string>("EssayText")
                        .HasColumnType("string")
                        .HasColumnName("essay_text");

                    b.Property<string>("Question")
                        .HasColumnType("string")
                        .HasColumnName("question");

                    b.HasKey("Id");

                    b.ToTable("EssayTest");
                });

            modelBuilder.Entity("MakeTheGradeAPI.Entities.Exam", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER")
                        .HasColumnName("id");

                    b.Property<int>("EssayTestId")
                        .HasColumnType("int")
                        .HasColumnName("essay_test_id");

                    b.Property<int>("MultipleChoiceTestId")
                        .HasColumnType("int")
                        .HasColumnName("multiple_choice_id");

                    b.Property<int>("ShortAnswerTestId")
                        .HasColumnType("int")
                        .HasColumnName("short_answer_id");

                    b.HasKey("Id");

                    b.ToTable("Exam");
                });

            modelBuilder.Entity("MakeTheGradeAPI.Entities.MultipleChoiceTest", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER")
                        .HasColumnName("id");

                    b.Property<string>("CorrectAnswers")
                        .HasColumnType("string")
                        .HasColumnName("correctAnswers");

                    b.Property<int>("Grader")
                        .HasColumnType("int")
                        .HasColumnName("grader_id");

                    b.Property<string>("PossibleAnswers")
                        .HasColumnType("string")
                        .HasColumnName("possibleAnswers");

                    b.Property<string>("Question")
                        .HasColumnType("string")
                        .HasColumnName("question");

                    b.HasKey("Id");

                    b.ToTable("MultipleChoiceTest");
                });

            modelBuilder.Entity("MakeTheGradeAPI.Entities.ShortAnswerTest", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER")
                        .HasColumnName("id");

                    b.Property<string>("Answer")
                        .HasColumnType("string")
                        .HasColumnName("answer");

                    b.Property<int>("AssignerId")
                        .HasColumnType("int")
                        .HasColumnName("assigner_id");

                    b.Property<string>("Question")
                        .HasColumnType("string")
                        .HasColumnName("question");

                    b.HasKey("Id");

                    b.ToTable("ShortAnswerTest");
                });

            modelBuilder.Entity("MakeTheGradeAPI.Entities.Student", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER")
                        .HasColumnName("id");

                    b.Property<string>("Address")
                        .HasColumnType("string")
                        .HasColumnName("address");

                    b.Property<string>("Email")
                        .HasColumnType("string")
                        .HasColumnName("email");

                    b.Property<string>("NumarMatricol")
                        .HasColumnType("string")
                        .HasColumnName("nr_matricol");

                    b.Property<string>("Password")
                        .HasColumnType("string")
                        .HasColumnName("password");

                    b.Property<string>("PhoneNumber")
                        .HasColumnType("string")
                        .HasColumnName("phoneNumber");

                    b.Property<string>("Username")
                        .HasColumnType("string")
                        .HasColumnName("username");

                    b.HasKey("Id");

                    b.ToTable("Student");
                });
#pragma warning restore 612, 618
        }
    }
}
