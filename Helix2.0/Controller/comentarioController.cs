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
    public class comentarioController : ApiController
    {
        private HelixEntities db = new HelixEntities();

        // GET: api/comentario
        public IQueryable<comentario> Getcomentario()
        {
            return db.comentario;
        }

        // GET: api/comentario/5
        [ResponseType(typeof(comentario))]
        public IHttpActionResult Getcomentario(int id)
        {
            comentario comentario = db.comentario.Find(id);
            if (comentario == null)
            {
                return NotFound();
            }

            return Ok(comentario);
        }

        // PUT: api/comentario/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putcomentario(int id, comentario comentario)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != comentario.ID)
            {
                return BadRequest();
            }

            db.Entry(comentario).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!comentarioExists(id))
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

        // POST: api/comentario
        [ResponseType(typeof(comentario))]
        public IHttpActionResult Postcomentario(comentario comentario)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.comentario.Add(comentario);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (comentarioExists(comentario.ID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = comentario.ID }, comentario);
        }

        // DELETE: api/comentario/5
        [ResponseType(typeof(comentario))]
        public IHttpActionResult Deletecomentario(int id)
        {
            comentario comentario = db.comentario.Find(id);
            if (comentario == null)
            {
                return NotFound();
            }

            db.comentario.Remove(comentario);
            db.SaveChanges();

            return Ok(comentario);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool comentarioExists(int id)
        {
            return db.comentario.Count(e => e.ID == id) > 0;
        }
    }
}