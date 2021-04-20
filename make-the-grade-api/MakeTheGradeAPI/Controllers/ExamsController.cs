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

        [HttpGet("{Id}")]
        public ActionResult<Exam> GetExamById(int Id)
        {
            return _context.Exam.Find(Id);
        }

        [HttpPost]
        public async Task<ActionResult<Exam>> AddExam([FromBody] Exam exam)
        {
            _context.Exam.Add(exam);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetExamById", new { id = exam.Id }, exam);
        }

        [HttpGet("{Id}/multiple-choice-tests")]
        public ActionResult<List<MultipleChoiceTest>> GetMultipleChoiceTests(int Id)
        {
            Exam Exam = _context.Exam.Find(Id);
            List<MultipleChoiceTest> MultipleChoiceTests = new List<MultipleChoiceTest>();
            if(Exam != null)
            {
                MultipleChoiceTests = _context.MultipleChoiceTest.Where(m => m.ExamId == Id).ToList();
            }
            return MultipleChoiceTests;
        }

        [HttpGet("{Id}/short-answer-tests")]
        public ActionResult<List<ShortAnswerTest>> GetShortAnswerTests(int Id)
        {
            Exam Exam = _context.Exam.Find(Id);
            List<ShortAnswerTest> ShortAnswerTests = new List<ShortAnswerTest>();
            if (Exam != null)
            {
                ShortAnswerTests = _context.ShortAnswerTest.Where(m => m.ExamId == Id).ToList();
            }
            return ShortAnswerTests;
        }

        [HttpGet("{Id}/essay-tests")]
        public ActionResult<List<EssayTest>> GetEssayTests(int Id)
        {
            Exam Exam = _context.Exam.Find(Id);
            List<EssayTest> EssayTests = new List<EssayTest>();
            if (Exam != null)
            {
                EssayTests = _context.EssayTest.Where(m => m.ExamId == Id).ToList();
            }
            return EssayTests;
        }
    }
}