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
    public class flujoController : ApiController
    {
        private HelixEntities db = new HelixEntities();

        // GET: api/flujo
        public IQueryable<flujo> Getflujo()
        {
            return db.flujo;
        }

        // GET: api/flujo/5
        [ResponseType(typeof(flujo))]
        public IHttpActionResult Getflujo(int id)
        {
            flujo flujo = db.flujo.Find(id);
            if (flujo == null)
            {
                return NotFound();
            }

            return Ok(flujo);
        }

        // PUT: api/flujo/5
        [ResponseType(typeof(void))]
        public IHttpActionResult Putflujo(int id, flujo flujo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != flujo.ID)
            {
                return BadRequest();
            }

            db.Entry(flujo).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!flujoExists(id))
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

        // POST: api/flujo
        [ResponseType(typeof(flujo))]
        public IHttpActionResult Postflujo(flujo flujo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.flujo.Add(flujo);

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateException)
            {
                if (flujoExists(flujo.ID))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = flujo.ID }, flujo);
        }

        // DELETE: api/flujo/5
        [ResponseType(typeof(flujo))]
        public IHttpActionResult Deleteflujo(int id)
        {
            flujo flujo = db.flujo.Find(id);
            if (flujo == null)
            {
                return NotFound();
            }

            db.flujo.Remove(flujo);
            db.SaveChanges();

            return Ok(flujo);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool flujoExists(int id)
        {
            return db.flujo.Count(e => e.ID == id) > 0;
        }
    }
}