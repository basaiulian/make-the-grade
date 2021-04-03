using MakeTheGradeAPI.Entities;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;

namespace MakeTheGradeAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UsersController : ControllerBase
    {
      
        static Student student1 = new Student(0, "Student1", "parola1", "student1@test.com", "0755555555", "Iasi, Romania", "017582917581");
        static Student student2 = new Student(1, "Student2", "parola2", "student2@test.com", "0755555554", "Iasi, Romania", "017582417581");
        static Grader grader1 = new Grader(2, "Grader1", "parola3", "grader1@test.com", "0755555555", "Iasi, Romania");

        public static List<Student> Students { get; set; } = new List<Student>()
        {
            student1, student2
        };

        public static List<User> Users { get; set; } = new List<User>()
        {
            student1, student2, grader1
        };

        [HttpGet("/all")]
        public ActionResult<IEnumerable<User>> findUsers()
        {
            return Users;
        }

        [HttpGet("/all-students")]
        public ActionResult<IEnumerable<Student>> findStudents()
        {
            return Students;
        }

        [HttpPost("/find-student")]
        public ActionResult<int> FindStudent([FromBody] List<string> studentData)
        {
            foreach(Student student in Students)
            {
                System.Console.WriteLine(student.Username);
                System.Console.WriteLine(student.Password);
                if (student.Username == studentData[0] && student.Password == studentData[1])
                {
                    return student.Id;
                }
            }
            return -1;
        }
    }
}
