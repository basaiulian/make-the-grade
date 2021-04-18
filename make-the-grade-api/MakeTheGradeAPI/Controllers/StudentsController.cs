using MakeTheGradeAPI.Entities;
using MakeTheGradeAPI.Model;
using Microsoft.AspNetCore.Mvc;
using MakeTheGradeAPI.Utils;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MakeTheGradeAPI.Utils.BulkInsert;

namespace MakeTheGradeAPI.Controllers
{
    [ApiController]
    [Route("/v1/students/")]
    public class StudentsController : ControllerBase
    {
        private readonly DataContext _context;

        public StudentsController(DataContext context)
        {
            _context = context;
        }

        [HttpGet]
        public ActionResult<IEnumerable<Student>> GetStudents()
        {
            return _context.Student.ToList();
        }

        [HttpGet("ungraded")]
        public List<Student> filterUnGradedNotes()
        {
            List<Student> studentList = new List<Student>();
            foreach (Catalog catalog in _context.Catalog)
            {
                if (catalog.Grade < 0)
                {
                    studentList.Add(_context.Student.Find(catalog.StudentId));
                }
            }
            return studentList;
        }

        [HttpGet("graded")]
        public List<Student> FilterGradedNotes()
        {
            List<Student> studentList = new List<Student>();
            foreach (Catalog catalog in _context.Catalog)
            {
                if (catalog.Grade > 0)
                {
                    studentList.Add(_context.Student.Find(catalog.StudentId));
                }
            }
            return studentList;
        }

        [HttpPost("bulk")]
        public async void BulkInsert()
        {
            BulkInsert bulkInsert = new BulkInsert();

            for(int i=0; i < 1000; i++)
            {
                if (i % 100 == 0)
                {
                    System.Console.WriteLine(i);
                }
                Student student1 = new Student() { Username = "Student1", Password = "TestDesc3ription3", Email = "3@gmail.com", PhoneNumber = "0755521512", Address = "address1", NumarMatricol = "RO213412" };
                bulkInsert.insert(student1, _context);
            }
            await _context.SaveChangesAsync();
        }

        [HttpPost("authenticate")]
        public ActionResult<int> Authenticate([FromBody] List<string> studentData)
        {
            List<Student> Students = _context.Student.ToList();

            foreach (Student student in Students)
            {
                if (student.Username == studentData[0] && student.Password == Hash.hashPassword(studentData[1]))
                {
                    return student.Id;
                }
            }
            return -1;
        }

        [HttpPost()]
        public async Task<ActionResult<string>> AddStudent([FromBody] List<string> studentData)
        {
            Student studentToAdd = new Student(studentData[0], Hash.hashPassword(studentData[1]), studentData[2], "", studentData[3], "");

            _context.Student.Add(studentToAdd);
            await _context.SaveChangesAsync();

            if (_context.Student.Find(studentToAdd.Id) != null)
            {
                return Ok("Student with id=" + studentToAdd.Id + " has been added.");
            } else
            {
                return Ok("Student not added.");
            }
        }
    }
}
