using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MakeTheGradeAPI.Entities
{
    public class MultipleChoiceTest : Test
    {
        public MultipleChoiceTest(int id, string question, Grader grader, List<string> possibleAnswers, string correctAnswer)
        {
            this.Id = id;
            this.Question = question;
            this.Assigner = grader;
            this.PossibleAnswers = possibleAnswers;
            this.CorrectAnswer = correctAnswer;
        }
        public List<string> PossibleAnswers { get; set; }

        public string CorrectAnswer { get; set; }
    }
}
