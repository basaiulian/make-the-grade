using System.ComponentModel.DataAnnotations.Schema;

namespace MakeTheGradeAPI.Entities
{
    public class ShortAnswerTest
    {
        [Column("id", TypeName = "INTEGER")]
        public int Id { get; set; }

        [Column("question", TypeName = "string")]
        public string Question { get; set; }

        [Column("exam_id", TypeName = "int")]
        public int ExamId { get; set; }

        [Column("answer", TypeName = "string")]
        public string Answer { get; set; }

        public ShortAnswerTest()
        {

        }

        public ShortAnswerTest(int id, string question, string answer)
        {
            this.Id = id;
            this.Question = question;
            this.Answer = answer;
        }
    }
}
