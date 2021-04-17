using System.ComponentModel.DataAnnotations.Schema;

namespace MakeTheGradeAPI.Entities
{
    public class MultipleChoiceTest
    {
        [Column("id", TypeName = "INTEGER")]
        public int Id { get; set; }

        [Column("question", TypeName = "string")]
        public string Question { get; set; }

        [Column("grader_id", TypeName = "int")]
        public int Grader { get; set; }

        [Column("possibleAnswers", TypeName = "string")]
        public string PossibleAnswers { get; set; }
        [Column("correctAnswer", TypeName = "string")]
        public string CorrectAnswer { get; set; }

        public MultipleChoiceTest()
        {
        }
        public MultipleChoiceTest(int id, string question, string possibleAnswers, string correctAnswer)
        {
            this.Id = id;
            this.Question = question;
            this.PossibleAnswers = possibleAnswers;
            this.CorrectAnswer = correctAnswer;
        }

        
    }
}
