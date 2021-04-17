using MakeTheGradeAPI.Entities;
using MakeTheGradeAPI.Model;
using Microsoft.AspNetCore.Mvc;
using MakeTheGradeAPI.Utils;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

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
        public ActionResult<IEnumerable<Student>> FindStudents()
        {
            return _context.Student.ToList();
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
