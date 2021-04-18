using MakeTheGradeAPI.Entities;
using MakeTheGradeAPI.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MakeTheGradeAPI.Utils.BulkInsert
{
    public class BulkInsert
    {
        private readonly DataContext _context;

        public BulkInsert()
        {
        }

        public async void insert(Student student, DataContext context)
        {
            context.Student.Add(student);
        }
    }
}
