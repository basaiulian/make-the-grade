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

        [HttpGet("{id}")]
        public ActionResult<Student> GetStudentById(int id)
        {
            return _context.Student.Find(id);
        }

        [HttpGet("ungraded")]
        public List<Student> FilterUnGradedNotes()
        {
            List<Student> studentList = new();
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
            List<Student> studentList = new();
            foreach (Catalog catalog in _context.Catalog)
            {
                if (catalog.Grade > 0)
                {
                    studentList.Add(_context.Student.Find(catalog.StudentId));
                }
            }
            return studentList;
        }

        [HttpPost("authenticate")]
        public ActionResult<int> Authenticate([FromBody] List<string> studentData)
        {
            List<Student> students = _context.Student.ToList();

            foreach (Student student in students)
            {
                if (student.Username == studentData[0] && student.Password == Hash.HashPassword(studentData[1]))
                {
                    return student.Id;
                }
            }
            return -1;
        }

        [HttpPost()]
        public async Task<ActionResult<string>> AddStudent([FromBody] List<string> studentData)
        {
            Student studentToAdd = new(studentData[0], Hash.HashPassword(studentData[1]), studentData[2], studentData[3], studentData[4], studentData[5]);

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
