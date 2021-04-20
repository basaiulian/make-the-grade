using System.Collections.Generic;

namespace MakeTheGradeAPI.Entities
{
    public class ShortAnswerTestUserAnswer
    {
        public int QuestionId { get; set; }

        public List<string> UserAnswers { get; set; }

        public ShortAnswerTestUserAnswer(int questionId, List<string> userAnswers)
        {
            QuestionId = questionId;
            UserAnswers = userAnswers;
        }

    }
}
