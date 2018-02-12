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
    public class HELIX_CIUDAD_Controller : ApiController
    {
        private HelixEntities db = new HelixEntities();

        // GET: api/HELIX_CIUDAD_
        public IQueryable<HELIX_CIUDAD> GetHELIX_CIUDAD()
        {
            return db.HELIX_CIUDAD;
        }

        // GET: api/HELIX_CIUDAD_/5
        [ResponseType(typeof(HELIX_CIUDAD))]
        public IHttpActionResult GetHELIX_CIUDAD(int id)
        {
            HELIX_CIUDAD hELIX_CIUDAD = db.HELIX_CIUDAD.Find(id);
            if (hELIX_CIUDAD == null)
            {
                return NotFound();
            }

            return Ok(hELIX_CIUDAD);
        }

        // PUT: api/HELIX_CIUDAD_/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutHELIX_CIUDAD(int id, HELIX_CIUDAD hELIX_CIUDAD)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != hELIX_CIUDAD.ID_CIUDAD)
            {
                return BadRequest();
            }

            db.Entry(hELIX_CIUDAD).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!HELIX_CIUDADExists(id))
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

        // POST: api/HELIX_CIUDAD_
        [ResponseType(typeof(HELIX_CIUDAD))]
        public IHttpActionResult PostHELIX_CIUDAD(HELIX_CIUDAD hELIX_CIUDAD)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.HELIX_CIUDAD.Add(hELIX_CIUDAD);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = hELIX_CIUDAD.ID_CIUDAD }, hELIX_CIUDAD);
        }

        // DELETE: api/HELIX_CIUDAD_/5
        [ResponseType(typeof(HELIX_CIUDAD))]
        public IHttpActionResult DeleteHELIX_CIUDAD(int id)
        {
            HELIX_CIUDAD hELIX_CIUDAD = db.HELIX_CIUDAD.Find(id);
            if (hELIX_CIUDAD == null)
            {
                return NotFound();
            }

            db.HELIX_CIUDAD.Remove(hELIX_CIUDAD);
            db.SaveChanges();

            return Ok(hELIX_CIUDAD);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool HELIX_CIUDADExists(int id)
        {
            return db.HELIX_CIUDAD.Count(e => e.ID_CIUDAD == id) > 0;
        }
    }
}