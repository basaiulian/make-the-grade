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
    }
}
