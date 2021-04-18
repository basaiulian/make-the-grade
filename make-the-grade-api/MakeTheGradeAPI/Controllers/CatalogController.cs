using MakeTheGradeAPI.Entities;
using MakeTheGradeAPI.Model;
using MakeTheGradeAPI.Utils;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace MakeTheGradeAPI.Controllers
{
    [ApiController]
    [Route("/v1/catalog/")]
    public class CatalogController : ControllerBase
    {
        private readonly DataContext _context;

        public CatalogController(DataContext context)
        {
            _context = context;
        }

        [HttpGet]
        public ActionResult<IEnumerable<Catalog>> GetCatalog()
        {
            return _context.Catalog.ToList();
        }

        [HttpGet("{Id}")]
        public ActionResult<Catalog> GetCatalogById(int Id)
        {
            return _context.Catalog.Find(Id);
        }

        [HttpPost]
        public async Task<ActionResult<Catalog>> AddCatalog([FromBody] Catalog catalog)
        {
            _context.Catalog.Add(catalog);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetCatalogById", new { id = catalog.Id }, catalog);
        }
    }
}