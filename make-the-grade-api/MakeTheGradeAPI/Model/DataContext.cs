using MakeTheGradeAPI.Entities;
using Microsoft.EntityFrameworkCore;

namespace MakeTheGradeAPI.Model
{
    public class DataContext : DbContext
    {
        public DataContext(DbContextOptions<DataContext> options) : base(options)
        {
        }
        public DbSet<Exam> Exam { get; set; }
        public DbSet<MultipleChoiceTest> MultipleChoiceTest { get; set; }
        public DbSet<ShortAnswerTest> ShortAnswerTest { get; set; }
        public DbSet<EssayTest> EssayTest { get; set; }
        public DbSet<Student> Student { get; set; }
        public DbSet<Teacher> Teacher { get; set; }
        public DbSet<Course> Course { get; set; }
        public DbSet<Catalog> Catalog { get; set; }
    }
}
