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
        public Catalog(int studentId, int teacherId, int examId, int grade)
        {
            StudentId = studentId;
            TeacherId = teacherId;
            ExamId = examId;
            Grade = grade;
        }
    }
}

