using MakeTheGradeAPI.Controllers;
using MakeTheGradeAPI.Entities;
using MakeTheGradeAPI.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using Xunit;

namespace MakeTheGradeAPI_Testing
{
    public class TeachersControllerTests
    {
        readonly Teacher teacher1 = new() {Username = "teacher111", Password = "Password111", Email = "email111@gmail.com", PhoneNumber = "075541212", Address = "address2231"};
        readonly Teacher teacher2 = new() {Username = "teacher222", Password = "Password222", Email = "email122@gmail.com", PhoneNumber = "0756123512", Address = "address21312" };
        readonly DataContext context;
        readonly Random random;
        readonly ConnectionFactory factory;
        readonly TeachersController controller;


        public TeachersControllerTests()
        {
            random = new Random();
            factory = new();
            context = ConnectionFactory.CreateContextForInMemory("teachers_database" + random.Next(100000).ToString());
            controller = new TeachersController(context);
        }

        [Fact]
        public void GetTeachers_ShouldReturnAllTeachers()
        {
            

            context.Teacher.Add(teacher1);
            context.Teacher.Add(teacher2);
            context.SaveChanges();

            var numberOfTeachers = context.Teacher.Count();
            Assert.Equal(2, numberOfTeachers);

            var teachers = controller.GetTeachers().Value.ToList();
            Assert.Equal(teacher1, teachers[0]);
            Assert.Equal(teacher2, teachers[1]);
        }

        [Fact]
        public async void AddTeacher()
        {
            var addTeacherResult = await controller.AddTeacher(new List<string> { teacher1.Username, teacher1.Password, teacher1.Email, teacher1.PhoneNumber, teacher1.Address});

            var numberOfTeachers = context.Teacher.Count();
            Assert.Equal(1, numberOfTeachers);
            Assert.NotEqual("Teacher not added.", addTeacherResult.Value);
        }

        [Fact]
        public async void AuthenticateTeacherUsingValidValues_ShouldReturnTeacherId()
        {
            await controller.AddTeacher(new List<string> { teacher1.Username, teacher1.Password, teacher1.Email, teacher1.PhoneNumber, teacher1.Address });
            int incrementedTeacherId = context.Teacher.Count();

            var authenticateTeacherData = new List<string> { teacher1.Username, teacher1.Password };
            var authenticateResult = controller.Authenticate(authenticateTeacherData);
            
            Assert.Equal(incrementedTeacherId, authenticateResult.Value);

        }

        [Fact]
        public async void AuthenticateTeacherUsingInvalidValues_ShouldReturn_Minus1()
        {
            await controller.AddTeacher(new List<string> { teacher1.Username, teacher1.Password, teacher1.Email, teacher1.PhoneNumber, teacher1.Address });

            var authenticateTeacherData = new List<string> { "invalidUsername", "invalidPassword" };
            var authenticateResult = controller.Authenticate(authenticateTeacherData);

            Assert.Equal(-1, authenticateResult.Value);
        }

    }
}
