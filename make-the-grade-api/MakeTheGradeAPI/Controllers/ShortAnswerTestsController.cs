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

        //public void randomHalfSizeList()
        //{
        //    var random = new Random();
        //    List<int> list = new List<int> { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
        //    List<int> listCopy = list;
        //    List<int> result = new List<int>();
        //    while (result.Count < list.Count)
        //    {
        //        int randomElement = listCopy[random.Next(listCopy.Count)];
        //        result.Add(randomElement);
        //        listCopy.Remove(randomElement);
        //    }
        //}

        [HttpGet("random")]
        public ActionResult<List<ShortAnswerTest>> GetRandomTest()
        {
            ShortAnswerTest ShortAnswerTest1 = _context.ShortAnswerTest.Find(1);
            ShortAnswerTest ShortAnswerTest2 = _context.ShortAnswerTest.Find(2);

            return new List<ShortAnswerTest> { ShortAnswerTest1, ShortAnswerTest2 };
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
