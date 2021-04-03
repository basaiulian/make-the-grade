using MakeTheGradeAPI.Entities;
using MakeTheGradeAPI.Model;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;

namespace MakeTheGradeAPI.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class TestsController : ControllerBase
    {
        static Grader grader1 = new Grader(2, "Grader1", "parola3", "grader1@test.com", "0755555555", "Iasi, Romania");
        static MultipleChoiceTest multipleChoice1 = new MultipleChoiceTest(0, "Question1", grader1, new List<string>() { "answer1", "answer2", "answer3", "answer4" }, "answer1");
        static ShortAnswerTest shortAnswer1 = new ShortAnswerTest(1, "Question2", grader1);
        static EssayTest essay1 = new EssayTest(2, "Question3", grader1);

        public static List<MultipleChoiceTest> MultipleChoiceTests { get; set; } = new List<MultipleChoiceTest>()
        {
            multipleChoice1
        };

        public static List<ShortAnswerTest> ShortAnswerTests { get; set; } = new List<ShortAnswerTest>()
        {
            shortAnswer1
        };

        public static List<EssayTest> EssayTests { get; set; } = new List<EssayTest>()
        {
            essay1
        };

        [HttpGet("/all-multiple-choice")]
        public ActionResult<IEnumerable<MultipleChoiceTest>> findMultipleChoiceTests()
        {
            return MultipleChoiceTests;
        }

        [HttpGet("/all-short-answer")]
        public ActionResult<IEnumerable<ShortAnswerTest>> findShortAnswerTests()
        {
            return ShortAnswerTests;
        }

        [HttpGet("/all-essay")]
        public ActionResult<IEnumerable<EssayTest>> findEssayTests()
        {
            return EssayTests;
        }
    }
}
