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
    public class HELIX_FLUJO_Controller : ApiController
    {
        private HelixEntities db = new HelixEntities();

        // GET: api/HELIX_FLUJO_
        public IQueryable<HELIX_FLUJO> GetHELIX_FLUJO()
        {
            return db.HELIX_FLUJO;
        }

        // GET: api/HELIX_FLUJO_/5
        [ResponseType(typeof(HELIX_FLUJO))]
        public IHttpActionResult GetHELIX_FLUJO(int id)
        {
            HELIX_FLUJO hELIX_FLUJO = db.HELIX_FLUJO.Find(id);
            if (hELIX_FLUJO == null)
            {
                return NotFound();
            }

            return Ok(hELIX_FLUJO);
        }

        // PUT: api/HELIX_FLUJO_/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutHELIX_FLUJO(int id, HELIX_FLUJO hELIX_FLUJO)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != hELIX_FLUJO.ID_FLUJO)
            {
                return BadRequest();
            }

            db.Entry(hELIX_FLUJO).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!HELIX_FLUJOExists(id))
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

        // POST: api/HELIX_FLUJO_
        [ResponseType(typeof(HELIX_FLUJO))]
        public IHttpActionResult PostHELIX_FLUJO(HELIX_FLUJO hELIX_FLUJO)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.HELIX_FLUJO.Add(hELIX_FLUJO);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = hELIX_FLUJO.ID_FLUJO }, hELIX_FLUJO);
        }

        // DELETE: api/HELIX_FLUJO_/5
        [ResponseType(typeof(HELIX_FLUJO))]
        public IHttpActionResult DeleteHELIX_FLUJO(int id)
        {
            HELIX_FLUJO hELIX_FLUJO = db.HELIX_FLUJO.Find(id);
            if (hELIX_FLUJO == null)
            {
                return NotFound();
            }

            db.HELIX_FLUJO.Remove(hELIX_FLUJO);
            db.SaveChanges();

            return Ok(hELIX_FLUJO);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool HELIX_FLUJOExists(int id)
        {
            return db.HELIX_FLUJO.Count(e => e.ID_FLUJO == id) > 0;
        }
    }
}