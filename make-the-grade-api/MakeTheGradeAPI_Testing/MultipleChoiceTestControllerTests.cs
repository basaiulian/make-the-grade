using MakeTheGradeAPI.Controllers;
using MakeTheGradeAPI.Entities;
using MakeTheGradeAPI.Model;
using System;
using System.Linq;
using Xunit;

namespace MakeTheGradeAPI_Testing
{
    public class MultipleChoiceTestControllerTests
    {
        readonly MultipleChoiceTest multipleChoiceTest1 = new() {Id = 0, Question = "1+1=?", ExamId = 1, PossibleAnswers = "3,4,2,5", CorrectAnswers="2"};
        readonly MultipleChoiceTest multipleChoiceTest2 = new() {Id = 1, Question = "5*5=?", ExamId = 2, PossibleAnswers = "66,25,12,32", CorrectAnswers="25"};
        readonly DataContext context;
        readonly Random random;
        readonly ConnectionFactory factory;
        readonly MultipleChoiceTestsController controller;

        public MultipleChoiceTestControllerTests()
        {
            random = new Random();
            factory = new();
            context = ConnectionFactory.CreateContextForInMemory("multiple_choice_database" + random.Next(100000).ToString());
            controller = new MultipleChoiceTestsController(context);
        }

        [Fact]
        public void GetEssayTestById_ShouldReturnAnswerTest()
        {
            context.MultipleChoiceTest.Add(multipleChoiceTest1);
            context.SaveChanges();

            var numberOfMultipleChoiceTests = context.MultipleChoiceTest.Count();
            Assert.Equal(1, numberOfMultipleChoiceTests);

            var essayTest = controller.GetMultipleChoiceTestById(numberOfMultipleChoiceTests);
            Assert.Equal(multipleChoiceTest1, essayTest.Value);
        }

        [Fact]
        public async void AddMultipleChoiceTest()
        {
            await controller.AddMultipleChoiceTest(multipleChoiceTest2);
            context.SaveChanges();

            var numberOfMultipleChoiceTests = context.MultipleChoiceTest.Count();

            var addedMultipleChoiceTest = context.MultipleChoiceTest.Find(numberOfMultipleChoiceTests);
            Assert.Equal(1, numberOfMultipleChoiceTests);
            Assert.Equal(addedMultipleChoiceTest, multipleChoiceTest2);
        }
    }
}
