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
        ShortAnswerTest shortAnswerTest1 = new ShortAnswerTest() {Question = "This is * first *.", AssignerId = 1, Answer = "This is the first question."};
        ShortAnswerTest shortAnswerTest2 = new ShortAnswerTest() {Question = "This is a very * question. I love it!", AssignerId = 2, Answer = "This is a very nice question. I love id!"};
        DataContext context;
        Random random;
        ConnectionFactory factory;
        ShortAnswerTestsController controller;

        public ShortAnswerControllerTests()
        {
            random = new Random();
            factory = new();
            context = factory.CreateContextForInMemory("short_answer_database" + random.Next(100000).ToString());
            controller = new ShortAnswerTestsController(context);
        }

        [Fact]
        public void GetShortAnswerTests_ShouldReturnAllShortAnswerTests()
        {
            context.ShortAnswerTest.Add(shortAnswerTest1);
            context.ShortAnswerTest.Add(shortAnswerTest2);
            context.SaveChanges();

            var NumberOfShortAnswerTests = context.ShortAnswerTest.Count();
            Assert.Equal(2, NumberOfShortAnswerTests);

            var shortAnswerTests = controller.GetShortAnswerTests().Value.ToList();
            Assert.Equal(shortAnswerTest1, shortAnswerTests[0]);
            Assert.Equal(shortAnswerTest2, shortAnswerTests[1]);
        }

        [Fact]
        public void GetShortAnswerTestById_ShouldReturnAnswerTest()
        {
            context.ShortAnswerTest.Add(shortAnswerTest1);
            context.SaveChanges();

            var NumberOfShortAnswerTests = context.ShortAnswerTest.Count();
            Assert.Equal(1, NumberOfShortAnswerTests);

            var shortAnswerTest = controller.GetShortAnswerTestById(NumberOfShortAnswerTests);
            Assert.Equal(shortAnswerTest1, shortAnswerTest.Value);
        }

        [Fact]
        public async void AddShortAnswerTest()
        {
            var AddShortAnswerResult = await controller.AddShortAnswerTest(shortAnswerTest1);
            context.SaveChanges();

            var NumberOfShortAnswerTests = context.ShortAnswerTest.Count();

            var AddedShortAnswerTest = context.ShortAnswerTest.Find(NumberOfShortAnswerTests);
            Assert.Equal(1, NumberOfShortAnswerTests);
            Assert.Equal(AddedShortAnswerTest, shortAnswerTest1);
        }


    }
}
