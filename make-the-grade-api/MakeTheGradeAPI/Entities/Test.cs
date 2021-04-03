using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MakeTheGradeAPI.Entities
{
    public class Test
    {
        public int Id { get; set; }

        public string Question { get; set; }

        public float Score { get; set; }

        public Grader Assigner { get; set; }

    }
}
