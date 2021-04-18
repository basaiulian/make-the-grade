using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace MakeTheGradeAPI.Entities
{
    public class Catalog
    {
        [Column("id", TypeName = "INTEGER")]
        public int Id { get; set; }

        [Column("student_id", TypeName = "INTEGER")]
        public int StudentId { get; set; }

        [Column("teacher_id", TypeName = "INTEGER")]
        public int TeacherId { get; set; }

        [Column("exam_id", TypeName = "INTEGER")]
        public int ExamId { get; set; }

        [Column("grade", TypeName = "INTEGER")]
        public int Grade { get; set; }
        public Catalog()
        {

        }
        public Catalog(int student_id, int teacher_id, int exam_id, int grade)
        {
            StudentId = student_id;
            TeacherId = teacher_id;
            ExamId = exam_id;
            Grade = grade;
        }
    }
}

