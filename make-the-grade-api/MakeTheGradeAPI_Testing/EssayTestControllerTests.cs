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
        EssayTest essayTest1 = new EssayTest() {Question = "Write an essay about your life.", AssignerId = 1, EssayText = "This is the first question."};
        EssayTest essayTest2 = new EssayTest() {Question = "Write an essay about your holiday.", AssignerId = 2, EssayText = "This is a very nice question. I love id!"};
        DataContext context;
        Random random;
        ConnectionFactory factory;
        EssayTestsController controller;

        public EssayTestControllerTests()
        {
            random = new Random();
            factory = new();
            context = factory.CreateContextForInMemory("essay_database" + random.Next(100000).ToString());
            controller = new EssayTestsController(context);
        }

        [Fact]
        public void GetEssayTests_ShouldReturnAllEssayTests()
        {
            context.EssayTest.Add(essayTest1);
            context.EssayTest.Add(essayTest2);
            context.SaveChanges();

            var NumberOfEssayTests = context.EssayTest.Count();
            Assert.Equal(2, NumberOfEssayTests);

            var EssayTests = controller.GetEssayTests().Value.ToList();
            Assert.Equal(essayTest1, EssayTests[0]);
            Assert.Equal(essayTest2, EssayTests[1]);
        }

        [Fact]
        public void GetEssayTestById_ShouldReturnAnswerTest()
        {
            context.EssayTest.Add(essayTest1);
            context.SaveChanges();

            var NumberOfEssayTests = context.EssayTest.Count();
            Assert.Equal(1, NumberOfEssayTests);

            var essayTest = controller.GetEssayTestById(NumberOfEssayTests);
            Assert.Equal(essayTest1, essayTest.Value);
        }

        [Fact]
        public async void AddEssayTest()
        {
            var AddEssayTestResult = await controller.AddEssayTest(essayTest2);
            context.SaveChanges();

            var NumberOfEssayTests = context.EssayTest.Count();

            var AddedEssayTest = context.EssayTest.Find(NumberOfEssayTests);
            Assert.Equal(1, NumberOfEssayTests);
            Assert.Equal(AddedEssayTest, essayTest2);
        }


    }
}
