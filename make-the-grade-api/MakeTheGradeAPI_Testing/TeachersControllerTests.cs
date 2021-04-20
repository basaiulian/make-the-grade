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
        Teacher teacher1 = new Teacher() {Username = "teacher111", Password = "Password111", Email = "email111@gmail.com", PhoneNumber = "075541212", Address = "address2231"};
        Teacher teacher2 = new Teacher() {Username = "teacher222", Password = "Password222", Email = "email122@gmail.com", PhoneNumber = "0756123512", Address = "address21312" };
        DataContext context;
        Random random;
        ConnectionFactory factory;
        TeachersController controller;


        public TeachersControllerTests()
        {
            random = new Random();
            factory = new();
            context = factory.CreateContextForInMemory("teachers_database" + random.Next(100000).ToString());
            controller = new TeachersController(context);
        }

        [Fact]
        public void GetTeachers_ShouldReturnAllTeachers()
        {
            

            context.Teacher.Add(teacher1);
            context.Teacher.Add(teacher2);
            context.SaveChanges();

            var NumberOfTeachers = context.Teacher.Count();
            Assert.Equal(2, NumberOfTeachers);

            var teachers = controller.GetTeachers().Value.ToList();
            Assert.Equal(teacher1, teachers[0]);
            Assert.Equal(teacher2, teachers[1]);
        }

        [Fact]
        public async void AddTeacher()
        {
            var AddTeacherResult = await controller.AddTeacher(new List<string> { teacher1.Username, teacher1.Password, teacher1.Email, teacher1.PhoneNumber, teacher1.Address});

            var NumberOfTeachers = context.Teacher.Count();
            Assert.Equal(1, NumberOfTeachers);
            Assert.NotEqual("Teacher not added.", AddTeacherResult.Value);
        }

        [Fact]
        public async void AuthenticateTeacherUsingValidValues_ShouldReturnTeacherId()
        {
            await controller.AddTeacher(new List<string> { teacher1.Username, teacher1.Password, teacher1.Email, teacher1.PhoneNumber, teacher1.Address });
            int IncrementedTeacherId = context.Teacher.Count();

            var AuthenticateTeacherData = new List<string> { teacher1.Username, teacher1.Password };
            var AuthenticateResult = controller.Authenticate(AuthenticateTeacherData);
            
            Assert.Equal(IncrementedTeacherId, AuthenticateResult.Value);

        }

        [Fact]
        public async void AuthenticateTeacherUsingInvalidValues_ShouldReturn_Minus1()
        {
            await controller.AddTeacher(new List<string> { teacher1.Username, teacher1.Password, teacher1.Email, teacher1.PhoneNumber, teacher1.Address });

            var AuthenticateTeacherData = new List<string> { "invalidUsername", "invalidPassword" };
            var AuthenticateResult = controller.Authenticate(AuthenticateTeacherData);

            Assert.Equal(-1, AuthenticateResult.Value);
        }

    }
}
