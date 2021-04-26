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

        [HttpGet("{id}")]
        public ActionResult<Course> GetCourseById(int id)
        {
            return _context.Course.Find(id);
        }

        [HttpPost]
        public async Task<ActionResult<Course>> AddCourse([FromBody] Course course)
        {
            _context.Course.Add(course);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCourseById", new { id = course.Id }, course);
        }

        [HttpGet("{id}/exams")]
        public ActionResult<List<Exam>> GetExams(int id)
        {
            Course course = _context.Course.Find(id);
            List<Exam> courseExams = new();
            if(course != null)
            {
                courseExams = _context.Exam.Where(e => e.CourseId == id).ToList();
            }

            return courseExams;
        }
    }
}
