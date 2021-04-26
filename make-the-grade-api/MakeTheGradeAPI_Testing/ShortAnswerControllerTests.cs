using MakeTheGradeAPI.Controllers;
using MakeTheGradeAPI.Entities;
using MakeTheGradeAPI.Model;
using System;
using System.Linq;
using Xunit;

namespace MakeTheGradeAPI_Testing
{
    public class ShortAnswerControllerTests
    {
        readonly ShortAnswerTest shortAnswerTest1 = new() {Question = "This is * first *.", ExamId = 1, Answer = "This is the first question."};
        readonly ShortAnswerTest shortAnswerTest2 = new() {Question = "This is a very * question. I love it!", ExamId = 2, Answer = "This is a very nice question. I love id!"};
        readonly DataContext context;
        readonly Random random;
        readonly ConnectionFactory factory;
        readonly ShortAnswerTestsController controller;

        public ShortAnswerControllerTests()
        {
            random = new Random();
            factory = new();
            context = ConnectionFactory.CreateContextForInMemory("short_answer_database" + random.Next(100000).ToString());
            controller = new ShortAnswerTestsController(context);
        }

        [Fact]
        public void GetShortAnswerTests_ShouldReturnAllShortAnswerTests()
        {
            context.ShortAnswerTest.Add(shortAnswerTest1);
            context.ShortAnswerTest.Add(shortAnswerTest2);
            context.SaveChanges();

            var numberOfShortAnswerTests = context.ShortAnswerTest.Count();
            Assert.Equal(2, numberOfShortAnswerTests);

            var shortAnswerTests = controller.GetShortAnswerTests().Value.ToList();
            Assert.Equal(shortAnswerTest1, shortAnswerTests[0]);
            Assert.Equal(shortAnswerTest2, shortAnswerTests[1]);
        }

        [Fact]
        public void GetShortAnswerTestById_ShouldReturnAnswerTest()
        {
            context.ShortAnswerTest.Add(shortAnswerTest1);
            context.SaveChanges();

            var numberOfShortAnswerTests = context.ShortAnswerTest.Count();
            Assert.Equal(1, numberOfShortAnswerTests);

            var shortAnswerTest = controller.GetShortAnswerTestById(numberOfShortAnswerTests);
            Assert.Equal(shortAnswerTest1, shortAnswerTest.Value);
        }

        [Fact]
        public async void AddShortAnswerTest()
        {
            await controller.AddShortAnswerTest(shortAnswerTest1);
            context.SaveChanges();

            var numberOfShortAnswerTests = context.ShortAnswerTest.Count();

            var addedShortAnswerTest = context.ShortAnswerTest.Find(numberOfShortAnswerTests);
            Assert.Equal(1, numberOfShortAnswerTests);
            Assert.Equal(addedShortAnswerTest, shortAnswerTest1);
        }


    }
}
