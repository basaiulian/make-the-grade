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
        private const char Asterix = '*';

        private readonly DataContext _context;

        public ShortAnswerTestsController(DataContext context)
        {
            _context = context;
        }

        [HttpGet("random/{numberOfQuestions}")]
        public ActionResult<List<ShortAnswerTest>> GetRandomTest(int numberOfQuestions)
        {
            List<ShortAnswerTest> shortAnswerTests = _context.ShortAnswerTest.ToList();
            return ShortAnswerTestUtil.GetRandomTestsList(numberOfQuestions, shortAnswerTests);
        }

        [HttpPost("register-user-answers")]
        public void RegisterUserAnswers(List<ShortAnswerTestUserAnswer> userAnswers)
        {
            foreach (ShortAnswerTestUserAnswer answer in userAnswers)
            {
                ShortAnswerTest shortAnswerTestToEdit = _context.ShortAnswerTest.Find(answer.QuestionId);
                string result = shortAnswerTestToEdit.Question;
                foreach (string currentAnswer in answer.UserAnswers)
                {
                    int place = result.IndexOf(Asterix);
                    result = result.Remove(place, 1).Insert(place, currentAnswer);
                }
                shortAnswerTestToEdit.Answer = result;
                _context.SaveChangesAsync();
            }
        }

        [HttpGet]
        public ActionResult<IEnumerable<ShortAnswerTest>> GetShortAnswerTests()
        {
            return _context.ShortAnswerTest.ToList();
        }

        [HttpGet("{id}")]
        public ActionResult<ShortAnswerTest> GetShortAnswerTestById(int id)
        {
            return _context.ShortAnswerTest.Find(id);
        }

        [HttpPost]
        public async Task<ActionResult<ShortAnswerTest>> AddShortAnswerTest([FromBody] ShortAnswerTest shortAnswerTest)
        {
            _context.ShortAnswerTest.Add(shortAnswerTest);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetShortAnswerTestById", new { id = shortAnswerTest.Id }, shortAnswerTest);
        }

        [HttpPut]
        public async Task<ActionResult<string>> EditShortAnswerTest([FromBody] List<ShortAnswer> shortAnswerTests)
        {
            foreach (ShortAnswer shortAnswer in shortAnswerTests)
            {
                ShortAnswerTest shortAnswerTest = _context.ShortAnswerTest.Find(shortAnswer.Id);
                shortAnswerTest.Answer = shortAnswer.ShortAnswerText;
                _context.Entry(shortAnswerTest).State = EntityState.Modified;
                await _context.SaveChangesAsync();
            }
            return "ShortAnswerText added.";
        }
    }


}
