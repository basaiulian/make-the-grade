using MakeTheGradeAPI.Entities;
using MakeTheGradeAPI.Model;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
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
                List<string> CorrectAnswers = new List<string>();
                List<string> WrongAnswers = new List<string>();
                List<string> CorrectButNotCheckedAnswers = new List<string>();

                System.Console.WriteLine(QuestionId);

                foreach (string _answer in UserAnswers)
                {
                    System.Console.WriteLine(_answer);
                }

                MultipleChoiceTest MultipleChoiceTestToValidate = _context.MultipleChoiceTest.Find(QuestionId);

                if (MultipleChoiceTestToValidate != null)
                {
                    List<string> TestAnswers = MultipleChoiceTestToValidate.PossibleAnswers.Split(',').ToList();
                    List<string> TestCorrectAnswers = MultipleChoiceTestToValidate.CorrectAnswers.Split(',').ToList();

                    System.Console.WriteLine("raspasuf0ijgasoigjsaoigjas");

                    foreach (string _answer in UserAnswers)
                    {
                        if (TestCorrectAnswers.Contains(_answer))
                        {
                            CorrectAnswers.Add(_answer);
                        }
                        else
                        {
                            WrongAnswers.Add(_answer);
                        }
                    }

                    foreach (string _answer in TestCorrectAnswers)
                    {
                        if (!UserAnswers.Contains(_answer))
                        {
                            CorrectButNotCheckedAnswers.Add(_answer);
                        }
                    }

                    double Score = CorrectAnswers.Count / TestAnswers.Count;
                    QuestionsValidations.Add(new QuestionValidation(QuestionId, CorrectAnswers, CorrectButNotCheckedAnswers, WrongAnswers, Score));
                }
            }
            return QuestionsValidations;

        }
    }
}


