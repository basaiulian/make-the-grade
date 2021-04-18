using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MakeTheGradeAPI.Entities
{
    public class MultipleChoiceTestAnswer
    {
        public int QuestionId { get; set; }

        public List<string> UserAnswers { get; set; }

    }
}
