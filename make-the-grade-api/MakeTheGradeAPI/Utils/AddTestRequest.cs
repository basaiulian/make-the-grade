using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MakeTheGradeAPI.Utils
{
    public class AddTestRequest
    {
        public int Id { get; set; }

        public AddTestRequest()
        {

        }

        public AddTestRequest(int Id)
        {
            this.Id = Id;
        }
    }
}
