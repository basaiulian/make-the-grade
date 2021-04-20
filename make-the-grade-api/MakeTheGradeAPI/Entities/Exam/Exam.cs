using System.ComponentModel.DataAnnotations.Schema;

namespace MakeTheGradeAPI.Entities
{
    public class Exam
    {
        [Column("id", TypeName = "INTEGER")]
        public int Id { get; set; }

        [Column("course_id", TypeName = "int")]
        public int CourseId { get; set; } = -1;

        [Column("student_id", TypeName = "int")]
        public int StudentId { get; set; } = -1;
    }
}
