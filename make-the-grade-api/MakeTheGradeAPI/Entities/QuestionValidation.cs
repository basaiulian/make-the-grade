using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MakeTheGradeAPI.Entities
{
    public class QuestionValidation
    {
        public QuestionValidation(int questionId, List<string> correctAnswers, List<string> correctButNotCheckedAnswers, List<string> wrongAnswers, double questionScore)
        {
            QuestionId = questionId;
            CorrectAnswers = correctAnswers;
            CorrectButNotCheckedAnswers = correctButNotCheckedAnswers;
            WrongAnswers = wrongAnswers;
            QuestionScore = questionScore;
        }
        public int QuestionId { get; set; }
        public List<string> CorrectAnswers { get; set; }
        public List<string> CorrectButNotCheckedAnswers { get; set; }
        public List<string> WrongAnswers { get; set; }
        public double QuestionScore { get; set; }
    }
}
