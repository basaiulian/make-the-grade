using System.Collections.Generic;

namespace MakeTheGradeAPI.Entities
{
    public class MultipleChoiceTestAnswer
    {
        public int QuestionId { get; set; }

        public List<string> UserAnswers { get; set; }

        public MultipleChoiceTestAnswer(int questionId, List<string> userAnswers)
        {
            QuestionId = questionId;
            UserAnswers = userAnswers;
        }

    }
}
