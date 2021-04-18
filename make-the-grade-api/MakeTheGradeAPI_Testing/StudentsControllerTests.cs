using MakeTheGradeAPI.Controllers;
using MakeTheGradeAPI.Entities;
using MakeTheGradeAPI.Model;
using MakeTheGradeAPI.Utils.BulkInsert;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using Xunit;

namespace MakeTheGradeAPI_Testing
{
    public class StudentsControllerTests
    {
        Student student1 = new Student() { Username = "Student1", Password = "TestDescription3", Email = "email1@gmail.com", PhoneNumber = "0755521512", Address = "address1", NumarMatricol = "RO213412" };
        Student student2 = new Student() { Username = "Student2", Password = "TestDescription3", Email = "email1@gmail.com", PhoneNumber = "0755521512", Address = "address1", NumarMatricol = "RO213412" };

        [Fact]
        public void GetStudents_ShouldReturnAllUsers()
        {
            //Arrange
            ConnectionFactory factory = new();
            DataContext context = factory.CreateContextForInMemory();
  
            //Act
            context.Student.Add(student1);
            context.Student.Add(student2);
            context.SaveChanges();

            //Assert
            var NumberOfStudents = context.Student.Count();
            Assert.Equal(2, NumberOfStudents);

            StudentsController controller = new StudentsController(context);
            var students = controller.GetStudents().Value.ToList();
            Assert.Equal(student1.Username, students[0].Username);
            Assert.Equal(student2.Username, students[1].Username);
        }
    }
}
