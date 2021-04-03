using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using MakeTheGradeAPI.Entities;
using Microsoft.EntityFrameworkCore;

namespace MakeTheGradeAPI.Model
{
    public class DataContext : DbContext
    {

        public DataContext(DbContextOptions<DataContext> options) : base(options)
        {
        }

        public DbSet<Student> Student { get; set; }
        public DbSet<Grader> Grader { get; set; }
        public DbSet<Administrator> Administrator { get; set; }
        public DbSet<User> User { get; set; }
    }
}
