using MakeTheGradeAPI.Entities;
using MakeTheGradeAPI.Model;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MakeTheGradeAPI.Controllers
{
    [ApiController]
    [Route("/v1/multiple-choice-tests/")]
    public class MultipleChoiceTestsController : ControllerBase
    {
        private const char Comma = ',';

        private readonly DataContext _context;

        public MultipleChoiceTestsController(DataContext context)
        {
            _context = context;
        }

        private bool MultipleChoiceTestExists(int id)
        {
            return _context.MultipleChoiceTest.Any(e => e.Id == id);
        }

        [HttpGet]
        public ActionResult<IEnumerable<MultipleChoiceTest>> GetMultipleChoiceTests()
        {
            return _context.MultipleChoiceTest.ToList();
        }

        [HttpGet("{id}")]
        public ActionResult<MultipleChoiceTest> GetMultipleChoiceTestById(int id)
        {
            return _context.MultipleChoiceTest.Find(id);
        }

        [HttpPost]
        public async Task<ActionResult<MultipleChoiceTest>> AddMultipleChoiceTest([FromBody] MultipleChoiceTest multipleChoiceTest)
        {
            _context.MultipleChoiceTest.Add(multipleChoiceTest);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetMultipleChoiceTestById", new { id = multipleChoiceTest.Id }, multipleChoiceTest);
        }

        [HttpPut("{id}")]
        public async Task<ActionResult<MultipleChoiceTest>> EditMultipleChoiceTest([FromBody] MultipleChoiceTest multipleChoiceTest, int id)
        {
            if (id != multipleChoiceTest.Id)
            {
                return BadRequest();
            }

            _context.Entry(multipleChoiceTest).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
                return CreatedAtAction("GetMultipleChoiceTestById", new { id = multipleChoiceTest.Id }, multipleChoiceTest);
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MultipleChoiceTestExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }
        }

        [HttpPost("validate")]
        public ActionResult<List<QuestionValidation>> ValidateUserAnswer([FromBody] List<MultipleChoiceTestAnswer> multipleChoiceTestAnswers)
        {
            List<QuestionValidation> questionsValidations = new();
            foreach (MultipleChoiceTestAnswer answer in multipleChoiceTestAnswers)
            {
                int questionId = answer.QuestionId;
                List<string> userAnswers = answer.UserAnswers;
                List<string> correctAnswers;
                List<string> wrongAnswers = new();
                List<string> correctButNotCheckedAnswers = new();

                MultipleChoiceTest MultipleChoiceTestToValidate = _context.MultipleChoiceTest.Find(questionId);

                if (MultipleChoiceTestToValidate != null)
                {
                    List<string> testCorrectAnswers = MultipleChoiceTestToValidate.CorrectAnswers.Split(Comma).ToList();

                    if (testCorrectAnswers == userAnswers)
                    {
                        correctAnswers = userAnswers;
                        questionsValidations.Add(new QuestionValidation(questionId, correctAnswers, correctButNotCheckedAnswers, wrongAnswers));
                    }
                    else
                    {
                        correctAnswers = testCorrectAnswers.Intersect(userAnswers).ToList();
                        correctButNotCheckedAnswers = testCorrectAnswers.Except(userAnswers).ToList();
                        wrongAnswers = userAnswers.Except(testCorrectAnswers).ToList();
                    }
                    questionsValidations.Add(new QuestionValidation(questionId, correctAnswers, correctButNotCheckedAnswers, wrongAnswers));
                }
            }
            return questionsValidations;
        }
    }
}


