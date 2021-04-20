using MakeTheGradeAPI.Entities;
using MakeTheGradeAPI.Model;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MakeTheGradeAPI.Controllers
{
    [ApiController]
    [Route("/v1/courses/")]
    public class CoursesController : ControllerBase
    {
        private readonly DataContext _context;

        public CoursesController(DataContext context)
        {
            _context = context;
        }

        [HttpGet]
        public ActionResult<IEnumerable<Course>> GetCourses()
        {
            return _context.Course.ToList();
        }

        [HttpGet("{Id}")]
        public ActionResult<Course> GetCourseById(int Id)
        {
            return _context.Course.Find(Id);
        }

        [HttpPost]
        public async Task<ActionResult<Course>> AddCourse([FromBody] Course Course)
        {
            _context.Course.Add(Course);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCourseById", new { id = Course.Id }, Course);
        }

        [HttpGet("{Id}/exams")]
        public async Task<ActionResult<List<Exam>>> GetExams(int Id)
        {
            Course Course = _context.Course.Find(Id);
            List<Exam> CourseExams = new List<Exam>();
            if(Course != null)
            {
                CourseExams = _context.Exam.Where(e => e.CourseId == Id).ToList();
            }

            return CourseExams;
        }
    }
}
