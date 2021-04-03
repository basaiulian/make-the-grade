using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MakeTheGradeAPI.Entities
{
    public class Student : User
    {
        public Student(int id, string username, string password, string email, string phoneNumber, string address, string numarMatricol)
        {
            this.Id = id;
            this.Username = username;
            this.Password = password;
            this.Email = email;
            this.PhoneNumber = phoneNumber;
            this.Address = address;
            this.NumarMatricol = numarMatricol;
        }

        public float Grade { get; set; }

        public string NumarMatricol { get; set; }

        public ICollection<MultipleChoiceTest> SubmitedMultipleChoiceTests { get; set; } = new List<MultipleChoiceTest>();

        public ICollection<ShortAnswerTest> SubmitedShortAnswerTests { get; set; } = new List<ShortAnswerTest>();

        public ICollection<EssayTest> SubmitedEssayTests { get; set; } = new List<EssayTest>();

        void calculateGrade()
        {
            float sum = 0;
            foreach(MultipleChoiceTest test in SubmitedMultipleChoiceTests)
            {
                sum += test.Score;
            }
            foreach (ShortAnswerTest test in SubmitedShortAnswerTests)
            {
                sum += test.Score;
            }
            foreach (EssayTest test in SubmitedEssayTests)
            {
                sum += test.Score;
            }
            Grade = sum / (SubmitedMultipleChoiceTests.Count + SubmitedShortAnswerTests.Count + SubmitedEssayTests.Count);
        }

        void AddMultipleChoiceTest(MultipleChoiceTest test)
        {
            SubmitedMultipleChoiceTests.Add(test);
            calculateGrade();
        }

        void AddShortAnswerTest(ShortAnswerTest test)
        {
            SubmitedShortAnswerTests.Add(test);
            calculateGrade();
        }

        void AddEssayTest(EssayTest test)
        {
            SubmitedEssayTests.Add(test);
            calculateGrade();
        }
    }
}
