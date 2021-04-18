using MakeTheGradeAPI.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MakeTheGradeAPI_Testing
{
    class BulkInsertTests
    {
        private readonly DataContext _context;

        public BulkInsertTests(DataContext context)
        {
            _context = context;
        }

        /*
         * [HttpPost("bulk")]
        public void bulkInsert()
        {
            Student student1 = new Student() { Username = "Student1", Password = "TestDesc3ription3", Email = "3@gmail.com", PhoneNumber = "0755521512", Address = "address1", NumarMatricol = "RO213412" };
            Student student2 = new Student() { Username = "Student2", Password = "TestDesc3ion3", Email = "email1@3gmail.com", PhoneNumber = "0755521512", Address = "address1", NumarMatricol = "RO213412" };
            Student student3 = new Student() { Username = "Student3", Password = "TestDescripti2on3", Email = "email1@gmail.com", PhoneNumber = "0755521512", Address = "address1", NumarMatricol = "RO213412" };
            Student student4 = new Student() { Username = "Student4", Password = "TestDescriptio1", Email = "email31@gmail.com", PhoneNumber = "0755521512", Address = "address1", NumarMatricol = "RO213412" };
            List<Student> students = new List<Student> { student1, student2, student3, student4 };

            BulkInsert bulkInsert = new BulkInsert();
            bulkInsert.insertAll(students, _context);
        }
         */
    }
}
