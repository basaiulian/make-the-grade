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
        MultipleChoiceTest multipleChoiceTest1 = new MultipleChoiceTest() {Id = 0, Question = "1+1=?", ExamId = 1, PossibleAnswers = "3,4,2,5", CorrectAnswers="2"};
        MultipleChoiceTest multipleChoiceTest2 = new MultipleChoiceTest() {Id = 1, Question = "5*5=?", ExamId = 2, PossibleAnswers = "66,25,12,32", CorrectAnswers="25"};
        DataContext context;
        Random random;
        ConnectionFactory factory;
        MultipleChoiceTestsController controller;

        public MultipleChoiceTestControllerTests()
        {
            random = new Random();
            factory = new();
            context = factory.CreateContextForInMemory("multiple_choice_database" + random.Next(100000).ToString());
            controller = new MultipleChoiceTestsController(context);
        }

        [Fact]
        public void GetEssayTestById_ShouldReturnAnswerTest()
        {
            context.MultipleChoiceTest.Add(multipleChoiceTest1);
            context.SaveChanges();

            var NumberOfMultipleChoiceTests = context.MultipleChoiceTest.Count();
            Assert.Equal(1, NumberOfMultipleChoiceTests);

            var essayTest = controller.GetMultipleChoiceTestById(NumberOfMultipleChoiceTests);
            Assert.Equal(multipleChoiceTest1, essayTest.Value);
        }

        [Fact]
        public async void AddMultipleChoiceTest()
        {
            var AddMultipleChoiceTestResult = await controller.AddMultipleChoiceTest(multipleChoiceTest2);
            context.SaveChanges();

            var NumberOfMultipleChoiceTests = context.MultipleChoiceTest.Count();

            var AddedMultipleChoiceTest = context.MultipleChoiceTest.Find(NumberOfMultipleChoiceTests);
            Assert.Equal(1, NumberOfMultipleChoiceTests);
            Assert.Equal(AddedMultipleChoiceTest, multipleChoiceTest2);
        }
    }
}
