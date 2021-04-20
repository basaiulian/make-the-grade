using System.Collections.Generic;

namespace MakeTheGradeAPI.Entities
{
    public class QuestionValidation
    {
        public QuestionValidation(int questionId, List<string> correctAnswers, List<string> correctButNotCheckedAnswers, List<string> wrongAnswers)
        {
            QuestionId = questionId;
            CorrectAnswers = correctAnswers;
            CorrectButNotCheckedAnswers = correctButNotCheckedAnswers;
            WrongAnswers = wrongAnswers;
        }
        public int QuestionId { get; set; }
        public List<string> CorrectAnswers { get; set; }
        public List<string> CorrectButNotCheckedAnswers { get; set; }
        public List<string> WrongAnswers { get; set; }
    }
}
