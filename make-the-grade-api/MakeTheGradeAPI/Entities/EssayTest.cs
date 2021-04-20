using System.ComponentModel.DataAnnotations.Schema;

namespace MakeTheGradeAPI.Entities
{
    public class EssayTest
    {
        [Column("id", TypeName = "INTEGER")]
        public int Id { get; set; }

        [Column("question", TypeName = "string")]
        public string Question { get; set; }

        [Column("assigner_id", TypeName = "int")]
        public int AssignerId { get; set; }

        [Column("essay_text", TypeName = "string")]
        public string EssayText { get; set; }

        public EssayTest()
        {

        }
        public EssayTest(int id, string question, int assignerId)
        {
            this.Id = id;
            this.Question = question;
            this.AssignerId = assignerId;
        }

    }
}
