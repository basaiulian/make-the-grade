using System.Collections.Generic;

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
    }
}
