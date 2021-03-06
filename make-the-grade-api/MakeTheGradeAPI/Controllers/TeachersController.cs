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
    [Route("/v1/teachers/")]
    public class TeachersController : ControllerBase
    {
        private readonly DataContext _context;

        public TeachersController(DataContext context)
        {
            _context = context;
        }

        [HttpGet]
        public ActionResult<IEnumerable<Teacher>> GetTeachers()
        {
            return _context.Teacher.ToList();
        }

        [HttpPost("authenticate")]
        public ActionResult<int> Authenticate([FromBody] List<string> teachersData)
        {
            List<Teacher> teachers = _context.Teacher.ToList();

            foreach (Teacher teacher in teachers)
            {
                if (teacher.Username == teachersData[0] && teacher.Password == Hash.HashPassword(teachersData[1]))
                {
                    return teacher.Id;
                }
            }
            return -1;
        }

        [HttpPost()]
        public async Task<ActionResult<string>> AddTeacher([FromBody] List<string> teachersData)
        {
            Teacher teacherToAdd = new(teachersData[0], Hash.HashPassword(teachersData[1]), teachersData[2], "", teachersData[3]);

            _context.Teacher.Add(teacherToAdd);
            await _context.SaveChangesAsync();

            if (_context.Teacher.Find(teacherToAdd.Id) != null)
            {
                return Ok("Teacher with id=" + teacherToAdd.Id + " has been added.");
            }
            else
            {
                return Ok("Teacher not added.");
            }
        }

        [HttpGet("ungraded/{id}")]
        public List<Student> FilterUnGradedNotes(int id)
        {
            List<Student> students = new();
            foreach (Catalog catalog in _context.Catalog)
            {
                if (catalog.Grade < 0 && catalog.TeacherId == id)
                {
                    students.Add(_context.Student.Find(catalog.StudentId));
                }
            }
            return students;
        }

        [HttpGet("graded/{id}")]
        public List<Student> FilterGradedNotes(int id)
        {
            List<Student> students = new();
            foreach (Catalog catalog in _context.Catalog)
            {
                if (catalog.Grade > 0 && catalog.TeacherId == id)
                {
                    students.Add(_context.Student.Find(catalog.StudentId));
                }
            }
            return students;
        }
    }
}
