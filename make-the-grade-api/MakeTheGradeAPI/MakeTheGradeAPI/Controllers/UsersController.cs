using MakeTheGradeAPI.Entities;
using MakeTheGradeAPI.Model;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace MakeTheGradeAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class UsersController : ControllerBase
    {
        private readonly DataContext _context;

        public UsersController(DataContext context)
        {
            _context = context;
        }

        private string hashPassword(string password)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                // ComputeHash - returns byte array  
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));

                // Convert byte array to a string   
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }

        //public static List<User> Users { get; set; } = new List<User>()
        //{
        //    student1, student2, grader1
        //};

        //[HttpGet("/all")]
        //public ActionResult<IEnumerable<User>> findUsers()
        //{
        //    return Users;
        //}

        [HttpGet("/all-students")]
        public ActionResult<IEnumerable<Student>> findStudents()
        {
            return _context.Student.ToList();
        }

        [HttpPost("/find-student")]
        public ActionResult<int> FindStudent([FromBody] List<string> studentData)
        {
            List<Student> Students = _context.Student.ToList();

            string hashedPassword = "";

            hashedPassword = hashPassword(studentData[1]);

            foreach (Student student in Students)
            {
                if (student.Username == studentData[0] && student.Password == hashedPassword)
                {
                    return student.Id;
                }
            }
            return -1;
        }

        [HttpPost("/add-student")]
        public async Task<ActionResult<string>> AddStudent([FromBody] List<string> studentData)
        {
            Student studentToAdd = new Student(studentData[0], hashPassword(studentData[1]), studentData[2], "", studentData[3], "");

            _context.Student.Add(studentToAdd);
            await _context.SaveChangesAsync();

            return "Student added";
        }
    }
}
