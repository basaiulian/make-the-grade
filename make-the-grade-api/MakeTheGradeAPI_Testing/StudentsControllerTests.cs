using MakeTheGradeAPI.Controllers;
using MakeTheGradeAPI.Entities;
using MakeTheGradeAPI.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using Xunit;

namespace MakeTheGradeAPI_Testing
{
    public class StudentsControllerTests
    {
        readonly Student student1 = new Student() {Username = "Student1", Password = "Password1", Email = "email1@gmail.com", PhoneNumber = "0755521512", Address = "address1", NumarMatricol = "RO213412" };
        readonly Student student2 = new Student() {Username = "Student2", Password = "Password2", Email = "email1@gmail.com", PhoneNumber = "0755521512", Address = "address1", NumarMatricol = "RO213412" };
        readonly DataContext context;
        readonly Random random;
        readonly ConnectionFactory factory;
        readonly StudentsController controller;

        public StudentsControllerTests()
        {
            random = new Random();
            factory = new();
            context = ConnectionFactory.CreateContextForInMemory("students_database" + random.Next(100000).ToString());
            controller = new StudentsController(context);
        }

        [Fact]
        public void GetStudents_ShouldReturnAllStudents()
        {
            context.Student.Add(student1);
            context.Student.Add(student2);
            context.SaveChanges();

            var numberOfStudents = context.Student.Count();
            Assert.Equal(2, numberOfStudents);

            var students = controller.GetStudents().Value.ToList();
            Assert.Equal(student1, students[0]);
            Assert.Equal(student2, students[1]);
        }

        [Fact]
        public async void AddStudent()
        {
            var addStudentResult = await controller.AddStudent(new List<string> { student1.Username, student1.Password, student1.Email, student1.PhoneNumber, student1.Address, student1.NumarMatricol });
            context.SaveChanges();

            var NumberOfStudents = context.Student.Count();
            Assert.Equal(1, NumberOfStudents);
            Assert.NotEqual("Student not added.", addStudentResult.Value);
        }

        [Fact]
        public async void AuthenticateStudentUsingValidValues_ShouldReturnStudentId()
        {
            await controller.AddStudent(new List<string> { student1.Username, student1.Password, student1.Email, student1.PhoneNumber, student1.Address, student1.NumarMatricol });
            int incrementedStudentId = context.Student.Count();

            var authenticateStudentData = new List<string> { student1.Username, student1.Password };
            var authenticateResult = controller.Authenticate(authenticateStudentData);

            Assert.Equal(incrementedStudentId, authenticateResult.Value);
        }

        [Fact]
        public async void AuthenticateStudentUsingInvalidValues_ShouldReturn_Minus1()
        {
            await controller.AddStudent(new List<string> { student1.Username, student1.Password, student1.Email, student1.PhoneNumber, student1.Address, student1.NumarMatricol });

            var authenticateStudentData = new List<string> { "invalidUsername", "invalidPassword" };
            var authenticateResult = controller.Authenticate(authenticateStudentData);

            Assert.Equal(-1, authenticateResult.Value);
        }
    }
}
