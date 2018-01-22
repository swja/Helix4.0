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
    public class ciudadController : ApiController
    {
        private HelixEntities db = new HelixEntities();

        // GET: api/ciudad
        public IQueryable<ciudad> Getciudad()
        {
            return db.ciudad;
        }

        // GET: api/ciudad/5
        [ResponseType(typeof(ciudad))]
        public IHttpActionResult Getciudad(int id)
        {
            ciudad ciudad = db.ciudad.Find(id);
            if (ciudad == null)
            {
                return NotFound();
            }

            return Ok(ciudad);
        }

        // PUT: api/ciudad/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putciudad(int id, ciudad ciudad)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != ciudad.ID)
            {
                return BadRequest();
            }

            db.Entry(ciudad).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ciudadExists(id))
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

        // POST: api/ciudad
        [ResponseType(typeof(ciudad))]
        public IHttpActionResult Postciudad(ciudad ciudad)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.ciudad.Add(ciudad);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (ciudadExists(ciudad.ID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = ciudad.ID }, ciudad);
        }

        // DELETE: api/ciudad/5
        [ResponseType(typeof(ciudad))]
        public IHttpActionResult Deleteciudad(int id)
        {
            ciudad ciudad = db.ciudad.Find(id);
            if (ciudad == null)
            {
                return NotFound();
            }

            db.ciudad.Remove(ciudad);
            db.SaveChanges();

            return Ok(ciudad);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ciudadExists(int id)
        {
            return db.ciudad.Count(e => e.ID == id) > 0;
        }
    }
}