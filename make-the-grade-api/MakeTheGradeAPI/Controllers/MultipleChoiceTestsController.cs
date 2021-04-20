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

        [HttpGet("{Id}")]
        public ActionResult<MultipleChoiceTest> GetMultipleChoiceTestById(int Id)
        {
            return _context.MultipleChoiceTest.Find(Id);
        }

        [HttpPost]
        public async Task<ActionResult<MultipleChoiceTest>> AddMultipleChoiceTest([FromBody] MultipleChoiceTest multipleChoiceTest)
        {
            _context.MultipleChoiceTest.Add(multipleChoiceTest);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetMultipleChoiceTestById", new { id = multipleChoiceTest.Id }, multipleChoiceTest);
        }

        [HttpPut("{Id}")]
        public async Task<ActionResult<MultipleChoiceTest>> EditMultipleChoiceTest([FromBody] MultipleChoiceTest multipleChoiceTest, int Id)
        {
            if (Id != multipleChoiceTest.Id)
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
                if (!MultipleChoiceTestExists(Id))
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
        public ActionResult<List<QuestionValidation>> validateUserAnswer([FromBody] List<MultipleChoiceTestAnswer> multipleChoiceTestAnswers)
        {
            List<QuestionValidation> QuestionsValidations = new List<QuestionValidation>();
            foreach (MultipleChoiceTestAnswer answer in multipleChoiceTestAnswers)
            {
                int QuestionId = answer.QuestionId;
                List<string> UserAnswers = answer.UserAnswers;
                List<string> CorrectAnswers;
                List<string> WrongAnswers = new List<string>();
                List<string> CorrectButNotCheckedAnswers = new List<string>();

                MultipleChoiceTest MultipleChoiceTestToValidate = _context.MultipleChoiceTest.Find(QuestionId);

                if (MultipleChoiceTestToValidate != null)
                {
                    List<string> TestCorrectAnswers = MultipleChoiceTestToValidate.CorrectAnswers.Split(',').ToList();

                    if (TestCorrectAnswers == UserAnswers)
                    {
                        CorrectAnswers = UserAnswers;
                        QuestionsValidations.Add(new QuestionValidation(QuestionId, CorrectAnswers, CorrectButNotCheckedAnswers, WrongAnswers));
                    }
                    else
                    {
                        CorrectAnswers = TestCorrectAnswers.Intersect(UserAnswers).ToList();
                        CorrectButNotCheckedAnswers = TestCorrectAnswers.Except(UserAnswers).ToList();
                        WrongAnswers = UserAnswers.Except(TestCorrectAnswers).ToList();
                    }
                    QuestionsValidations.Add(new QuestionValidation(QuestionId, CorrectAnswers, CorrectButNotCheckedAnswers, WrongAnswers));
                }
            }
            return QuestionsValidations;
        }
    }
}


