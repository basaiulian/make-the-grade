using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace MakeTheGradeAPI.Entities
{
    public class Student
    {
        [Column("id", TypeName = "INTEGER")]
        public int Id { get; set; }

        [Column("username", TypeName = "string")]
        public string Username { get; set; }

        [Column("password", TypeName = "string")]
        public string Password { get; set; }

        [Column("email", TypeName = "string")]
        public string Email { get; set; }

        [Column("phoneNumber", TypeName = "string")]
        public string PhoneNumber { get; set; }

        [Column("address", TypeName = "string")]
        public string Address { get; set; }

        public Student()
        {

        }
        public Student(string username, string password, string email, string phoneNumber, string address, string numarMatricol)
        {
            this.Username = username;
            this.Password = password;
            this.Email = email;
            this.PhoneNumber = phoneNumber;
            this.Address = address;
            this.NumarMatricol = numarMatricol;
        }

        [Column("nr_matricol", TypeName = "string")]
        public string NumarMatricol { get; set; }

        public ICollection<MultipleChoiceTest> SubmitedMultipleChoiceTests { get; set; } = new List<MultipleChoiceTest>();

        public ICollection<ShortAnswerTest> SubmitedShortAnswerTests { get; set; } = new List<ShortAnswerTest>();

        public ICollection<EssayTest> SubmitedEssayTests { get; set; } = new List<EssayTest>();

        void AddMultipleChoiceTest(MultipleChoiceTest test)
        {
            SubmitedMultipleChoiceTests.Add(test);
        }

        void AddShortAnswerTest(ShortAnswerTest test)
        {
            SubmitedShortAnswerTests.Add(test);
        }

        void AddEssayTest(EssayTest test)
        {
            SubmitedEssayTests.Add(test);
        }
    }
}
