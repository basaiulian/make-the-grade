using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace MakeTheGradeAPI.Entities
{
    public class Course
    {
        [Column("id", TypeName = "INTEGER")]
        public int Id { get; set; }

        [Column("title", TypeName = "string")]
        public string Title { get; set; }

        [Column("credits", TypeName = "int")]
        public string Credits { get; set; }

        public List<Student> EnrroledStudents = new();

        public List<Teacher> CourseAuthors = new();

        public Course()
        {

        }
        public Course(string title, string credits)
        {
            this.Title = title;
            this.Credits = credits;
        }
    }
}

