using System.ComponentModel.DataAnnotations.Schema;

namespace MakeTheGradeAPI.Entities
{
    public class ShortAnswerTest
    {
        [Column("id", TypeName = "INTEGER")]
        public int Id { get; set; }

        [Column("question", TypeName = "string")]
        public string Question { get; set; }
        [Column("assigner_id", TypeName = "int")]
        public int AssignerId { get; set; }
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

        public ShortAnswerTest(int id, string question, int assignerId, string answer)
        {
            this.Id = id;
            this.Question = question;
            this.AssignerId = assignerId;
            this.Answer = answer;
        }
    }
}
