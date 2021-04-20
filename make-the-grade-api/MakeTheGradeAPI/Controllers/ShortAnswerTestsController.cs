using MakeTheGradeAPI.Entities;
using MakeTheGradeAPI.Model;
using MakeTheGradeAPI.Utils.ShortAnswerTests;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MakeTheGradeAPI.Controllers
{
    [ApiController]
    [Route("/v1/short-answer-tests/")]
    public class ShortAnswerTestsController : ControllerBase
    {
        private readonly DataContext _context;

        public ShortAnswerTestsController(DataContext context)
        {
            _context = context;
        }

        [HttpGet("random/{NumberOfQuestions}/exam/{ExamId}")]
        public ActionResult<List<ShortAnswerTest>> GetRandomTest(int ExamId, int NumberOfQuestions)
        {
            List<ShortAnswerTest> ShortAnswerTests = _context.ShortAnswerTest.Where(s => s.ExamId == ExamId).ToList();
            return ShortAnswerTestUtil.getRandomTestsList(NumberOfQuestions, ShortAnswerTests);
        }

        [HttpPost("register-user-answers")]
        public void RegisterUserAnswers(List<ShortAnswerTestUserAnswer> UserAnswers)
        {
            string modified = "";
            foreach (ShortAnswerTestUserAnswer answer in UserAnswers)
            {
                ShortAnswerTest ShortAnswerTestToEdit = _context.ShortAnswerTest.Find(answer.QuestionId);
                string result = ShortAnswerTestToEdit.Question;
                foreach (string _answer in answer.UserAnswers)
                {
                    int Place = result.IndexOf("*");
                    result = result.Remove(Place, "*".Length).Insert(Place, _answer);
                }
                ShortAnswerTestToEdit.Answer = result;
                _context.SaveChangesAsync();
            }
        }

        [HttpGet]
        public ActionResult<IEnumerable<ShortAnswerTest>> GetShortAnswerTests()
        {
            return _context.ShortAnswerTest.ToList();
        }

        [HttpGet("{Id}")]
        public ActionResult<ShortAnswerTest> GetShortAnswerTestById(int Id)
        {
            return _context.ShortAnswerTest.Find(Id);
        }

        [HttpPost]
        public async Task<ActionResult<ShortAnswerTest>> AddShortAnswerTest([FromBody] ShortAnswerTest shortAnswerTest)
        {
            System.Console.WriteLine(shortAnswerTest.Answer + shortAnswerTest.Question);
            _context.ShortAnswerTest.Add(shortAnswerTest);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetShortAnswerTestById", new { id = shortAnswerTest.Id }, shortAnswerTest);
        }

        [HttpPut]
        public async Task<ActionResult<string>> EditShortAnswerTest([FromBody] List<ShortAnswer> shortAnswerTests)
        {
            foreach (ShortAnswer shortAnswer in shortAnswerTests)
            {
                System.Console.WriteLine(shortAnswer.Id);
                ShortAnswerTest shortAnswerTest = _context.ShortAnswerTest.Find(shortAnswer.Id);
                shortAnswerTest.Answer = shortAnswer.ShortAnswerText;
                _context.Entry(shortAnswerTest).State = EntityState.Modified;
                await _context.SaveChangesAsync();
            }
            return "ShortAnswerText added.";
        }
    }


}
