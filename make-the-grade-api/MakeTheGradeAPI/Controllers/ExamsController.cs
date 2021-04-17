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

        [HttpPut("{Id}/add-multiple-choice")]
        public async Task<ActionResult<MultipleChoiceTest>> AddMultipleChoiceTest([FromBody] AddTestRequest addTestRequest, int Id)
        {
            Exam examToEdit = _context.Exam.Find(Id);

            MultipleChoiceTest multipleChoiceTest = _context.MultipleChoiceTest.Find(addTestRequest.Id);

            if (multipleChoiceTest == null)
            {
                return NoContent();
            }
            else
            {
                examToEdit.MultipleChoiceTestId = addTestRequest.Id;
                await _context.SaveChangesAsync();

                return CreatedAtAction("GetExamById", new { id = examToEdit.Id }, examToEdit);
            }
        }

        [HttpPut("{Id}/add-short-answer")]
        public async Task<ActionResult<Exam>> AddShortAnswerTest([FromBody] AddTestRequest addTestRequest, int Id)
        {
            Exam examToEdit = _context.Exam.Find(Id);
            Console.WriteLine(examToEdit.Id);

            ShortAnswerTest shortAnswerTest = _context.ShortAnswerTest.Find(addTestRequest.Id);

            if (shortAnswerTest == null)
            {
                return NoContent();
            }
            else
            {
                examToEdit.ShortAnswerTestId = addTestRequest.Id;
                await _context.SaveChangesAsync();

                return CreatedAtAction("GetExamById", new { id = examToEdit.Id }, examToEdit);
            }
        }

        [HttpPut("{Id}/add-essay")]
        public async Task<ActionResult<Exam>> AddEssayTest([FromBody] AddTestRequest addTestRequest, int Id)
        {
            Exam examToEdit = _context.Exam.Find(Id);
            examToEdit.EssayTestId = addTestRequest.Id;
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetExamById", new { id = examToEdit.Id }, examToEdit);
        }
    }
}