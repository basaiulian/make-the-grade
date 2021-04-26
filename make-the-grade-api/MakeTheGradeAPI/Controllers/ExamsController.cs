using MakeTheGradeAPI.Entities;
using MakeTheGradeAPI.Model;
using MakeTheGradeAPI.Utils;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MakeTheGradeAPI.Controllers
{
    [ApiController]
    [Route("/v1/exams/")]
    public class ExamsController : ControllerBase
    {
        private readonly DataContext _context;

        public ExamsController(DataContext context)
        {
            _context = context;
        }

        [HttpGet]
        public ActionResult<IEnumerable<Exam>> GetExams()
        {
            return _context.Exam.ToList();
        }

        [HttpGet("{id}")]
        public ActionResult<Exam> GetExamById(int id)
        {
            return _context.Exam.Find(id);
        }

        [HttpPost]
        public async Task<ActionResult<Exam>> AddExam([FromBody] Exam exam)
        {
            _context.Exam.Add(exam);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetExamById", new { id = exam.Id }, exam);
        }

        [HttpGet("{id}/multiple-choice-tests")]
        public ActionResult<List<MultipleChoiceTest>> GetMultipleChoiceTests(int id)
        {
            Exam Exam = _context.Exam.Find(id);
            List<MultipleChoiceTest> MultipleChoiceTests = new();
            if(Exam != null)
            {
                MultipleChoiceTests = _context.MultipleChoiceTest.Where(m => m.ExamId == id).ToList();
            }
            return MultipleChoiceTests;
        }

        [HttpGet("{id}/short-answer-tests")]
        public ActionResult<List<ShortAnswerTest>> GetShortAnswerTests(int id)
        {
            Exam exam = _context.Exam.Find(id);
            List<ShortAnswerTest> shortAnswerTests = new();
            if (exam != null)
            {
                shortAnswerTests = _context.ShortAnswerTest.Where(m => m.ExamId == id).ToList();
            }
            return shortAnswerTests;
        }

        [HttpGet("{id}/essay-tests")]
        public ActionResult<List<EssayTest>> GetEssayTests(int id)
        {
            Exam exam = _context.Exam.Find(id);
            List<EssayTest> essayTests = new();
            if (exam != null)
            {
                essayTests = _context.EssayTest.Where(m => m.ExamId == id).ToList();
            }
            return essayTests;
        }
    }
}