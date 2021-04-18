using MakeTheGradeAPI.Entities;
using MakeTheGradeAPI.Model;
using MakeTheGradeAPI.Utils.ShortAnswerTests;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
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

        [HttpGet("random/{numberOfQuestions}")]
        public ActionResult<List<ShortAnswerTest>> GetRandomTest(int numberOfQuestions)
        {
            List<ShortAnswerTest> ShortAnswerTests = _context.ShortAnswerTest.ToList();
            return ShortAnswerTestUtil.getRandomTestsList(numberOfQuestions, ShortAnswerTests);
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
