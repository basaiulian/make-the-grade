using MakeTheGradeAPI.Controllers;
using MakeTheGradeAPI.Entities;
using MakeTheGradeAPI.Model;
using System;
using System.Linq;
using Xunit;

namespace MakeTheGradeAPI_Testing
{
    public class EssayTestControllerTests
    {
        readonly EssayTest essayTest1 = new() {Question = "Write an essay about your life.", ExamId = 1, EssayText = "This is the first question."};
        readonly EssayTest essayTest2 = new() {Question = "Write an essay about your holiday.", ExamId = 2, EssayText = "This is a very nice question. I love id!"};
        readonly DataContext context;
        readonly Random random;
        readonly ConnectionFactory factory;
        readonly EssayTestsController controller;

        public EssayTestControllerTests()
        {
            random = new Random();
            factory = new();
            context = ConnectionFactory.CreateContextForInMemory("essay_database" + random.Next(100000).ToString());
            controller = new EssayTestsController(context);
        }

        [Fact]
        public void GetEssayTests_ShouldReturnAllEssayTests()
        {
            context.EssayTest.Add(essayTest1);
            context.EssayTest.Add(essayTest2);
            context.SaveChanges();

            var numberOfEssayTests = context.EssayTest.Count();
            Assert.Equal(2, numberOfEssayTests);

            var essayTests = controller.GetEssayTests().Value.ToList();
            Assert.Equal(essayTest1, essayTests[0]);
            Assert.Equal(essayTest2, essayTests[1]);
        }

        [Fact]
        public void GetEssayTestById_ShouldReturnAnswerTest()
        {
            context.EssayTest.Add(essayTest1);
            context.SaveChanges();

            var numberOfEssayTests = context.EssayTest.Count();
            Assert.Equal(1, numberOfEssayTests);

            var essayTest = controller.GetEssayTestById(numberOfEssayTests);
            Assert.Equal(essayTest1, essayTest.Value);
        }

        [Fact]
        public async void AddEssayTest()
        {
            await controller.AddEssayTest(essayTest2);
            context.SaveChanges();

            var numberOfEssayTests = context.EssayTest.Count();

            var addedEssayTest = context.EssayTest.Find(numberOfEssayTests);
            Assert.Equal(1, numberOfEssayTests);
            Assert.Equal(addedEssayTest, essayTest2);
        }


    }
}
