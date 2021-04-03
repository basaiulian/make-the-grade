using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MakeTheGradeAPI.Entities
{
    public class EssayTest:Test
    {
        public EssayTest(int id, string question, Grader grader)
        {
            this.Id = id;
            this.Question = question;
            this.Assigner = grader;
        }
        public string EssayText { get; set; }
    }
}
