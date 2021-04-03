using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MakeTheGradeAPI.Entities
{
    public class ShortAnswerTest : Test
    {
        public ShortAnswerTest(int id, string question, Grader grader)
        {
            this.Id = id;
            this.Question = question;
            this.Assigner = grader;
        }
        public string Answer { get; set; }
    }
}
