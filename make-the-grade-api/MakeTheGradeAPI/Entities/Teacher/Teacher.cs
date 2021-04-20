using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;

namespace MakeTheGradeAPI.Entities
{
    public class Teacher
    {
        [Column("id", TypeName = "INTEGER")]
        public int Id { get; set; }

        [Column("username", TypeName = "string")]
        public string Username { get; set; }

        [Column("password", TypeName = "string")]
        public string Password { get; set; }

        [Column("email", TypeName = "string")]
        public string Email { get; set; }

        [Column("phoneNumber", TypeName = "string")]
        public string PhoneNumber { get; set; }

        [Column("address", TypeName = "string")]
        public string Address { get; set; }

        List<Course> courses_list = new List<Course>();
        public Teacher()
        {

        }
        public Teacher(string username, string password, string email, string phoneNumber, string address, string numarMatricol)
        {
            this.Username = username;
            this.Password = password;
            this.Email = email;
            this.PhoneNumber = phoneNumber;
            this.Address = address;
        }
    }
}
