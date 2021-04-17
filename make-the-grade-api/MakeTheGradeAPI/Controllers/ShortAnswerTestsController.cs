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
    [Route("/v1/short-answer-tests/")]
    public class ShortAnswerTestsController : ControllerBase
    {
        private readonly DataContext _context;

        public ShortAnswerTestsController(DataContext context)
        {
            _context = context;
        }

        private bool ShortAnswerTestExists(int id)
        {
            return _context.ShortAnswerTest.Any(e => e.Id == id);
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

        [HttpPut("{Id}")]
        public async Task<ActionResult<ShortAnswerTest>> EditShortAnswerTest([FromBody] ShortAnswerTest shortAnswerTest, int Id)
        {
            if (Id != shortAnswerTest.Id)
            {
                return BadRequest();
            }

            _context.Entry(shortAnswerTest).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
                return CreatedAtAction("GetShortAnswerTestById", new { id = shortAnswerTest.Id }, shortAnswerTest);
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ShortAnswerTestExists(Id))
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
