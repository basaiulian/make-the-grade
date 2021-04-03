using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MakeTheGradeAPI.Entities
{
    public class Grader : User
    {
        public Grader()
        {

        }
        public Grader(int id, string username, string password, string email, string phoneNumber, string address)
        {
            this.Id = id;
            this.Username = username;
            this.Password = password;
            this.Email = email;
            this.PhoneNumber = phoneNumber;
            this.Address = address;
        }

        public ICollection<Test> GradedTests { get; set; } = new List<Test>();

        void AddTest(Test test)
        {
            GradedTests.Add(test);
        }


    }
}
