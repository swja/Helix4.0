using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using Helix2._0.Model;

namespace Helix2._0.Controller
{
    public class tipo_industriaController : ApiController
    {
        private HelixEntities db = new HelixEntities();

        // GET: api/tipo_industria
        public IQueryable<tipo_industria> Gettipo_industria()
        {
            return db.tipo_industria;
        }

        // GET: api/tipo_industria/5
        [ResponseType(typeof(tipo_industria))]
        public IHttpActionResult Gettipo_industria(int id)
        {
            tipo_industria tipo_industria = db.tipo_industria.Find(id);
            if (tipo_industria == null)
            {
                return NotFound();
            }

            return Ok(tipo_industria);
        }

        // PUT: api/tipo_industria/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Puttipo_industria(int id, tipo_industria tipo_industria)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != tipo_industria.ID)
            {
                return BadRequest();
            }

            db.Entry(tipo_industria).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!tipo_industriaExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/tipo_industria
        [ResponseType(typeof(tipo_industria))]
        public IHttpActionResult Posttipo_industria(tipo_industria tipo_industria)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.tipo_industria.Add(tipo_industria);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (tipo_industriaExists(tipo_industria.ID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = tipo_industria.ID }, tipo_industria);
        }

        // DELETE: api/tipo_industria/5
        [ResponseType(typeof(tipo_industria))]
        public IHttpActionResult Deletetipo_industria(int id)
        {
            tipo_industria tipo_industria = db.tipo_industria.Find(id);
            if (tipo_industria == null)
            {
                return NotFound();
            }

            db.tipo_industria.Remove(tipo_industria);
            db.SaveChanges();

            return Ok(tipo_industria);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool tipo_industriaExists(int id)
        {
            return db.tipo_industria.Count(e => e.ID == id) > 0;
        }
    }
}