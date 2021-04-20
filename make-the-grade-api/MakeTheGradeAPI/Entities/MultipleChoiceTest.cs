using System.ComponentModel.DataAnnotations.Schema;

namespace MakeTheGradeAPI.Entities
{
    public class MultipleChoiceTest
    {
        [Column("id", TypeName = "INTEGER")]
        public int Id { get; set; }

        [Column("question", TypeName = "string")]
        public string Question { get; set; }

        [Column("exam_id", TypeName = "int")]
        public int ExamId { get; set; }

        [Column("possibleAnswers", TypeName = "string")] // string-uri despartite prin virgula
        public string PossibleAnswers { get; set; }

        [Column("correctAnswers", TypeName = "string")] // string-uri despartite prin virgula
        public string CorrectAnswers { get; set; }

        public MultipleChoiceTest()
        {
        }
        public MultipleChoiceTest(int id, string question, string possibleAnswers, string correctAnswers)
        {
            this.Id = id;
            this.Question = question;
            this.PossibleAnswers = possibleAnswers;
        }


    }
}
