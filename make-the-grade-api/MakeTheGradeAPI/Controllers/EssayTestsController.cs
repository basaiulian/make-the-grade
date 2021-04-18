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
    [Route("/v1/essay-tests/")]
    public class EssayTestsController : ControllerBase
    {
        private readonly DataContext _context;

        public EssayTestsController(DataContext context)
        {
            _context = context;
        }

        private bool EssayTestExists(int id)
        {
            return _context.EssayTest.Any(e => e.Id == id);
        }

        [HttpGet]
        public ActionResult<IEnumerable<EssayTest>> GetEssayTests()
        {
            return _context.EssayTest.ToList();
        }

        [HttpGet("random")]
        public ActionResult<EssayTest> GetRandomTest()
        {
            return _context.EssayTest.Find(1);
        }

        [HttpGet("{Id}")]
        public ActionResult<EssayTest> GetEssayTestById(int Id)
        {
            return _context.EssayTest.Find(Id);
        }

        [HttpPut("{Id}")]
        public async Task<ActionResult<string>> setEssayTestText([FromBody] EssayTestAnswer essayTestAnswer, int Id)
        {
            EssayTest EssayTestToUpdate = _context.EssayTest.Find(essayTestAnswer.Id);
            EssayTestToUpdate.EssayText = essayTestAnswer.EssayTestText;
            _context.Entry(EssayTestToUpdate).State = EntityState.Modified;
            await _context.SaveChangesAsync();
            return "Essay text added.";
        }

        [HttpPost]
        public async Task<ActionResult<EssayTest>> AddEssayTest([FromBody] EssayTest essayTest)
        {
            _context.EssayTest.Add(essayTest);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetEssayTestById", new { id = essayTest.Id }, essayTest);
        }

        //[HttpPut("{Id}")]
        //public async Task<ActionResult<EssayTest>> EditEssayTest([FromBody] EssayTest essayTest, int Id)
        //{
        //    if (Id != essayTest.Id)
        //    {
        //        return BadRequest();
        //    }

        //    _context.Entry(essayTest).State = EntityState.Modified;

        //    try
        //    {
        //        await _context.SaveChangesAsync();
        //        return CreatedAtAction("GetEssayTestById", new { id = essayTest.Id }, essayTest);
        //    }
        //    catch (DbUpdateConcurrencyException)
        //    {
        //        if (!EssayTestExists(Id))
        //        {
        //            return NotFound();
        //        }
        //        else
        //        {
        //            throw;
        //        }
        //    }
        //}
    }
}
